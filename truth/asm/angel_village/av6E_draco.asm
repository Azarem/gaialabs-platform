
?INCLUDE 'func_0AA41C'
?INCLUDE 'func_00DB8A'
?INCLUDE 'table_0EE000'

!player_x_pos                   09A2
!player_actor                   09AA

---------------------------------------------

h_av6E_draco [
  h_actor < #15, #02, #00 >   ;00
]

---------------------------------------------

e_av6E_draco {
    COP [0B]
    LDA #$0001
    TSB $12
    COP [57] ( @code_0AF06B )
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    COP [9C] ( @code_0AF032, #$0301 )
    LDA #$0003
    STA $24

  code_0AEF5A:
    COP [9C] ( @code_0AEFF0, #$0202 )
    DEC $24
    BPL code_0AEF5A
    COP [5B] ( #$0020 )

  code_0AEF69:
    COP [80] ( #12 )
    COP [89]
    COP [C1]
    COP [21] ( #04, &code_0AEF76 )
    RTL 
}

code_0AEF76 {
    LDA #$0002
    TSB $12
    COP [2A] ( #$0000, &code_0AEF87, &code_0AEF87, &code_0AEF85 )
}

code_0AEF85 {
    COP [BB]
}

code_0AEF87 {
    COP [80] ( #16 )
    COP [89]
    JSR $&sub_0AFD26
    COP [C8] ( &code_0AEFC0 )
    JSR $&sub_0AFD26
    COP [C8] ( &code_0AEFC0 )
    COP [21] ( #04, &code_0AEFA1 )
    BRA code_0AEF69
}

code_0AEFA1 {
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [C8] ( &code_0AEFBA )
    COP [BA]
    BRA code_0AEF69
}

code_0AEFBA {
    COP [22] ( #13, #04 )
    BRA code_0AEFC4
}

code_0AEFC0 {
    COP [22] ( #13, #02 )
}

code_0AEFC4 {
    COP [84] ( #17, #02 )
    COP [8A]

  code_0AEFCA:
    LDA $7F100C, X
    STA $7F0018, X
    LDA $7F100E, X
    STA $7F001A, X
    COP [22] ( #12, #03 )
    LDA $7F100C, X
    CMP $14
    BNE code_0AEFCA
    LDA $7F100E, X
    CMP $16
    BNE code_0AEFCA
    COP [C5]
}

code_0AEFF0 {
    COP [80] ( #14 )
    COP [89]
    LDA $0E
    STA $26

  code_0AEFF9:
    COP [C1]
    JSL $@func_0AA41C
    LDY $24
    LDA $000E, Y
    STA $0E
    LDA $0010, Y
    BIT #$0080
    BNE code_0AF00F
    RTL 
}

code_0AF00F {
    COP [C1]
    JSL $@func_0AA41C
    LDY $24
    LDA $0010, Y
    BIT #$0080
    BEQ code_0AEFF9
    LDA $0036
    LSR 
    BCC code_0AF02D
    LDA $26
    ORA #$0200
    STA $0E
    RTL 
}

code_0AF02D {
    LDA $26
    STA $0E
    RTL 
}

code_0AF032 {
    COP [80] ( #15 )
    COP [89]
    LDA $0E
    STA $26

  code_0AF03B:
    LDA $26
    STA $0E
    COP [C1]
    LDY $24
    LDA $0010, Y
    BIT #$0080
    BNE code_0AF04C
    RTL 
}

code_0AF04C {
    COP [C1]
    LDY $24
    LDA $0010, Y
    BIT #$0080
    BEQ code_0AF03B
    LDA $0036
    LSR 
    BCC code_0AF066
    LDA $26
    ORA #$0200
    STA $0E
    RTL 
}

code_0AF066 {
    LDA $26
    STA $0E
    RTL 
}

code_0AF06B {
    LDA #$0004
    STA $000E
    LDY $06
    LDA #$0004
    STA $0000

  code_0AF079:
    LDA #$&loc_0AF0B4
    STA $0000, Y
    LDA $0000
    STA $0008, Y
    CLC 
    ADC #$0008
    STA $0000
    LDA $0006, Y
    TAY 
    DEC $000E
    BPL code_0AF079
    LDA $14
    PHA 
    LDA $16
    PHA 
    LDA $7F100C, X
    STA $14
    LDA $7F100E, X
    STA $16
    COP [0C]
    PLA 
    STA $16
    PLA 
    STA $14
    COP [C7] ( @func_00DB8A )

  loc_0AF0B4:
    LDA $26
    STA $0E
    COP [07] ( #06 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0AFD26 {
    LDY $player_actor
    LDA $16
    SEC 
    SBC $0016, Y
    BPL code_0AFD35
    SEC 
    ROR 
    BRA code_0AFD36
}

code_0AFD35 {
    LSR 
}

code_0AFD36 {
    CLC 
    ADC $16
    STA $7F001A, X
    COP [23]
    AND #$001F
    PHA 
    LDA $14
    CMP $player_x_pos
    BPL code_0AFD51
    PLA 
    EOR #$FFFF
    INC 
    BRA code_0AFD52
}

code_0AFD51 {
    PLA 
}

code_0AFD52 {
    CLC 
    ADC $14
    STA $7F0018, X
    RTS 
}