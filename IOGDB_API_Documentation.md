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

### String Processing Models
- **GameString**: Game-specific string type definitions with delimiters and terminators
- **GameStringCommand**: Commands for game string processing (ESC codes, control characters)
- **ReleaseString**: Release-specific string overrides with character maps
- **ReleaseStringCommand**: Release-specific command overrides
- **ReleaseStringLayer**: Character mapping layers for complex string systems

### User Management
- **User**: User accounts and profiles with comprehensive audit trails
- **Account/Session**: OAuth authentication data
- **VerificationToken**: Email verification tokens

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

### String Processing

#### Get Game String Types with Commands
```http
GET /GameString?gameId=eq.GAME_ID&select=*,commands:GameStringCommand(*),releaseStrings:ReleaseString(*)
```

#### Get Release String with Character Map
```http
GET /ReleaseString?releaseId=eq.RELEASE_ID&select=*,characterMap,gameString:GameString(*),commands:ReleaseStringCommand(*),layers:ReleaseStringLayer(*)
```

## Complete API Endpoint Reference

### Core Game Data Endpoints

#### Game
- `GET /Game` - List games
- `POST /Game` - Create game
- `PATCH /Game?<filter>` - Update games
- `DELETE /Game?<filter>` - Delete games

#### GameFile
- `GET /GameFile` - List game files
- `POST /GameFile` - Create game file
- `PATCH /GameFile?<filter>` - Update game files
- `DELETE /GameFile?<filter>` - Delete game files

#### GameBlock
- `GET /GameBlock` - List game blocks
- `POST /GameBlock` - Create game block
- `PATCH /GameBlock?<filter>` - Update game blocks
- `DELETE /GameBlock?<filter>` - Delete game blocks

#### GamePart
- `GET /GamePart` - List game parts
- `POST /GamePart` - Create game part
- `PATCH /GamePart?<filter>` - Update game parts
- `DELETE /GamePart?<filter>` - Delete game parts

### Release Management Endpoints

#### Release
- `GET /Release` - List releases
- `POST /Release` - Create release
- `PATCH /Release?<filter>` - Update releases
- `DELETE /Release?<filter>` - Delete releases

#### ReleaseFile
- `GET /ReleaseFile` - List release files
- `POST /ReleaseFile` - Create release file
- `PATCH /ReleaseFile?<filter>` - Update release files
- `DELETE /ReleaseFile?<filter>` - Delete release files

#### ReleaseBlock
- `GET /ReleaseBlock` - List release blocks
- `POST /ReleaseBlock` - Create release block
- `PATCH /ReleaseBlock?<filter>` - Update release blocks
- `DELETE /ReleaseBlock?<filter>` - Delete release blocks

#### ReleasePart
- `GET /ReleasePart` - List release parts
- `POST /ReleasePart` - Create release part
- `PATCH /ReleasePart?<filter>` - Update release parts
- `DELETE /ReleasePart?<filter>` - Delete release parts

#### ReleaseOverride
- `GET /ReleaseOverride` - List release overrides
- `POST /ReleaseOverride` - Create release override
- `PATCH /ReleaseOverride?<filter>` - Update release overrides
- `DELETE /ReleaseOverride?<filter>` - Delete release overrides

#### ReleaseRewrite
- `GET /ReleaseRewrite` - List release rewrites
- `POST /ReleaseRewrite` - Create release rewrite
- `PATCH /ReleaseRewrite?<filter>` - Update release rewrites
- `DELETE /ReleaseRewrite?<filter>` - Delete release rewrites

#### ReleaseTransform
- `GET /ReleaseTransform` - List release transforms
- `POST /ReleaseTransform` - Create release transform
- `PATCH /ReleaseTransform?<filter>` - Update release transforms
- `DELETE /ReleaseTransform?<filter>` - Delete release transforms

#### ReleaseLabel
- `GET /ReleaseLabel` - List release labels
- `POST /ReleaseLabel` - Create release label
- `PATCH /ReleaseLabel?<filter>` - Update release labels
- `DELETE /ReleaseLabel?<filter>` - Delete release labels

### Processor/Assembly Endpoints

