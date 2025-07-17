# SNES Development AI Primer

## Overview

This primer provides essential technical information about Super Nintendo Entertainment System (SNES) development for AI systems to quickly bootstrap development conversations. The SNES, released in 1990, featured the 65C816 16-bit processor running at 3.58MHz, with sophisticated graphics capabilities and memory mapping systems.

## Key Technical Areas

### 1. Memory Management & Mapping

The SNES uses several memory mapping modes to organize ROM and RAM across its 24-bit address space:

#### Memory Mapping Modes
- **LoROM (Mode 20)**: Most common format, maps ROM in banks $80-$FF and $00-$7F
- **HiROM (Mode 21)**: Higher capacity format, maps ROM linearly in banks $C0-$FF
- **ExHiROM (Mode 25)**: Extended HiROM for larger games, uses additional banking
- **SA-1 ROM (Mode 23)**: Special mapping for SA-1 enhancement chip

#### Memory Map Structure
- **$000000-$7FFFFF**: LoROM area (32MB)
- **$800000-$FFFFFF**: HiROM area (8MB) 
- **System RAM**: $7E0000-$7FFFFF (128KB)
- **Expansion RAM**: $700000-$7DFFFF (variable)
- **Hardware Registers**: Various locations ($2100-$21FF, $4000-$43FF, etc.)

### 2. ROM Header Detection & Structure

SNES ROM headers contain critical cartridge information and are located at different addresses depending on the mapping mode:

#### Header Locations
- **LoROM**: $007FC0-$007FDF (also mirrored at $00FFC0)
- **HiROM**: $00FFC0-$00FFDF
- **ExHiROM**: $40FFC0-$40FFDF

#### Header Structure (32 bytes)
```
$00-$14: Game Title (21 bytes, ASCII)
$15:     Map Mode & Speed
         Bit 0: Slow (0) / Fast (1) ROM
         Bits 4-7: Mapping mode
$16:     Cartridge Type (ROM/RAM/Battery/etc.)
$17:     ROM Size (2^n KB)
$18:     RAM Size (2^n KB) 
$19:     Country Code
$1A:     License Code
$1B:     Version Number
$1C-$1D: Checksum Complement
$1E-$1F: Checksum
```

#### Header Validation
- Checksum verification: Sum all ROM bytes except checksum fields
- Complement check: Checksum + Complement should equal $FFFF
- Map mode validation: Check for valid mapping mode values
- Title validation: Check for printable ASCII characters

### 3. Graphics System & Modes

The SNES PPU (Picture Processing Unit) supports 8 different graphics modes with varying capabilities:

#### Background Modes
- **Mode 0**: 4 layers, 2-bit color (4 colors each)
- **Mode 1**: 3 layers, 4-bit color on BG1/BG2, 2-bit on BG3
- **Mode 2**: 2 layers, 4-bit color, offset-per-tile
- **Mode 3**: 2 layers, 8-bit color on BG1, 4-bit on BG2
- **Mode 4**: 2 layers, 8-bit color on BG1, 2-bit on BG2, offset-per-tile
- **Mode 5**: 2 layers, 4-bit color, high resolution (512x224)
- **Mode 6**: 1 layer, 4-bit color, high resolution, offset-per-tile
- **Mode 7**: 1 layer, 8-bit color, rotation/scaling matrix

#### Graphics Components
- **Backgrounds**: Up to 4 scrolling layers (BG1-BG4)
- **Sprites/Objects**: 128 sprites, up to 32 per scanline
- **Palettes**: 256 colors total, organized in 16-color sub-palettes
- **Tiles**: 8x8 pixel graphics building blocks
- **Tilemaps**: Define tile arrangement and attributes

### 4. DMA (Direct Memory Access) System

The SNES features 8 DMA channels for efficient data transfer without CPU intervention:

#### DMA Channel Structure (Each channel has 16 registers)
- **$43x0**: DMA Control Register
  - Bit 0: Transfer direction (0=CPU→PPU, 1=PPU→CPU)
  - Bit 1: Address increment (0=increment, 1=decrement)
  - Bit 2: Fixed address flag
  - Bits 3-5: Transfer mode
  - Bit 6: Indirect addressing
  - Bit 7: Transfer type

- **$43x1**: Destination Register (PPU address)
- **$43x2-$43x3**: Source Address (low/high)
- **$43x4**: Source Bank
- **$43x5-$43x6**: Transfer Size (low/high)
- **$43x7**: Indirect Bank (Mode 1 only)

#### HDMA (Horizontal-Blank DMA)
- Automated DMA during horizontal blanking
- Allows per-scanline effects (gradients, parallax, etc.)
- Uses indirect addressing for complex patterns

### 5. CPU Architecture (65C816)

The 65C816 is an enhanced 6502 with 16-bit capabilities:

#### Key Features
- 24-bit address space (16MB)
- 16-bit accumulator and index registers (switchable to 8-bit)
- Direct page addressing
- Bank wrapping behavior
- Decimal mode support

