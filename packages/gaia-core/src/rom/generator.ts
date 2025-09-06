import { ChunkFileUtils, crc32_buffer } from '@gaialabs/shared';
import { DbRootUtils, ChunkFile, BinType, DbRoot } from '@gaialabs/shared';
import { BlockReader, BlockWriter } from './extraction';
import { RomLayout, RomProcessor, Assembler, RomWriter } from './rebuild';

export class RomGenerator {
  private readonly moduleLookup: Map<string, ChunkFile[]> = new Map();
  private readonly moduleList = ['jp-viper', 'title-enhanced'];
  private readonly sourceData: Uint8Array;
  private readonly patchFiles: ChunkFile[] = [];
  private chunkFiles: ChunkFile[] = [];
  private asmFiles: ChunkFile[] = [];
  private dbRoot: DbRoot = {} as DbRoot;

  constructor(modules: string[], sourceData: Uint8Array) {
    this.sourceData = sourceData;
    this.moduleList = modules;
    
    const crc = crc32_buffer(this.sourceData);

    if(crc !== 0x1C3848C0){
      throw new Error('CRC mismatch, please provide the correct ROM');
    }
  }

  public async generateProject(projectName: string): Promise<Uint8Array> {
    await this.initializeDatabase(projectName);
    const reader = this.initializeChunks();
    this.writeScriptTexts(reader);
    this.applyBaseRom();
    this.applyProjectInit();
    this.applySelectedModules();
    this.assembleCodeFromText();
    this.applyCodePatches();
    this.calculateSizes();
    this.performLayout();
    this.rebaseAssemblies();
    this.generateAsmIncludeLookups();
    const blockLookup = this.generateBlockLookup();
    const outRom = await this.writeRom(blockLookup);
    return outRom;
  }

  //Grab structures from supabase
  private async initializeDatabase(projectName: string){
    this.dbRoot = await DbRootUtils.fromSupabaseProject({ projectName });
  }

  //Read graph from rom
  private initializeChunks(){
    const reader = new BlockReader(this.sourceData, this.dbRoot);
    this.chunkFiles = reader.analyzeAndResolve();
    this.asmFiles = this.chunkFiles.filter(b => b.type === BinType.Assembly);
    return reader;
  }

  //Convert blocks to text
  private writeScriptTexts(reader: BlockReader){
    const writer = new BlockWriter(reader);

    //Write blocks to assembly text
    for(const block of this.asmFiles) {
      block.textData = writer.generateAsm(block);
    }
  }

  //Apply base rom files
  private applyBaseRom(){
    for (const chunkFile of this.dbRoot.baseRomFiles!) {
      this.applyPatchFile(chunkFile);
    }
  }

  private applyProjectInit(){
    //Run a single pass to collect all the module files, and apply base files
    for (const chunkFile of this.dbRoot.projectFiles!) {
      // Parse the patch file with the assembler
      console.log(`Processing patch: ${chunkFile.name}`);

      //ChunkFile.group is the module name
      if(chunkFile.group){
        let modArray: ChunkFile[];
        if(!this.moduleLookup.has(chunkFile.group)){
          this.moduleLookup.set(chunkFile.group, modArray = []);
        } else {
          modArray = this.moduleLookup.get(chunkFile.group)!;
        }
        //
        modArray!.push(chunkFile);
      } else {
        //If chunk file is not part of a group, apply it now
        this.applyPatchFile(chunkFile);
      }
    }
  }

  //Apply selected project modules
  private applySelectedModules(){
    for(const module of this.moduleList) {
      for(const file of this.moduleLookup.get(module)!) {
        this.applyPatchFile(file);
      }
    }
  }

  //Assemble code from script text
  private assembleCodeFromText(){
    for(const block of this.asmFiles) {
      const assembler = new Assembler(this.dbRoot, block.textData!);
      const { blocks, includes, reqBank } = assembler.parseAssembly();
      block.parts = blocks;
      block.includes = includes;
      block.bank = reqBank ?? undefined;
    }
  }

  //Apply patches
  private applyCodePatches(){
    RomProcessor.applyPatches(this.asmFiles, this.patchFiles);
  }

  //Calculate sizes
  private calculateSizes(){
    for (const asm of this.chunkFiles) {
      ChunkFileUtils.calculateSize(asm);
    }
  }

  // Assign locations
  private performLayout(){
    const layout = new RomLayout(this.chunkFiles);
    layout.organize();
  }

  // Rebase assemblies
  private rebaseAssemblies(){
    for (const file of this.asmFiles) {
      ChunkFileUtils.rebase(file);
    }
  }

  // Build include lookup map per asm file
  private generateAsmIncludeLookups(){
    for (const f of this.asmFiles) {
      const includeBlocks = this.asmFiles
        .filter(x => f.includes?.has(x.name.toUpperCase()))
        .flatMap(x => x.parts!)
        .filter(b => !!b.label);

      f.includeLookup = new Map();

      for (const b of includeBlocks) {
        if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
      }

      for (const b of (f.parts || []).filter(x => !!x.label)) {
        if (b.label) f.includeLookup.set(b.label.toUpperCase(), b);
      }
    }
  }

  public applyPatchFile(chunkFile: ChunkFile): void {
    console.log(`Processing patch: ${chunkFile.name}`);
    const existing = this.chunkFiles.find(x => x.name === chunkFile.name);

    if(chunkFile.type === BinType.Patch || chunkFile.type === BinType.Assembly) {
      if(existing){
        existing.textData = chunkFile.textData;
      } else {
        if(chunkFile.type === BinType.Patch) {
          this.patchFiles.push(chunkFile);
        }
        this.asmFiles.push(chunkFile);
        this.chunkFiles.push(chunkFile);
      }
    } else {
      if(existing){
        existing.rawData = chunkFile.rawData;
        existing.size = chunkFile.size;
      } else {
        this.chunkFiles.push(chunkFile);
      }
    }
  }

  // Create block lookup for resolving labels to locations
  private generateBlockLookup(){
    const blockLookup = new Map<string, number>();
    for (const f of this.chunkFiles) {
      blockLookup.set(f.name.toUpperCase(), f.location);
    }
    return blockLookup;
  }

  private async writeRom(blockLookup: Map<string, number>){
    const romWriter = new RomWriter(this.dbRoot.entryPoints, "GAIALABS", "01JG  ");
    // Write all files
    for (const file of this.chunkFiles) {
      await romWriter.writeFile(file, blockLookup);
    }

    romWriter.writeHeader();
    romWriter.writeEntryPoints(this.asmFiles);
    romWriter.writeChecksum();

    return romWriter.outBuffer;
  }
}