#### InstructionSet
- `GET /InstructionSet` - List instruction sets
- `POST /InstructionSet` - Create instruction set
- `PATCH /InstructionSet?<filter>` - Update instruction sets
- `DELETE /InstructionSet?<filter>` - Delete instruction sets

#### InstructionGroup
- `GET /InstructionGroup` - List instruction groups
- `POST /InstructionGroup` - Create instruction group
- `PATCH /InstructionGroup?<filter>` - Update instruction groups
- `DELETE /InstructionGroup?<filter>` - Delete instruction groups

#### Instruction
- `GET /Instruction` - List instructions
- `POST /Instruction` - Create instruction
- `PATCH /Instruction?<filter>` - Update instructions
- `DELETE /Instruction?<filter>` - Delete instructions

#### InstructionVariant
- `GET /InstructionVariant` - List instruction variants
- `POST /InstructionVariant` - Create instruction variant
- `PATCH /InstructionVariant?<filter>` - Update instruction variants
- `DELETE /InstructionVariant?<filter>` - Delete instruction variants

#### AddressingMode
- `GET /AddressingMode` - List addressing modes
- `POST /AddressingMode` - Create addressing mode
- `PATCH /AddressingMode?<filter>` - Update addressing modes
- `DELETE /AddressingMode?<filter>` - Delete addressing modes

#### ValidationRule
- `GET /ValidationRule` - List validation rules
- `POST /ValidationRule` - Create validation rule
- `PATCH /ValidationRule?<filter>` - Update validation rules
- `DELETE /ValidationRule?<filter>` - Delete validation rules

### Game-Specific Data Endpoints

#### GameMnemonic
- `GET /GameMnemonic` - List game mnemonics
- `POST /GameMnemonic` - Create game mnemonic
- `PATCH /GameMnemonic?<filter>` - Update game mnemonics
- `DELETE /GameMnemonic?<filter>` - Delete game mnemonics

#### GameCop
- `GET /GameCop` - List game COP codes
- `POST /GameCop` - Create game COP code
- `PATCH /GameCop?<filter>` - Update game COP codes
- `DELETE /GameCop?<filter>` - Delete game COP codes

### String Processing Endpoints

#### GameString
- `GET /GameString` - List game string types
- `POST /GameString` - Create game string type
- `PATCH /GameString?<filter>` - Update game string types
- `DELETE /GameString?<filter>` - Delete game string types

#### GameStringCommand
- `GET /GameStringCommand` - List game string commands
- `POST /GameStringCommand` - Create game string command
- `PATCH /GameStringCommand?<filter>` - Update game string commands
- `DELETE /GameStringCommand?<filter>` - Delete game string commands

#### ReleaseString
- `GET /ReleaseString` - List release strings
- `POST /ReleaseString` - Create release string
- `PATCH /ReleaseString?<filter>` - Update release strings
- `DELETE /ReleaseString?<filter>` - Delete release strings

#### ReleaseStringCommand
- `GET /ReleaseStringCommand` - List release string commands
- `POST /ReleaseStringCommand` - Create release string command
- `PATCH /ReleaseStringCommand?<filter>` - Update release string commands
- `DELETE /ReleaseStringCommand?<filter>` - Delete release string commands

#### ReleaseStringLayer
- `GET /ReleaseStringLayer` - List release string layers
- `POST /ReleaseStringLayer` - Create release string layer
- `PATCH /ReleaseStringLayer?<filter>` - Update release string layers
- `DELETE /ReleaseStringLayer?<filter>` - Delete release string layers

### User Management Endpoints

#### User
- `GET /User` - List users
- `POST /User` - Create user
- `PATCH /User?<filter>` - Update users
- `DELETE /User?<filter>` - Delete users

#### Account
- `GET /Account` - List accounts
- `POST /Account` - Create account
- `PATCH /Account?<filter>` - Update accounts
- `DELETE /Account?<filter>` - Delete accounts

#### Session
- `GET /Session` - List sessions
- `POST /Session` - Create session
- `PATCH /Session?<filter>` - Update sessions
- `DELETE /Session?<filter>` - Delete sessions

