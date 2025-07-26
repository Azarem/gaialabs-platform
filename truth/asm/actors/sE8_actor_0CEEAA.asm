?BANK 0C

?INCLUDE 'sE8_thinker_0CEB74'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'thinker_00B7CC'
?INCLUDE 'thinker_00B7D6'
?INCLUDE 'func_0AA36E'
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_00E683'
?INCLUDE 'player_character'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE
!WH0                            2126
!_TM                            212C

---------------------------------------------

h_sE8_actor_0CEEAA [
  h_actor < #00, #00, #21 >   ;00
]

---------------------------------------------

e_sE8_actor_0CEEAA {
    LDA #$0010
    TSB $12
    LDA #$0000
    STA $06C2
    STA $06BE
    STA $06C4
    STA $06C0
    LDA #$0081
    STA $14
    LDA #$00EA
    STA $16
    LDY $player_actor
    LDA #$&func_0CF5EF
    STA $0000, Y
    LDA #$*func_0CF5EF
    STA $0002, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0CEEF1
    RTL 
}

code_0CEEF1 {
    COP [9B] ( @func_0CED37 )
    COP [C2]
    LDY #$0F00
    LDA #$&e_sE8_thinker_0CEBA1
    STA $0000, Y
    COP [04] ( #10 )
    COP [57] ( @code_0CEF88 )
    COP [DA] ( #FE )
    COP [80] ( #1F )
    COP [89]

  code_0CEF11:
    COP [58] ( &code_0CEF3C )
    LDA #$2000
    TRB $10
    COP [A5] ( @code_0CF550, #00, #00, #$0301 )
    STY $24
    LDA #$0064
    STA $26
    COP [C1]
    DEC $26
    BMI code_0CEF31
    RTL 
}

code_0CEF31 {
    LDA #$2000
    TSB $10

  code_0CEF36:
    COP [DB] ( #$01DF )
    BRA code_0CEF11
}

code_0CEF3C {
    LDA #$2000
    TSB $10
    COP [A5] ( @code_0CEF6D, #00, #00, #$2000 )
    COP [CA] ( #10 )
    LDY $24
    BEQ code_0CEF5A
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
}

code_0CEF5A {
    COP [C2]
    LDY $24
    BEQ code_0CEF69
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
}

code_0CEF69 {
    COP [CB]
    BRA code_0CEF36
}

code_0CEF6D {
    COP [CA] ( #10 )
    SEP #$20
    LDA #$16
    STA $_TM
    REP #$20
    COP [C2]
    SEP #$20
    LDA #$17
    STA $_TM
    REP #$20
    COP [CB]
    COP [E0]
}

code_0CEF88 {
    COP [CC] ( #03 )
    COP [58] ( #$0000 )
    COP [57] ( $000000 )
    LDA #$2300
    TSB $10
    LDY $24
    BEQ code_0CEFA6
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
}

code_0CEFA6 {
    COP [9B] ( @func_0CED3E )
    COP [DA] ( #3B )
    LDY #$0F00
    LDA #$&e_sE8_thinker_0CEB74
    STA $0000, Y
    COP [3C] ( @e_thinker_00B7CC )
    COP [DA] ( #77 )
    LDA #$&stats_01ABF0+154
    STA $7F0020, X
    LDA $&stats_01ABF0+154
    AND #$00FF
    STA $7F0026, X
    LDA #$0301
    STA $10
    LDA #$1000
    TSB $12
    LDA #$0080
    TSB $09EC
    COP [C2]
    LDA #$0800
    TSB $player_flags
    LDY $player_actor
    LDA $0010, Y
    AND #$FFF7
    STA $0010, Y
    COP [CA] ( #80 )
    LDA $068E
    CLC 
    ADC #$0002
    STA $06C2
    LDY $0056

  code_0CF004:
    LDA $0010, Y
    BIT #$0400
    BEQ code_0CF016
    LDA $0016, Y
    CLC 
    ADC #$0002
    STA $0016, Y
}

code_0CF016 {
    LDA $0006, Y
    TAY 
    BNE code_0CF004
    COP [CB]
    COP [C2]
    COP [3C] ( @e_thinker_00B7D6 )
    LDY #$0F00
    LDA #$&e_sE8_thinker_0CEBA1
    STA $0000, Y
    COP [CC] ( #01 )
    LDY $player_actor
    LDA $0010, Y
    ORA #$0008
    STA $0010, Y
    COP [DA] ( #63 )
    LDY #$0F00
    LDA #$&e_sE8_thinker_0CEBF7
    STA $0000, Y
    COP [DA] ( #63 )
    LDA #$0080
    TRB $09EC
    COP [32] ( #9D )
    COP [33]
    COP [A2] ( @code_0CF4E3, #$0301 )
    TYA 
    STA $7F0010, X
    COP [A2] ( @code_0CF3FC, #$2200 )
    COP [A2] ( @code_0CF403, #$2200 )
    LDA #$0080
    STA $14
    LDA #$0150
    STA $16
    LDA #$2000
    TRB $10
    LDA #$0001
    TSB $12
    COP [80] ( #03 )
    COP [89]

  code_0CF08A:
    COP [57] ( @code_0CF154 )

  code_0CF08F:
    COP [C1]
    LDA $7F0012, X
    BMI code_0CF0A2
    DEC 
    STA $7F0012, X
    LDA #$0000
    JMP $&code_0CF13B
}

code_0CF0A2 {
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0CF0B0 )
}

code_list_0CF0B0 [
  &code_0CF13B   ;00
  &code_0CF13B   ;01
  &code_0CF0C0   ;02
  &code_0CF0C0   ;03
  &code_0CF0C0   ;04
  &code_0CF0C0   ;05
  &code_0CF0C0   ;06
  &code_0CF0C0   ;07
]

code_0CF0C0 {
    LDA #$0003
    STA $7F0012, X
    LDA $7F0010, X
    TAY 
    LDA #$&func_0CF51E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0200
    TRB $10
    COP [80] ( #17 )
    COP [89]
    LDA #$0200
    TSB $10
    LDA #$0057
    STA $7F0C02
    COP [3C] ( @func_0CEC65 )
    COP [CC] ( #02 )
    COP [A5] ( @func_0CED45, #00, #00, #$2000 )
    COP [07] ( #20 )
    COP [A5] ( @func_0CF266, #00, #00, #$2200 )

  code_0CF10B:
    COP [80] ( #1A )
    COP [89]
    COP [D0] ( #02, #01, &code_0CF10B )
    LDA #$00FF
    STA $WH0
    COP [84] ( #06, #3C )
    COP [8A]
    COP [80] ( #18 )
    COP [89]
    LDA $7F0010, X
    TAY 
    LDA #$&loc_0CF4FF
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    JMP $&code_0CF08F
}

code_0CF13B {
    COP [A5] ( @code_0CF2F2, #00, #00, #$0301 )
    COP [A5] ( @code_0CF31F, #00, #00, #$0301 )
    COP [DB] ( #$012B )
    JMP $&code_0CF08A
}

code_0CF154 {
    COP [CC] ( #04 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    COP [A5] ( @code_0CF201, #00, #E0, #$2300 )
    COP [A5] ( @code_0CF1CE, #00, #00, #$0300 )
    COP [A5] ( @code_0CF1DF, #00, #00, #$0300 )
    COP [A5] ( @code_0CF1F0, #00, #00, #$0300 )
    COP [A5] ( @code_0CF291, #00, #00, #$2800 )
    COP [80] ( #19 )
    COP [89]
    COP [80] ( #1E )
    COP [89]
    LDY #$0F00
    LDA #$&e_sE8_thinker_0CEC35
    STA $0000, Y
    COP [3C] ( @e_thinker_00B7CC )
    COP [DB] ( #$012B )
    LDA #$0404
    STA $064A
    COP [26] ( #E5, #$0000, #$0000, #00, #$1100 )
    LDA #$0800
    TSB $10
    COP [DA] ( #01 )
    LDA #$0000
    STA $0AD4
    RTL 
}

code_0CF1CE {
    LDA #$0060
    STA $14
    LDA #$01B8
    STA $16

  code_0CF1D8:
    COP [80] ( #08 )
    COP [89]
    BRA code_0CF1D8
}

code_0CF1DF {
    LDA #$00B1
    STA $14
    LDA #$01B8
    STA $16

  code_0CF1E9:
    COP [80] ( #08 )
    COP [89]
    BRA code_0CF1E9
}

code_0CF1F0 {
    LDA #$00B4
    STA $14
    LDA #$01A0
    STA $16

  code_0CF1FA:
    COP [80] ( #09 )
    COP [89]
    BRA code_0CF1FA
}

code_0CF201 {
    LDA #$0080
    STA $14
    LDA #$0170
    STA $16
    COP [88] ( @table_0EE000 )
    COP [CA] ( #0C )
    COP [A5] ( @code_0CF22F, #00, #00, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0CF23C, #00, #00, #$0302 )
    COP [DA] ( #03 )
    COP [CB]
    COP [E0]
}

code_0CF22F {
    COP [07] ( #06 )
    JSR $&sub_0CF249
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0CF23C {
    COP [07] ( #06 )
    JSR $&sub_0CF249
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0CF249 {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $14
    STA $14
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $16
    STA $16
    RTS 
}

---------------------------------------------

func_0CEC65 {
    LDA #$0004
    STA $7F000E, X
    LDA #$0000
    STA $7F0000, X
    STA $7F0002, X
    STA $7F0006, X
    COP [C1]
    LDA $7F0000, X
    LSR 
    BCS code_0CEC89
    LDY #$0000
    BRA code_0CEC8C
}

code_0CEC89 {
    LDY #$0200
}

code_0CEC8C {
    SEP #$20
    PHB 
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    PHD 
    LDA #$0000
    TCD 
    LDA $7F0002, X
    INC 
    INC 
    STA $7F0002, X
    STA $0E
    LDA #$857A
    STA $18
    LDA #$00FF
    STA $7C01, Y
    SEP #$20
    LDA #$45
    STA $7C00, Y
    INY 
    INY 
    INY 

  code_0CECBB:
    LDA #$04
    STA $7C00, Y
    LDA $18
    DEC 
    STA $18
    STA $7C01, Y
    LDA $19
    INC 
    STA $19
    STA $7C02, Y
    INY 
    INY 
    INY 
    DEC $0E
    BPL code_0CECBB
    LDA #$01
    STA $7C00, Y
    REP #$20
    LDA #$00FF
    STA $7C01, Y
    SEP #$20
    LDA #$00
    STA $7C03, Y
    REP #$20
    PLD 
    PLB 
    LDA $7F0000, X
    LSR 
    BCS code_0CECFE
    COP [02] ( $7E7C00, #26 )
    BRA code_0CED04
}

code_0CECFE {
    COP [02] ( $7E7E00, #26 )
}

code_0CED04 {
    LDA $7F0000, X
    INC 
    STA $7F0000, X
    LDA $7F0002, X
    CMP #$0024
    BCS code_0CED17
    RTL 
}

code_0CED17 {
    LDA #$0023
    STA $7F0002, X
    LDA $7F0006, X
    INC 
    STA $7F0006, X
    COP [CE] ( #02 )
    COP [C2]
    COP [C2]
    LDA #$00FF
    STA $WH0
    COP [3D]
    RTL 
}

---------------------------------------------

func_0CED37 {
    COP [37] ( #7D )
    COP [39]
    COP [E0]
}

---------------------------------------------

func_0CED3E {
    COP [37] ( #7F )
    COP [39]
    COP [E0]
}

---------------------------------------------

func_0CED45 {
    COP [37] ( #69 )
    COP [39]
    COP [E0]
}

---------------------------------------------

func_0CF266 {
    LDA #$&stats_01ABF0+160
    STA $7F0020, X
    LDA $&stats_01ABF0+160
    AND #$00FF
    STA $7F0026, X
    LDA #$0080
    STA $14
    LDA #$01E0
    STA $16
    COP [DA] ( #09 )
    LDA #$2000
    TRB $10
    COP [84] ( #1F, #0A )
    COP [8A]
    COP [E0]
}

code_0CF291 {
    LDA #$0220
    STA $16
    COP [CA] ( #1E )
    COP [9C] ( @code_0CF2BB, #$0B00 )
    COP [DA] ( #0E )
    COP [9C] ( @code_0CF2C8, #$0B00 )
    COP [DA] ( #0E )
    COP [9C] ( @code_0CF2D5, #$0B00 )
    COP [DA] ( #0E )
    COP [CB]
    COP [E0]
}

code_0CF2BB {
    COP [23]
    STA $14
    COP [83] ( #1B, #00, #06 )
    COP [89]
    BRA code_0CF2E2
}

code_0CF2C8 {
    COP [23]
    STA $14
    COP [83] ( #1C, #00, #06 )
    COP [89]
    BRA code_0CF2E2
}

code_0CF2D5 {
    COP [23]
    STA $14
    COP [83] ( #1D, #00, #08 )
    COP [89]
    BRA code_0CF2E2
}

code_0CF2E2 {
    COP [B1]
    COP [80] ( #FF )
    COP [89]
    LDA $16
    CMP #$00E0
    BCS code_0CF2E2
    COP [E0]
}

code_0CF2F2 {
    LDA #$0031
    STA $14
    LDA #$0197
    STA $16
    COP [9C] ( @code_0CF3EF, #$0301 )
    COP [80] ( #09 )
    COP [89]
    LDA #$0010
    STA $14
    LDA #$0150
    STA $16
    COP [80] ( #0A )
    COP [89]
    LDA #$0004
    STA $26
    JMP $&code_0CF353
}

code_0CF31F {
    COP [BB]
    LDA #$0002
    TSB $12
    LDA #$00CF
    STA $14
    LDA #$0197
    STA $16
    COP [9C] ( @code_0CF3EF, #$0301 )
    COP [80] ( #09 )
    COP [89]
    LDA #$00F0
    STA $14
    LDA #$0150
    STA $16
    COP [80] ( #0A )
    COP [89]
    LDA #$000C
    STA $26
    JMP $&code_0CF353
}

code_0CF353 {
    COP [07] ( #20 )
    COP [5B] ( #$0010 )
    LDA #$00A0
    TSB $12
    LDA #$0100
    TRB $10
    LDA #$&stats_01ABF0+158
    STA $7F0020, X
    LDA $&stats_01ABF0+158
    AND #$00FF
    STA $7F0026, X
    COP [80] ( #0B )
    COP [89]
    COP [A2] ( @func_00E683, #$2000 )
    LDA #$800B
    STA $7F000A, X
    LDA #$0003
    STA $7F0014, X
    LDA $player_actor
    STA $0024, Y
    PHX 
    TYX 
    LDA $26
    STA $7F000E, X
    PLX 
    LDA #$0002
    TSB $10
    COP [84] ( #0B, #05 )
    COP [8A]
    PHX 
    LDX $06
    LDA $7F002C, X
    STA $0000
    LDA $7F002E, X
    PLX 
    STA $7F100E, X
    LDA $0000
    STA $7F100C, X
    COP [A9]

  code_0CF3C5:
    COP [C1]
    COP [8B]
    LDA $08
    STA $24
    STZ $08
    COP [C1]
    LDA $7F100C, X
    STA $7F002C, X
    LDA $7F100E, X
    STA $7F002E, X
    DEC $24
    BMI code_0CF3E6
    RTL 
}

code_0CF3E6 {
    LDA $10
    BIT #$4000
    BEQ code_0CF3C5
    COP [E0]
}

code_0CF3EF {
    COP [80] ( #08 )
    COP [89]
    COP [E0]
    COP [84] ( #0A, #06 )
    COP [8A]
}

code_0CF3FC {
    LDA #$0018
    STA $14
    BRA code_0CF408
}

code_0CF403 {
    LDA #$00E8
    STA $14
}

code_0CF408 {
    LDA #$01D8
    STA $16

  code_0CF40D:
    COP [23]
    AND #$003F
    CLC 
    ADC #$0078
    STA $08
    COP [C2]
    COP [D0] ( #04, #01, &code_0CF4E1 )
    COP [A2] ( @code_0CF429, #$0200 )
    BRA code_0CF40D
}

code_0CF429 {
    COP [5B] ( #$0080 )
    LDA #$00A0
    TSB $12
    COP [84] ( #11, #02 )
    COP [8A]
    COP [80] ( #12 )
    COP [89]
    LDA #$&stats_01ABF0+15C
    STA $7F0020, X
    LDA $&stats_01ABF0+15C
    AND #$00FF
    STA $7F0026, X
    COP [07] ( #1D )
    COP [57] ( @code_0CF4D9 )
    LDA #$0200
    TRB $10
    COP [82] ( #13, #0A )
    COP [89]
    COP [82] ( #13, #2A )
    COP [89]
    LDA #$0000
    STA $7F0026, X
    LDA #$&loc_0CF47E
    STA $7F001E, X
    STA $00
    LDA #$0005
    STA $7F0014, X

  loc_0CF47E:
    COP [C1]
    COP [D0] ( #04, #01, &code_0CF4DC )
    COP [23]
    LDY $player_actor
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $0014, Y
    STA $7F0018, X
    BPL code_0CF49D
    RTL 
}

code_0CF49D {
    CMP #$0108
    BCC code_0CF4A3
    RTL 
}

code_0CF4A3 {
    LDA $0411
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $0016, Y
    CMP #$0100
    BCS code_0CF4B7
    RTL 
}

code_0CF4B7 {
    CMP #$01E8
    BCC code_0CF4BD
    RTL 
}

code_0CF4BD {
    STA $7F001A, X
    COP [22] ( #13, #02 )
    LDA $10
    BIT #$4000
    BNE code_0CF4E1
    COP [84] ( #13, #01 )
    COP [8A]
    COP [CB]
    COP [57] ( $000000 )
}

code_0CF4D9 {
    COP [07] ( #1B )
}

code_0CF4DC {
    COP [80] ( #11 )
    COP [89]
}

code_0CF4E1 {
    COP [E0]
}

code_0CF4E3 {
    LDA #$0080
    STA $14
    LDA #$01AA
    STA $16
    COP [A4] ( @code_0CF549, #FC, #FC, #$0301 )
    COP [A4] ( @code_0CF543, #04, #00, #$0301 )

  loc_0CF4FF:
    LDY $06
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    LDA $0006, Y
    TAY 
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y

  code_0CF517:
    COP [80] ( #00 )
    COP [89]
    BRA code_0CF517
}

---------------------------------------------

func_0CF51E {
    COP [80] ( #01 )
    COP [89]
    LDY $06
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0006, Y
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [80] ( #02 )
    COP [89]
    COP [C1]
    RTL 
}

code_0CF543 {
    COP [8D] ( #0C )
    COP [DA] ( #09 )
}

code_0CF549 {
    COP [80] ( #0C )
    COP [89]
    BRA code_0CF549
}

code_0CF550 {
    COP [80] ( #0D )
    COP [89]
    COP [80] ( #0E )
    COP [89]
    COP [9C] ( @code_0CF570, #$0202 )
    COP [80] ( #0F )
    COP [89]
    LDY $24
    LDA #$0000
    STA $0024, Y
    COP [E0]
}

code_0CF570 {
    COP [80] ( #14 )
    COP [89]
    COP [07] ( #1D )

  code_0CF578:
    COP [82] ( #15, #0C )
    COP [89]
    COP [D0] ( #03, #01, &code_0CF5AD )
    LDA $16
    BPL code_0CF578
    BPL code_0CF58E
    EOR #$FFFF
    INC 
}

code_0CF58E {
    CMP #$0030
    BCC code_0CF578
    LDA #$2000
    TSB $10
    COP [CA] ( #0E )
    COP [D0] ( #03, #01, &code_0CF5AD )
    COP [9C] ( @code_0CF5AF, #$0202 )
    COP [DA] ( #0E )
    COP [CB]
}

code_0CF5AD {
    COP [E0]
}

code_0CF5AF {
    COP [D0] ( #03, #01, &code_0CF5AD )
    COP [07] ( #23 )
    COP [23]
    STA $14
    COP [23]
    LSR 
    BCS code_0CF5D8

  code_0CF5C1:
    COP [82] ( #16, #09 )
    COP [89]
    COP [D0] ( #03, #01, &code_0CF5AD )
    LDA $16
    BMI code_0CF5C1
    CMP #$0120
    BCC code_0CF5C1
    COP [E0]
}

code_0CF5D8 {
    COP [82] ( #16, #0D )
    COP [89]
    COP [D0] ( #03, #01, &code_0CF5AD )
    LDA $16
    BMI code_0CF5D8
    CMP #$0120
    BCC code_0CF5D8
    COP [E0]
}

---------------------------------------------

func_0CF5EF {
    LDA #$0008
    TRB $10
    LDA #$0088
    STA $14
    LDA #$FFC0
    STA $16

  code_0CF5FE:
    COP [91] ( #1B, #07 )
    COP [89]
    LDA $16
    BMI code_0CF5FE
    CMP #$00E0
    BCC code_0CF5FE
    COP [06] ( #2C )
    COP [91] ( #1C, #00 )
    COP [89]
    LDA #$0008
    TSB $10
    JML $@code_02C3C8
}