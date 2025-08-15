?BANK 02

?INCLUDE 'chunk_008000'
?INCLUDE 'table_018000'
?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'dictionary_01EBA8'
?INCLUDE 'dictionary_01F54D'
?INCLUDE 'array_01D3CE'
?INCLUDE 'table_01ADA8'
?INCLUDE 'itemget_table_01FD24'
?INCLUDE 'func_02F048'
?INCLUDE 'entry_points_00C418'
?INCLUDE 'scene_warps'
?INCLUDE 'chunk_00E683'
?INCLUDE 'chunk_02CFD0'

!scene_next                     0642
!scene_current                  0644
!joypad_mask_std                065A
!joypad_mask_inv                065C
!map_bounds_x                   0692
!effect_bounds_x                0694
!map_bounds_y                   0696
!effect_bounds_y                0698
!camera_offset_x                06D6
!camera_offset_y                06D8
!camera_bounds_x                06DA
!camera_bounds_y                06DC
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_x_tile                  09A6
!player_y_tile                  09A8
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4
!INIDISP                        2100
!OAMADDL                        2102
!BGMODE                         2105
!BG1SC                          2107
!BG2SC                          2108
!VMAIN                          2115
!VMADDL                         2116
!VMDATAL                        2118
!M7A                            211B
!M7B                            211C
!M7C                            211D
!M7D                            211E
!M7X                            211F
!M7Y                            2120
!CGADD                          2121
!_TM                            212C
!_TS                            212D
!TMW                            212E
!TSW                            212F
!CGWSEL                         2130
!CGADSUB                        2131
!COLDATA                        2132
!VMDATALREAD                    2139
!APUIO0                         2140
!APUIO1                         2141
!APUIO2                         2142
!WMADDL                         2181
!WMADDH                         2183
!NMITIMEN                       4200
!WRMPYA                         4202
!WRMPYB                         4203
!WRDIVL                         4204
!WRDIVH                         4205
!WRDIVB                         4206
!MDMAEN                         420B
!RDNMI                          4210
!RDDIVL                         4214
!RDMPYL                         4216
!RDMPYH                         4217
!DMAP0                          4300
!BBAD0                          4301
!A1T0L                          4302
!A1B0                           4304
!DAS0L                          4305

---------------------------------------------

func_028000 {
    SEP #$20
    STA $WRMPYA
    XBA 
    PHA 
    REP #$20
    TYA 
    SEP #$20
    STA $WRMPYB
    XBA 
    NOP 
    NOP 
    NOP 
    LDY $RDMPYL
    STA $WRMPYB
    REP #$20
    TYA 
    SEP #$20
    STA $WRDIVL
    XBA 
    CLC 
    ADC $RDMPYL
    STA $WRDIVH
    PLA 
    STA $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    REP #$20
    LDA $RDDIVL
    RTL 
}

---------------------------------------------

func_02803B {
    PHP 
    REP #$20
    PHA 
    SEP #$20
    BRA code_028057
}

---------------------------------------------

func_028043 {
    PHP 
    REP #$20
    PHA 
    SEP #$20
    LDA $804210

  code_02804D:
    LDA $804210
    BPL code_02804D
    LDA $804210
}

code_028057 {
    LDA $06EF
    BIT #$08
    BEQ code_0280A6
    LDA $C2
    STA $M7A
    LDA $C3
    STA $M7A
    LDA $C4
    STA $M7B
    LDA $C5
    STA $M7B
    LDA $C6
    STA $M7C
    LDA $C7
    STA $M7C
    LDA $C8
    STA $M7D
    LDA $C9
    STA $M7D
    LDA $CA
    STA $M7X
    LDA $CB
    AND #$1F
    STA $M7X
    LDA $CC
    STA $M7Y
    LDA $CD
    AND #$1F
    STA $M7Y
    LDX $BE
    STX $CE
    LDX $C0
    STX $D0
}

code_0280A6 {
    REP #$20
    LDA $09AC
    BEQ code_0280B6
    STA $0656
    STZ $09AC
    PLA 
    PLP 
    RTL 
}

code_0280B6 {
    LDA $0660
    AND #$0F00
    STA $065E
    LDA $0DB2
    BEQ code_0280D2
    LDA $0660
    BIT #$1000
    BEQ code_0280D2
    LDA $0DB2
    TSB $065E
}

code_0280D2 {
    LDA $0DB4
    BEQ code_0280E5
    LDA $0660
    BIT #$2000
    BEQ code_0280E5
    LDA $0DB4
    TSB $065E
}

code_0280E5 {
    LDA $0DAA
    BEQ code_0280F8
    LDA $0660
    BIT #$8000
    BEQ code_0280F8
    LDA $0DAA
    TSB $065E
}

code_0280F8 {
    LDA $0DAE
    BEQ code_02810B
    LDA $0660
    BIT #$4000
    BEQ code_02810B
    LDA $0DAE
    TSB $065E
}

code_02810B {
    LDA $0DAC
    BEQ code_02811E
    LDA $0660
    BIT #$0080
    BEQ code_02811E
    LDA $0DAC
    TSB $065E
}

code_02811E {
    LDA $0DB0
    BEQ code_028131
    LDA $0660
    BIT #$0040
    BEQ code_028131
    LDA $0DB0
    TSB $065E
}

code_028131 {
    LDA $0DA8
    BEQ code_028144
    LDA $0660
    BIT #$0020
    BEQ code_028144
    LDA $0DA8
    TSB $065E
}

code_028144 {
    LDA $0DA6
    BEQ code_028157
    LDA $0660
    BIT #$0010
    BEQ code_028157
    LDA $0DA6
    TSB $065E
}

code_028157 {
    LDA $065E
    STA $0656
    STA $0660
    AND $0658
    STA $0658
    BEQ code_02817F
    AND $joypad_mask_inv
    BEQ code_02817F
    LDA $0662
    INC 
    STA $0662
    CMP #$000C
    BNE code_028182
    LDA $joypad_mask_inv
    TRB $0658
}

code_02817F {
    STZ $0662
}