#### VerificationToken
- `GET /VerificationToken` - List verification tokens
- `POST /VerificationToken` - Create verification token
- `PATCH /VerificationToken?<filter>` - Update verification tokens
- `DELETE /VerificationToken?<filter>` - Delete verification tokens

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

### Example 5: String Processing Setup
Create a game string type with commands for dialogue processing:

```http
POST /GameString
Content-Type: application/json

{
  "gameId": "GAME_ID",
  "name": "DialogueString",
  "delimiter": "|",
  "terminator": 255,
  "description": "Main dialogue string type with control codes"
}
```

Then add commands to it:
```http
POST /GameStringCommand
Content-Type: application/json

{
  "gameStringId": "STRING_TYPE_ID",
  "key": 254,
  "value": "WAIT",
  "types": ["byte"],
  "halt": true
}
```

### Example 6: Character Map Management
Get a complete character map for a release:

```http
GET /ReleaseString?releaseId=eq.RELEASE_ID&gameStringId=eq.STRING_TYPE_ID&select=*,characterMap,layers:ReleaseStringLayer(base,map),commands:ReleaseStringCommand(*,gameStringCommand:GameStringCommand(*))
```

Create a character mapping layer:
```http
POST /ReleaseStringLayer
Content-Type: application/json

{
  "releaseStringId": "RELEASE_STRING_ID",
  "base": 0,
  "map": [
    {"index": 0, "character": " "},
    {"index": 1, "character": "A"},
    {"index": 2, "character": "B"}
  ]
}
```

### Example 7: String Processing Query
Find all string commands that halt processing:

```http
GET /GameStringCommand?halt=eq.true&select=*,gameString:GameString(name,game:Game(title))
```

Get release-specific overrides for string commands:
```http
GET /ReleaseStringCommand?select=*,value,types,gameStringCommand:GameStringCommand(value,types),releaseString:ReleaseString(release:Release(romRegion,romVersion))
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
 ├── (1) ──── (N) Release ──── (N) ReleaseBlock ──── (1) GameBlock
 │                   │                                     │
 │                   └── (N) ReleasePart ──── (1) GamePart ┘
 │
 ├── (1) ──── (N) GameMnemonic
 ├── (1) ──── (N) GameCop
 └── (1) ──── (N) GameString ──── (N) GameStringCommand
                     │
                     └── (1) ──── (N) ReleaseString ──── (1) Release
                                         │
                                         ├── (N) ReleaseStringCommand ──── (1) GameStringCommand
                                         └── (N) ReleaseStringLayer

InstructionSet (1) ──── (N) InstructionGroup (1) ──── (N) Instruction
         │                                                 │
         └── (N) ValidationRule              └── (N) InstructionVariant ──── (1) AddressingMode

User (1) ──── (N) Account
  │    └──── (N) Session
  └── (N) [Audit Relations] ──── All Models with audit fields

Release (1) ──── (N) ReleaseOverride
    │      ──── (N) ReleaseRewrite
    │      ──── (N) ReleaseTransform
    └──────────── (N) ReleaseLabel
```

### Key Constraints

- **Unique Constraints**:
  - `Game.title` must be unique
  - `GameFile(gameId, name)` combination must be unique
  - `GameBlock(gameId, name)` combination must be unique
  - `GamePart(gameBlockId, name)` combination must be unique
  - `Release(gameId, romVersion, romRegion)` combination must be unique
  - `GameMnemonic(gameId, key)` combination must be unique
  - `GameCop(gameId, code)` combination must be unique
  - `GameString(gameId, name)` combination must be unique
  - `GameStringCommand(gameStringId, key)` combination must be unique
  - `InstructionSet.name` must be unique
  - `InstructionGroup(instructionSetId, name)` combination must be unique
  - `Instruction(instructionGroupId, mnemonic)` combination must be unique
  - `InstructionVariant.opcode` must be unique
  - `AddressingMode.mode` must be unique
  - `AddressingMode.shorthand` must be unique
  - Various other unique constraints on relationship tables

