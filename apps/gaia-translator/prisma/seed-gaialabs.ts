import * as fs from 'fs'
import * as path from 'path'
// eslint-disable-next-line @typescript-eslint/no-var-requires
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

const GAIALABS_REGION_CODE = 'GaiaLabs'
const GAIALABS_REGION_NAME = 'GaiaLabs'
const GAIALABS_LANGUAGE = 'English'
const ADMIN_EMAIL = 'azarem@gmail.com'

// Resolve patches directory relative to current working directory in common monorepo layouts
const PATCHES_CANDIDATE_PATHS = [
  path.resolve(process.cwd(), 'truth/patches'),
  path.resolve(process.cwd(), '../../truth/patches'),
  path.resolve(process.cwd(), '../../../truth/patches'),
]

interface ExtractedString {
  name: string
  text: string
}

interface ChapterFileInfo {
  filePath: string
  chapterNumber: string // two-digit string, e.g. "01"
}

async function resolvePatchesDirectory(): Promise<string> {
  for (const candidate of PATCHES_CANDIDATE_PATHS) {
    try {
      const stat = await fs.promises.stat(candidate)
      if (stat.isDirectory()) return candidate
    } catch {
      // try next candidate
    }
  }
  throw new Error(`Could not locate patches directory. Tried: ${PATCHES_CANDIDATE_PATHS.join(', ')}`)
}

async function scanFilesRecursively(directoryPath: string): Promise<string[]> {
  const files: string[] = []
  const entries = await fs.promises.readdir(directoryPath, { withFileTypes: true })

  for (const entry of entries) {
    const fullPath = path.join(directoryPath, entry.name)
    if (entry.isDirectory()) {
      const nested = await scanFilesRecursively(fullPath)
      files.push(...nested)
    } else if (entry.isFile()) {
      files.push(fullPath)
    }
  }

  return files
}