code_028182 {
    LDA $0658
    TRB $0656
    LDA $joypad_mask_std
    TRB $0656
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

func_028191 {
    PHP 
    SEP #$20
    PHA 
    LDA $804210
    LDA #$81
    STA $804200
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

func_0281A2 {
    PHP 
    SEP #$20
    PHA 
    LDA #$01
    STA $804200
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

func_0281AF {
    PHP 
    SEP #$20
    PHA 
    LDA #$00
    STA $802100
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

func_0281BC {
    PHP 
    SEP #$20
    PHA 
    LDA #$80
    STA $802100
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

func_0281C9 {
    JSL $@func_028043
    DEC 
    BNE func_0281C9
    RTL 
}

---------------------------------------------

func_0281D1 {
    STA $804202
    XBA 
    STA $804203
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $804217
    XBA 
    LDA $804216
    RTL 
}

---------------------------------------------

func_0281E8 {
    STY $WRDIVL
    STA $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    LDA $RDMPYL
    XBA 
    LDA $RDDIVL
    RTL 
}

---------------------------------------------

func_0281FE_noref {
    PHD 
    PHA 
    LDA #$0000
    TCD 
    PLA 
    STZ $00
    STZ $02
    STZ $04
    STZ $06
    CMP #$0000
    BMI code_028217

  code_028212:
    INC $00
    ASL 
    BPL code_028212
}

code_028217 {
    STA $02
    TYA 
    LDY #$0010
    CLC 

  code_02821E:
    BCS code_028224
    CMP $02
    BCC code_028227
}

code_028224 {
    SBC $02
    SEC 
}

code_028227 {
    ROL $06
    DEC $00
    BMI code_028231
    ASL 
    DEY 
    BNE code_02821E
}

code_028231 {
    ASL 
    LDY #$0010
    CLC 

  code_028236:
    BCS code_02823C
    CMP $02
    BCC code_02823F
}

code_02823C {
    SBC $02
    SEC 
}

code_02823F {
    ROL $04
    ASL 
    DEY 
    BNE code_028236
    PLD 
    RTL 
}

---------------------------------------------

func_028247_noref {
    PHP 
    SEP #$20
    PHA 
    PHX 
    PHY 
    LDX #$000F
    LDA #$00
    XBA 
    CLC 

  code_028254:
    LDA $0410, X
    ADC $040F, X
    STA $040F, X
    DEX 
    BNE code_028254
    LDX #$0010

  code_028263:
    INC $040F, X
    BNE code_02826B
    DEX 
    BNE code_028263
}

code_02826B {
    PLA 
    PLY 
    PLX 
    PLP 
    RTL 
}

---------------------------------------------

func_028270 {
    PHP 
    PHB 
    PHX 
    PHY 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    LDX #$0200
    STX $74
    STX $76
    LDA #$20

  code_028283:
    STA ($74)
    INC $74
    BNE code_028283
    LDA #$EF
    STA $74
    LDA #$80
    STA $72
    LDX $7A
    LDY $78

  code_028295:
    LDA [$3E]
    AND $72
    PHA 
    LSR $72
    BCC code_0282A6
    ROR $72
    INC $3E
    BNE code_0282A6
    INC $3F
}

code_0282A6 {
    PLA 
    BEQ code_0282B9
    JSR $&sub_0282DE
    STA $0000, X
    INX 
    STA ($74)
    INC $74
    DEY 
    BNE code_028295
    BRA code_0282D9
}

code_0282B9 {
    JSR $&sub_0282DE
    STA $76
    JSR $&sub_02833B
    INC 
    INC 

  code_0282C3:
    XBA 
    LDA ($76)
    INC $76
    STA ($74)
    INC $74
    STA $0000, X
    INX 
    DEY 
    BEQ code_0282D9
    XBA 
    DEC 
    BNE code_0282C3
    BRA code_028295
}

code_0282D9 {
    PLY 
    PLX 
    PLB 
    PLP 
    RTL 
}

---------------------------------------------

sub_0282DE {
    LDA $72
    BMI code_028325
    ASL 
    BMI code_02831E
    ASL 
    BMI code_028317
    ASL 
    BMI code_028310
    ASL 
    BMI code_028309
    ASL 
    BMI code_028302
    ASL 
    BMI code_0282FB
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_02832E
}

code_0282FB {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_02832F
}

code_028302 {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_028330
}

code_028309 {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_028331
}

code_028310 {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_028332
}

code_028317 {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_028333
}

code_02831E {
    REP #$20
    LDA [$3E]
    XBA 
    BRA code_028334
}

code_028325 {
    LDA [$3E]
    REP #$20
    INC $3E
    SEP #$20
    RTS 
}

code_02832E {
    ASL 
}

code_02832F {
    ASL 
}

code_028330 {
    ASL 
}

code_028331 {
    ASL 
}

code_028332 {
    ASL 
}

code_028333 {
    ASL 
}

code_028334 {
    ASL 
    INC $3E
    XBA 
    SEP #$20
    RTS 
}

---------------------------------------------

sub_02833B {
    LDA $72
    CMP #$10
    BCC code_02835D
    LSR 
    LSR 
    LSR 
    LSR 
    STA $72
    XBA 
    LDA [$3E]
    XBA 
    REP #$20
    LSR 
    BCS code_028357
    LSR 
    BCS code_028357
    LSR 
    BCS code_028357
    LSR 
}

code_028357 {
    SEP #$20
    XBA 
    AND #$0F
    RTS 
}

code_02835D {
    LSR 
    BCS code_02838E
    LSR 
    BCS code_028381
    LSR 
    BCS code_028375
    LDA #$80
    STA $72
    LDA [$3E]
    REP #$20
    INC $3E
    SEP #$20
    AND #$0F
    RTS 
}

code_028375 {
    LDA #$40
    STA $72
    REP #$20
    LDA [$3E]
    XBA 
    ASL 
    BRA code_02839A
}

code_028381 {
    LDA #$20
    STA $72
    REP #$20
    LDA [$3E]
    XBA 
    ASL 
    ASL 
    BRA code_02839A
}

code_02838E {
    LDA #$10
    STA $72
    REP #$20
    LDA [$3E]
    XBA 
    ASL 
    ASL 
    ASL 
}

code_02839A {
    INC $3E
    SEP #$20
    XBA 
    AND #$0F
    RTS 
}

---------------------------------------------

func_0283A2 {
    STX $A1T0L
    STA $A1B0
    STY $DAS0L
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$01
    STA $MDMAEN
    RTL 
}

---------------------------------------------

func_0283BB {
    PHP 
    SEP #$20
    JSR $&sub_028CF2

  code_0283C1:
    JSR $&sub_028CE7
    CMP #$00
    BEQ code_0283DB
    PEA $&code_0283C1-1
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_028416, X
    DEC 
    PHA 
    SEP #$20
    RTS 
}

code_0283DB {
    LDA $scene_current
    CMP #$F7
    BEQ code_0283E5
    JSR $&sub_029020
}

code_0283E5 {
    PLP 
    RTL 
}

---------------------------------------------

func_0283E7 {
    PHP 
    SEP #$20
    JSR $&sub_028CF2

  code_0283ED:
    JSR $&sub_028CE7
    CMP #$00
    BEQ code_028414
    PEA $&code_0283ED-1
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_028416, X
    CMP #$&func_028B6D
    BEQ code_02840C
    DEC 
    PHA 
    SEP #$20
    RTS 
}

code_02840C {
    INY 
    INY 
    INY 
    INY 
    INY 
    SEP #$20
    RTS 
}

code_028414 {
    PLP 
    RTL 
}

---------------------------------------------

table_028416 [
  &code_02845C   ;00
  &code_02845C   ;01
  &func_028A6D   ;02
  &func_02845D   ;03
  &func_0286C3   ;04
  &func_028712   ;05
  &func_0287BC   ;06
  &code_02845C   ;07
  &code_02845C   ;08
  &code_02845C   ;09
  &code_02845C   ;0A
  &code_02845C   ;0B
  &code_02845C   ;0C
  &code_02845C   ;0D
  &func_028B69   ;0E
  &code_02845C   ;0F
  &func_028BE4   ;10
  &func_028B6D   ;11
  &code_02845C   ;12
  &func_028446   ;13
  &func_02845B   ;14
  &func_028D3D   ;15
  &code_02845C   ;16
  &func_028C30   ;17
]

---------------------------------------------

func_028446 {
    PHP 
    REP #$20
    JSR $&sub_028CE7
    PHY 
    JSL $@func_00B4B7
    PLY 
    BCC code_028458
    PLP 
    JMP $&func_028D3D
}

code_028458 {
    INY 
    PLP 
    RTS 
}

---------------------------------------------

func_02845B {
    INY 
}

code_02845C {
    RTS 
}

---------------------------------------------

func_02845D {
    PHP 
    REP #$20
    JSR $&sub_028CE7
    XBA 
    ASL 
    STA $0664
    JSR $&sub_028CE7
    XBA 
    ASL 
    STA $0666
    JSR $&sub_028CE7
    STA $0668
    LDX #$003E
    JSR $&sub_028D8F
    JSR $&sub_028CE7
    CMP #$0000
    BEQ code_02848D
    DEC 
    BEQ code_0284BC
    DEC 
    BEQ code_0284E7
    DEC 
    BEQ code_0284F3
}

code_02848D {
    LDA $0668
    BIT #$0010
    BNE code_0284B0
    CLC 
    ADC #$0020
    STA $0668
    LDX #$066C
    LDA $0666
    SEC 
    SBC $0664
    CMP #$2001
    BMI code_0284FC
    STZ $0670
    BRA code_0284FC
}

code_0284B0 {
    CLC 
    ADC #$0020
    STA $0668
    LDX #$066F
    BRA code_0284FC
}

code_0284BC {
    LDA $0668
    BIT #$0010
    BNE code_0284DB
    CLC 
    ADC #$0040
    STA $0668
    BIT #$0028
    BEQ code_0284D3
    STZ $0676
}

code_0284D3 {
    STZ $0673
    LDX #$0672
    BRA code_0284FC
}

code_0284DB {
    CLC 
    ADC #$0040
    STA $0668
    LDX #$0675
    BRA code_0284FC
}

code_0284E7 {
    LDA $0668
    CLC 
    ADC #$0060
    STA $0668
    BRA code_028503
}

code_0284F3 {
    LDA $0668
    STA $0668
    JMP $&func_028592
}

code_0284FC {
    JSR $&sub_028DC1
    BCS code_028503
    PLP 
    RTS 
}

code_028503 {
    LDA [$3E]
    INC $3E
    INC $3E
    STA $78
    CMP #$0000
    BEQ func_028555
    CPX #$066C
    BNE code_028520
    LDA $06EE
    BIT #$0800
    BEQ code_028520
    JMP $&func_0285DB
}

code_028520 {
    JSR $&sub_028E6F
    BCC code_02852A
    JSR $&sub_028F53
    PLP 
    RTS 
}

code_02852A {
    JSR $&sub_028E94
    LDA $78
    CMP #$2001
    BCC code_028537
    STZ $067F
}

code_028537 {
    LDX #$7000
    STX $7A
    JSL $@func_028270
    LDX #$7000
    STX $3E
    LDA #$007E
    STA $40
    JSR $&sub_028552
    JSR $&sub_028EB8
    PLP 
    RTS 
}

---------------------------------------------

func_028555 {
    LDA $06EE
    BIT #$0800
    BEQ func_028560
    JMP $&code_0285F3
}

---------------------------------------------

sub_028552 {
    PHP 
    BRA func_028560
}

---------------------------------------------

func_028560 {
    LDA $0668
    XBA 
    STA $VMADDL
    LDA $3E
    CLC 
    ADC $0664
    STA $A1T0L
    LDA $0666
    SEC 
    SBC $0664
    STA $DAS0L
    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA $40
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

func_028592 {
    LDA [$3E]
    STA $78
    INC $3E
    INC $3E
    CMP #$0000
    BEQ code_0285B2
    LDX #$7000
    STX $7A
    JSL $@func_028270
    LDX #$7000
    STX $3E
    LDA #$007E
    STA $40
}

code_0285B2 {
    SEP #$20
    LDX #$2000
    STX $VMADDL
    LDA #$00
    STA $DMAP0
    LDA #$19
    STA $BBAD0
    LDX $3E
    STX $A1T0L
    LDA $40
    STA $A1B0
    LDX #$4000
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

func_0285DB {
    STZ $0670
    STZ $067F
    STZ $0682
    STZ $0679
    STZ $067C
    LDX #$7000
    STX $7A
    JSL $@func_028270
}

code_0285F3 {
    PHY 
    PHB 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    LDX #$0000
    STZ $0E
    LDY #$A000
    STY $5E
    JSR $&sub_02868C

  code_028608:
    LDA #$07
    STA $12
    LDA ($3E)
    STA $10
    INC $3E
    BNE code_028616
    INC $3F
}

code_028616 {
    LDA $7000, X
    STA $00
    LDA $7001, X
    STA $02
    LDA $7010, X
    STA $04
    LDA $7011, X
    STA $06
    LDY #$0007

  code_02862D:
    LDA #$00
    ROL $06
    ROL 
    ROL $04
    ROL 
    ROL $02
    ROL 
    ROL $00
    ROL 
    ORA $10
    STA ($5E)
    INC $5E
    BNE code_028645
    INC $5F
}

code_028645 {
    DEY 
    BPL code_02862D
    INX 
    INX 
    DEC $12
    BPL code_028616
    REP #$20
    TXA 
    CLC 
    ADC #$0010
    TAX 
    SEP #$20
    CPX #$2000
    BCC code_028608
    PLB 
    LDX #$0000
    STX $VMADDL
    LDA #$80
    STA $VMAIN
    LDA #$00
    STA $DMAP0
    LDA #$19
    STA $BBAD0
    LDX #$A000
    STX $A1T0L
    LDA #$7E
    STA $A1B0
    LDX #$4000
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    PLY 
    PLP 
    RTS 
}

---------------------------------------------

sub_02868C {
    PHP 
    REP #$20
    LDA #$0000
    TAY 

  code_028693:
    STA $2800, Y
    INY 
    INY 
    CPY #$0100
    BCC code_028693
    LDY #$2800
    STY $3E
    LDY #$0000
    SEP #$20

  code_0286A7:
    LDA $2000, Y
    STA $3E
    LDA $2001, Y
    ASL 
    ASL 
    AND #$70
    STA ($3E)
    INY 
    INY 
    CPY #$0800
    BCC code_0286A7
    LDY #$2800
    STY $3E
    PLP 
    RTS 
}

---------------------------------------------

func_0286C3 {
    PHP 
    REP #$20
    JSR $&sub_028CE7
    ASL 
    STA $0664
    JSR $&sub_028CE7
    ASL 
    STA $0666
    JSR $&sub_028CE7
    ASL 
    STA $0668
    CMP #$0020
    BEQ code_0286F5
    LDX #$003E
    JSR $&sub_028D8F
    LDX #$0A00
    STX $42
    LDA #$007F
    STA $44
    JSR $&sub_028DEA
    PLP 
    RTS 
}

code_0286F5 {
    LDX #$003E
    JSR $&sub_028D8F
    LDX #$0A00
    STX $42
    LDA #$007F
    STA $44
    JSR $&sub_028DEA
    LDA $7F0A20
    STA $7F0A00
    PLP 
    RTS 
}

---------------------------------------------

func_028712 {
    PHP 
    REP #$20
    JSR $&sub_028CE7
    XBA 
    LSR 
    LSR 
    STA $0664
    JSR $&sub_028CE7
    XBA 
    LSR 
    LSR 
    STA $0666
    JSR $&sub_028CE7
    XBA 
    LSR 
    LSR 
    STA $0668
    JSR $&sub_028CE7
    STA $066A
    LDX #$003E
    JSR $&sub_028D8F
    LDA #$0001
    AND $066A
    BEQ code_028752
    LDX #$0678
    JSR $&sub_028DC1
    BCS code_028752
    LDA #$0001
    TRB $066A
}

code_028752 {
    LDA #$0002
    AND $066A
    BEQ code_028768
    LDX #$067B
    JSR $&sub_028DC1
    BCS code_028768
    LDA #$0002
    TRB $066A
}

code_028768 {
    LDA $066A
    BEQ code_0287BA
    LDA [$3E]
    STA $78
    INC $3E
    INC $3E
    BEQ code_02878A
    LDX #$7000
    STX $7A
    JSL $@func_028270
    LDX #$7000
    STX $3E
    LDA #$007E
    STA $40
}

code_02878A {
    LSR $066A
    BCC code_0287A2
    LDX #$2000
    STX $42
    LDA #$007E
    STA $44
    JSR $&sub_028DEA
    LDX #$0000
    JSR $&sub_028FCD
}

code_0287A2 {
    LSR $066A
    BCC code_0287BA
    LDX #$2800
    STX $42
    LDA #$007E
    STA $44
    JSR $&sub_028DEA
    LDX #$0002
    JSR $&sub_028FCD
}

code_0287BA {
    PLP 
    RTS 
}

---------------------------------------------

func_0287BC {
    STZ $0664
    STZ $0665
    JSR $&sub_028CE7
    STA $066A
    LDX #$003E
    JSR $&sub_028D8F
    LDA $066A
    AND #$7F
    BEQ code_02880D
    LDA #$01
    AND $066A
    BEQ code_0287F0
    LDA $06EF
    BIT #$08
    BNE code_028818
    LDX #$067E
    JSR $&sub_028DC1
    BCS code_0287F0
    LDA #$01
    TRB $066A
}

code_0287F0 {
    LDA #$02
    AND $066A
    BEQ code_028804
    LDX #$0681
    JSR $&sub_028DC1
    BCS code_028804
    LDA #$02
    TRB $066A
}

code_028804 {
    LDA $066A
    AND #$7F
    BEQ code_02883C
    BRA code_028818
}

code_02880D {
    LDA $066A
    BMI code_028818
    STZ $067F
    STZ $0680
}

code_028818 {
    REP #$20
    LDA [$3E]
    INC $3E
    AND #$00FF
    XBA 
    STA $00
    LDA [$3E]
    INC $3E
    AND #$00FF
    XBA 
    STA $02
    SEP #$20
    LDA $066A
    AND #$7F
    BNE code_02883A
    JMP $&func_028926
}

code_02883A {
    BRA code_02883D
}

code_02883C {
    RTS 
}

code_02883D {
    REP #$20
    LDA [$3E]
    STA $78
    STA $0666
    INC $3E
    INC $3E
    CMP #$0000
    BEQ func_0288B5
    SEP #$20
    LDA $066A
    BIT #$01
    BEQ code_02888E
    LDX #$0000
    JSR $&sub_028895
    LDA $066A
    BIT #$02
    BEQ code_028894
    LDX #$A000
    STX $3E
    LDA #$7E
    STA $40
    LDX #$C000
    STX $42
    LDA #$7E
    STA $44
    JSR $&sub_028DEA
    LDA $01
    STA $0695
    XBA 
    LDA $03
    STA $0699
    JSL $@func_0281D1
    STA $069D
    BRA code_028894
}

code_02888E {
    LDX #$0002
    JSR $&sub_028895
}

code_028894 {
    RTS 
}

---------------------------------------------

sub_028895 {
    LDA $01
    STA $0693, X
    XBA 
    LDA $03
    STA $0697, X
    JSL $@func_0281D1
    STA $069B, X
    REP #$20
    LDA $069E, X
    STA $7A
    JSL $@func_028270
    SEP #$20
    RTS 
}

---------------------------------------------

func_0288B5 {
    SEP #$20
    LDA $01
    XBA 
    LDA $03
    JSL $@func_0281D1
    STZ $0666
    STA $0667
    LDA $066A
    BIT #$01
    BEQ code_028904
    LDX #$A000
    STX $42
    LDA #$7E
    STA $44
    LDX #$0000
    JSR $&sub_028914
    LDA $066A
    BIT #$02
    BEQ code_028913
    LDX #$A000
    STX $3E
    LDA #$7E
    STA $40
    LDX #$C000
    STX $42
    LDA #$7E
    STA $44
    JSR $&sub_028DEA
    LDX $00
    STX $effect_bounds_x
    LDX $02
    STX $effect_bounds_y
    BRA code_028913
}

code_028904 {
    LDX #$C000
    STX $42
    LDA #$7E
    STA $44
    LDX #$0002
    JSR $&sub_028914
}

code_028913 {
    RTS 
}

---------------------------------------------

sub_028914 {
    REP #$20
    LDA $00
    STA $map_bounds_x, X
    LDA $02
    STA $map_bounds_y, X
    JSR $&sub_028DEA
    SEP #$20
    RTS 
}

---------------------------------------------

func_028926 {
    REP #$20
    LDA [$3E]
    INC $3E
    INC $3E
    STA $78
    CMP #$0000
    BNE code_028943
    SEP #$20
    LDX $3E
    STX $A1T0L
    LDA $40
    STA $A1B0
    BRA code_028959
}

code_028943 {
    SEP #$20
    LDX #$A000
    STX $7A
    JSL $@func_028270
    LDX #$A000
    STX $A1T0L
    LDA #$7E
    STA $A1B0
}

code_028959 {
    STZ $VMAIN
    LDX #$2000
    STX $VMADDL
    LDA #$00
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDX #$4000
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    LDA #$80
    STA $VMAIN
    RTS 
}

---------------------------------------------

func_02897D {
    PHY 
    PHB 
    LDA #$7E
    PHA 
    PLB 
    LDX #$0000
    REP #$20

  code_028988:
    LDA #$0000
    STA $B000, X
    STA $B002, X
    STA $B004, X
    STA $B006, X
    TXA 
    CLC 
    ADC #$0008
    TAX 
    CPX #$4000
    BCC code_028988
    SEP #$20
    LDA $0693
    STA $18
    LDA $0697
    CMP #$05
    BCC code_0289B2
    LDA #$04
}

code_0289B2 {
    STA $1C
    LDA #$00
    STA $0E
    STA $10
    LDY #$0000
    TYX 
    STX $00

  code_0289C0:
    REP #$20
    TYA 
    CLC 
    ADC #$0100
    STA $14
    SEP #$20

  code_0289CB:
    LDA #$0F
    STA $12

  code_0289CF:
    REP #$20
    LDA $A000, Y
    PHY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    TAY 
    SEP #$20
    LDA $2000, Y
    STA $B000, X
    LDA $2002, Y
    STA $B001, X
    LDA $2004, Y
    STA $B080, X
    LDA $2006, Y
    STA $B081, X
    PLY 
    INY 
    INX 
    INX 
    DEC $12
    BPL code_0289CF
    REP #$20
    TXA 
    CLC 
    ADC #$00E0
    TAX 
    SEP #$20
    CPY $14
    BCC code_0289CB
    REP #$20
    LDA $00
    CLC 
    ADC #$0020
    STA $00
    TAX 
    SEP #$20
    LDA $0E
    INC 
    STA $0E
    CMP $18
    BCC code_0289C0
    STZ $0E
    LDA $10
    INC 
    STA $10
    CMP $1C
    BCS code_028A3C
    REP #$20
    AND #$00FF
    XBA 
    ASL 
    ASL 
    ASL 
    ASL 
    STA $00
    TAX 
    BRA code_0289C0
}

code_028A3C {
    PLB 
    STZ $VMAIN
    LDX #$0000
    STX $VMADDL
    LDX #$B000
    STX $A1T0L
    LDA #$7E
    STA $A1B0
    LDA #$00
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDX #$4000
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    LDA #$80
    STA $VMAIN
    PLY 
    RTL 
}

---------------------------------------------

func_028A6D {
    JSR $&sub_028CE7
    PHY 
    REP #$20
    AND #$00FF
    ASL 
    TAX 
    LDA $@table_018000, X
    SEC 
    SBC #$&table_018000
    TAX 
    SEP #$20
    LDA $@table_018000, X
    STA $_TM
    STA $TMW
    LDA $@table_018000+1, X
    STA $_TS
    STA $TSW
    LDA $@table_018000+2, X
    STA $CGWSEL
    LDA $@table_018000+3, X
    STA $CGADSUB
    LDA $@table_018000+4, X
    AND #$30
    STA $06F1
    LDA $@table_018000+4, X
    STZ $06A3
    STZ $06A5
    LDY #$2000
    ROR 
    BCC code_028AC1
    STY $06A2
}

code_028AC1 {
    ROR 
    BCC code_028AC7
    STY $06A4
}

code_028AC7 {
    ROR 
    ROR 
    ROR 
    ROR 
    ROR 
    LDY #$00E0
    BCC code_028AD4
    LDY #$0100
}

code_028AD4 {
    STY $06EC
    ROR 
    BCS code_028ADF
    LDA #$01
    TSB $06A5
}

code_028ADF {
    REP #$20
    LDA $06A2
    CMP $06A6
    BEQ code_028AEC
    STZ $0679
}

code_028AEC {
    STA $06A6
    LDA $06A4
    CMP $06A8
    BEQ code_028AFA
    STZ $067C
}

code_028AFA {
    STA $06A8
    SEP #$20
    LDA $@table_018000+5, X
    STA $06EE
    BMI code_028B22
    LDA $06EE
    AND #$03
    CLC 
    ADC #$10
    STA $BG1SC
    LDA $06EE
    LSR 
    LSR 
    AND #$03
    CLC 
    ADC #$18
    STA $BG2SC
    BRA code_028B3A
}

code_028B22 {
    LDA $06EE
    AND #$03
    CLC 
    ADC #$18
    STA $BG1SC
    LDA $06EE
    LSR 
    LSR 
    AND #$03
    CLC 
    ADC #$10
    STA $BG2SC
}

code_028B3A {
    LDA $@table_018000+6, X
    STA $BGMODE
    LDA $@table_018000+7, X
    PHA 
    AND #$1F
    STA $06EF
    BIT #$08
    BEQ code_028B52
    STZ $066E
}

code_028B52 {
    LDA #$40
    TRB $09ED
    PLA 
    BPL code_028B5F
    LDA #$40
    TSB $09ED
}

code_028B5F {
    LDA $@table_018000+8, X
    LDA $@table_018000+9, X
    PLY 
    RTS 
}

---------------------------------------------

func_028B69 {
    INY 
    INY 
    INY 
    RTS 
}

---------------------------------------------

func_028B6D {
    JSR $&sub_028CE7
    STA $06F2
    JSR $&sub_028CE7
    STA $06F4
    LDX #$003E
    JSR $&sub_028D8F
    LDA $06F6
    CMP $06F4
    BEQ code_028B88
    RTS 
}

code_028B88 {
    LDX #$0687
    JSR $&sub_028DC1
    BCS code_028B91
    RTS 
}

code_028B91 {
    LDA #$1A
    JSL $@func_0281C9
    LDA $0D72
    BEQ code_028BA7
    LDA #$F2
    STA $APUIO0
    LDA #$20
    JSL $@func_0281C9
}

code_028BA7 {
    LDA #$F0
    STA $APUIO0

  code_028BAC:
    LDA $APUIO0
    BNE code_028BAC
    LDA #$02
    JSL $@func_0281C9
    LDA #$FF
    STA $APUIO0
    LDA #$02
    JSL $@func_0281C9
    LDX $3E
    STX $46
    LDX $40
    STX $48
    JSL $@func_02909B
    LDA #$01
    STA $0D72
    LDA #$03
    JSL $@func_0281C9
    LDA $06F2
    BEQ code_028BE0
    LDA #$01
}

code_028BE0 {
    STA $APUIO0
    RTS 
}

---------------------------------------------

func_028BE4 {
    PHP 
    REP #$20
    LDA [$3A], Y
    STA $0666
    SEP #$20
    INY 
    INY 
    INY 
    LDX #$003E
    JSR $&sub_028D8F
    LDX #$0684
    JSR $&sub_028DC1
    BCC code_028C19
    REP #$20
    LDA [$3E]
    INC $3E
    INC $3E
    CMP #$0000
    BEQ code_028C1B
    STA $78
    SEP #$20
    LDX #$4000
    STX $7A
    JSL $@func_028270
}

code_028C19 {
    PLP 
    RTS 
}

code_028C1B {
    STZ $0664
    STZ $0668
    LDX #$4000
    STX $42
    LDA #$007E
    STA $44
    JSR $&sub_028DEA
    PLP 
    RTS 
}

---------------------------------------------

func_028C30 {
    PHP 
    JSR $&sub_028CE7
    STA $066A
    LDX #$003E
    JSR $&sub_028D8F
    REP #$20
    LDA [$3E]
    STA $00
    INC $3E
    INC $3E
    LDA [$3E]
    XBA 
    ORA $00
    INC $3E
    INC $3E
    SEP #$20
    JSL $@func_0281D1
    REP #$20
    STA $00
    XBA 
    ASL 
    ASL 
    ASL 
    STA $0666
    LDA [$3E]
    INC $3E
    INC $3E
    BEQ code_028C81
    STA $78
    SEP #$20
    LDX #$7000
    STX $7A
    JSL $@func_028270
    LDX #$7000
    STX $3E
    LDA #$7E
    STA $40
    BRA code_028C87
}

code_028C81 {
    INC $3E
    INC $3E
    SEP #$20
}

code_028C87 {
    LDA $066A
    BPL code_028C9A
    AND #$7F
    XBA 
    LDA #$00
    REP #$20
    ASL 
    ASL 
    STA $VMADDL
    BRA code_028CC4
}

code_028C9A {
    REP #$20
    AND #$00FF
    BIT #$0001
    BEQ code_028CB0
    LDA #$1000
    STA $VMADDL
    PEA $&code_028CB0-1
    PHP 
    BRA code_028CC4
}

code_028CB0 {
    REP #$20
    LDA $066A
    BIT #$0002
    BEQ code_028CC2
    LDA #$1800
    STA $VMADDL
    BRA code_028CC4
}

code_028CC2 {
    PLP 
    RTS 
}

code_028CC4 {
    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDX $3E
    STX $A1T0L
    LDA $40
    STA $A1B0
    LDX $0666
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

sub_028CE7 {
    PHP 
    SEP #$20
    LDA #$00
    XBA 
    LDA [$3A], Y
    INY 
    PLP 
    RTS 
}

---------------------------------------------

sub_028CF2 {
    LDY #$0000

  code_028CF5:
    LDA [$3A], Y
    INY 
    INY 
    CMP $scene_current
    BNE code_028CFF
    RTS 
}

code_028CFF {
    SEP #$20
    LDA [$3A], Y
    INY 
    CMP #$00
    BEQ code_028CF5
    CMP #$13
    BEQ code_028D39
    CMP #$02
    BEQ code_028D3A
    CMP #$03
    BEQ code_028D34
    CMP #$04
    BEQ code_028D35
    CMP #$05
    BEQ code_028D34
    CMP #$06
    BEQ code_028D37
    CMP #$0E
    BEQ code_028D38
    CMP #$10
    BEQ code_028D35
    CMP #$11
    BEQ code_028D36
    CMP #$14
    BEQ code_028D3A
    CMP #$15
    BEQ code_028D3A
}

code_028D34 {
    INY 
}

code_028D35 {
    INY 
}

code_028D36 {
    INY 
}

code_028D37 {
    INY 
}

code_028D38 {
    INY 
}

code_028D39 {
    INY 
}

code_028D3A {
    INY 
    BRA code_028CFF
}

---------------------------------------------

func_028D3D {
    JSR $&sub_028CE7
    PHA 
    LDY #$0000

  code_028D44:
    INY 
    INY 

  code_028D46:
    LDA [$3A], Y
    INY 
    CMP #$00
    BEQ code_028D44
    CMP #$02
    BEQ code_028D83
    CMP #$03
    BEQ code_028D7D
    CMP #$04
    BEQ code_028D7E
    CMP #$05
    BEQ code_028D7D
    CMP #$06
    BEQ code_028D80
    CMP #$0E
    BEQ code_028D81
    CMP #$10
    BEQ code_028D7E
    CMP #$11
    BEQ code_028D7F
    CMP #$12
    BEQ code_028D8D
    CMP #$13
    BEQ code_028D82
    CMP #$14
    BEQ code_028D86
    CMP #$15
    BEQ code_028D83
}

code_028D7D {
    INY 
}

code_028D7E {
    INY 
}

code_028D7F {
    INY 
}

code_028D80 {
    INY 
}

code_028D81 {
    INY 
}

code_028D82 {
    INY 
}

code_028D83 {
    INY 
    BRA code_028D46
}

code_028D86 {
    LDA [$3A], Y
    INY 
    CMP $01, S
    BNE code_028D46
}

code_028D8D {
    PLA 
    RTS 
}

---------------------------------------------

sub_028D8F {
    PHP 
    REP #$20
    LDA [$3A], Y
    INY 
    INY 
    STA $0000, X
    SEP #$20
    LDA [$3A], Y
    INY 
    STA $0002, X
    CMP #$70
    BCS code_028DBF
    CLC 
    ADC #$80
    CMP #$A0
    BCC code_028DBC
    CLC 
    ADC #$20
    STA $0002, X
    LDA $0001, X
    AND #$7F
    STA $0001, X
    BRA code_028DBF
}

code_028DBC {
    STA $0002, X
}

code_028DBF {
    PLP 
    RTS 
}

---------------------------------------------

sub_028DC1 {
    PHP 
    REP #$20
    LDA $3E
    CMP $0000, X
    BNE code_028DD9
    SEP #$20
    LDA $40
    CMP $0002, X
    BNE code_028DD9
    REP #$20
    PLP 
    CLC 
    RTS 
}

code_028DD9 {
    SEP #$20
    LDA $40
    STA $0002, X
    REP #$20
    LDA $3E
    STA $0000, X
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_028DEA {
    PHP 
    PHY 
    SEP #$20
    LDA $3E
    CMP #$80
    BCC code_028E43
    CMP #$C0
    BCS code_028E01
    REP #$20
    LDA $3E
    CMP #$8000
    BCC code_028E43
}

code_028E01 {
    REP #$20
    LDA $0666
    SEC 
    SBC $0664
    STA $DAS0L
    LDA $3E
    CLC 
    ADC $0664
    STA $A1T0L
    LDA $42
    CLC 
    ADC $0668
    STA $WMADDL
    SEP #$20
    LDA $44
    CMP #$7F
    LDA #$00
    ADC #$00
    STA $WMADDH
    LDA #$00
    STA $DMAP0
    LDA #$80
    STA $BBAD0
    LDA $40
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    PLY 
    PLP 
    RTS 
}

code_028E43 {
    PHX 
    SEP #$20
    LDA $40
    STA $0405
    LDA $44
    STA $0404
    REP #$20
    LDA $3E
    CLC 
    ADC $0664
    TAX 
    LDA $42
    CLC 
    ADC $0668
    TAY 
    LDA $0666
    SEC 
    SBC $0664
    DEC 
    JSR $0402
    PLX 
    PLY 
    PLP 
    RTS 
}

---------------------------------------------

sub_028E6F {
    LDX #$0000

  code_028E72:
    LDA $3E
    CMP $0084, X
    BEQ code_028E83

  code_028E79:
    INX 
    INX 
    INX 
    CPX #$000C
    BNE code_028E72
    CLC 
    RTS 
}

code_028E83 {
    SEP #$20
    LDA $40
    CMP $0086, X
    BEQ code_028E90
    REP #$20
    BRA code_028E79
}

code_028E90 {
    REP #$20
    SEC 
    RTS 
}

---------------------------------------------

sub_028E94 {
    LDX $0094
    TXA 
    INC 
    AND #$0003
    STA $0094
    TXA 
    PHA 
    ASL 
    CLC 
    ADC $01, S
    TAX 
    PLA 
    LDA $003E
    STA $0084, X
    SEP #$20
    LDA $0040
    STA $0086, X
    REP #$20
    RTS 
}

---------------------------------------------

sub_028EB8 {
    PHY 
    LDA $0668
    XBA 
    STA $VMADDL
    LDA $0666
    CMP #$2001
    BMI code_028ED4
    SEC 
    SBC #$2000
    STA $0666
    LDA #$2000
    BRA code_028ED7
}

code_028ED4 {
    STZ $0666
}

code_028ED7 {
    JSR $&sub_028F18
    LDA $0666
    BEQ code_028F16
    PHA 
    LDY $0094
    TYA 
    INC 
    CMP #$0004
    BCC code_028EED
    LDA #$0000
}

code_028EED {
    STA $0094
    TYA 
    PHA 
    ASL 
    CLC 
    ADC $01, S
    TAY 
    PLA 
    LDA #$FFFF
    STA $0084, Y
    SEP #$20
    LDA #$FF
    STA $0086, Y
    REP #$20
    LDA $0668
    XBA 
    CLC 
    ADC #$1000
    STA $VMADDL
    PLA 
    JSR $&sub_028F18
}

code_028F16 {
    PLY 
    RTS 
}

---------------------------------------------

sub_028F18 {
    PHP 
    STA $DAS0L
    JSR $&sub_028F43
    TAY 
    LDA $VMDATALREAD
    SEP #$20
    STY $A1T0L
    LDA #$7F
    STA $A1B0
    LDA #$81
    STA $DMAP0
    LDA #$39
    STA $BBAD0
    LDA #$01
    STA $MDMAEN
    LDA #$01
    STA $DMAP0
    PLP 
    RTS 
}

---------------------------------------------

sub_028F43 {
    LDA $0094
    DEC 
    ROR 
    ROR 
    ROR 
    ROR 
    AND #$6000
    CLC 
    ADC #$4000
    RTS 
}

---------------------------------------------

sub_028F53 {
    PHY 
    LDA $@binary_029F4E, X
    AND #$00FF
    PHA 
    ROR 
    ROR 
    ROR 
    ROR 
    AND #$6000
    CLC 
    ADC #$4000
    TAX 
    LDA $0666
    SEC 
    SBC $0664
    CMP #$2001
    BCS code_028F7B
    TAY 
    JSR $&sub_028FA7
    PLA 
    PLY 
    RTS 
}

code_028F7B {
    SEC 
    SBC #$2000
    PHA 
    LDA #$2000
    TAY 
    JSR $&sub_028FA7
    LDA $0668
    CLC 
    ADC #$0010
    STA $0668
    LDA $03, S
    INC 
    ROR 
    ROR 
    ROR 
    ROR 
    AND #$6000
    CLC 
    ADC #$4000
    TAX 
    PLA 
    JSR $&sub_028FA7
    PLA 
    PLY 
    RTS 
}

---------------------------------------------

sub_028FA7 {
    LDA $0668
    XBA 
    STA $VMADDL
    STX $A1T0L
    STY $DAS0L
    SEP #$20
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7F
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    REP #$20
    RTS 
}

---------------------------------------------

sub_028FCD {
    PHP 
    SEP #$20
    PHB 
    PHY 
    LDA #$7E
    PHA 
    PLB 
    LDY $06AA, X
    STY $42
    LDA #$7F
    STA $44
    LDY $06AE, X
    LDA #$00
    STA $0E

  code_028FE6:
    LDA #$04
    STA $10

  code_028FEA:
    LDA $0001, Y
    AND #$02
    PHA 
    REP #$20
    LDA $0000, Y
    AND #$FDFF
    ORA $06A2, X
    STA $0000, Y
    SEP #$20
    INY 
    INY 
    DEC $10
    BNE code_028FEA
    PLA 
    ASL 
    ORA $01, S
    ASL 
    ORA $02, S
    ASL 
    ORA $03, S
    LSR 
    STA [$42]
    INC $42
    PLA 
    PLA 
    PLA 
    DEC $0E
    BNE code_028FE6
    PLY 
    PLB 
    PLP 
    RTS 
}

---------------------------------------------

sub_029020 {
    LDX #$0000
    JSR $&sub_029034
    LDA $06EF
    BIT #$01
    BEQ code_029033
    LDX #$0002
    JSR $&sub_029060
}

code_029033 {
    RTS 
}

---------------------------------------------

sub_029034 {
    LDY $06AA
    STY $3E
    LDA #$7F
    STA $40
    LDA $0693
    XBA 
    LDA $0697
    JSL $@func_0281D1
    XBA 
    TAY 
    BEQ code_02905F
    LDX $069E

  code_02904F:
    LDA $7E0000, X
    STA $3E
    LDA [$3E]
    STA $7F2000, X
    INX 
    DEY 
    BNE code_02904F
}

code_02905F {
    RTS 
}

---------------------------------------------

sub_029060 {
    LDY $06AC
    STY $3E
    LDA #$7F
    STA $40
    LDA $0695
    XBA 
    LDA $0699
    JSL $@func_0281D1
    XBA 
    TAY 
    BEQ code_02908D
    LDX $0080

  code_02907B:
    LDA $7E0000, X
    STA $3E
    LDA [$3E]
    BEQ code_029089
    STA $7F0000, X
}

code_029089 {
    INX 
    DEY 
    BNE code_02907B
}

code_02908D {
    RTS 
}

---------------------------------------------

func_02908E {
    LDX #$&binary_029210
    STX $46
    LDA #$^binary_029210
    STA $48
    JSR $&sub_02919B
    RTL 
}

---------------------------------------------

func_02909B {
    PHP 
    PHY 
    JSR $&sub_02919B
    DEY 
    DEY 
    SEP #$20
    LDA #$FF
    STA $APUIO0
    LDA #$CC
    STA $30
    REP #$20
    LDA #$BBAA

  code_0290B2:
    CMP $APUIO0
    BNE code_0290B2
    LDA [$46], Y
    INY 
    INY 
    STA $2E
    LDA [$46], Y
    INY 
    STY $32
    AND #$00FF
    STA $28
    STZ $2C

  code_0290C9:
    REP #$20
    LDX #$0000
    STX $4A
    SEP #$20
    LDA #$C5
    STA $4C
    LDY $32
    LDA [$46], Y
    INY 
    STY $32
    STA $2A
    STZ $2B
    BIT #$80
    BEQ code_0290E8
    JMP $&code_029153
}

code_0290E8 {
    REP #$20
    LDA $2E
    CLC 
    ADC $2C
    STA $2E

  code_0290F1:
    LDA [$4A]
    STA $2C
    STA $34
    INC $4A
    INC $4A
    LDA $2A
    BEQ code_029113
    DEC $2A
    LDA $4A
    CLC 
    ADC $2C
    STA $4A
    BPL code_0290F1
    AND #$7FFF
    STA $4A
    INC $4C
    BRA code_0290F1
}

code_029113 {
    LDY $4A
    STZ $4A
    SEP #$20
    LDA $30
    BRA code_029160

  code_02911D:
    LDA [$4A], Y
    INY 
    BPL code_029127
    LDY #$0000
    INC $4C
}

code_029127 {
    XBA 
    LDA #$00
    BRA code_02913E

  code_02912C:
    XBA 
    LDA [$4A], Y
    INY 
    BPL code_029137
    LDY #$0000
    INC $4C
}

code_029137 {
    XBA 

  code_029138:
    CMP $APUIO0
    BNE code_029138
    INC 
}

code_02913E {
    REP #$20
    STA $APUIO0
    SEP #$20
    DEX 
    BNE code_02912C

  code_029148:
    CMP $APUIO0
    BNE code_029148

  code_02914D:
    ADC #$03
    BEQ code_02914D
    STA $30
}

code_029153 {
    DEC $28
    BEQ code_02915A
    JMP $&code_0290C9
}

code_02915A {
    STZ $2C
    STZ $2D
    LDA $30
}

code_029160 {
    PHA 
    REP #$20
    LDA $2C
    TAX 
    LDA $2E
    STA $APUIO2
    SEP #$20
    CPX #$0001
    LDA #$00
    ROL 
    STA $APUIO1
    ADC #$7F
    JSL $@func_0281A2
    PLA 
    STA $APUIO0

  code_029180:
    CMP $APUIO0
    BNE code_029180
    LDA $0654
    CMP #$0F
    BNE code_029190
    JSL $@func_028191
}

code_029190 {
    BVS code_02911D
    STZ $APUIO1
    STZ $APUIO2
    PLY 
    PLP 
    RTL 
}

---------------------------------------------

sub_02919B {
    PHP 
    REP #$20
    LDY #$0000
    LDA #$BBAA

  code_0291A4:
    CMP $APUIO0
    BNE code_0291A4
    SEP #$20
    LDA #$CC
    BRA code_0291D5

  code_0291AF:
    LDA [$46], Y
    INY 
    XBA 
    LDA #$00
    BRA code_0291C2

  code_0291B7:
    XBA 
    LDA [$46], Y
    INY 
    XBA 

  code_0291BC:
    CMP $APUIO0
    BNE code_0291BC
    INC 
}

code_0291C2 {
    REP #$20
    STA $APUIO0
    SEP #$20
    DEX 
    BNE code_0291B7

  code_0291CC:
    CMP $APUIO0
    BNE code_0291CC

  code_0291D1:
    ADC #$03
    BEQ code_0291D1
}

code_0291D5 {
    PHA 
    REP #$20
    LDA [$46], Y
    INY 
    INY 
    TAX 
    LDA [$46], Y
    INY 
    INY 
    STA $APUIO2
    SEP #$20
    JSL $@func_0281A2
    CPX #$0001
    LDA #$00
    ROL 
    STA $APUIO1
    ADC #$7F
    PLA 
    STA $APUIO0

  code_0291F9:
    CMP $APUIO0
    BNE code_0291F9
    LDA $0654
    CMP #$0F
    BNE code_029209
    JSL $@func_028191
}

code_029209 {
    BVS code_0291AF
    STZ $APUIO2
    PLP 
    RTS 
}

---------------------------------------------

binary_029210 #CA0B000420CDCFBDE8005DAFC8F0D0FBC248BC3F760AA248E8008D0C3F06068D1C3F06068D2C3F06068D3C3F0606E8108D5D3F0606E830C4F1E810C4FAE810C4FBC453E803C4F1E43648FF244AC4388D0AAD05F007B008694D4CD00FE34C0CF6440EC4F2F64E0E5DE6C4F3FEE4CB45CB46EBFDF0FCE840CF608443C4439015E5FD0F6814F007E431F0033F870E694D4CF002AB4CE4536084F5EBFEF0FCCF608451C451B004AD00F0463F3807E431F037EB61E431CFE43ECFCB6BEB63E431CFE43ECFCB6C8D60E431CFE43ECFDDC4F78D0C3F06068D1C3F0606E430F00A8B31D0068F00043F3606CD003F04055F4304E404F012CD008F0147F4D5F0033F630D3D3D0B47D0F35F4304F404D4F4F4F474F4D0FAD4006FADCA90053F9D088DA4ADC8B0F2E41A2447D0ECDD287F6084506095F002D57D03F5A503D57C03F5A1025CE8007CD58C02E800D4ACD50001D5C802D4C009475E094745F56402D498F01EF56502D499F57802D00AF57D0380B57902D57D03F5790260957D033F0A0B3F220B8D00E41180A834B009E41180A813B006DC1C7A10DA104DE4111C8D00CD189E5DF65A0EC415F6590EC414F65C0E2DF65B0EEE9A14EB10CFDD8D007A14CB151C2B15C4142F044B157C3DC806D0F8C414CEF52802EB15CFDA16F52802EB14CF6DF52902EB14CF7A16DA16F52902EB15CFFDAE7A16DA16F5730E0802FDE4163FFE05FCE4172DE447241AAED004CBF2C4F36F8D00F7403A402DF7403A40FDAE6F8FFF308FFF31C4046F2DE5FE0FECFF0FDA3BE8005DC73B3A3BD0FAAE6FE4D5F044E800C46BC46C8FFF5C8FFF0E8F0004E8008D0C3F06068D1C3F06068D2C3F06068D3C3F0606A248E800C4D5C4D7C4D9C4DBC4DDC4DFC4E1C4E3C4E5C4E7C431E8013F760A6F8FFF0E6F3F890FC408C4046F68F0F0A768F1F08668F2F0E868FFF0E86FE4046890F0186891F018E404300F80A840900A1C1C48FFFDE8E0CFCB3E6F8F01326F8F00326FC4041CF0336802D0D13F2206E5FC0FECFD0FDA403A403A408F020CE800C4308F0031C45FC439C436C4E5C4E7C43DC4F58FE03E8F000ED248E41A48FF0E46006FCD0E8F8047E800D50503E80A3F0909D51502D5A503D5F002D56402D4ADD4C11D1D4B47D0E0C45AC468C454C450C4428F00598F20536FEB08E40068F090035F8B06C4087E00F0035FC206E404F0E78F000EE40CF05E6E0CA8FA3DF53F0B06D020FDD0098FFF3D8FFFF55FC2068B421005C4428F003D3F0B06F842F0DCDA402FD8AB3DDA168D0FF716D6D400DC10F8CD008F0147F4D5F00AF51502D005E8003F9D08E800D5B803D484D485BCD4703D3D0B47D0E0CD00D85E8F0147D844F4D5F06C9B70D0623F9308D01DF5B803F08A3F0E0AF5B8039CD5B803D0EAF53C02D4D4F53D02D4D52FDE3020D500023F930830182D9F2807FDF60013D50102AE280FFDF60813D514023F930868E090053F81082FB33F1105F50002D470FDF50102CFDDD001BCD4712F033F720C3FEA0A3D3D0B47D088E454F00BBA567A526E5402BA54DA52E468F015BA647A60DA60BA667A626E6806BA68DA60EB6ADA62E45AF00EBA5C7A586E5A02BA5ADA588FFF5ECD008F0147F4D5F0033FA90B3D3D0B47D0F36F1CFDF68A0A2DF6890A2DDD5CFDF6290BF008E7D4BBD4D002BBD5FD6FD51502EB34D011FD100680A8CA60845F4D5DF5E00FCE2F09FD100680A8CA6084398D06CFDA1460980014981215E41A2447D0384DF5730E08045D8D00F714100E281F3820480E4800094749DD2F07E4474E4900F714D8F2C4F33DFCAD04D0F4CEF714D52902FCF714D528026FD56903281FD54103E800D540036FD4852D3F9308D5680380B54103CE3F2D0BD55403DDD555036FD5A0023F9308D58D023F9308D4ADD5B502E800D5A1026FD5A1022D8D00F4ADCE9EF844D5B4026FDD80A81EFDE800DA58E431D0038FFF316FC45A3F9308C45B80A459F85A3F2D0BDA5C6FE434D004E800DA526FC4543F9308C45580A453F8543F2D0BDA566FC4506FD5F0026FD5DC023F9308D5C9023F9308D4C16FE8012F02E800D57802DDD565023F9308D564023F9308D579026FD564026FEB34F002E8B4D50503E800D504036FD4842D3F9308D52C0380B50503CE3F2D0BD51803DDD519036FD5A5036FD550023F9308D551023F9308D5B803F4D4D53C02F4D5D53D02F55002D4D4F55102D4D56FC44A3F9308E800DA603F9308E800DA62B2486FC4683F9308C46980A461F8683F2D0BDA643F9308C46A80A463F8683F2D0BDA666FDA60DA62A2486F3F760A3F9308C44E3F93088D08CF5D8D0FF5250E3F06063DDD608810FD10F2F8446FC44D8D7DCBF2E4F3644DF029280F48FFF34C0360844CC44C8D04F6440EC4F2E800C4F3FEF5E44808208D6C3F0606E44D8D7D3F06061C1C1C48FF8088FF8D6D5F06062D7D6810900380A8049F5C608805FDAE08803FFE05FC6D3F9308C43F3F93089F1C043FEE3FFE056FEB34D003C45F6FC4396FF498D033E7D468F9D02D3F95083F9308D4993F9308D4983F930860845095F002287FD5A40380B57D03FB986DCE3F2D0BD59003DDD591036FF57D03C411F57C03C4106FED6B12100348FFBC8D009E2DE8009EEEF844F31206DA14BA1C9A146F9D080909170930093C09570968097A098309950998099C09A809C909D809F5094709AB09AF09C509F109190A4D0A540A2C0AFA0AE00A0000000000000000B80A0101020300010201020101030001020301030300010300030303010000000001F484F009E8048D039B843F490CFBC1F023F5DC02DEC01B09475EF5C8021007FCD004E8802F046095C902D5C8023FEF0D2F07BBC0E8FF3FFA0DF485F009E8408D039B853F490CE447245EF053F54103FDF54003DA10F5730EC412E432F0098F0A118F00108F0A11EB11F6110E80B6100EEB10CFDDEB116096100EFDF52D03CFF569031C1312011CDD900348FFBCEB123FFE058D14E8009A10DA10AB123312C86F09475EDA14DA164DEE60D00F982716687CF01560E800D714FC2F099814163F6B0CFCF7149716D7146FF471F0649B71F005E802DE705BF5B803C417F4D4FBD5DA148D00F714F01C3005FCF71410FB68C8F03F68EFF02968E090306DFDAE96A90AFD2FE0E417F0238B17D00AF53D022DF53C02EE2FCAF551022DF55002EE2FC0FCF7142DFCF714FDAE2FB5E4478D5C3FFE05F213F498F02CF499F0049B992F24E2139B98D00BF5A503D57C03F5A4032F1060F57C03959003D57C03F57D03959103D57D033F220BF4ADF04CF5A002DEAC44F5000175A102D005F5B5022F0D40BB0020FDF002F4AD6095B402D4ADF58C0260958D02D58C02C4121C1C900248FFFDF4AD68F19005280FCF2F04CFDD8D003FDA0D5F7B05BBACE313F86FF213F4C1F009F5DC02DEC0033FE20DF54103FDF54003DA10F485F00AF55503FDF554033FC40DF313033FFE0BF213F57D03FDF57C03DA10F498F00EF499D00AF59103FDF590033FC40DF4ADF0AFF5A002DEACA9EB51F58D02CFDD60958C025F3F0DE213CB123F3F0B6DEB51CFCB148F0015EB51AECF7A143F3F0B7A10DA106FE213EB51F5C902CFDD6095C8021C900248FFFBC1CFDD48FFEB34D003EB59CFF51402CFF50503CFDDCFDDD52D036F000103070D151E293442515E676E73777A7C7D7E7F7F0000000000000058BFDBF0FE070C0C0C212B2B13FEF3F9343300D9E501FCEB2C3C0D4D6C4C5C3D2D5C6B6C4E3848450E494B465F08DE086509F4098C0A2C0BD60B8B0C4A0D140EEA0ECD0FBE100000100020003000400050006000700060007000FA1A37383F1A8FFF348F005E8F4047CD10E4F6F00C0947460947370947363FCA0E3F300F8F8047CD12E4F7F00C0947460947370947363FCA0E3F300F8F0034FA371A6F1C4D5DF50114FDF50014CED4D4DBD5E896D50503E80A3F0909E800D51502D5A503D5F002D56402D4ADD4C1D5B803D484D485E802D4706FE44748FFFD2437C437DD2436C43609475EFA475C0947468F00344D7D80A8045DF515023F9D08CE8FFF34E800D4D56FF4D5F054D8449B70D0453F9308F0C23020D500023F930830182D9F2807FDF60013D50102AE280FFDF60813D514023F930868E090053F81082FD03F1105F50002D470FDF50102CFDDD001BCD4712F033F720C3FEA0A3FA90B6F8DBBE8AADAF4E4F468CCD0FA2F1EEBF4D0FC7EF4D010CBF4E4F5D60000FCD0F2ACA50F5F9B0F10EA7EF410E6BAF6C5A40FCCA50FEBF4E4F5CBF4D0D2CD33D8F16F00000004

---------------------------------------------

func_029DE2 {
    PHP 
    SEP #$20
    STZ $CGADD
    STZ $DMAP0
    LDA #$22
    STA $BBAD0
    LDX #$0A00
    STX $A1T0L
    LDA #$7F
    STA $A1B0
    LDX #$0200
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    LDA $7F0C00
    STA $COLDATA
    LDA $7F0C01
    STA $COLDATA
    LDA $7F0C02
    STA $COLDATA
    PLP 
    RTL 
}

---------------------------------------------

func_029E1D {
    PHP 
    LDX #$0000
    STX $OAMADDL
    STZ $DMAP0
    LDA #$04
    STA $BBAD0
    LDX #$0422
    STX $A1T0L
    LDA #$00
    STA $A1B0
    LDX #$0220
    STX $DAS0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTL 
}

---------------------------------------------

func_029E44 {
    PHP 
    REP #$20
    LDA #$0000
    SEP #$20
    STA $WMADDH
    REP #$20
    STA $WMADDL
    LDY #$0100
    JSR $&sub_029F0F
    LDA #$0200
    STA $WMADDL
    LDY #$FF00
    JSR $&sub_029F0F
    LDY #$FF00
    JSR $&sub_029F0F
    LDX #$0000

  code_029E6F:
    LDA $@constants_029E85, X
    BMI code_029E83
    TAY 
    LDA $@constants_029E85+2, X
    STA $0000, Y
    INX 
    INX 
    INX 
    INX 
    BRA code_029E6F
}

code_029E83 {
    PLP 
    RTL 
}

---------------------------------------------

constants_029E85 [
  const < #$069E, #$A000 >   ;00
  const < #$06A0, #$C000 >   ;01
  const < #$0080, #$C000 >   ;02
  const < #$0082, #$007F >   ;03
  const < #$06BA, #$1000 >   ;04
  const < #$06BC, #$1800 >   ;05
  const < #$06AE, #$2000 >   ;06
  const < #$06B0, #$2800 >   ;07
  const < #$06B2, #$3100 >   ;08
  const < #$06B4, #$3288 >   ;09
  const < #$06B6, #$3184 >   ;0A
  const < #$06B8, #$330C >   ;0B
  const < #$06AA, #$0000 >   ;0C
  const < #$06AC, #$0100 >   ;0D
  const < #$003A, #$&scene_meta >   ;0E
  const < #$003C, #$^scene_meta, #00 >   ;0F
  const < #$0402, #$548B >   ;10
  const < #$0406, #$60AB >   ;11
  const < #$005E, #$0000 >   ;12
  const < #$0060, #$0081 >   ;13
  const < #$0062, #$0000 >   ;14
  const < #$064A, #$0001 >   ;15
  const < #$0648, #$0404 >   ;16
  const < #$0DA8, #$0020 >   ;17
  const < #$0DA6, #$0010 >   ;18
  const < #$0DAA, #$8000 >   ;19
  const < #$0DAC, #$0080 >   ;1A
  const < #$0DAE, #$4000 >   ;1B
  const < #$0DB0, #$0040 >   ;1C
  const < #$0DB4, #$2000 >   ;1D
  const < #$0DB2, #$1000 >   ;1E
  const < #$0B14, #$003C >   ;1F
  const < #$0AC4, #$FFFF >   ;20
  const < #$0B04, #$0000 >   ;21
]

---------------------------------------------

sub_029F0F {
    PHP 
    SEP #$20
    STY $DAS0L
    LDA #$08
    STA $DMAP0
    LDA #$80
    STA $BBAD0
    LDA #$^binary_01C455
    STA $A1B0
    LDX #$&binary_01C455
    STX $A1T0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

func_029F31 {
    PHP 
    LDX #$0000

  code_029F35:
    REP #$20
    LDA $@struct_029F5A, X
    BMI code_029F4C
    TAY 
    SEP #$20
    LDA $@struct_029F5A+2, X
    STA $0000, Y
    INX 
    INX 
    INX 
    BRA code_029F35
}

code_029F4C {
    PLP 
    RTL 
}

---------------------------------------------

binary_029F4E #000000010000020000030000

---------------------------------------------

struct_029F5A [
  unk6 < #0B, #$0042 >   ;00
  unk6 < #0C, #$0042 >   ;01
  unk6 < #00, #$8021 >   ;02
  unk6 < #01, #$0221 >   ;03
  unk6 < #02, #$0021 >   ;04
  unk6 < #03, #$0021 >   ;05
  unk6 < #05, #$0921 >   ;06
  unk6 < #06, #$0021 >   ;07
  unk6 < #07, #$1121 >   ;08
  unk6 < #08, #$1921 >   ;09
  unk6 < #09, #$7821 >   ;0A
  unk6 < #0A, #$0021 >   ;0B
  unk6 < #0B, #$2221 >   ;0C
  unk6 < #0C, #$0621 >   ;0D
  unk6 < #0D, #$0021 >   ;0E
  unk6 < #0D, #$0021 >   ;0F
  unk6 < #0E, #$0021 >   ;10
  unk6 < #0E, #$0021 >   ;11
  unk6 < #0F, #$0021 >   ;12
  unk6 < #0F, #$0021 >   ;13
  unk6 < #10, #$0021 >   ;14
  unk6 < #10, #$0021 >   ;15
  unk6 < #11, #$0021 >   ;16
  unk6 < #11, #$0021 >   ;17
  unk6 < #12, #$0021 >   ;18
  unk6 < #12, #$0021 >   ;19
  unk6 < #13, #$0021 >   ;1A
  unk6 < #13, #$0021 >   ;1B
  unk6 < #14, #$0021 >   ;1C
  unk6 < #14, #$0021 >   ;1D
  unk6 < #15, #$8021 >   ;1E
  unk6 < #16, #$0021 >   ;1F
  unk6 < #17, #$0021 >   ;20
  unk6 < #1A, #$8021 >   ;21
  unk6 < #1B, #$0121 >   ;22
  unk6 < #1B, #$0021 >   ;23
  unk6 < #1C, #$0021 >   ;24
  unk6 < #1C, #$0021 >   ;25
  unk6 < #1D, #$0021 >   ;26
  unk6 < #1D, #$0021 >   ;27
  unk6 < #1E, #$0021 >   ;28
  unk6 < #1E, #$0021 >   ;29
  unk6 < #1F, #$0021 >   ;2A
  unk6 < #1F, #$0021 >   ;2B
  unk6 < #20, #$0021 >   ;2C
  unk6 < #20, #$0021 >   ;2D
  unk6 < #21, #$0021 >   ;2E
  unk6 < #23, #$3321 >   ;2F
  unk6 < #24, #$3321 >   ;30
  unk6 < #25, #$3321 >   ;31
  unk6 < #26, #$0021 >   ;32
  unk6 < #27, #$FF21 >   ;33
  unk6 < #28, #$0021 >   ;34
  unk6 < #29, #$0021 >   ;35
  unk6 < #2A, #$0021 >   ;36
  unk6 < #2B, #$0021 >   ;37
  unk6 < #2C, #$0421 >   ;38
  unk6 < #2D, #$0021 >   ;39
  unk6 < #2E, #$0021 >   ;3A
  unk6 < #2F, #$0021 >   ;3B
  unk6 < #30, #$8221 >   ;3C
  unk6 < #31, #$0021 >   ;3D
  unk6 < #32, #$E021 >   ;3E
  unk6 < #33, #$0021 >   ;3F
  unk6 < #00, #$0042 >   ;40
  unk6 < #01, #$FF42 >   ;41
  unk6 < #02, #$0042 >   ;42
  unk6 < #03, #$0042 >   ;43
  unk6 < #04, #$0042 >   ;44
  unk6 < #05, #$0042 >   ;45
  unk6 < #06, #$0042 >   ;46
  unk6 < #07, #$0042 >   ;47
  unk6 < #08, #$0042 >   ;48
  unk6 < #09, #$0042 >   ;49
  unk6 < #0A, #$0042 >   ;4A
  unk6 < #0D, #$0042 >   ;4B
]

---------------------------------------------

func_02A040 {
    LDA $06F2
    STA $7F0010, X
    COP [9C] ( @func_03E1D6, #$2000 )
    CPY #$1FC0
    BNE code_02A056
    JMP $&code_02A0DD
}

code_02A056 {
    TXA 
    TYX 
    TAY 
    LDA $26
    INC 
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    TXA 
    TYX 
    TAY 
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_02A07D
    RTL 
}

code_02A07D {
    COP [9C] ( @func_02A0E5, #$2000 )
    LDA $20
    STA $0020, Y
    LDA $22
    STA $0022, Y
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_02A0A9
    RTL 
}

code_02A0A9 {
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_03E1D6, #$2000 )
    CPY #$1FC0
    BEQ code_02A0DD
    PHX 
    LDA $7F0010, X
    TYX 
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    PLX 
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_02A0DA
    RTL 
}

code_02A0DA {
    COP [DA] ( #01 )
}

code_02A0DD {
    LDA #$0080
    TRB $09EC
    COP [E0]
}

---------------------------------------------

func_02A0E5 {
    COP [DA] ( #48 )
    LDA #$1000
    TRB $12
    PHP 
    PHB 
    REP #$20
    STZ $joypad_mask_std
    SEP #$20
    LDA $22
    PHA 
    PLB 
    LDY $20
    JSL $@func_00817D
    REP #$20
    JSL $@sub_03E255
    PLB 
    PLP 
    COP [E0]
}

---------------------------------------------

func_02A10A {
    LDA $06FA
    BNE code_02A119
    LDA $09EC
    BIT #$0080
    BNE code_02A119
    CLC 
    RTL 
}

code_02A119 {
    SEC 
    RTL 
}

---------------------------------------------

func_02A11B {
    LDA $0D6E
    CMP $scene_current
    BNE code_02A124
    RTL 
}

code_02A124 {
    JSR $&sub_02A172
    LDA $00
    BNE code_02A12C
    RTL 
}

code_02A12C {
    PHP 
    PHB 
    SEC 
    SBC #$12
    EOR #$FF
    INC 
    AND #$FE
    PHA 
    LDA #$E0
    STA $00B4
    STZ $00B5
    LDA $0040
    PHA 
    LDY $3E
    PHY 
    PHK 
    PLB 
    LDY #$&asciistring_02A169
    REP #$20
    JSL $@sub_03E255
    PLY 
    PLB 
    SEP #$20
    PLA 
    REP #$20
    AND #$00FF
    CLC 
    ADC $0998
    STA $0998
    JSL $@sub_03E255
    PLB 
    PLP 
    RTL 
}

---------------------------------------------

asciistring_02A169 `[DLG:7,7][SIZ:A,1][SFX:0]`

---------------------------------------------

sub_02A172 {
    PHP 
    REP #$20
    INC $3E
    STZ $00
    SEP #$20
    LDY #$0000

  code_02A17E:
    LDA [$3E], Y
    CMP #$CA
    BEQ code_02A1A7
    CMP #$C0
    BCC code_02A1A2
    CMP #$CC
    BNE code_02A197
    INY 
    LDA [$3E], Y
    INY 
    CLC 
    ADC $00
    STA $00
    BRA code_02A17E
}

code_02A197 {
    CMP #$D6
    BEQ code_02A1A9
    CMP #$D7
    BEQ code_02A1BE
    INY 
    BRA code_02A17E
}

code_02A1A2 {
    INY 
    INC $00
    BRA code_02A17E
}

code_02A1A7 {
    PLP 
    RTS 
}

code_02A1A9 {
    INY 
    PHB 
    PHY 
    LDA #$^dictionary_01EBA8
    PHA 
    PLB 
    REP #$20
    LDA [$3E], Y
    AND #$00FF
    ASL 
    CLC 
    ADC #$&dictionary_01EBA8
    BRA code_02A1D1
}

code_02A1BE {
    INY 
    PHB 
    PHY 
    LDA #$^dictionary_01F54D
    PHA 
    PLB 
    REP #$20
    LDA [$3E], Y
    AND #$00FF
    ASL 
    CLC 
    ADC #$&dictionary_01F54D
}

code_02A1D1 {
    TAY 
    LDA $0000, Y
    TAY 
    SEP #$20

  code_02A1D8:
    LDA $0000, Y
    CMP #$CA
    BEQ code_02A1E4
    INC $00
    INY 
    BRA code_02A1D8
}

code_02A1E4 {
    PLY 
    PLB 
    INY 
    BRA code_02A17E
}

---------------------------------------------

func_02A1E9 {
    PHP 
    SEP #$20
    LDY #$0000
    STY $04

  code_02A1F1:
    LDA $0A20, Y
    INY 
    STA $06
    LDA #$08
    STA $0E

  code_02A1FB:
    LSR $06
    BCC code_02A214
    LDA $04
    REP #$20
    PHY 
    AND #$00FF
    JSL $@func_02A363
    PLY 
    SEP #$20
    BCS code_02A214
    JSL $@func_02A220
}

code_02A214 {
    INC $04
    DEC $0E
    BNE code_02A1FB
    LDA $04
    BNE code_02A1F1
    PLP 
    RTL 
}

---------------------------------------------

func_02A220 {
    PHP 
    PHY 
    REP #$20
    LDA $06AC
    STA $3E
    LDA #$007F
    STA $40
    STZ $A6
    LDA $A4
    AND #$00FF
    BEQ code_02A23C
    LDA #$0002
    STA $A6
}

code_02A23C {
    LDA $9A
    STA $18
    LDA $9C
    STA $1C
    LDX $A6
    JSL $@func_02B0A3
    STX $00
    STX $1A
    LDA $96
    STA $18
    LDA $98
    STA $1C
    LDX $A6
    JSL $@func_02B0A3
    STX $02
    STX $1E
    LDA $A6
    BNE code_02A2B9

  code_02A264:
    LDX $02
    SEP #$20
    LDA $7EA000, X
    PHA 
    LDA $7FC000, X
    LDX $00
    STA $7FC000, X
    PLA 
    STA $7EA000, X
    REP #$20
    DEC $9E
    BEQ code_02A296
    JSL $@func_02B0F6
    PHX 
    LDA $00
    STA $02
    JSL $@func_02B0F6
    STX $00
    PLX 
    STX $02
    BRA code_02A264
}

code_02A296 {
    DEC $A0
    BEQ code_02A2B6
    LDA $A2
    STA $9E
    LDA $1A
    STA $02
    JSL $@func_02B132
    STX $00
    STX $1A
    LDA $1E
    STA $02
    JSL $@func_02B132
    STX $1E
    BRA code_02A264
}

code_02A2B6 {
    PLY 
    PLP 
    RTL 
}

code_02A2B9 {
    LDX $02
    SEP #$20
    LDA $7EC000, X
    PHA 
    LDX $00
    STA $3E
    LDA [$3E]
    BEQ code_02A2CE
    STA $7FC000, X
}

code_02A2CE {
    PLA 
    STA $7EC000, X
    REP #$20
    DEC $9E
    BEQ code_02A2ED
    JSL $@func_02B0F6
    PHX 
    LDA $00
    STA $02
    JSL $@func_02B0F6
    STX $00
    PLX 
    STX $02
    BRA code_02A2B9
}

code_02A2ED {
    DEC $A0
    BEQ code_02A30D
    LDA $A2
    STA $9E
    LDA $1A
    STA $02
    JSL $@func_02B14E
    STX $00
    STX $1A
    LDA $1E
    STA $02
    JSL $@func_02B14E
    STX $1E
    BRA code_02A2B9
}

code_02A30D {
    PLY 
    PLP 
    RTL 
}

---------------------------------------------

func_02A310 {
    TSX 
    LDY $0800
    BEQ code_02A32F
    REP #$20
    LDA #$07FF
    TCS 

  code_02A31C:
    PLA 
    BEQ code_02A328
    STA $VMADDL
    PLA 
    STA $VMDATAL
    BRA code_02A31C
}

code_02A328 {
    TXS 
    STZ $0800
    SEP #$20
    RTL 
}

code_02A32F {
    TXS 
    LDA #$80
    STA $VMAIN
    REP #$20
    LDA $0902
    BEQ code_02A35D
    STA $VMADDL
    LDA $0904
    STA $VMDATAL
    LDA $0906
    STA $VMDATAL
    LDA $0908
    STA $VMADDL
    LDA $090A
    STA $VMDATAL
    LDA $090C
    STA $VMDATAL
}

code_02A35D {
    STZ $0902
    SEP #$20
    RTL 
}

---------------------------------------------

func_02A363 {
    ASL 
    ASL 
    ASL 
    TAY 
    STA $00A8
    LDA $&array_01D3CE, Y
    AND #$00FF
    CMP $scene_current
    BNE code_02A3A6
    PHD 
    LDA #$0000
    TCD 
    SEP #$20
    LDA $&array_01D3CE+7, Y
    STA $A4
    LDA $&array_01D3CE+5, Y
    STA $9A
    LDA $&array_01D3CE+6, Y
    STA $9C
    LDA $&array_01D3CE+1, Y
    STA $96
    LDA $&array_01D3CE+2, Y
    STA $98
    LDA $&array_01D3CE+3, Y
    STA $A2
    STA $9E
    LDA $&array_01D3CE+4, Y
    STA $A0
    PLD 
    REP #$20
    CLC 
    RTL 
}

code_02A3A6 {
    SEC 
    RTL 
}

---------------------------------------------

func_02A3A8 {
    PHX 
    PHD 
    LDA #$0000
    TCD 

  code_02A3AE:
    STA $A6
    LDA $A4
    AND #$00FF
    BEQ code_02A3BC
    LDA #$0002
    STA $A6
}

code_02A3BC {
    LDY #$0000

  code_02A3BF:
    LDA $9A
    STA $18
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1A
    LDA $9C
    STA $1C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1E
    LDX $A6
    JSL $@func_02B0A3
    STX $00
    LDA $96
    STA $18
    LDA $98
    STA $1C
    LDX $A6
    JSL $@func_02B0A3
    STX $02
    LDA $A6
    BNE code_02A443

  code_02A3EF:
    LDX $02
    SEP #$20
    LDA $7EA000, X
    PHA 
    LDA $7FC000, X
    LDX $00
    STA $7FC000, X
    PLA 
    STA $7EA000, X
    JSR $&sub_02A50D
    BCS code_02A40E
    BEQ code_02A41C
}

code_02A40E {
    REP #$20
    JSR $&sub_02A58B
    BCC code_02A3EF
    JSR $&sub_02A5B1
    BCS code_02A439
    BRA code_02A3BF
}

code_02A41C {
    REP #$20
    JSR $&sub_02A58B
    BCC code_02A428
    JSR $&sub_02A5B1
    BCS code_02A439
}

code_02A428 {
    LDA #$0000
    STA $0800, Y
    SEP #$20
    JSL $@func_00811E
    REP #$20
    JMP $&code_02A3AE
}

code_02A439 {
    LDA #$0000
    STA $0800, Y
    PLD 
    PLX 
    SEC 
    RTL 
}

code_02A443 {
    LDA $06AC
    STA $3E
    LDA #$007F
    STA $40
    LDX $02
    SEP #$20
    LDA $7EC000, X
    PHA 
    LDX $00
    STA $3E
    LDA [$3E]
    BEQ code_02A462
    STA $7FC000, X
}

code_02A462 {
    PLA 
    STA $7EC000, X
    REP #$20
    LDA $1A
    CLC 
    ADC #$0010
    SEC 
    SBC $068C
    CMP #$0111
    BCS code_02A4DF
    LDA $0690
    SEC 
    SBC #$0010
    AND #$FFF0
    PHA 
    LDA $1E
    SEC 
    SBC $01, S
    BMI code_02A4DE
    CMP #$00F1
    BCS code_02A4DE
    PLA 
    LDA $7EC000, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    TAX 
    LDA $7E2800, X
    STA $0802, Y
    LDA $7E2802, X
    STA $0806, Y
    LDA $7E2804, X
    STA $080A, Y
    LDA $7E2806, X
    STA $080E, Y
    JSL $@func_02B0CF
    CLC 
    ADC #$0800
    STA $0800, Y
    INC 
    STA $0804, Y
    CLC 
    ADC #$001F
    STA $0808, Y
    INC 
    STA $080C, Y
    TYA 
    CLC 
    ADC #$0010
    TAY 
    CMP #$0100
    BEQ code_02A4EF
    BRA code_02A4DF
}

code_02A4DE {
    PLA 
}

code_02A4DF {
    JSR $&sub_02A58B
    BCS code_02A4E7
    JMP $&code_02A443
}

code_02A4E7 {
    JSR $&sub_02A5B1
    BCS code_02A503
    JMP $&code_02A3BF
}

code_02A4EF {
    JSR $&sub_02A58B
    BCC code_02A4F9
    JSR $&sub_02A5B1
    BCS code_02A503
}

code_02A4F9 {
    LDA #$0000
    STA $0800, Y
    PLD 
    PLX 
    CLC 
    RTL 
}

code_02A503 {
    LDA #$0000
    STA $0800, Y
    PLD 
    PLX 
    SEC 
    RTL 
}

---------------------------------------------

sub_02A50D {
    PHP 
    REP #$20
    LDA $1A
    CLC 
    ADC #$0010
    SEC 
    SBC $068A
    CMP #$0111
    BCS code_02A588
    LDA $068E
    SEC 
    SBC #$0010
    AND #$FFF0
    PHA 
    LDA $1E
    SEC 
    SBC $01, S
    BMI code_02A587
    CMP #$00F1
    BCS code_02A587
    PLA 
    LDA $7EA000, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    TAX 
    LDA $7E2000, X
    STA $0802, Y
    LDA $7E2002, X
    STA $0806, Y
    LDA $7E2004, X
    STA $080A, Y
    LDA $7E2006, X
    STA $080E, Y
    JSL $@func_02B0CF
    STA $0800, Y
    INC 
    STA $0804, Y
    CLC 
    ADC #$001F
    STA $0808, Y
    INC 
    STA $080C, Y
    TYA 
    CLC 
    ADC #$0010
    TAY 
    CMP #$0100
    BEQ code_02A582
    PLP 
    CLC 
    RTS 
}

code_02A582 {
    PLP 
    LDX #$0000
    RTS 
}

code_02A587 {
    PLA 
}

code_02A588 {
    PLP 
    SEC 
    RTS 
}

---------------------------------------------

sub_02A58B {
    SEC 
    DEC $9E
    BNE code_02A591
    RTS 
}

code_02A591 {
    LDA $1A
    CLC 
    ADC #$0010
    STA $1A
    INC $96
    INC $9A
    JSL $@func_02B0F6
    PHX 
    LDA $00
    STA $02
    JSL $@func_02B0F6
    STX $00
    PLX 
    STX $02
    CLC 
    RTS 
}

---------------------------------------------

sub_02A5B1 {
    SEC 
    DEC $A0
    BNE code_02A5B7
    RTS 
}

code_02A5B7 {
    LDA $1E
    CLC 
    ADC #$0010
    STA $1E
    INC $98
    INC $9C
    LDX $A8
    LDA $@array_01D3CE+1, X
    AND #$00FF
    STA $96
    LDA $@array_01D3CE+5, X
    AND #$00FF
    STA $9A
    LDA $A2
    STA $9E
    CLC 
    RTS 
}

---------------------------------------------

func_02A5DD {
    PHP 
    REP #$20
    JSR $&sub_02A97B
    BCS code_02A5EA
    JSR $&sub_02A65D
    BCS code_02A5EA
}

code_02A5EA {
    NOP 
    NOP 
    NOP 
    NOP 
    PLP 
    RTL 
}

---------------------------------------------

func_02A5F0 {
    PHP 
    REP #$20
    LDY $0646
    LDX $&table_01ADA8, Y

  code_02A5F9:
    LDA $0000, X
    BIT #$0080
    BNE code_02A65B
    LDA $0003, X
    AND #$007F
    JSL $@func_00B489
    BCC code_02A655
    PHX 
    SEP #$20
    LDA $0000, X
    STA $18
    LDA $0001, X
    DEC 
    STA $1C
    STZ $19
    STZ $1D
    LDX #$0000
    JSL $@func_02B0A3
    STX $02
    STX $00
    LDA #$FE
    STA $7EA000, X
    JSL $@func_02B0F6
    LDA #$FF
    STA $7EA000, X
    LDX $00
    STX $02
    JSL $@func_02B132
    LDA #$FC
    STA $7EA000, X
    JSL $@func_02B0F6
    LDA #$FD
    STA $7EA000, X
    REP #$20
    PLX 
}

code_02A655 {
    INX 
    INX 
    INX 
    INX 
    BRA code_02A5F9
}

code_02A65B {
    PLP 
    RTL 
}

---------------------------------------------

sub_02A65D {
    LDA $06EE
    BIT #$0200
    BEQ code_02A666
    RTS 
}

code_02A666 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0004
    BNE code_02A672
    RTS 
}

code_02A672 {
    LDA $0656
    BIT #$0800
    BNE code_02A67B
    RTS 
}

code_02A67B {
    JSL $@func_03F0CA
    AND #$00FF
    CMP #$0001
    BEQ code_02A688
    RTS 
}

code_02A688 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC #$0008
    STA $18
    AND #$0008
    ASL 
    CLC 
    ADC $18
    LSR 
    LSR 
    LSR 
    LSR 
    STA $18
    LDA $0016, Y
    SEC 
    SBC #$0020
    LSR 
    LSR 
    LSR 
    LSR 
    STA $1C
    LDX #$0000
    SEP #$20
    JSL $@func_02B0A3
    LDA $7EA000, X
    STX $02
    CMP #$F8
    BEQ code_02A6D8
    CMP #$F9
    BEQ code_02A6C8

  code_02A6C5:
    REP #$20
    RTS 
}

code_02A6C8 {
    JSL $@func_02B113
    LDA $7EA000, X
    CMP #$F8
    BNE code_02A6C5
    DEC $18
    BRA code_02A6E4
}

code_02A6D8 {
    JSL $@func_02B0F6
    LDA $7EA000, X
    CMP #$F9
    BNE code_02A6C5
}

code_02A6E4 {
    LDY $0646
    LDX $&table_01ADA8, Y

  code_02A6EA:
    LDA $0000, X
    BMI code_02A700
    CMP $18
    BNE code_02A6FA
    LDA $0001, X
    CMP $1C
    BEQ code_02A70A
}

code_02A6FA {
    INX 
    INX 
    INX 
    INX 
    BRA code_02A6EA
}

code_02A700 {
    REP #$20
    LDY #$&widestring_01FF48
    JSL $@func_02F048
    RTS 
}

code_02A70A {
    REP #$20
    PHX 
    LDA #$0080
    TSB $09EC
    LDA #$00FC
    STA $06
    JSR $&sub_02A8B2
    LDA $01, S
    TAX 
    LDA $0002, X
    AND #$00FF
    BEQ code_02A73D
    JSL $@func_03EF97
    BCC code_02A753
    JSL $@func_02F048
    LDA $01, S
    TAX 
    LDA #$00F8
    STA $06
    JSR $&sub_02A8B2
    BRA code_02A7B0
}

code_02A73D {
    LDY #$&widestring_01FF36
    JSL $@func_02F048
    LDA $01, S
    TAX 
    LDA $0003, X
    AND #$007F
    JSL $@func_00B481
    BRA code_02A7B0
}

code_02A753 {
    LDA $01, S
    PHX 
    TAX 
    LDA $0003, X
    BIT #$0080
    BNE code_02A778
    LDA #$0080
    TRB $09EC
    SEP #$20
    LDA #$2A
    STA $06F9
    REP #$20
    PLX 
    LDY #$&widestring_01FF2D
    JSL $@func_02F048
    BRA code_02A7A1
}

code_02A778 {
    PLX 
    PHY 
    PHX 
    LDX #$0000
    COP [A5] ( @func_02A7B8, #00, #00, #$2000 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$0017
    STA $0026, Y
    PLX 
    PLA 
    STA $0024, Y
    LDA $0DB8
    STA $0020, Y
}

code_02A7A1 {
    LDA $01, S
    TAX 
    LDA $0003, X
    AND #$007F
    JSL $@func_00B481
    PLX 
    RTS 
}

code_02A7B0 {
    LDA #$0080
    TRB $09EC
    PLX 
    RTS 
}

---------------------------------------------

func_02A7B8 {
    LDA $06F2
    STA $7F0010, X
    COP [9C] ( @func_03E1D6, #$2000 )
    CPY #$1FC0
    BNE code_02A7CE
    JMP $&code_02A88B
}

code_02A7CE {
    TXA 
    TYX 
    TAY 
    LDA $26
    INC 
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    TXA 
    TYX 
    TAY 
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$*func_00C432
    STA $0002, Y
    LDA #$&func_00C432
    JSR $&sub_02A8A8
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_02A813
    RTL 
}

code_02A813 {
    COP [9C] ( @func_02A893, #$2000 )
    LDA $24
    STA $0024, Y
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA $20
    STA $0020, Y
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_02A83F
    RTL 
}

code_02A83F {
    LDY $player_actor
    LDA $0012, Y
    AND #$EFFF
    STA $0012, Y
    LDA #$*func_00C45A
    STA $0002, Y
    LDA #$&func_00C45A
    JSR $&sub_02A8A8
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_03E1D6, #$2000 )
    CPY #$1FC0
    BEQ code_02A88B
    PHX 
    LDA $7F0010, X
    TYX 
    STA $7F000A, X
    LDA $0012, X
    ORA #$1000
    STA $0012, X
    PLX 
    COP [C1]
    LDA $06FA
    CMP #$FFFF
    BEQ code_02A888
    RTL 
}

code_02A888 {
    COP [DA] ( #0B )
}

code_02A88B {
    LDA #$0080
    TRB $09EC
    COP [E0]
}

---------------------------------------------

func_02A893 {
    COP [DA] ( #48 )
    LDA #$1000
    TRB $12
    LDA $20
    STA $0DB8
    LDY $24
    JSL $@func_02F048
    COP [E0]
}

---------------------------------------------

sub_02A8A8 {
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    RTS 
}

---------------------------------------------

sub_02A8B2 {
    PHP 
    LDA $0000, X
    AND #$00FF
    STA $18
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1A
    LDA $0001, X
    AND #$00FF
    DEC 
    STA $1C
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1E
    SEP #$20
    LDX #$0000
    JSL $@func_02B0A3
    STX $02
    STX $00
    LDY #$0000
    LDA $06
    CLC 
    ADC #$02
    STA $7EA000, X
    JSR $&sub_02A50D
    JSL $@func_02B0F6
    LDA $06
    CLC 
    ADC #$03
    STA $7EA000, X
    REP #$20
    LDA $1A
    CLC 
    ADC #$0010
    STA $1A
    SEP #$20
    JSR $&sub_02A50D
    LDX $00
    STX $02
    JSL $@func_02B132
    LDA $06
    STA $7EA000, X
    REP #$20
    LDA $1A
    SEC 
    SBC #$0010
    STA $1A
    LDA $1E
    CLC 
    ADC #$0010
    STA $1E
    SEP #$20
    JSR $&sub_02A50D
    JSL $@func_02B0F6
    LDA $06
    INC 
    STA $7EA000, X
    REP #$20
    LDA $1A
    CLC 
    ADC #$0010
    STA $1A
    SEP #$20
    JSR $&sub_02A50D
    REP #$20
    LDA #$0000
    STA $0800, Y
    SEP #$20
    JSL $@func_00817D
    PLP 
    RTS 
}

---------------------------------------------

func_02A957 {
    REP #$20
    LDA $0646
    TAX 
    LDA $&scene_warps, X
    STA $00D4

  code_02A963:
    SEP #$20
    TAX 
    LDA $0000, X
    BMI code_02A974
    REP #$20
    TXA 
    CLC 
    ADC #$000C
    BRA code_02A963
}

code_02A974 {
    INX 
    STX $00D6
    SEP #$20
    RTL 
}

---------------------------------------------

sub_02A97B {
    SEP #$20
    LDX $00D4
    BEQ code_02A9C9

  code_02A982:
    LDA $0000, X
    CMP #$FF
    BEQ code_02A9C9
    LDA $player_x_tile
    SEC 
    SBC $0000, X
    CMP $0002, X
    BCS code_02A9A1
    LDA $player_y_tile
    SEC 
    SBC $0001, X
    CMP $0003, X
    BCC code_02A9AD
}

code_02A9A1 {
    REP #$20
    TXA 
    CLC 
    ADC #$000C
    TAX 
    SEP #$20
    BRA code_02A982
}

code_02A9AD {
    REP #$20
    JSR $&sub_02AA21
    LDA $player_x_pos
    SEC 
    SBC $00
    CMP $04
    BCS code_02A9C9
    LDA $player_y_pos
    SEC 
    SBC $02
    CMP $06
    BCS code_02A9C9
    JMP $&func_02AA5A
}

code_02A9C9 {
    SEP #$20
    LDX $00D6
    BEQ code_02AA17

  code_02A9D0:
    LDA $0000, X
    CMP #$FF
    BEQ code_02AA17
    LDA $player_x_tile
    SEC 
    SBC $0000, X
    CMP $0002, X
    BCS code_02A9EF
    LDA $player_y_tile
    SEC 
    SBC $0001, X
    CMP $0003, X
    BCC code_02A9FB
}

code_02A9EF {
    REP #$20
    TXA 
    CLC 
    ADC #$000D
    TAX 
    SEP #$20
    BRA code_02A9D0
}

code_02A9FB {
    REP #$20
    JSR $&sub_02AA21
    LDA $player_x_pos
    SEC 
    SBC $00
    CMP $04
    BCS code_02AA17
    LDA $player_y_pos
    SEC 
    SBC $02
    CMP $06
    BCS code_02AA17
    JMP $&code_02AAF2
}

code_02AA17 {
    REP #$20
    LDA #$0100
    TRB $player_flags
    CLC 
    RTS 
}

---------------------------------------------

sub_02AA21 {
    LDA $0000, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    STA $00
    LDA $0001, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    STA $02
    LDA $0002, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    SEC 
    SBC #$000F
    STA $04
    LDA $0003, X
    AND #$00FF
    ASL 
    ASL 
    ASL 
    ASL 
    SEC 
    SBC #$000F
    STA $06
    RTS 
}

---------------------------------------------

func_02AA5A {
    PHP 
    TXA 
    CLC 
    ADC #$0004
    STA $0AF4
    SEP #$20
    LDA #$^scene_warps
    STA $0AF6
    LDA $0004, X
    STA $scene_next
    LDY $0005, X
    STY $064C
    LDY $0007, X
    STY $064E
    LDA $0009, X
    STA $0650
    LDY $000A, X
    STY $0652
    LDY $scene_current
    STY $0B12
    LDA $0000, X
    STA $0B08
    LDA $0001, X
    STA $0B0C
    LDA $0002, X
    STA $0B0A
    LDA $0003, X
    STA $0B0E
    LDA $camera_offset_x+1
    AND #$0F
    STA $0B10
    LDA $camera_offset_y+1
    ASL 
    ASL 
    ASL 
    ASL 
    ORA $0B10
    STA $0B10
    LDA $camera_bounds_x+1
    AND #$0F
    STA $0B11
    LDA $camera_bounds_y+1
    ASL 
    ASL 
    ASL 
    ASL 
    ORA $0B11
    STA $0B11
    LDA $0650
    BIT #$80
    BNE code_02AADA
    PLP 
    SEC 
    RTS 
}

code_02AADA {
    AND #$7F
    STA $0650
    REP #$20
    TXA 
    CLC 
    ADC #$0004
    STA $0AF0
    LDA #$*scene_warps
    STA $0AF2
    PLP 
    SEC 
    RTS 
}

code_02AAF2 {
    LDA $player_flags
    BIT #$0100
    BEQ code_02AAFB
    RTS 
}

code_02AAFB {
    TXA 
    CLC 
    ADC #$0007
    STA $0650
    LDA #$0000
    STA $player_speed_ew
    STA $player_speed_ns
    SEP #$20
    LDY $0004, X
    STY $0652
    LDA $0006, X
    STA $06E0
    JSL $@func_03E050
    JSR $&sub_02AB25
    REP #$20
    SEC 
    RTS 
}

---------------------------------------------

sub_02AB25 {
    REP #$20
    LDA #$0100
    TSB $player_flags
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    STZ $06E2
    LDA $06E0
    PHA 
    AND #$000F
    STA $06E0
    PLA 
    BIT #$0020
    BNE code_02AB63
    BIT #$0010
    BNE code_02AB70
    BIT #$0080
    BNE code_02AB7D
    PHD 
    LDA $player_actor
    TAX 
    TCD 
    COP [99] ( @func_00EB9B )
    PLD 
    RTS 
}

code_02AB63 {
    PHD 
    LDA $player_actor
    TAX 
    TCD 
    COP [99] ( @func_00EC43 )
    PLD 
    RTS 
}

code_02AB70 {
    PHD 
    LDA $player_actor
    TAX 
    TCD 
    COP [99] ( @func_00EC97 )
    PLD 
    RTS 
}

code_02AB7D {
    PHD 
    LDA $player_actor
    TAX 
    TCD 
    COP [99] ( @func_00EBEF )
    PLD 
    RTS 
}

---------------------------------------------

func_02AB8A {
    PHP 
    REP #$20
    LDA $06BE, X
    CMP $map_bounds_x, X
    BCC code_02ABA3
    LDA $map_bounds_x, X
    DEC 
    STA $00
    LDA $06BE, X
    AND $00
    STA $06BE, X
}

code_02ABA3 {
    STA $068A, X
    AND #$FFF0
    STA $18
    LDA $06C2, X
    BMI code_02ABC3
    CMP $map_bounds_y, X
    BCC code_02ABC3
    LDA $map_bounds_y, X
    DEC 
    STA $00
    LDA $06C2, X
    AND $00
    STA $06C2, X
}

code_02ABC3 {
    STA $068E, X
    AND #$FFF0
    STA $1C
    SEP #$20
    LDA #$81
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7E
    STA $A1B0
    REP #$20
    LDA #$0020

  code_02ABE6:
    PHA 
    JSR $&sub_02ADA2
    PHX 
    LDA $06B2, X
    TAX 
    LDA $7E0000, X
    TAY 
    JSR $&sub_02AFC7
    PLX 
    LDA $18
    CLC 
    ADC #$0010
    CMP $map_bounds_x, X
    BCC code_02AC0F
    AND #$0100
    CMP $map_bounds_x, X
    BCC code_02AC0F
    SEC 
    SBC $map_bounds_x, X
}

code_02AC0F {
    STA $18
    PLA 
    DEC 
    BNE code_02ABE6
    LDA #$0000
    STA $7E3100
    STA $7E3288
    STA $7E3184
    STA $7E330C
    JSL $@func_029DE2
    PLP 
    RTL 
}

---------------------------------------------

func_02AC2E {
    PHP 
    REP #$20
    LDA $06EF
    BIT #$0008
    BEQ code_02AC47
    LDA $06BE, X
    STA $068A, X
    LDA $06C2, X
    STA $068E, X
    PLP 
    RTL 
}

code_02AC47 {
    CPX #$0000
    BEQ code_02AC62
    LDA $06EE
    BIT #$0400
    BEQ code_02AC62
    LDA $06C0
    STA $068C
    LDA $06C4
    STA $0690
    PLP 
    RTL 
}

code_02AC62 {
    LDA $068A, X
    PHA 
    LDA $06BE, X
    SEC 
    SBC $068A, X
    BPL code_02AC79
    CMP #$FFF0
    BCS code_02AC81
    LDA #$FFF0
    BRA code_02AC81
}

code_02AC79 {
    CMP #$0010
    BCC code_02AC81
    LDA #$0010
}

code_02AC81 {
    STA $06CE, X
    CLC 
    ADC $068A, X
    STA $068A, X
    EOR $01, S
    BIT #$0010
    BEQ code_02AC95
    JSR $&sub_02ACF1
}

code_02AC95 {
    PLA 
    LDA $068E, X
    PHA 
    LDA $06C2, X
    SEC 
    SBC $068E, X
    BPL code_02ACAD
    CMP #$FFF0
    BCS code_02ACB5
    LDA #$FFF0
    BRA code_02ACB5
}

code_02ACAD {
    CMP #$0010
    BCC code_02ACB5
    LDA #$0010
}

code_02ACB5 {
    STA $06D2, X
    CLC 
    ADC $068E, X
    STA $068E, X
    EOR $01, S
    BIT #$0010
    BEQ code_02ACC9
    JSR $&sub_02ACCC
}

code_02ACC9 {
    PLA 
    PLP 
    RTL 
}

---------------------------------------------

sub_02ACCC {
    LDA $068A, X
    STA $18
    LDA #$FFF0
    LDY $06D2, X
    BMI code_02ACDC
    LDA #$00E0
}

code_02ACDC {
    CLC 
    ADC $068E, X

  code_02ACE0:
    STA $1C
    CMP $map_bounds_y, X
    BCC code_02ACED
    SEC 
    SBC $map_bounds_y, X
    BRA code_02ACE0
}

code_02ACED {
    JSR $&sub_02AD0B
    RTS 
}

---------------------------------------------

sub_02ACF1 {
    LDA #$0000
    LDY $06CE, X
    BMI code_02ACFC
    LDA #$0100
}

code_02ACFC {
    CLC 
    ADC $068A, X
    STA $18
    LDA $068E, X
    STA $1C
    JSR $&sub_02ADA2
    RTS 
}

---------------------------------------------

sub_02AD0B {
    PHP 
    PHB 
    PHX 
    LDA $06AE, X
    STA $02
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    LDA $1D
    XBA 
    LDA $0693, X
    JSL $@func_0281D1
    CLC 
    ADC $19
    CLC 
    ADC $069F, X
    XBA 
    LDA $1C
    AND #$F0
    TAY 
    STY $04
    REP #$20
    JSR $&sub_02AD8D
    LDA $1C
    AND #$00F0
    ASL 
    ASL 
    CLC 
    ADC $06BA, X
    PHA 
    LDA $06B6, X
    TAX 
    LDA $18
    BIT #$0100
    BNE code_02AD5B
    PLA 
    STA $0000, X
    CLC 
    ADC #$0400
    STA $0082, X
    BRA code_02AD66
}

code_02AD5B {
    PLA 
    STA $0082, X
    CLC 
    ADC #$0400
    STA $0000, X
}

code_02AD66 {
    PHX 
    LDA #$0010
    JSR $&sub_02AEF1
    LDA $04
    CLC 
    ADC #$0100
    STA $04
    LDA $03, S
    TAX 
    LDA $04
    JSR $&sub_02AD8D
    PLA 
    CLC 
    ADC #$0082
    TAX 
    LDA #$0010
    JSR $&sub_02AEF1
    PLX 
    PLB 
    PLP 
    RTS 
}

---------------------------------------------

sub_02AD8D {
    SEC 
    SBC $069E, X
    SEC 
    SBC $069A, X
    BCS code_02AD98
    RTS 
}

code_02AD98 {
    CLC 
    ADC $069E, X
    STA $0004
    TAY 
    BRA sub_02AD8D
}

---------------------------------------------

sub_02ADA2 {
    PHP 
    PHB 
    PHX 
    LDA $map_bounds_x, X
    STA $1A
    LDA $069A, X
    STA $08
    CLC 
    ADC $069E, X
    STA $1E
    LDA $06AE, X
    STA $02
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    LDA $1D
    XBA 
    LDA $1B
    JSL $@func_0281D1
    CLC 
    ADC $19
    CLC 
    ADC $069F, X
    STA $05
    LDA $1C
    LSR 
    LSR 
    LSR 
    LSR 
    XBA 
    LDA #$10
    JSL $@func_0281D1
    STA $04
    LDA $18
    LSR 
    LSR 
    LSR 
    LSR 
    CLC 
    ADC $04
    STA $04
    REP #$20
    LDA $04
    JSR $&sub_02AD8D
    LDA $04
    STA $06
    LDA $06B2, X
    PHA 
    LDA $18
    LSR 
    LSR 
    LSR 
    AND #$003E
    BIT #$0020
    BNE code_02AE58
    CLC 
    ADC $06BA, X
    PLX 
    STA $0000, X
    INC 
    STA $0042, X
    PHX 
    LDA $1C
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$000F
    STA $10
    ASL 
    ASL 
    CLC 
    ADC $01, S
    TAX 
    LDA #$0010
    SEC 
    SBC $10
    JSR $&sub_02AF26
    PLY 
    LDA $10
    BEQ code_02AE56
    TYX 
    LDA $04
    AND #$FF0F
    CLC 
    ADC $1A
    CMP $1E
    BCC code_02AE44
    SEC 
    SBC $08
}

code_02AE44 {
    STA $04
    TAY 
    PHX 
    LDA $03, S
    TAX 
    LDA $04
    JSR $&sub_02AD8D
    PLX 
    LDA $10
    JSR $&sub_02AF26
}

code_02AE56 {
    BRA code_02AEB0
}

code_02AE58 {
    AND #$001E
    CLC 
    ADC $06BA, X
    CLC 
    ADC #$0400
    PLX 
    STA $0000, X
    CLC 
    ADC #$0001
    STA $0042, X
    PHX 
    LDA $1C
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$000F
    STA $10
    ASL 
    ASL 
    CLC 
    ADC $01, S
    TAX 
    LDA #$0010
    SEC 
    SBC $10
    JSR $&sub_02AF26
    PLY 
    LDA $10
    BEQ code_02AEB0
    TYX 
    LDA $04
    AND #$FF0F
    CLC 
    ADC $1A
    CMP $1E
    BCC code_02AE9E
    SEC 
    SBC $08
}

code_02AE9E {
    STA $04
    TAY 
    PHX 
    LDA $03, S
    TAX 
    LDA $04
    JSR $&sub_02AD8D
    PLX 
    LDA $10
    JSR $&sub_02AF26
}

code_02AEB0 {
    TXA 
    SEC 
    SBC #$0004
    TAX 
    LDA $06
    BIT #$00F0
    BNE code_02AED7
    SEC 
    SBC $1A
    CLC 
    ADC #$00F0
    STA $04
    PHX 
    LDA $03, S
    TAX 
    LDA $04
    CMP $069E, X
    BMI code_02AED4
    PLX 
    BRA code_02AEDD
}

code_02AED4 {
    PLX 
    BRA code_02AEED
}

code_02AED7 {
    SEC 
    SBC #$0010
    STA $04
}

code_02AEDD {
    PHX 
    LDA $03, S
    TAX 
    LDA $04
    JSR $&sub_02AD8D
    PLX 
    LDA #$0001
    JSR $&sub_02AF26
}

code_02AEED {
    PLX 
    PLB 
    PLP 
    RTS 
}

---------------------------------------------

sub_02AEF1 {
    LDY $04
    STA $0E

  code_02AEF5:
    LDA $0000, Y
    PHY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $02
    TAY 
    LDA $0000, Y
    STA $0002, X
    LDA $0002, Y
    STA $0004, X
    LDA $0004, Y
    STA $0042, X
    LDA $0006, Y
    STA $0044, X
    INX 
    INX 
    INX 
    INX 
    PLY 
    INY 
    DEC $0E
    BNE code_02AEF5
    RTS 
}

---------------------------------------------

sub_02AF26 {
    LDY $04
    STA $0E

  code_02AF2A:
    LDA $0000, Y
    PHY 
    AND #$00FF
    ASL 
    ASL 
    ASL 
    CLC 
    ADC $02
    TAY 
    LDA $0000, Y
    STA $0002, X
    LDA $0002, Y
    STA $0044, X
    LDA $0004, Y
    STA $0004, X
    LDA $0006, Y
    STA $0046, X
    INX 
    INX 
    INX 
    INX 
    PLA 
    CLC 
    ADC #$0010
    TAY 
    DEC $0E
    BNE code_02AF2A
    RTS 
}

---------------------------------------------

func_02AF5F {
    PHP 
    SEP #$20
    LDA #$81
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7E
    STA $A1B0
    REP #$20
    LDX $06B2
    LDA $7E0000, X
    TAY 
    BEQ code_02AF85
    JSR $&sub_02AFC7
}

code_02AF85 {
    LDX $06B4
    LDA $7E0000, X
    TAY 
    BEQ code_02AF92
    JSR $&sub_02AFC7
}

code_02AF92 {
    LDA #$0080
    STA $VMAIN
    LDX $06B6
    LDA $7E0000, X
    TAY 
    BEQ code_02AFA5
    JSR $&sub_02B000
}

code_02AFA5 {
    LDX $06B8
    LDA $7E0000, X
    TAY 
    BEQ code_02AFB2
    JSR $&sub_02B000
}

code_02AFB2 {
    LDA #$0000
    STA $7E3100
    STA $7E3288
    STA $7E3184
    STA $7E330C
    PLP 
    RTL 
}

---------------------------------------------

sub_02AFC7 {
    PHP 
    SEP #$20
    INX 
    INX 
    PHX 
    STY $VMADDL
    STX $A1T0L
    LDA #$40
    STA $DAS0L
    LDA #$01
    STA $MDMAEN
    REP #$20
    PLA 
    CLC 
    ADC #$0040
    TAX 
    LDA $7E0000, X
    TAY 
    INX 
    INX 
    SEP #$20
    STY $VMADDL
    STX $A1T0L
    LDA #$40
    STA $DAS0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

sub_02B000 {
    PHP 
    SEP #$20
    INX 
    INX 
    PHX 
    STY $VMADDL
    STX $A1T0L
    LDA #$80
    STA $DAS0L
    LDA #$01
    STA $MDMAEN
    REP #$20
    PLA 
    CLC 
    ADC #$0080
    TAX 
    LDA $7E0000, X
    STA $VMADDL
    INX 
    INX 
    SEP #$20
    STX $A1T0L
    LDA #$80
    STA $DAS0L
    LDA #$01
    STA $MDMAEN
    PLP 
    RTS 
}

---------------------------------------------

func_02B038 {
    LDA $09ED
    BPL code_02B03E
    RTL 
}

code_02B03E {
    LDA $09EC
    BIT #$31
    BNE code_02B046
    RTL 
}

code_02B046 {
    BIT #$01
    BEQ code_02B05E
    LDX #$0800
    STX $DAS0L
    LDX #$7800
    STX $VMADDL
    LDX #$0200
    STX $A1T0L
    BRA code_02B084
}

code_02B05E {
    LDA $09EC
    BIT #$20
    BNE code_02B06D
    LDX #$0140
    STX $DAS0L
    BRA code_02B078
}

code_02B06D {
    AND #$DF
    STA $09EC
    LDX #$0140
    STX $DAS0L
}

code_02B078 {
    LDX #$7840
    STX $VMADDL
    LDX #$0280
    STX $A1T0L
}

code_02B084 {
    LDA #$31
    TRB $09EC
    LDA #$80
    STA $VMAIN
    LDA #$01
    STA $DMAP0
    LDA #$18
    STA $BBAD0
    LDA #$7F
    STA $A1B0
    LDA #$01
    STA $MDMAEN
    RTL 
}

---------------------------------------------

func_02B0A3 {
    PHP 
    REP #$20
    LDA $1C
    ASL 
    ASL 
    ASL 
    ASL 
    PHA 
    SEP #$20
    LDA $0693, X
    JSL $@func_0281D1
    STA $02, S
    LDA $18
    AND #$0F
    CLC 
    ADC $01, S
    STA $01, S
    LDA $18
    LSR 
    LSR 
    LSR 
    LSR 
    CLC 
    ADC $02, S
    STA $02, S
    PLX 
    PLP 
    RTL 
}

---------------------------------------------

func_02B0CF {
    LDA $1E
    AND #$00F8
    ASL 
    ASL 
    PHA 
    LDA $1A
    AND #$00F8
    LSR 
    LSR 
    LSR 
    CLC 
    ADC $01, S
    STA $01, S
    LDA $1A
    AND #$0100
    ASL 
    ASL 
    CLC 
    ADC $01, S
    STA $01, S
    PLA 
    CLC 
    ADC #$1000
    RTL 
}

---------------------------------------------

func_02B0F6 {
    PHP 
    SEP #$20
    LDA $02
    INC 
    BIT #$0F
    BEQ code_02B106
    STA $02
    LDX $02
    PLP 
    RTL 
}

code_02B106 {
    XBA 
    LDA $03
    INC 
    XBA 
    CLC 
    ADC #$F0
    TAX 
    STX $02
    PLP 
    RTL 
}

---------------------------------------------

func_02B113 {
    PHP 
    REP #$20
    LDA $02
    SEP #$20
    DEC 
    PHA 
    AND #$0F
    CMP #$0F
    BEQ code_02B126
    PLA 
    TAX 
    PLP 
    RTL 
}

code_02B126 {
    PLA 
    XBA 
    LDA $03
    DEC 
    XBA 
    SEC 
    SBC #$F0
    TAX 
    PLP 
    RTL 
}

---------------------------------------------

func_02B132 {
    PHP 
    REP #$20
    LDA $02
    SEP #$20
    CLC 
    ADC #$10
    BCS code_02B143
    TAX 
    STX $02
    PLP 
    RTL 
}

code_02B143 {
    XBA 
    CLC 
    ADC $0693
    XBA 
    TAX 
    STX $02
    PLP 
    RTL 
}

---------------------------------------------

func_02B14E {
    PHP 
    LDA $02
    SEP #$20
    CLC 
    ADC #$10
    BCS code_02B15D
    TAX 
    STX $02
    PLP 
    RTL 
}

code_02B15D {
    XBA 
    CLC 
    ADC $0695
    XBA 
    TAX 
    STX $02
    PLP 
    RTL 
}

---------------------------------------------

sub_02B168 {
    JSR $&sub_02E1F1
    REP #$20
    LDA $1A
    CLC 
    ADC #$0008
    STA $1A
    SEP #$20
    JSR $&sub_02E2AF
    CMP #$0A
    BEQ code_02B1B5
    CMP #$05
    BEQ code_02B1B7
    CMP #$09
    BNE code_02B190
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    CMP #$0A
    BEQ code_02B1B5
}

code_02B190 {
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$0A
    BEQ code_02B1B5
    CMP #$05
    BEQ code_02B1B7
    JSR $&sub_02E263
    CMP #$0A
    BEQ code_02B1B8
    CMP #$05
    BEQ code_02B1BA
    JSR $&sub_02E285
    CMP #$0A
    BEQ code_02B1B8
    CMP #$05
    BEQ code_02B1BA
    RTS 
}

code_02B1B5 {
    CLC 
    RTS 
}

code_02B1B7 {
    RTS 
}

code_02B1B8 {
    CLC 
    RTS 
}

code_02B1BA {
    RTS 
}

---------------------------------------------

sub_02B1BB {
    JSR $&sub_02E1A9
    REP #$20
    LDA $1A
    SEC 
    SBC #$0008
    STA $1A
    SEP #$20
    JSR $&sub_02E2AF
    CMP #$0A
    BEQ code_02B209
    CMP #$05
    BEQ code_02B208
    CMP #$06
    BNE code_02B1E3
    JSR $&sub_02E32B
    JSR $&sub_02E2FC
    CMP #$05
    BEQ code_02B208
}

code_02B1E3 {
    JSR $&sub_02E313
    JSR $&sub_02E2FC
    CMP #$0A
    BEQ code_02B209
    CMP #$05
    BEQ code_02B208
    JSR $&sub_02E20D
    CMP #$0A
    BEQ code_02B20C
    CMP #$05
    BEQ code_02B20B
    JSR $&sub_02E237
    CMP #$0A
    BEQ code_02B20C
    CMP #$05
    BEQ code_02B20B
    RTS 
}

code_02B208 {
    RTS 
}

code_02B209 {
    CLC 
    RTS 
}

code_02B20B {
    RTS 
}

code_02B20C {
    CLC 
    RTS 
}