- **Foreign Key Cascades**:
  - Deleting a Game cascades to all related GameFiles, GameBlocks, Releases, GameMnemonics, GameCops, GameStrings
  - Deleting a Release cascades to all ReleaseFiles, ReleaseBlocks, ReleaseParts, ReleaseStrings, ReleaseOverrides, etc.
  - Deleting a GameString cascades to GameStringCommands and ReleaseStrings
  - Deleting an InstructionSet cascades to all related groups, instructions, and variants
  - Deleting a User cascades to Accounts and Sessions

- **Enum Validations**:
  - `ProcessorFlag`: N, V, M, X, D, I, Z, C, B, E, WILDCARD
  - `AddressingModeType`: Immediate, Absolute, AbsoluteLong, DirectPage, etc.
  - `InstructionCategory`: LoadStore, Arithmetic, Logical, Shift, ControlFlow, etc.
  - `OperandType`: Absolute, AbsoluteLong, Direct, Immediate, None, Label, etc.
  - `UserRole`: USER, MODERATOR, ADMIN

## Complete Schema Reference

### Core Game Data Models

#### Game
- `id`: String (cuid, primary key)
- `title`: String (unique, required)
- `description`: String (optional)
- `platform`: String (required, e.g., "SNES", "Genesis")
- `meta`: Json (optional metadata)
- ROM characteristics:
  - `romDeveloper`: Int (optional)
  - `romMode`: Int (optional)
  - `romChipset`: Int (optional)
  - `romSize`: Int (optional)
  - `ramSize`: Int (optional)
- Audit fields: `createdAt`, `updatedAt`, `deletedAt`, `createdById`, `updatedById`, `deletedById`
- Relations: `files`, `blocks`, `releases`, `mnemonics`, `cops`, `gameStrings`, audit relations

#### GameFile
- `id`: String (cuid, primary key)
- `name`: String (required)
- `type`: String (optional, e.g., "Graphics", "Text", "Code")
- `group`: String (optional, for logical grouping)
- `scene`: String (optional, e.g., "Intro", "World Map")
- `gameId`: String (foreign key to Game)
- Audit fields and relations
- Unique constraint: `(gameId, name)`

#### GameBlock
- `id`: String (cuid, primary key)
- `name`: String (required)
- `group`: String (optional)
- `scene`: String (optional)
- `gameId`: String (foreign key to Game)
- Relations: `parts`, `releaseBlocks`
- Audit fields and relations
- Unique constraint: `(gameId, name)`

#### GamePart
- `id`: String (cuid, primary key)
- `name`: String (required)
- `struct`: String (optional, describes data structure)
- `order`: Int (default 0, order within block)
- `gameBlockId`: String (foreign key to GameBlock)
- Relations: `releaseParts`
- Audit fields and relations
- Unique constraint: `(gameBlockId, name)`

### Release Management Models

#### Release
- `id`: String (cuid, primary key)
- `romVersion`: Int (e.g., 0 for "1.0")
- `romRegion`: Int (e.g., 1 for "US")
- `romTitle`: String (optional)
- `romCode`: String (optional)
- `romCrc`: Int (optional, e.g., 0x1C3848C0)
- `gameId`: String (foreign key to Game)
- Relations: `files`, `blocks`, `parts`, `overrides`, `rewrites`, `transforms`, `labels`, `releaseStrings`
- Audit fields and relations
- Unique constraint: `(gameId, romVersion, romRegion)`

#### ReleaseFile
- `id`: String (cuid, primary key)
- `releaseId`: String (foreign key to Release)
- `gameFileId`: String (foreign key to GameFile)
- Overridable fields: `name`, `type`, `group`, `scene`
- Release-specific fields: `romLocation`, `romSize`
- Audit fields and relations
- Unique constraint: `(releaseId, gameFileId)`

#### ReleaseBlock
- `id`: String (cuid, primary key)
- `releaseId`: String (foreign key to Release)
- `gameBlockId`: String (foreign key to GameBlock)
- Overridable fields: `name`, `group`, `scene`
- Audit fields and relations
- Unique constraint: `(releaseId, gameBlockId)`

