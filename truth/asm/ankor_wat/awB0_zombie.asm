
?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_0AA41C'
?INCLUDE 'func_00DF15'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_awB0_zombie [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_awB0_zombie {
    LDA #$0020
    TSB $12
    LDA $&stats_01ABF0+120
    AND #$00FF
    STA $7F0010, X
    BRA code_0BB2A8
}

---------------------------------------------

func_0BB289 {
    LDA #$00FF
    STA $7F0026, X
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BB2A0 )
}

code_list_0BB2A0 [
  &code_0BB2C8   ;00
  &code_0BB315   ;01
  &code_0BB3B6   ;02
  &code_0BB36C   ;03
]

code_0BB2A8 {
    LDA #$00FF
    STA $7F0026, X
    COP [C6] ( &code_0BB2A8 )
    COP [C2]
    COP [27] ( #11 )
    COP [2C] ( &code_0BB2BE, &code_0BB362 )
}

code_0BB2BE {
    COP [2A] ( #$0000, &code_0BB2C8, &code_0BB2C8, &code_0BB315 )
}

code_0BB2C8 {
    COP [CA] ( #02 )
    COP [17] ( &func_0BB289 )
    COP [21] ( #03, &code_0BB2EB )
    COP [81] ( #24, #02 )
    COP [89]
    COP [17] ( &func_0BB289 )
    COP [21] ( #03, &code_0BB2F7 )
    COP [81] ( #2A, #02 )
    COP [89]
    COP [CB]
}

code_0BB2EB {
    COP [17] ( &func_0BB289 )
    COP [81] ( #24, #02 )
    COP [89]
    BRA code_0BB301
}

code_0BB2F7 {
    COP [17] ( &func_0BB289 )
    COP [81] ( #2A, #02 )
    COP [89]
}

code_0BB301 {
    COP [80] ( #21 )
    COP [89]
    COP [35]
    CMP #$0001
    BEQ code_0BB310
    JMP $&code_0BB400
}

code_0BB310 {
    COP [DA] ( #0F )
    COP [C5]
}

code_0BB315 {
    COP [CA] ( #02 )
    COP [21] ( #03, &code_0BB338 )
    COP [18] ( &func_0BB289 )
    COP [81] ( #A4, #01 )
    COP [89]
    COP [21] ( #03, &code_0BB344 )
    COP [18] ( &func_0BB289 )
    COP [81] ( #AA, #01 )
    COP [89]
    COP [CB]
}

code_0BB338 {
    COP [18] ( &func_0BB289 )
    COP [81] ( #A4, #01 )
    COP [89]
    BRA code_0BB34E
}

code_0BB344 {
    COP [18] ( &func_0BB289 )
    COP [81] ( #AA, #01 )
    COP [89]
}

code_0BB34E {
    COP [80] ( #A1 )
    COP [89]
    COP [35]
    CMP #$0003
    BEQ code_0BB35D
    JMP $&code_0BB400
}

code_0BB35D {
    COP [DA] ( #0F )
    COP [C5]
}

code_0BB362 {
    COP [2B] ( #$0000, &code_0BB36C, &code_0BB36C, &code_0BB3B6 )
}

code_0BB36C {
    COP [CA] ( #02 )
    COP [21] ( #03, &code_0BB38F )
    COP [15] ( &func_0BB289 )
    COP [82] ( #23, #02 )
    COP [89]
    COP [21] ( #03, &code_0BB39B )
    COP [15] ( &func_0BB289 )
    COP [82] ( #29, #02 )
    COP [89]
    COP [CB]
}

code_0BB38F {
    COP [15] ( &func_0BB289 )
    COP [82] ( #23, #02 )
    COP [89]
    BRA code_0BB3A5
}

code_0BB39B {
    COP [15] ( &func_0BB289 )
    COP [82] ( #29, #02 )
    COP [89]
}

code_0BB3A5 {
    COP [80] ( #20 )
    COP [89]
    COP [35]
    CMP #$0002
    BNE code_0BB400
    COP [DA] ( #0F )
    COP [C5]
}

code_0BB3B6 {
    COP [CA] ( #02 )
    COP [21] ( #03, &code_0BB3D9 )
    COP [16] ( &func_0BB289 )
    COP [82] ( #22, #01 )
    COP [89]
    COP [21] ( #03, &code_0BB3E5 )
    COP [16] ( &func_0BB289 )
    COP [82] ( #28, #01 )
    COP [89]
    COP [CB]
}

code_0BB3D9 {
    COP [16] ( &func_0BB289 )
    COP [82] ( #22, #01 )
    COP [89]
    BRA code_0BB3EF
}

code_0BB3E5 {
    COP [16] ( &func_0BB289 )
    COP [82] ( #28, #01 )
    COP [89]
}

code_0BB3EF {
    COP [80] ( #1F )
    COP [89]
    COP [35]
    CMP #$0000
    BNE code_0BB400
    COP [DA] ( #0F )
    COP [C5]
}

code_0BB400 {
    AND #$0003
    STA $26
    COP [21] ( #05, &code_0BB40C )
    COP [C5]
}

code_0BB40C {
    LDA $26
    STA $0000
    COP [D9] ( #$0000, &code_list_0BB417 )
}

code_list_0BB417 [
  &code_0BB41F   ;00
  &code_0BB4E9   ;01
  &code_0BB47A   ;02
  &code_0BB558   ;03
]

code_0BB41F {
    COP [80] ( #26 )
    COP [89]
    COP [A4] ( @code_0BB74F, #00, #D0, #$2002 )
    COP [A4] ( @code_0BB6BD, #00, #D2, #$2202 )
    COP [A4] ( @code_0BB6BD, #00, #DA, #$2202 )
    COP [A4] ( @code_0BB6BD, #00, #E0, #$2202 )
    COP [A4] ( @func_0BB68E, #00, #E6, #$2202 )
    LDA #$FFFF
    STA $26
    COP [C2]
    COP [80] ( #10 )
    COP [89]
    LDA $26
    BPL code_0BB462
    RTL 
}

code_0BB462 {
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    LDA $26
    BEQ code_0BB473
    JMP $&code_0BB5C4
}

code_0BB473 {
    COP [80] ( #20 )
    COP [89]
    COP [C5]
}

code_0BB47A {
    COP [80] ( #25 )
    COP [89]
    COP [A1] ( @code_0BB73D, #$2002 )
    LDA #$FFD0
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFD2
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFDA
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFE0
    JSR $&sub_0BB686
    COP [A1] ( @func_0BB68E, #$2202 )
    LDA #$FFE6
    JSR $&sub_0BB686
    LDA #$FFFF
    STA $26
    COP [C2]
    COP [80] ( #0F )
    COP [89]
    LDA $26
    BPL code_0BB4D1
    RTL 
}

code_0BB4D1 {
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    LDA $26
    BEQ code_0BB4E2
    JMP $&code_0BB5C4
}

code_0BB4E2 {
    COP [80] ( #1F )
    COP [89]
    COP [C5]
}

code_0BB4E9 {
    COP [80] ( #A7 )
    COP [89]
    COP [A1] ( @code_0BB6CC, #$2002 )
    LDA #$FFD8
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFD2
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFDA
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFE0
    JSR $&sub_0BB686
    COP [A1] ( @func_0BB68E, #$2202 )
    LDA #$FFE6
    JSR $&sub_0BB686
    LDA #$FFFF
    STA $26
    COP [C2]
    COP [80] ( #91 )
    COP [89]
    LDA $26
    BPL code_0BB540
    RTL 
}

code_0BB540 {
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    LDA $26
    BEQ code_0BB551
    JMP $&code_0BB5C4
}

code_0BB551 {
    COP [80] ( #A1 )
    COP [89]
    COP [C5]
}

code_0BB558 {
    COP [80] ( #27 )
    COP [89]
    COP [A1] ( @code_0BB6DC, #$2002 )
    LDA #$FFD8
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFD2
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFDA
    JSR $&sub_0BB686
    COP [A1] ( @code_0BB6BD, #$2202 )
    LDA #$FFE0
    JSR $&sub_0BB686
    COP [A1] ( @func_0BB68E, #$2202 )
    LDA #$FFE6
    JSR $&sub_0BB686
    LDA #$FFFF
    STA $26
    COP [C2]
    COP [80] ( #11 )
    COP [89]
    LDA $26
    BPL code_0BB5AF
    RTL 
}

code_0BB5AF {
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    COP [A8]
    LDA $26
    BNE code_0BB5C4
    COP [80] ( #21 )
    COP [89]
    COP [C5]
}

code_0BB5C4 {
    LDA #$&stats_01ABF0+11C
    STA $7F0020, X
    LDA $&stats_01ABF0+11C
    AND #$00FF
    STA $7F0026, X
    LDA #$0020
    TRB $12
    COP [80] ( #2B )
    COP [89]

  code_0BB5DF:
    COP [C6] ( &code_0BB5DF )
    COP [C2]
    COP [21] ( #07, &code_0BB600 )
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BB5F8 )
}

code_list_0BB5F8 [
  &code_0BB610   ;00
  &code_0BB62B   ;01
  &code_0BB650   ;02
  &code_0BB66B   ;03
]

code_0BB600 {
    COP [2C] ( &code_0BB606, &code_0BB646 )
}

code_0BB606 {
    COP [2A] ( #$0000, &code_0BB610, &code_0BB610, &code_0BB62B )
}

code_0BB610 {
    COP [CA] ( #03 )
    COP [17] ( &code_0BB5DF )
    COP [81] ( #14, #04 )
    COP [89]
    COP [17] ( &code_0BB5DF )
    COP [81] ( #17, #04 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0BB62B {
    COP [CA] ( #03 )
    COP [18] ( &code_0BB5DF )
    COP [81] ( #94, #03 )
    COP [89]
    COP [18] ( &code_0BB5DF )
    COP [81] ( #97, #03 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0BB646 {
    COP [2B] ( #$0000, &code_0BB650, &code_0BB650, &code_0BB66B )
}

code_0BB650 {
    COP [CA] ( #07 )
    COP [15] ( &code_0BB5DF )
    COP [82] ( #13, #04 )
    COP [89]
    COP [15] ( &code_0BB5DF )
    COP [82] ( #16, #04 )
    COP [89]
    COP [CB]
    COP [C5]
}

code_0BB66B {
    COP [CA] ( #07 )
    COP [16] ( &code_0BB5DF )
    COP [82] ( #12, #03 )
    COP [89]
    COP [16] ( &code_0BB5DF )
    COP [82] ( #15, #03 )
    COP [89]
    COP [CB]
    COP [C5]
}

---------------------------------------------

sub_0BB686 {
    CLC 
    ADC $0016, Y
    STA $0016, Y
    RTS 
}

---------------------------------------------

func_0BB68E {
    LDY $24
    LDA $14
    SEC 
    SBC $0014, Y
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $0016, Y
    STA $7F100E, X
    COP [C1]
    LDY $24
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $16
    RTL 
}

code_0BB6BD {
    LDA #$2000
    TRB $10
    COP [8D] ( #1E )
    COP [C1]
    JSL $@func_0AA41C
    RTL 
}

code_0BB6CC {
    COP [8D] ( #9D )
    LDA #$0002
    TSB $12
    LDA $14
    CLC 
    ADC #$0040
    BRA code_0BB6E5
}

code_0BB6DC {
    COP [8D] ( #1D )
    LDA $14
    CLC 
    ADC #$FFC0
}

code_0BB6E5 {
    STA $7F0018, X
    LDA $24
    STA $26
    PHX 
    TAX 
    LDA $7F0010, X
    PLX 
    STA $7F0026, X
    LDA #$&stats_01ABF0+120
    STA $7F0020, X
    LDA #$FFD8
    STA $7F100E, X
    LDA #$0000
    STA $7F100C, X
    LDA $16
    CLC 
    ADC #$0018
    STA $16
    LDA #$2000
    TRB $10
    COP [2B] ( #$0020, &code_0BB72D, &code_0BB724, &code_0BB72D )
}

code_0BB724 {
    LDA $player_y_pos
    CLC 
    ADC #$0008
    BRA code_0BB72F
}

code_0BB72D {
    LDA $16
}

code_0BB72F {
    STA $7F001A, X
    LDA $16
    CLC 
    ADC #$FFE8
    STA $16
    BRA code_0BB79E
}

code_0BB73D {
    COP [8D] ( #19 )
    LDA #$FFD8
    STA $7F100E, X
    LDA $16
    CLC 
    ADC #$0050
    BRA code_0BB75F
}

code_0BB74F {
    COP [8D] ( #1B )
    LDA #$FFD0
    STA $7F100E, X
    LDA $16
    CLC 
    ADC #$FFD0
}

code_0BB75F {
    STA $7F001A, X
    LDA $24
    STA $26
    PHX 
    TAX 
    LDA $7F0010, X
    PLX 
    STA $7F0026, X
    LDA #$&stats_01ABF0+120
    STA $7F0020, X
    LDA #$0000
    STA $7F100C, X
    LDA #$2000
    TRB $10
    COP [2A] ( #$0020, &code_0BB798, &code_0BB78F, &code_0BB798 )
}

code_0BB78F {
    LDA $player_x_pos
    CLC 
    ADC #$0008
    BRA code_0BB79A
}

code_0BB798 {
    LDA $14
}

code_0BB79A {
    STA $7F0018, X
}

code_0BB79E {
    COP [57] ( @code_0BB800 )
    COP [22] ( #FF, #02 )
    DEC $28
    LDY $26

  code_0BB7AB:
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $7F0018, X
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $7F001A, X
    COP [22] ( #FF, #02 )
    LDY $26
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    SEC 
    SBC $14
    BPL code_0BB7DA
    EOR #$FFFF
    INC 
}

code_0BB7DA {
    CMP #$0002
    BCS code_0BB7AB
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    SEC 
    SBC $16
    BPL code_0BB7F0
    EOR #$FFFF
    INC 
}

code_0BB7F0 {
    CMP #$0002
    BCS code_0BB7AB
    LDY $26
    LDA #$0000
    STA $0026, Y
    COP [C1]
    RTL 
}

code_0BB800 {
    LDY $26
    LDA #$0001
    STA $0026, Y
    COP [07] ( #06 )
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [C1]
    RTL 
}