#### Processor Status Flags
- **N**: Negative flag
- **V**: Overflow flag  
- **M**: Memory/Accumulator select (0=16-bit, 1=8-bit)
- **X**: Index register select (0=16-bit, 1=8-bit)
- **D**: Decimal mode
- **I**: IRQ disable
- **Z**: Zero flag
- **C**: Carry flag

### 6. Color Math & Special Effects

The SNES supports advanced color operations for visual effects:

#### Color Math Operations
- **Addition**: Combine main screen + sub screen
- **Subtraction**: Subtract sub screen from main screen
- **Half Addition**: Addition with automatic halving
- **Fixed Color**: Add/subtract a fixed RGB color

#### Transparency & Blending
- Semi-transparent sprites and backgrounds
- Color window effects
- Math window operations
- Per-layer color math enable/disable

## Essential Hardware Registers

### PPU Registers ($2100-$21FF)
- **$2100**: Screen Display Register (INIDISP)
- **$2101**: Object Size and Data Area Designation (OBSEL)
- **$2105**: BG Mode and Tile Size Setting (BGMODE)
- **$2106**: Mosaic Size and BG Enable (MOSAIC)
- **$2107-$210A**: BG Tilemap Address Settings (BG1SC-BG4SC)
- **$210B-$210C**: BG Character Address Settings (BG12NBA, BG34NBA)
- **$210D-$2114**: BG Scroll Registers (BG1HOFS-BG4VOFS)
- **$2115**: VRAM Address Increment (VMAIN)
- **$2116-$2119**: VRAM Address and Data (VMADDL/H, VMDATAL/H)

### CPU Registers ($4000-$43FF)  
- **$4016-$4017**: Joypad registers
- **$4200**: Interrupt Enable (NMITIMEN)
- **$4201**: Programmable I/O Port (WRIO)
- **$4210**: NMI Flag and CPU Version (RDNMI)
- **$420B**: DMA Enable (MDMAEN)
- **$420C**: HDMA Enable (HDMAEN)

### DMA Registers ($4300-$43FF)
- **$43x0-$43x7**: DMA channel parameters (8 channels × 8 registers)

## Development Best Practices

### Memory Management
- Always validate ROM headers before processing
- Implement proper bank switching for large ROMs
- Use appropriate memory mapping mode detection
- Handle wrap-around behavior in bank boundaries

### Graphics Programming
- Plan tileset organization for optimal VRAM usage
- Utilize appropriate background modes for your needs
- Implement efficient palette management
- Consider DMA transfers for large graphics updates

### Performance Optimization
- Use HDMA for complex per-line effects
- Minimize PPU register writes during active display
- Leverage sprites vs. background layers appropriately
- Optimize tile reuse and compression

## Technical Reference Links

### ROM Structure & Headers
- [SNES ROM Header Format](https://snes.nesdev.org/wiki/ROM_header)
- [Memory Mapping](https://snes.nesdev.org/wiki/Memory_map)

### Graphics & PPU
- [Color Math](https://snes.nesdev.org/wiki/Color_math)
- [Backgrounds](https://snes.nesdev.org/wiki/Backgrounds)
- [Sprites](https://snes.nesdev.org/wiki/Sprites)
- [Palettes](https://snes.nesdev.org/wiki/Palette)
- [Tilemaps](https://snes.nesdev.org/wiki/Tilemap)
- [Tiles](https://snes.nesdev.org/wiki/Tile)

### CPU & Assembly
- [65C816 Opcodes](https://6502.org/tutorials/65c816opcodes.html)
- [CPU Vectors](https://snes.nesdev.org/wiki/Vectors)

### Hardware Registers
- [PPU Registers](https://snes.nesdev.org/wiki/PPU_registers)
- [DMA Registers](https://snes.nesdev.org/wiki/DMA_registers)

## Common Development Tasks

### Header Analysis
```assembly
; Check if ROM has valid header
LDA $00FFC0    ; Load potential header location
CMP #$00       ; Check for null terminator in title
```

### DMA Setup Example
```assembly
; Set up DMA channel 0 for VRAM transfer
LDA #$01       ; Transfer mode: 2 registers write once
STA $4300      ; DMA control
LDA #$18       ; Destination: VRAM data register
STA $4301      ; DMA destination
```

### Graphics Mode Setup
```assembly
; Enable Mode 1 with 16x16 sprites
LDA #$01       ; BG Mode 1
STA $2105      ; BGMODE register
LDA #$62       ; 16x16 and 32x32 sprites
STA $2101      ; OBSEL register
```

## Debugging & Analysis Tools

### Common Issues
- Header checksum mismatches
- Incorrect memory mapping detection
- VRAM overflow from excessive DMA
- Bank boundary crossing errors
- Palette corruption from incorrect addressing

### Analysis Techniques
- Hexadecimal header inspection
- Memory map validation
- DMA timing analysis
- Graphics layer debugging
- CPU trace analysis

This primer provides the foundation for understanding SNES architecture and development. Each section can be expanded based on specific development needs and requirements.
