# IOGDB API Documentation

## Table of Contents
1. [Introduction](#introduction)
2. [Quick Start](#quick-start)
3. [Authentication](#authentication)
4. [Base URL & Endpoints](#base-url--endpoints)
5. [Data Models Overview](#data-models-overview)
6. [Core Endpoints](#core-endpoints)
7. [Advanced Querying](#advanced-querying)
8. [Practical Examples](#practical-examples)
9. [Error Handling](#error-handling)
10. [Rate Limits & Best Practices](#rate-limits--best-practices)

## Introduction

IOGDB (Interactive Oldschool Gaming Database) is a comprehensive database for managing retro gaming data, ROM analysis, and assembly instruction sets. Built on Supabase with PostgreSQL, it provides auto-generated REST and GraphQL APIs for accessing game metadata, release information, file structures, and 65C816 processor instruction data.

### Key Features
- **Game Management**: Store and organize game metadata across multiple platforms
- **Release Tracking**: Manage different versions and regional releases
- **File & Block Structure**: Organize game assets and data structures
- **Assembly Instruction Sets**: Complete 65C816 processor instruction reference
- **ROM Analysis**: Track ROM characteristics, locations, and transformations
- **User Management**: Built-in authentication and audit trails

## Quick Start

Get up and running with IOGDB API in 5 minutes:

```bash
# Get all games
curl 'https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1/Game' \
  -H "apikey: sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV" \
  -H "Authorization: Bearer sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV"

# Get a specific game with its files
curl 'https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1/Game?id=eq.GAME_ID&select=*,files:GameFile(*)' \
  -H "apikey: sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV" \
  -H "Authorization: Bearer sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV"
```

## Authentication

### API Key
**Publishable Key**: `sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV`

### Required Headers
All API requests must include these headers:

```http
apikey: sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV
Authorization: Bearer sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV
Content-Type: application/json
```

### Security Model
- **Row Level Security (RLS)**: Enforced at the database level
- **JWT Authentication**: User sessions provide access to user-specific data
- **Audit Trails**: All modifications tracked with user attribution
- **Public Access**: Some data may be publicly readable with the provided key

## Base URL & Endpoints

**Base URL**: `https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1/`

### Standard Endpoints
Each table in the database automatically gets these endpoints:

- `GET /<table>` - List records
- `POST /<table>` - Create new record
- `PATCH /<table>?<filter>` - Update records
- `DELETE /<table>?<filter>` - Delete records

## Data Models Overview

### Core Game Data
- **Game**: Master game definitions (title, platform, ROM characteristics)
- **GameFile**: Game asset files (graphics, text, code)
- **GameBlock**: Logical data blocks within games
- **GamePart**: Individual parts within blocks

### Release Management
- **Release**: Specific game versions/regions (US v1.0, JP v1.1)
- **ReleaseFile/Block/Part**: Release-specific overrides and locations
- **ReleaseOverride/Rewrite/Transform/Label**: Release modifications

### Processor/Assembly Data
- **InstructionSet**: 65C816 processor instruction sets
- **InstructionGroup/Instruction/Variant**: Instruction definitions
- **AddressingMode**: Instruction addressing modes
- **ValidationRule**: Assembly validation rules

### Game-Specific Extensions
- **GameMnemonic**: Memory address mnemonics
- **GameCop**: COP operation codes

### User Management
- **User**: User accounts and profiles
- **Account/Session**: Authentication data

## Core Endpoints

### Games

#### List All Games
```http
GET /Game
```

**Example Response:**
```json
[
  {
    "id": "clx1234567890",
    "title": "Super Mario World",
    "description": "Classic Nintendo platformer",
    "platform": "SNES",
    "romDeveloper": 1,
    "romMode": 21,
    "romChipset": 0,
    "romSize": 524288,
    "ramSize": 2048,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z"
  }
]
```

#### Get Game with Files and Blocks
```http
GET /Game?id=eq.GAME_ID&select=*,files:GameFile(*),blocks:GameBlock(*)
```

#### Create New Game
```http
POST /Game
Content-Type: application/json

{
  "title": "The Legend of Zelda: A Link to the Past",
  "description": "Action-adventure game",
  "platform": "SNES",
  "romSize": 1048576,
  "ramSize": 8192
}
```

### Releases

#### Get All Releases for a Game
```http
GET /Release?gameId=eq.GAME_ID&select=*,game:Game(title)
```

#### Find Specific Release
```http
GET /Release?gameId=eq.GAME_ID&romRegion=eq.1&romVersion=eq.0
```

### Game Files

#### Get Files by Type
```http
GET /GameFile?gameId=eq.GAME_ID&type=eq.Graphics
```

#### Get Files with Release Locations
```http
GET /GameFile?gameId=eq.GAME_ID&select=*,releaseFiles:ReleaseFile(romLocation,romSize,release:Release(romRegion,romVersion))
```

### Instruction Sets

#### Get Instruction Set with Instructions
```http
GET /InstructionSet?name=eq.65C816&select=*,instructionGroups:InstructionGroup(*,instructions:Instruction(*,variants:InstructionVariant(*)))
```

#### Find Instruction by Opcode
```http
GET /InstructionVariant?opcode=eq.169&select=*,instruction:Instruction(*),addressingMode:AddressingMode(*)
```

## Advanced Querying

### Filtering

#### Multiple Conditions
```http
GET /Game?platform=eq.SNES&romSize=gte.524288
```

#### Text Search
```http
GET /Game?title=ilike.*mario*
```

#### Array Contains
```http
GET /Instruction?affectedFlags=cs.{N,Z}
```

### Pagination

#### Limit and Offset
```http
GET /Game?limit=10&offset=20
```

#### Range Headers (Preferred)
```http
GET /Game
Range: 0-9
```

### Sorting

#### Single Field
```http
GET /Game?order=title.asc
```

#### Multiple Fields
```http
GET /Release?order=gameId.asc,romRegion.asc,romVersion.desc
```

### Embedding Related Data

#### Deep Relationships
```http
GET /Game?select=*,releases:Release(*,files:ReleaseFile(*,gameFile:GameFile(*)))
```

#### Filtered Relationships
```http
GET /Game?select=*,files:GameFile(*,releaseFiles:ReleaseFile(romLocation,release:Release(romRegion)))&files.type=eq.Graphics
```

## Practical Examples

### Example 1: Game Discovery
Find all SNES games with their file counts:

```http
GET /Game?platform=eq.SNES&select=*,fileCount:files.count()
```

### Example 2: ROM Analysis
Get ROM characteristics for all US releases:

```http
GET /Release?romRegion=eq.1&select=*,game:Game(title,platform),files:ReleaseFile(romLocation,romSize)
```

### Example 3: Assembly Reference
Look up all addressing modes for load instructions:

```http
GET /Instruction?mnemonic=like.LD*&select=*,variants:InstructionVariant(*,addressingMode:AddressingMode(*))
```

### Example 4: File Organization
Get all graphics files grouped by scene:

```http
GET /GameFile?type=eq.Graphics&select=scene,files:*&group=scene
```

## Error Handling

### HTTP Status Codes
- `200` - Success
- `201` - Created
- `400` - Bad Request
- `401` - Unauthorized
- `403` - Forbidden
- `404` - Not Found
- `409` - Conflict
- `422` - Unprocessable Entity
- `500` - Internal Server Error

### Error Response Format
```json
{
  "code": "PGRST116",
  "details": "The result contains 0 rows",
  "hint": null,
  "message": "JSON object requested, multiple (or no) rows returned"
}
```

### Common Errors

#### Invalid Filter
```json
{
  "code": "PGRST102",
  "message": "Unknown operator: 'invalid_op'"
}
```

#### Missing Required Field
```json
{
  "code": "23502",
  "message": "null value in column \"title\" violates not-null constraint"
}
```

## Rate Limits & Best Practices

### Rate Limits
- **Anonymous requests**: 60 requests per minute
- **Authenticated requests**: Higher limits based on plan

### Best Practices

#### 1. Use Specific Selects
```http
# Good - only get needed fields
GET /Game?select=id,title,platform

# Avoid - gets all fields
GET /Game
```

#### 2. Leverage Relationships
```http
# Good - single request with embedded data
GET /Game?select=*,files:GameFile(*)

# Avoid - multiple requests
GET /Game
GET /GameFile?gameId=eq.GAME_ID
```

#### 3. Use Pagination
```http
# Good - paginated results
GET /Game?limit=50&offset=0

# Avoid - large result sets
GET /Game
```

#### 4. Cache Results
- Cache frequently accessed data
- Use ETags for conditional requests
- Implement client-side caching strategies

#### 5. Optimize Queries
- Use indexes for frequently filtered fields
- Avoid deep nesting in complex queries
- Use count queries sparingly

## JavaScript/TypeScript Examples

### Using Supabase Client

```javascript
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://adwobxutnpmjbmhdxrzx.supabase.co'
const supabaseKey = 'sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV'
const supabase = createClient(supabaseUrl, supabaseKey)

// Get all SNES games
const { data: games, error } = await supabase
  .from('Game')
  .select('*')
  .eq('platform', 'SNES')

// Get game with files and releases
const { data: gameData, error } = await supabase
  .from('Game')
  .select(`
    *,
    files:GameFile(*),
    releases:Release(
      *,
      files:ReleaseFile(*)
    )
  `)
  .eq('id', 'GAME_ID')
  .single()

// Create new game
const { data: newGame, error } = await supabase
  .from('Game')
  .insert({
    title: 'Chrono Trigger',
    platform: 'SNES',
    description: 'Time-traveling RPG'
  })
  .select()
  .single()

// Update game
const { data: updatedGame, error } = await supabase
  .from('Game')
  .update({ description: 'Updated description' })
  .eq('id', 'GAME_ID')
  .select()
```

### Real-time Subscriptions

```javascript
// Subscribe to game changes
const gameSubscription = supabase
  .channel('games')
  .on('postgres_changes',
    { event: '*', schema: 'public', table: 'Game' },
    (payload) => {
      console.log('Game changed:', payload)
    }
  )
  .subscribe()

// Subscribe to new releases
const releaseSubscription = supabase
  .channel('releases')
  .on('postgres_changes',
    { event: 'INSERT', schema: 'public', table: 'Release' },
    (payload) => {
      console.log('New release:', payload.new)
    }
  )
  .subscribe()
```

## Python Examples

### Using httpx

```python
import httpx
import json

BASE_URL = "https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1"
API_KEY = "sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV"

headers = {
    "apikey": API_KEY,
    "Authorization": f"Bearer {API_KEY}",
    "Content-Type": "application/json"
}

async def get_games_by_platform(platform: str):
    async with httpx.AsyncClient() as client:
        response = await client.get(
            f"{BASE_URL}/Game",
            headers=headers,
            params={"platform": f"eq.{platform}"}
        )
        return response.json()

async def create_game(game_data: dict):
    async with httpx.AsyncClient() as client:
        response = await client.post(
            f"{BASE_URL}/Game",
            headers=headers,
            json=game_data
        )
        return response.json()

# Usage
games = await get_games_by_platform("SNES")
new_game = await create_game({
    "title": "Final Fantasy VI",
    "platform": "SNES",
    "description": "Epic RPG adventure"
})
```

## Advanced Use Cases

### 1. ROM File Analysis Workflow

```javascript
// Complete workflow for analyzing a ROM file
async function analyzeROM(gameId, releaseData) {
  // 1. Create release record
  const { data: release } = await supabase
    .from('Release')
    .insert({
      gameId,
      romVersion: releaseData.version,
      romRegion: releaseData.region,
      romCrc: releaseData.crc,
      romSize: releaseData.size
    })
    .select()
    .single()

  // 2. Map game files to ROM locations
  const { data: gameFiles } = await supabase
    .from('GameFile')
    .select('*')
    .eq('gameId', gameId)

  const releaseFiles = gameFiles.map(file => ({
    releaseId: release.id,
    gameFileId: file.id,
    romLocation: calculateROMLocation(file),
    romSize: calculateFileSize(file)
  }))

  // 3. Create release file mappings
  const { data: mappedFiles } = await supabase
    .from('ReleaseFile')
    .insert(releaseFiles)
    .select()

  return { release, mappedFiles }
}
```

### 2. Assembly Instruction Lookup

```javascript
// Find instruction by assembly syntax
async function findInstruction(assembly) {
  const { data: variants } = await supabase
    .from('InstructionVariant')
    .select(`
      opcode,
      size,
      cycleTiming,
      instruction:Instruction(
        mnemonic,
        description,
        affectedFlags
      ),
      addressingMode:AddressingMode(
        mode,
        shorthand,
        format,
        parseRegex
      )
    `)
    .or(`instruction.mnemonic.eq.${assembly.split(' ')[0]}`)

  return variants.filter(variant =>
    new RegExp(variant.addressingMode.parseRegex).test(assembly)
  )
}

// Usage
const instructions = await findInstruction("LDA #$80")
```

### 3. Game Comparison Tool

```javascript
// Compare two game releases
async function compareReleases(gameId, region1, region2) {
  const { data: releases } = await supabase
    .from('Release')
    .select(`
      *,
      files:ReleaseFile(
        romLocation,
        romSize,
        gameFile:GameFile(name, type)
      )
    `)
    .eq('gameId', gameId)
    .in('romRegion', [region1, region2])

  const [release1, release2] = releases

  // Compare file locations
  const differences = release1.files.map(file1 => {
    const file2 = release2.files.find(f =>
      f.gameFile.name === file1.gameFile.name
    )

    return {
      fileName: file1.gameFile.name,
      region1Location: file1.romLocation,
      region2Location: file2?.romLocation,
      locationDiff: file2 ? file2.romLocation - file1.romLocation : null
    }
  })

  return differences
}
```

## Database Schema Reference

### Relationships Diagram

```
Game (1) ──── (N) GameFile
 │                 │
 │                 └── (1) ──── (N) ReleaseFile ──── (1) Release
 │                                                      │
 └── (1) ──── (N) Release ──── (N) ReleaseBlock ──── (1) GameBlock
                   │                                     │
                   └── (N) ReleasePart ──── (1) GamePart ┘

InstructionSet (1) ──── (N) InstructionGroup (1) ──── (N) Instruction
                                                           │
                                                           └── (N) InstructionVariant ──── (1) AddressingMode
```

### Key Constraints

- **Unique Constraints**:
  - `Game.title` must be unique
  - `GameFile(gameId, name)` combination must be unique
  - `Release(gameId, romVersion, romRegion)` combination must be unique

- **Foreign Key Cascades**:
  - Deleting a Game cascades to all related GameFiles, GameBlocks, Releases
  - Deleting a Release cascades to all ReleaseFiles, ReleaseBlocks, ReleaseParts

- **Check Constraints**:
  - `GameFile.task` must be longer than 3 characters
  - Various enum validations for ProcessorFlag, AddressingModeType, etc.

## Troubleshooting

### Common Issues

#### 1. Empty Results
```javascript
// Problem: Getting empty array when expecting data
const { data } = await supabase.from('Game').select('*')
// data = []

// Solution: Check RLS policies and authentication
const { data: user } = await supabase.auth.getUser()
console.log('Current user:', user) // May be null for public access
```

#### 2. Permission Denied
```javascript
// Problem: 403 Forbidden errors
// Solution: Ensure proper authentication or check if data is public

// For public data, use anon key
// For user data, ensure user is authenticated
await supabase.auth.signInWithPassword({
  email: 'user@example.com',
  password: 'password'
})
```

#### 3. Invalid JSON Response
```javascript
// Problem: Unexpected response format
// Solution: Check Content-Type header and response status

const response = await fetch(url, { headers })
console.log('Status:', response.status)
console.log('Content-Type:', response.headers.get('content-type'))
```

### Performance Optimization

#### 1. Use Indexes
```sql
-- Create indexes for frequently queried fields
CREATE INDEX idx_game_platform ON "Game"(platform);
CREATE INDEX idx_release_game_region ON "Release"(gameId, romRegion);
CREATE INDEX idx_instruction_mnemonic ON "Instruction"(mnemonic);
```

#### 2. Optimize Queries
```javascript
// Good: Specific field selection
const { data } = await supabase
  .from('Game')
  .select('id, title, platform')
  .limit(10)

// Better: Use count for pagination info
const { count } = await supabase
  .from('Game')
  .select('*', { count: 'exact', head: true })
```

#### 3. Batch Operations
```javascript
// Good: Batch inserts
const { data } = await supabase
  .from('GameFile')
  .insert([
    { gameId: 'game1', name: 'file1.bin', type: 'Graphics' },
    { gameId: 'game1', name: 'file2.bin', type: 'Audio' },
    { gameId: 'game1', name: 'file3.bin', type: 'Code' }
  ])
```

---

*This documentation covers the core functionality of the IOGDB API. For additional features and advanced use cases, refer to the [Supabase PostgREST documentation](https://postgrest.org/en/stable/).*