#### ReleasePart
- `id`: String (cuid, primary key)
- `releaseId`: String (foreign key to Release)
- `gamePartId`: String (foreign key to GamePart)
- Overridable fields: `name`, `struct`, `order`
- Release-specific fields: `romLocation`, `romSize`
- Audit fields and relations
- Unique constraint: `(releaseId, gamePartId)`

### String Processing Models

#### GameString
- `id`: String (cuid, primary key)
- `gameId`: String (foreign key to Game)
- `name`: String (required, e.g., "ASCIIString", "WideString")
- `delimiter`: String (required, e.g., "|", "`", "~")
- `shiftType`: String (optional, e.g., "wh2", "h2")
- `terminator`: Int (required, terminator byte value)
- `greedyTerminator`: Boolean (default false)
- `description`: String (optional)
- Relations: `commands`, `releaseStrings`
- Audit fields and relations
- Unique constraint: `(gameId, name)`

#### GameStringCommand
- `id`: String (cuid, primary key)
- `key`: Int (required, command key/code)
- `value`: String (required, command name/mnemonic)
- `types`: Json (required, array of parameter types)
- `delimiter`: Int (optional, delimiter for ESC commands)
- `halt`: Boolean (default false, whether command halts processing)
- `gameStringId`: String (foreign key to GameString)
- Relations: `releaseStringCommands`
- Audit fields
- Unique constraint: `(gameStringId, key)`

#### ReleaseString
- `id`: String (cuid, primary key)
- `releaseId`: String (foreign key to Release)
- `gameStringId`: String (foreign key to GameString)
- Overridable fields: `name`, `delimiter`, `shiftType`, `terminator`, `greedyTerminator`, `description`
- `characterMap`: Json (required, array of character mappings - THE ACTUAL DATA)
- Relations: `commands`, `layers`
- Audit fields and relations
- Unique constraint: `(releaseId, gameStringId)`

#### ReleaseStringCommand
- `id`: String (cuid, primary key)
- `releaseStringId`: String (foreign key to ReleaseString)
- `gameStringCommandId`: String (foreign key to GameStringCommand)
- Overridable fields: `key`, `value`, `types`, `delimiter`, `halt`
- Audit fields and relations
- Unique constraint: `(releaseStringId, gameStringCommandId)`

#### ReleaseStringLayer
- `id`: String (cuid, primary key)
- `base`: Int (required, base offset for the layer)
- `map`: Json (required, array of character mappings for this layer)
- `releaseStringId`: String (foreign key to ReleaseString)
- Audit fields: `createdAt`, `updatedAt`

### Processor/Assembly Models

#### InstructionSet
- `id`: String (cuid, primary key)
- `name`: String (unique, required)
- `version`: String (required)
- `description`: String (optional)
- `baseProcessor`: String (optional)
- `generatedFrom`: String (optional)
- `totalInstructions`: Int (required)
- `totalVariants`: Int (required)
- `cycleNotation`: Json (required, cycle timing notation and examples)
- `metadata`: Json (optional, additional metadata)
- Relations: `instructionGroups`, `validationRules`
- Audit fields

#### InstructionGroup
- `id`: String (cuid, primary key)
- `name`: String (required)
- `category`: InstructionCategory (enum, required)
- `description`: String (optional)
- `instructionSetId`: String (foreign key to InstructionSet)
- Relations: `instructions`
- Audit fields
- Unique constraint: `(instructionSetId, name)`

#### Instruction
- `id`: String (cuid, primary key)
- `mnemonic`: String (required, e.g., "LDA", "STA")
- `description`: String (required)
- `affectedFlags`: ProcessorFlag[] (array of affected flags)
- `instructionGroupId`: String (foreign key to InstructionGroup)
- Relations: `variants`
- Audit fields
- Unique constraint: `(instructionGroupId, mnemonic)`

#### InstructionVariant
- `id`: String (cuid, primary key)
- `opcode`: Int (unique, 0-255 opcode value)
- `size`: Int (optional, size in bytes, null for flag-dependent)
- `isFlagDependent`: Boolean (default false, true if size depends on processor flags)
- `cycleTiming`: Json (required, CycleTiming object with base, penalties, description, etc.)
- `instructionId`: String (foreign key to Instruction)
- `addressingModeId`: String (foreign key to AddressingMode)
- Audit fields

