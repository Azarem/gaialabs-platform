?BANK 03

?INCLUDE 'binary_01C384'

!M7SEL                          211A
!WRDIVL                         4204
!WRDIVB                         4206
!RDDIVL                         4214

---------------------------------------------

h_sFE_proc_03A940 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_sFE_proc_03A940 {
    SEP #$20
    LDA #$80
    STA $M7SEL
    REP #$20
    LDA #$FFFF
    STA $7F0B22
    LDA #$FFFF
    STA $7F0B24
    LDA $0D54
    STA $00CA
    SEC 
    SBC #$0080
    ORA #$8000
    STA $06C6
    LDA $0D56
    STA $00CC
    SEC 
    SBC #$0070
    ORA #$8000
    STA $06CA
    STZ $00B6
    STZ $00BC
    LDA #$0400
    STA $00B8
}

code_03A985 {
    PHX 
    PHD 
    LDA #$0000
    TCD 
    SEP #$20
    LDX #$0000
    LDA #$E0
    STA $0E

  code_03A994:
    LDA #$01
    STA $7E7000, X
    STA $7E7800, X
    STA $7E8000, X
    INX 
    INX 
    INX 
    DEC $0E
    BNE code_03A994
    LDA #$00
    STA $7E7000, X
    STA $7E7800, X
    STA $7E8000, X
    REP #$20
    PLD 
    PLX 
    COP [C1]
    PHX 
    PHD 
    LDA #$0000
    TCD 
    LDA $B8
    STZ $00
    STA $02
    LDA $B6
    STA $04
    LDA #$00E0
    STA $0E
    LDA $BC
    AND #$01FF
    ASL 
    TAY 
    LDX #$0000
    PEA $&code_03AA12-1
    LDA $&binary_01C695, Y
    BMI code_03A9F9
    STA $18
    LDA $&binary_01C595, Y
    BMI code_03A9F0
    STA $1C
    JMP $&code_03AA2D
}

code_03A9F0 {
    EOR #$FFFF
    INC 
    STA $1C
    JMP $&code_03AA7E
}

code_03A9F9 {
    EOR #$FFFF
    INC 
    STA $18
    LDA $&binary_01C595, Y
    BMI code_03AA09
    STA $1C
    JMP $&code_03AACF
}

code_03AA09 {
    EOR #$FFFF
    INC 
    STA $1C
    JMP $&code_03AB22
}

code_03AA12 {
    PLD 
    PLX 
    COP [02] ( $7E7000, #1B )
    COP [02] ( $7E7800, #1C )
    COP [02] ( $7E8000, #1D )
    COP [02] ( $7E7000, #1E )
    RTL 
}

code_03AA2D {
    JSR $&sub_03AB75

  code_03AA30:
    LDY $02
    LDA $18
    STA $WRDIVL
    STY $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    INX 
    INX 
    LDA $RDDIVL
    STA $7E6FFF, X
    LDA $1C
    STA $WRDIVL
    STY $WRDIVB
    INX 
    LDA $04
    CLC 
    ADC $01
    STA $01
    LDA $RDDIVL
    STA $7E77FE, X
    EOR #$FFFF
    INC 
    STA $7E7FFE, X
    BCS code_03AA6F
    DEC $0E
    BNE code_03AA30
    RTS 
}

code_03AA6F {
    INC $03
    LSR $18
    LSR $1C
    LSR $02
    LSR $04
    DEC $0E
    BNE code_03AA30
    RTS 
}

code_03AA7E {
    JSR $&sub_03AB75

  code_03AA81:
    LDY $02
    LDA $18
    STA $WRDIVL
    STY $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    INX 
    INX 
    LDA $RDDIVL
    STA $7E6FFF, X
    LDA $1C
    STA $WRDIVL
    STY $WRDIVB
    INX 
    LDA $04
    CLC 
    ADC $01
    STA $01
    LDA $RDDIVL
    STA $7E7FFE, X
    EOR #$FFFF
    INC 
    STA $7E77FE, X
    BCS code_03AAC0
    DEC $0E
    BNE code_03AA81
    RTS 
}

code_03AAC0 {
    INC $03
    LSR $18
    LSR $1C
    LSR $02
    LSR $04
    DEC $0E
    BNE code_03AA81
    RTS 
}

code_03AACF {
    JSR $&sub_03AB75

  code_03AAD2:
    LDY $02
    LDA $18
    STA $WRDIVL
    STY $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    INX 
    INX 
    LDA #$0000
    SEC 
    SBC $RDDIVL
    STA $7E6FFF, X
    LDA $1C
    STA $WRDIVL
    STY $WRDIVB
    INX 
    LDA $04
    CLC 
    ADC $01
    STA $01
    LDA $RDDIVL
    STA $7E77FE, X
    EOR #$FFFF
    INC 
    STA $7E7FFE, X
    BCS code_03AB13
    DEC $0E
    BNE code_03AAD2
    RTS 
}

code_03AB13 {
    INC $03
    LSR $18
    LSR $1C
    LSR $02
    LSR $04
    DEC $0E
    BNE code_03AAD2
    RTS 
}

code_03AB22 {
    JSR $&sub_03AB75

  code_03AB25:
    LDY $02
    LDA $18
    STA $WRDIVL
    STY $WRDIVB
    NOP 
    NOP 
    NOP 
    NOP 
    INX 
    INX 
    LDA #$0000
    SEC 
    SBC $RDDIVL
    STA $7E6FFF, X
    LDA $1C
    STA $WRDIVL
    STY $WRDIVB
    INX 
    LDA $04
    CLC 
    ADC $01
    STA $01
    LDA $RDDIVL
    STA $7E7FFE, X
    EOR #$FFFF
    INC 
    STA $7E77FE, X
    BCS code_03AB66
    DEC $0E
    BNE code_03AB25
    RTS 
}

code_03AB66 {
    INC $03
    LSR $18
    LSR $1C
    LSR $02
    LSR $04
    DEC $0E
    BNE code_03AB25
    RTS 
}

---------------------------------------------

sub_03AB75 {
    LDA $02
    BIT #$FF00
    BNE code_03AB7D
    RTS 
}

code_03AB7D {
    LSR 
    STA $02
    LSR $18
    LSR $1C
    LSR $04
    BRA sub_03AB75
}