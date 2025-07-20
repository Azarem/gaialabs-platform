?INCLUDE 'sE6_gaia'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00CF8E'
?INCLUDE 'func_0AA36E'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00DB8A'
?INCLUDE 'func_00F3C9'
?INCLUDE 'func_00CFEF'
?INCLUDE 'entry_points_00C418'

!scene_current                  0644
!joypad_mask_std                065A
!player_x_pos                   09A2
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btF2_neo_castoth [
  h_actor < #01, #01, #03 >   ;00
]

---------------------------------------------

e_btF2_neo_castoth {
    LDA #$8011
    TSB $12
    COP [BC] ( #08, #00 )
    COP [B6] ( #30 )
    COP [A3] ( @code_0A9A68, #$0058, #$00A0, #$0200 )
    TYA 
    STA $7F0000, X
    COP [A3] ( @code_0A9A76, #$0098, #$00A0, #$0200 )
    TYA 
    STA $7F0002, X
    COP [80] ( #00 )
    COP [89]
    LDA #$0100
    TSB $12
    COP [80] ( #01 )
    COP [89]
    LDA $0AD4
    CMP #$0002
    BEQ code_0A9A43
    LDY $player_actor
    LDA #$*func_08F5F9
    STA $0002, Y
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0A9A43
    RTL 
}

code_0A9A43 {
    COP [A5] ( @func_0A9EEB, #00, #00, #$2200 )
    TYA 
    STA $7F0010, X
    COP [57] ( @func_0A9C1E )
    COP [A5] ( @code_0A9AB9, #00, #00, #$2000 )
    STZ $00F0
    STZ $00F2
    JMP $&code_0A9BF6
}

code_0A9A68 {
    COP [BC] ( #08, #00 )
    LDA #$8023
    TSB $12
    COP [B6] ( #30 )
    BRA code_0A9A84
}

code_0A9A76 {
    COP [BC] ( #08, #00 )
    COP [B8]
    LDA #$8023
    TSB $12
    COP [B6] ( #30 )
}

code_0A9A84 {
    LDA #$&stats_01ABF0+190
    STA $7F0020, X
    LDA $@stats_01ABF0+190
    AND #$00FF
    STA $7F0026, X
    STA $7F0010, X
    COP [80] ( #06 )
    COP [89]
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BNE code_0A9AB8
    JMP $&code_0AA1D3
}

code_0A9AB8 {
    RTL 
}

code_0A9AB9 {
    COP [C1]
    LDA $0AEC
    BEQ code_0A9AC1
    RTL 
}

code_0A9AC1 {
    LDY $player_actor
    LDA #$*func_08F3B1
    STA $0002, Y
    LDA #$&func_08F3B1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0A9AE7
    RTL 
}

code_0A9AE7 {
    COP [CD] ( #$0175 )
    LDA #$0003
    STA $0648
    LDA #$0303
    STA $064A
    COP [26] ( #E0, #$03F8, #$03A0, #03, #$4830 )
    COP [E0]
}

---------------------------------------------

h_ir29_castoth [
  h_actor < #01, #01, #03 >   ;00
]

---------------------------------------------

e_ir29_castoth {
    LDA #$0000
    JSL $@func_00B05E
    BCC code_0A9B17
    STZ $0AEC
    STZ $0AEE
    COP [E0]
}

code_0A9B17 {
    LDA #$8011
    TSB $12
    COP [BC] ( #08, #F8 )
    COP [B6] ( #20 )
    LDA #$*binary_0A9C0F
    AND #$00FF
    STA $0AF6
    LDA #$&binary_0A9C0F
    STA $0AF4
    JSL $@func_0AA37B
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [08] ( #$0E0E )
    COP [32] ( #1E )
    COP [33]
    COP [DA] ( #27 )
    COP [04] ( #0F )
    COP [DA] ( #3B )
    LDA #$EFF0
    TRB $joypad_mask_std
    JSL $@func_0AA391
    COP [A5] ( @func_00CF8E, #00, #00, #$2000 )
    COP [A3] ( @code_0AA169, #$0050, #$00E0, #$0301 )
    TYA 
    STA $7F0000, X
    COP [DA] ( #3B )
    COP [A3] ( @code_0AA177, #$00A0, #$00E0, #$0301 )
    TYA 
    STA $7F0002, X
    COP [DA] ( #3B )
    COP [80] ( #00 )
    COP [89]
    LDA #$0100
    TSB $12
    LDA #$0090
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    COP [22] ( #01, #01 )
    COP [A5] ( @func_0A9EEB, #00, #00, #$2200 )
    TYA 
    STA $7F0010, X
    COP [57] ( @func_0A9C1E )
    STZ $26
    STZ $00F0
    STZ $00F2
    BRA code_0A9BF6
}

---------------------------------------------

func_0A9BC2 {
    LDA #$0200
    TRB $10
    COP [80] ( #29 )
    COP [89]
    COP [A5] ( @func_0A9C17, #00, #00, #$2000 )
    COP [DB] ( #$0095 )
    COP [A2] ( @code_0A9D64, #$0302 )
    COP [DB] ( #$0095 )
    COP [C8] ( &func_0A9D25 )
    LDA #$0003
    STA $00F2
    LDA #$0200
    TSB $10
    STZ $00F0
}

code_0A9BF6 {
    COP [DB] ( #$010D )
    COP [A2] ( @code_0A9D64, #$0302 )
    COP [DB] ( #$010D )
    LDA $00F0
    CMP #$0003
    BEQ func_0A9BC2
    BRA code_0A9BF6
}

---------------------------------------------

binary_0A9C0F #1E68000001000024

---------------------------------------------

func_0A9C17 {
    COP [37] ( #11 )
    COP [39]
    COP [E0]
}

---------------------------------------------

func_0A9C1E {
    LDA $player_flags
    BIT #$0200
    BEQ code_0A9C29
    COP [C1]
    RTL 
}

code_0A9C29 {
    LDA #$0020
    TSB $player_flags
    LDY $26
    BEQ code_0A9C41
    STZ $26
    LDA #$&code_0A9DB1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
}

code_0A9C41 {
    LDA $7F0010, X
    PHX 
    TCD 
    TAX 
    COP [A7]
    PLA 
    TCD 
    TAX 
    LDA $7F0000, X
    TAY 
    LDA #$&func_0A9CB2
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA $7F0002, X
    TAY 
    LDA #$&func_0A9CB2
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    COP [A5] ( @code_0A9C8E, #00, #00, #$2000 )
    COP [DA] ( #3B )
    COP [88] ( @table_0EE000 )
    COP [C7] ( @func_00DB8A )
}

code_0A9C8E {
    COP [88] ( @table_0EE000 )
    COP [CA] ( #12 )
    COP [A5] ( @code_0A9CE7, #00, #C8, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0A9CF4, #00, #C8, #$0302 )
    COP [DA] ( #02 )
    COP [CB]
    COP [E0]
}

---------------------------------------------

func_0A9CB2 {
    COP [A5] ( @code_0A9CC0, #00, #00, #$2000 )
    COP [DA] ( #1D )
    COP [E0]
}

code_0A9CC0 {
    COP [B6] ( #30 )
    COP [88] ( @table_0EE000 )
    COP [CA] ( #0A )
    COP [A5] ( @code_0A9CE7, #00, #00, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0A9CF4, #00, #00, #$0302 )
    COP [DA] ( #02 )
    COP [CB]
    COP [E0]
}

code_0A9CE7 {
    JSR $&sub_0A9CFE
    COP [07] ( #06 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0A9CF4 {
    JSR $&sub_0A9CFE
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0A9CFE {
    COP [23]
    COP [23]
    COP [24] ( #60 )
    LDA $0420
    SEC 
    SBC #$0030
    CLC 
    ADC $14
    STA $14
    COP [23]
    COP [23]
    COP [24] ( #60 )
    LDA $0420
    SEC 
    SBC #$0030
    CLC 
    ADC $16
    STA $16
    RTS 
}

---------------------------------------------

func_0A9D25 {
    LDA #$0200
    TSB $10
    COP [CA] ( #05 )
    COP [07] ( #1F )
    COP [80] ( #28 )
    COP [89]
    COP [CB]
    COP [9E] ( @code_0A9D93, #$0000, #$FFE0, #$2202 )
    STY $26
    COP [80] ( #01 )
    COP [89]
    COP [DB] ( #$012B )
    LDA #$0200
    TRB $10
    LDY $26
    STZ $26
    LDA #$&code_0A9DB1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    COP [C5]
}

code_0A9D64 {
    COP [80] ( #25 )
    COP [89]
    COP [80] ( #26 )
    COP [89]
    COP [A5] ( @code_0A9FDB, #00, #A0, #$2000 )
    LDA $scene_current
    CMP #$002A
    BCC code_0A9D8B
    COP [DA] ( #0E )
    COP [A5] ( @code_0A9FDB, #00, #A0, #$2000 )
}

code_0A9D8B {
    COP [84] ( #26, #08 )
    COP [8A]
    COP [E0]
}

code_0A9D93 {
    COP [B6] ( #30 )
    COP [A2] ( @code_0A9DBA, #$0202 )
    COP [A2] ( @code_0A9DB3, #$0202 )
    COP [C1]
    LDY $24
    LDA $0010, Y
    BIT #$0040
    BNE code_0A9DB1
    RTL 
}

code_0A9DB1 {
    COP [E0]
}

code_0A9DB3 {
    COP [80] ( #19 )
    COP [89]
    BRA code_0A9DB3
}

code_0A9DBA {
    PHX 
    LDX #$0000
    LDA $player_x_pos
    CLC 
    ADC #$0008
    STA $0000
    SEC 
    SBC #$0080
    BMI code_0A9DED

  code_0A9DCE:
    CMP $@array_0A9ED3, X
    BCC code_0A9DDD
    INX 
    INX 
    INX 
    INX 
    CPX #$0014
    BCC code_0A9DCE
}

code_0A9DDD {
    LDA $@array_0A9ED3+2, X
    PLX 
    PHA 
    LDA $0E
    ORA #$4000
    STA $0E
    PLA 
    BRA code_0A9E07
}

code_0A9DED {
    BPL code_0A9DF3
    EOR #$FFFF
    INC 
}

code_0A9DF3 {
    CMP $@array_0A9ED3, X
    BCC code_0A9E02
    INX 
    INX 
    INX 
    INX 
    CPX #$0014
    BCC code_0A9DF3
}

code_0A9E02 {
    LDA $@array_0A9ED3+2, X
    PLX 
}

code_0A9E07 {
    STA $28
    STZ $2A
    LDA #$2000
    TSB $10
    COP [DA] ( #0F )
    LDA #$2000
    TRB $10
    COP [A5] ( @code_0A9E36, #00, #00, #$2200 )
    COP [07] ( #20 )
    LDA #$0004
    STA $24

  code_0A9E29:
    COP [C1]
    COP [89]
    DEC $24
    BPL code_0A9E29
    COP [C4] ( @code_0A9DBA )
}

code_0A9E36 {
    COP [DA] ( #03 )
    LDA #$2000
    TRB $10
    PHX 
    LDA $0E
    BIT #$4000
    BNE code_0A9E5B
    LDA $28
    SEC 
    SBC #$001D
    ASL 
    ASL 
    TAX 
    LDA $@array_0A9EA3, X
    STA $14
    LDA $@array_0A9EA3+2, X
    BRA code_0A9E6E
}

code_0A9E5B {
    LDA $28
    SEC 
    SBC #$001D
    ASL 
    ASL 
    TAX 
    LDA $@array_0A9EBB, X
    STA $14
    LDA $@array_0A9EBB+2, X
}

code_0A9E6E {
    STA $16
    PLX 
    COP [07] ( #06 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #16 )
    COP [89]
    COP [23]
    AND #$0007
    SEC 
    SBC #$0003
    STA $14
    LDA $0411
    AND #$0007
    SEC 
    SBC $16
    STA $16
    COP [07] ( #06 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #16 )
    COP [89]
    COP [E0]
}

---------------------------------------------

array_0A9EA3 [
  unk10 < #$0080, #$00D6 >   ;00
  unk10 < #$0070, #$00D6 >   ;01
  unk10 < #$0056, #$00D6 >   ;02
  unk10 < #$0038, #$00C6 >   ;03
  unk10 < #$001A, #$00B0 >   ;04
  unk10 < #$001A, #$0098 >   ;05
]

---------------------------------------------

array_0A9EBB [
  unk10 < #$0080, #$00D6 >   ;00
  unk10 < #$0093, #$00D6 >   ;01
  unk10 < #$00AA, #$00D6 >   ;02
  unk10 < #$00CA, #$00C6 >   ;03
  unk10 < #$00E7, #$00B8 >   ;04
  unk10 < #$00E5, #$0098 >   ;05
]

---------------------------------------------

array_0A9ED3 [
  unk10 < #$000A, #$001D >   ;00
  unk10 < #$0015, #$001E >   ;01
  unk10 < #$0032, #$001F >   ;02
  unk10 < #$0059, #$0020 >   ;03
  unk10 < #$005F, #$0021 >   ;04
  unk10 < #$005D, #$0022 >   ;05
]

---------------------------------------------

func_0A9EEB {
    COP [B6] ( #30 )

  code_0A9EEE:
    COP [C6] ( &code_0A9EEE )
    LDA #$2000
    TSB $10
    COP [CA] ( #1E )
    COP [45] ( #05, #02, #0C, #05, &code_0A9F2A )
    COP [45] ( #05, #0A, #0B, #0C, &code_0A9FAA )
    COP [DA] ( #04 )
    COP [CB]
    LDA #$2000
    TRB $10
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A9F22 )
}

code_list_0A9F22 [
  &code_0A9F37   ;00
  &code_0A9F5B   ;01
  &code_0A9F7F   ;02
  &code_0A9F86   ;03
]

code_0A9F2A {
    LDA #$2000
    TRB $10
    LDA $0036
    LSR 
    BCC code_0A9F37
    BRA code_0A9F5B
}

code_0A9F37 {
    LDA #$0008
    STA $14
    LDA #$003A
    STA $16
    COP [84] ( #27, #06 )
    COP [8A]
    COP [CA] ( #10 )
    COP [9C] ( @code_0A9FD3, #$0200 )
    COP [81] ( #27, #07 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0A9F5B {
    LDA #$00F0
    STA $14
    LDA #$003A
    STA $16
    COP [84] ( #27, #06 )
    COP [8A]
    COP [CA] ( #10 )
    COP [9C] ( @code_0A9FD3, #$0200 )
    COP [81] ( #27, #08 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0A9F7F {
    LDA #$0020
    STA $14
    BRA code_0A9F8B
}

code_0A9F86 {
    LDA #$00E0
    STA $14
}

code_0A9F8B {
    LDA #$001C
    STA $16
    COP [84] ( #27, #06 )
    COP [8A]
    COP [CA] ( #10 )
    COP [9C] ( @code_0A9FD3, #$0200 )
    COP [82] ( #27, #07 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0A9FAA {
    LDA #$2000
    TRB $10
    LDA #$0008
    STA $14
    LDA #$00B6
    STA $16
    COP [84] ( #27, #06 )
    COP [8A]
    COP [CA] ( #10 )
    COP [9C] ( @code_0A9FD3, #$0200 )
    COP [81] ( #27, #07 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0A9FD3 {
    COP [84] ( #27, #03 )
    COP [8A]
    COP [E0]
}

code_0A9FDB {
    COP [B6] ( #30 )
    LDA #$0014
    STA $20
    LDA #$0001
    STA $22
    COP [84] ( #19, #04 )
    COP [8A]
    COP [07] ( #1F )
    COP [A2] ( @code_0AA04D, #$0302 )
    COP [84] ( #1A, #02 )
    COP [8A]
    COP [C2]
    LDA $20
    CMP #$0010
    BCS code_0AA011
    LDA $22
    EOR #$FFFF
    INC 
    STA $22
    BRA code_0AA01E
}

code_0AA011 {
    CMP #$0028
    BCC code_0AA01E
    LDA $22
    EOR #$FFFF
    INC 
    STA $22
}

code_0AA01E {
    LDA $20
    CLC 
    ADC $22
    STA $20
    LDY $24
    LDA $0010, Y
    BIT #$0040
    BNE code_0AA030
    RTL 
}

code_0AA030 {
    LDA #$2000
    TRB $10
    LDY $06
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [88] ( @table_0EE000 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

code_0AA04D {
    LDA $24
    STA $7F0010, X
    COP [A2] ( @code_0AA12E, #$0202 )
    LDA #$0000
    STA $0026, Y
    COP [A2] ( @code_0AA12E, #$0202 )
    LDA #$0055
    STA $0026, Y
    COP [A2] ( @code_0AA12E, #$0202 )
    LDA #$00AA
    STA $0026, Y
    COP [84] ( #24, #04 )
    COP [8A]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AA08E )
}

code_list_0AA08E [
  &code_0AA096   ;00
  &code_0AA09B   ;01
  &code_0AA0A1   ;02
  &code_0AA0A6   ;03
]

code_0AA096 {
    LDA #$4000
    TSB $12
}

code_0AA09B {
    COP [AC] ( #05, #03 )
    BRA code_0AA0AC
}

code_0AA0A1 {
    LDA #$4000
    TSB $12
}

code_0AA0A6 {
    COP [AC] ( #03, #05 )
    BRA code_0AA0AC
}

code_0AA0AC {
    COP [8D] ( #24 )
    LDA #$0186
    STA $26

  code_0AA0B4:
    COP [B1]
    COP [8B]
    LDA $2A
    BEQ code_0AA0B4
    LDA $08
    STA $24
    STZ $08

  code_0AA0C2:
    COP [C2]
    LDA $14
    BMI code_0AA0CD
    CMP #$0020
    BCS code_0AA0D6
}

code_0AA0CD {
    LDA $12
    EOR #$4000
    STA $12
    BRA code_0AA0E2
}

code_0AA0D6 {
    CMP #$00E0
    BCC code_0AA0E2
    LDA $12
    EOR #$4000
    STA $12
}

code_0AA0E2 {
    LDA $16
    BMI code_0AA0EB
    CMP #$0020
    BCS code_0AA0F4
}

code_0AA0EB {
    LDA $12
    EOR #$2000
    STA $12
    BRA code_0AA100
}

code_0AA0F4 {
    CMP #$00C0
    BCC code_0AA100
    LDA $12
    EOR #$2000
    STA $12
}

code_0AA100 {
    DEC $26
    BMI code_0AA10A
    DEC $24
    BPL code_0AA0C2
    BRA code_0AA0B4
}

code_0AA10A {
    LDA $24
    DEC 
    BMI code_0AA113
    STA $08
    COP [C2]
}

code_0AA113 {
    COP [B1]
    COP [C1]
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0AA113
    LDA $7F0010, X
    TAY 
    LDA #$&code_0AA030
    STA $0000, Y
    COP [C1]
    RTL 
}

code_0AA12E {
    LDA $26
    STA $7F0010, X
    COP [8D] ( #23 )

  code_0AA137:
    COP [8B]
    LDA $2A
    BEQ code_0AA137
    LDA $08
    STA $26
    STZ $08

  code_0AA143:
    LDA $7F001C, X
    TAY 
    LDA $0020, Y
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC #$0002
    STA $7F0010, X
    LDY $24
    JSL $@func_00F3C9
    COP [C2]
    DEC $26
    BPL code_0AA143
    BRA code_0AA137
}

code_0AA169 {
    COP [BC] ( #08, #00 )
    LDA #$8023
    TSB $12
    COP [B6] ( #20 )
    BRA code_0AA185
}

code_0AA177 {
    COP [BC] ( #08, #00 )
    COP [B8]
    LDA #$8023
    TSB $12
    COP [B6] ( #20 )
}

code_0AA185 {
    LDA #$&stats_01ABF0+190
    STA $7F0020, X
    LDA $@stats_01ABF0+190
    AND #$00FF
    STA $7F0026, X
    STA $7F0010, X
    COP [82] ( #03, #02 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [B6] ( #30 )
    COP [80] ( #05 )
    COP [89]
    COP [08] ( #$1515 )
    COP [A5] ( @func_00CFEF, #00, #00, #$2000 )
    COP [B5]
    COP [80] ( #06 )
    COP [89]
    LDA #$0101
    TRB $10
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
}

code_0AA1D3 {
    COP [57] ( @code_0AA241 )

  code_0AA1D8:
    LDA #$0200
    TSB $10
    COP [2A] ( #$0030, &code_0AA1E7, &code_0AA1EE, &code_0AA1E7 )
}

code_0AA1E7 {
    COP [80] ( #06 )
    COP [89]
    BRA code_0AA1D8
}

code_0AA1EE {
    COP [84] ( #06, #03 )
    COP [8A]
    COP [2A] ( #$0020, &code_0AA1E7, &code_0AA1FE, &code_0AA1E7 )
}

code_0AA1FE {
    LDA #$0200
    TRB $10
    COP [80] ( #07 )
    COP [89]
    COP [B6] ( #20 )
    COP [80] ( #08 )
    COP [89]
    COP [B6] ( #30 )
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [80] ( #0B )
    COP [89]
    COP [C6] ( &code_0AA230 )
    COP [2A] ( #$0020, &code_0AA2DB, &code_0AA2FE, &code_0AA31D )
}

code_0AA230 {
    COP [80] ( #0A )
    COP [89]
    COP [80] ( #08 )
    COP [89]
    COP [80] ( #07 )
    COP [89]
    BRA code_0AA1D8
}

code_0AA241 {
    COP [5C] ( #$FFBD )
    COP [CA] ( #08 )
    COP [B7] ( #02 )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    LDA $28
    CMP #$000A
    BCS code_0AA260
    CMP #$0009
    BEQ code_0AA289
    BRA code_0AA291
}

code_0AA260 {
    LDA $7F100C, X
    CMP $14
    BNE code_0AA270
    LDA $7F100E, X
    CMP $16
    BEQ code_0AA284
}

code_0AA270 {
    LDA $7F100C, X
    STA $7F0018, X
    LDA $7F100E, X
    STA $7F001A, X
    COP [22] ( #FF, #01 )
}

code_0AA284 {
    COP [80] ( #09 )
    COP [89]
}

code_0AA289 {
    COP [B6] ( #30 )
    COP [80] ( #08 )
    COP [89]
}

code_0AA291 {
    COP [B6] ( #20 )
    COP [80] ( #07 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [82] ( #1C, #01 )
    COP [89]
    LDA #$2000
    TSB $10
    LDA #$0040
    TRB $10
    LDA $7F0010, X
    STA $7F0026, X
    SEC 
    ROL $00F0
    COP [C2]
    LDA $00F2
    BNE code_0AA2C2
    RTL 
}

code_0AA2C2 {
    LSR $00F2
    LDA #$2000
    TRB $10
    COP [82] ( #1C, #02 )
    COP [89]
    COP [B6] ( #30 )
    COP [80] ( #06 )
    COP [89]
    JMP $&code_0AA1D3
}

code_0AA2DB {
    COP [82] ( #0C, #04 )
    COP [89]
    COP [81] ( #0D, #12 )
    COP [89]
    COP [83] ( #0E, #02, #01 )
    COP [89]
    COP [83] ( #0F, #02, #03 )
    COP [89]
    COP [83] ( #10, #02, #05 )
    COP [89]
    BRA code_0AA33E
}

code_0AA2FE {
    COP [82] ( #0C, #04 )
    COP [89]
    COP [80] ( #0D )
    COP [89]
    COP [82] ( #0E, #01 )
    COP [89]
    COP [82] ( #0F, #03 )
    COP [89]
    COP [82] ( #10, #05 )
    COP [89]
    BRA code_0AA33E
}

code_0AA31D {
    COP [82] ( #0C, #04 )
    COP [89]
    COP [81] ( #0D, #11 )
    COP [89]
    COP [83] ( #0E, #01, #01 )
    COP [89]
    COP [83] ( #0F, #01, #03 )
    COP [89]
    COP [83] ( #10, #01, #05 )
    COP [89]
}

code_0AA33E {
    COP [07] ( #15 )
    COP [A5] ( @func_00CFEF, #00, #00, #$2000 )
    COP [80] ( #11 )
    COP [89]
    LDA $7F100C, X
    STA $7F0018, X
    LDA $7F100E, X
    STA $7F001A, X
    COP [22] ( #11, #01 )
    COP [A5] ( @func_00CFEF, #00, #00, #$2000 )
    COP [C5]
}

---------------------------------------------

func_0AA37B {
    LDY $player_actor
    LDA #$*func_00C432
    STA $0002, Y
    LDA #$&func_00C432
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    RTL 
}

---------------------------------------------

func_0AA391 {
    LDY $player_actor
    LDA #$*func_00C45A
    STA $0002, Y
    LDA #$&func_00C45A
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    RTL 
}