#### AddressingMode
- `id`: String (cuid, primary key)
- `mode`: AddressingModeType (unique enum)
- `shorthand`: String (unique, e.g., "abs", "imm")
- `operandType`: OperandType (enum, required)
- `description`: String (required)
- `officialName`: String (optional)
- `length`: Int (required, instruction length in bytes)
- `format`: String (required, format pattern like "$OP $LL $HH")
- `formatString`: String (required, format string like "${0:X4}")
- `parseRegex`: String (required, regex for parsing assembly)
- `operandSize`: Int (required, size of operand in bytes)
- `supportsSymbols`: Boolean (default false)
- `bankWrapping`: Boolean (default false)
- `pageWrapping`: Boolean (default false)
- `validationPatterns`: Json (required, validation regex patterns)
- `examples`: Json (required, example usage patterns)
- Relations: `instructionVariants`
- Audit fields

#### ValidationRule
- `id`: String (cuid, primary key)
- `name`: String (required)
- `category`: String (required, e.g., "operandSizeValidation", "instructionValidation")
- `rules`: Json (required, complete validation rule object)
- `instructionSetId`: String (foreign key to InstructionSet)
- Audit fields
- Unique constraint: `(instructionSetId, name, category)`

### Game-Specific Data Models

#### GameMnemonic
- `id`: String (cuid, primary key)
- `key`: Int (required, memory address key)
- `value`: String (required, mnemonic name/value)
- `gameId`: String (foreign key to Game)
- Audit fields
- Unique constraint: `(gameId, key)`

#### GameCop
- `id`: String (cuid, primary key)
- `code`: Int (required, COP operation code)
- `mnem`: String (required, mnemonic representation)
- `size`: Int (required, size in bytes)
- `halt`: Boolean (required, whether operation halts execution)
- `parts`: Json (required, array of parts/parameters)
- `gameId`: String (foreign key to Game)
- Audit fields
- Unique constraint: `(gameId, code)`

### Release-Specific Data Models

#### ReleaseOverride
- `id`: String (cuid, primary key)
- `data`: Json (required, override data structure)
- `releaseId`: String (foreign key to Release)
- Audit fields

#### ReleaseRewrite
- `id`: String (cuid, primary key)
- `data`: Json (required, rewrite data structure)
- `releaseId`: String (foreign key to Release)
- Audit fields

#### ReleaseTransform
- `id`: String (cuid, primary key)
- `block`: String (required, block name that transform applies to)
- `transforms`: Json (required, array of key-value transform rules)
- `releaseId`: String (foreign key to Release)
- Audit fields
- Unique constraint: `(releaseId, block)`

#### ReleaseLabel
- `id`: String (cuid, primary key)
- `location`: Int (required, memory location/address)
- `label`: String (required, label name)
- `releaseId`: String (foreign key to Release)
- Audit fields
- Unique constraint: `(releaseId, location)`

### User Management Models

#### User
- `id`: String (cuid, primary key)
- `name`: String (optional)
- `email`: String (unique, optional)
- `emailVerified`: DateTime (optional)
- `image`: String (optional)
- `role`: UserRole (enum, default USER)
- Relations: `accounts`, `sessions`, plus extensive audit relations to all auditable models
- Audit fields: `createdAt`, `updatedAt`, `deletedAt`

#### Account
- `id`: String (cuid, primary key)
- `userId`: String (foreign key to User)
- `type`: String (required)
- `provider`: String (required)
- `providerAccountId`: String (required)
- OAuth fields: `refresh_token`, `access_token`, `expires_at`, `token_type`, `scope`, `id_token`, `session_state`
- Unique constraint: `(provider, providerAccountId)`

#### Session
- `id`: String (cuid, primary key)
- `sessionToken`: String (unique, required)
- `userId`: String (foreign key to User)
- `expires`: DateTime (required)

#### VerificationToken
- `identifier`: String (required)
- `token`: String (unique, required)
- `expires`: DateTime (required)
- Unique constraint: `(identifier, token)`

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