function extractStrings(content: string): ExtractedString[] {
  const results: ExtractedString[] = []

  // widestring_{hex} `text`
  const wideRegex = /widestring_([0-9A-Fa-f]+)\s+`([^`]*)`/g
  // asciistring_{hex} |text|
  const asciiRegex = /asciistring_([0-9A-Fa-f]+)\s+\|([^|]*)\|/g
  // spritestring_{hex} ~text~
  const spriteRegex = /spritestring_([0-9A-Fa-f]+)\s+~([^~]*)~/g

  let m: RegExpExecArray | null

  while ((m = wideRegex.exec(content)) !== null) {
    results.push({ name: `widestring_${m[1]}`, text: m[2] })
  }
  while ((m = asciiRegex.exec(content)) !== null) {
    results.push({ name: `asciistring_${m[1]}`, text: m[2] })
  }
  while ((m = spriteRegex.exec(content)) !== null) {
    results.push({ name: `spritestring_${m[1]}`, text: m[2] })
  }

  return results
}

function isChapterFile(filePath: string): { match: boolean; chapter: string | null } {
  const base = path.basename(filePath)
  const m = base.match(/^chapter(\d{2})\.asm$/i)
  return { match: !!m, chapter: m ? m[1] : null }
}

async function findChapterFiles(directoryPath: string): Promise<ChapterFileInfo[]> {
  const all: ChapterFileInfo[] = []
  const files = await scanFilesRecursively(directoryPath)
  for (const f of files) {
    const { match, chapter } = isChapterFile(f)
    if (match && chapter) {
      all.push({ filePath: f, chapterNumber: chapter })
    }
  }
  return all
}

async function buildNameToChapterMap(chapterFiles: ChapterFileInfo[]): Promise<{
  nameToChapters: Map<string, Set<string>>
  duplicates: Map<string, string[]>
  unmatchedChapterStrings: string[]
}> {
  const nameToChapters = new Map<string, Set<string>>()
  const duplicates = new Map<string, string[]>()
  const unmatchedChapterStrings: string[] = [] // filled later if needed

  for (const { filePath, chapterNumber } of chapterFiles) {
    try {
      const content = await fs.promises.readFile(filePath, 'utf-8')
      const extracted = extractStrings(content)
      for (const item of extracted) {
        const set = nameToChapters.get(item.name) ?? new Set<string>()
        set.add(chapterNumber)
        nameToChapters.set(item.name, set)
      }
    } catch (err) {
      console.warn(`⚠️ Could not read chapter file: ${filePath}`, err)
    }
  }

  for (const [name, set] of nameToChapters.entries()) {
    if (set.size > 1) {
      duplicates.set(name, Array.from(set))
    }
  }

  return { nameToChapters, duplicates, unmatchedChapterStrings }
}

async function ensureChapters(chapterNumbers: Set<string>): Promise<Map<string, string>> {
  const map = new Map<string, string>()
  for (const num of chapterNumbers) {
    const name = `chapter${num}`
    const chap = await prisma.chapter.upsert({
      where: { name },
      update: {},
      create: { name },
    })
    map.set(num, chap.id)
  }
  return map
}

async function ensureAdminUser() {
  return prisma.user.upsert({
    where: { email: ADMIN_EMAIL },
    update: {},
    create: {
      email: ADMIN_EMAIL,
      username: 'Azarem',
      fullName: 'GaiaLabs Admin',
      role: 'ADMIN',
    },
  })
}

async function ensureGaiaLabsRegion(adminUserId: string) {
  const region = await prisma.textRegion.upsert({
    where: { code: GAIALABS_REGION_CODE },
    update: {},
    create: {
      code: GAIALABS_REGION_CODE,
      name: GAIALABS_REGION_NAME,
      language: GAIALABS_LANGUAGE,
      isCore: false,
      createdById: adminUserId,
    },
  })
  return region
}

async function main() {
  console.log('🌱 Seeding GaiaLabs StringText entries from truth/patches (widestring, asciistring, spritestring) ...')

  // Admin for audit fields
  const adminUser = await ensureAdminUser()
  console.log(`✅ Admin user ready: ${adminUser.email}`)

  // Region upsert
  const region = await ensureGaiaLabsRegion(adminUser.id)
  console.log(`✅ TextRegion ready: ${region.code}`)

  // Find patches directory
  const patchesDir = await resolvePatchesDirectory()
  console.log(`📂 Using patches directory: ${patchesDir}`)

  // Build chapter references from chapter##.asm
  const chapterFiles = await findChapterFiles(patchesDir)
  console.log(`📘 Found ${chapterFiles.length} chapter files (chapter##.asm)`) 

  const { nameToChapters, duplicates } = await buildNameToChapterMap(chapterFiles)
  if (duplicates.size > 0) {
    console.warn('⚠️ Strings appearing in multiple chapters (potential ambiguity):')
    for (const [name, chapters] of duplicates.entries()) {
      console.warn(`   ${name} -> chapters: ${chapters.join(', ')}`)
    }
  }

  // Ensure Chapter records exist for all referenced chapter numbers
  const allChapterNumbers = new Set<string>()
  for (const set of nameToChapters.values()) {
    for (const c of set) allChapterNumbers.add(c)
  }
  const chapterNumberToId = await ensureChapters(allChapterNumbers)

  // Read all files
  const allFiles = await scanFilesRecursively(patchesDir)
  console.log(`📄 Found ${allFiles.length} files in patches`)

  if (allFiles.length === 0) {
    console.warn('⚠️ No files found in patches directory. Nothing to import.')
    return
  }

  // Extract all string types across all files
  const uniqueByName = new Map<string, ExtractedString>()
  const nameCounts = new Map<string, number>()
  const namesInPatches = new Set<string>()

  for (const filePath of allFiles) {
    try {
      const content = await fs.promises.readFile(filePath, 'utf-8')
      const extracted = extractStrings(content)
      for (const item of extracted) {
        // Track presence and occurrence counts across all patch files
        namesInPatches.add(item.name)
        nameCounts.set(item.name, (nameCounts.get(item.name) ?? 0) + 1)

        // For text upsert, last one wins if duplicate across files
        uniqueByName.set(item.name, item)
      }
    } catch (err) {
      console.warn(`⚠️ Could not read file: ${filePath}`, err)
    }
  }

  console.log(`🔤 Extracted ${uniqueByName.size} string entries (all types)`) 

  if (uniqueByName.size === 0) {
    console.warn('⚠️ No widestring patterns found in patches.')
    return
  }

  let created = 0
  let updated = 0
  let missingStrings = 0

  // Validation tracking
  const existingGameStrings = await prisma.gameString.findMany({ select: { id: true, name: true } })
  const existingNames: Set<string> = new Set(existingGameStrings.map((g) => g.name))
  const processedNames = new Set<string>()
  const updatedChapterNames = new Set<string>()

  for (const [name, { text }] of uniqueByName.entries()) {
    try {
      const gameString = await prisma.gameString.findFirst({ where: { name } })
      if (!gameString) {
        missingStrings++
        continue
      }

      const upserted = await prisma.stringText.upsert({
        where: {
          stringId_regionId: {
            stringId: gameString.id,
            regionId: region.id,
          },
        },
        update: {
          text,
          updatedById: adminUser.id,
        },
        create: {
          stringId: gameString.id,
          regionId: region.id,
          text,
          createdById: adminUser.id,
        },
      })

      if ((upserted.updatedOn ?? null) !== null) {
        updated++
      } else {
        created++
      }

      // Apply chapter assignment if available
      const chaptersForName = nameToChapters.get(name)
      if (chaptersForName && chaptersForName.size > 0) {
        // If ambiguous (multiple), pick the lowest number deterministically
        const chosen = Array.from(chaptersForName).sort()[0]
        const chapterId = chapterNumberToId.get(chosen)
        if (chapterId) {
          await prisma.gameString.update({ where: { id: gameString.id }, data: { chapterId } })
          updatedChapterNames.add(name)
        }
      }
      processedNames.add(name)
    } catch (err) {
      console.warn(`⚠️ Failed to upsert StringText for ${name}:`, err)
    }
  }

  console.log('📊 GaiaLabs import summary')
  console.log(`   🆕 Created: ${created}`)
  console.log(`   ♻️ Updated: ${updated}`)
  console.log(`   ❓ Missing GameString: ${missingStrings}`)

  // Validation: every GameString must be matched exactly once across ALL patches files
  console.log('🔎 Validation results')
  const duplicatesAcrossPatches = Array.from(nameCounts.entries()).filter(([, c]) => c !== 1)
  const missedInPatches = Array.from(existingNames).filter((n) => !namesInPatches.has(n))
  const processedButNotExisting = Array.from(processedNames).filter((n) => !existingNames.has(n))
  const processedMismatch = processedNames.size !== existingNames.size

  console.log(`   Total existing GameStrings: ${existingNames.size}`)
  console.log(`   Names present in patches: ${namesInPatches.size}`)
  console.log(`   Processed (StringText upserts attempted): ${processedNames.size}`)
  console.log(`   Chapter updates executed: ${updatedChapterNames.size}`)

  if (
    duplicatesAcrossPatches.length === 0 &&
    missedInPatches.length === 0 &&
    processedButNotExisting.length === 0 &&
    !processedMismatch
  ) {
    console.log('   ✅ All GameStrings matched exactly once with patches; chapter updates applied where available')
  } else {
    console.warn('   ❗ Validation discrepancies detected:')
    if (duplicatesAcrossPatches.length > 0) {
      console.warn(`     - Duplicate occurrences across patches: ${duplicatesAcrossPatches.length}`)
    }
    if (missedInPatches.length > 0) {
      console.warn(`     - GameStrings missing from patches: ${missedInPatches.length}`)
    }
    if (processedButNotExisting.length > 0) {
      console.warn(`     - Processed strings with no existing GameString: ${processedButNotExisting.length}`)
    }
    if (processedMismatch) {
      console.warn('     - Processed count does not match existing GameStrings count')
    }
  }
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error('❌ Seed failed:', e)
    await prisma.$disconnect()
    process.exit(1)
  })


