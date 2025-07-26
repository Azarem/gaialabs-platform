
---------------------------------------------

h_crF7_thinker_05FB16 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

func_05FB18 {
    COP [C1]
    JSR $&sub_05FB59
    LDA $7F000A, X
    LSR 
    BCC code_05FB2B
    COP [01] ( $7E7000, #26 )
    RTL 
}

code_05FB2B {
    COP [01] ( $7E7100, #26 )
    RTL 
}

---------------------------------------------

h_thinker_05FB32 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_05FB32 {
    JSR $&sub_05FE9A
    COP [C1]
    JSR $&sub_05FEA4
    BCS code_05FB44
    JSR $&sub_05FC92
    JSR $&sub_05FEBF
}

code_05FB44 {
    LDA $7F000A, X
    LSR 
    BCC code_05FB52
    COP [01] ( $7E7000, #26 )
    RTL 
}

code_05FB52 {
    COP [01] ( $7E7100, #26 )
    RTL 
}

---------------------------------------------

sub_05FB59 {
    PHX 
    PHD 
    PHB 
    LDA #$0000
    TCD 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    JSR $&sub_05FE2C
    BCC code_05FB70
    JMP $&code_05FC71
}

code_05FB70 {
    LDY $02
    LDA #$0001
    STA $0000, Y
    LDA $04
    STA $0001, Y
    LDA #$0000
    STA $0003, Y
    LDA $FE
    BPL code_05FB8A
    JMP $&code_05FC71
}

code_05FB8A {
    AND #$FFFE
    STA $FC
    STA $18
    STA $1A
    BIT #$FF00
    BEQ code_05FB9D
    LDA #$00FE
    STA $1A
}

code_05FB9D {
    LDA $F8
    ASL 
    SEC 
    SBC $18
    BCC code_05FBB8
    LSR 
    JSR $&sub_05FDD7
    LDA $18
    EOR #$FFFF
    INC 
    CLC 
    ADC $00
    STA $02
    LDA $18
    BRA code_05FBCA
}

code_05FBB8 {
    LDA $F8
    ASL 
    PHA 
    EOR #$FFFF
    INC 
    CLC 
    ADC $00
    STA $02
    PLA 
    CLC 
    ADC $18
    LSR 
}

code_05FBCA {
    INC 
    JSR $&sub_05FDFA
    LDA #$0001
    STA $0000, Y
    LDA $04
    STA $0001, Y
    LDA #$0000
    STA $0003, Y
    LDA #$0000
    CLC 
    BRA code_05FBE9

  code_05FBE5:
    LDA $1C
    INC 
    INC 
}

code_05FBE9 {
    STA $1C
    STA $1E
    BIT #$FF00
    BEQ code_05FBF7
    LDA #$00FE
    STA $1E
}

code_05FBF7 {
    LDA $1C
    BIT #$FE00
    BNE code_05FC27
    LDA $1C
    CLC 
    ADC $00
    TAX 
    LDA $00
    SEC 
    SBC $1C
    TAY 
    SEP #$20
    LDA $1A
    CLC 
    ADC $F4
    BCC code_05FC15
    LDA #$FF
}

code_05FC15 {
    XBA 
    LDA $F4
    SEC 
    SBC $1A
    BCS code_05FC1F
    LDA #$00
}

code_05FC1F {
    REP #$20
    STA $0000, X
    STA $0000, Y
}

code_05FC27 {
    LDA $18
    BIT #$FE00
    BNE code_05FC57
    LDA $00
    CLC 
    ADC $18
    TAX 
    LDA $00
    SEC 
    SBC $18
    TAY 
    SEP #$20
    LDA $1E
    CLC 
    ADC $F4
    BCC code_05FC45
    LDA #$FF
}

code_05FC45 {
    XBA 
    LDA $F4
    SEC 
    SBC $1E
    BCS code_05FC4F
    LDA #$00
}

code_05FC4F {
    REP #$20
    STA $0000, X
    STA $0000, Y
}

code_05FC57 {
    LDA $1C
    ASL 
    DEC 
    EOR #$FFFF
    INC 
    CLC 
    ADC $FC
    STA $FC
    BMI code_05FC75

  code_05FC66:
    LDA $18
    BMI code_05FC71
    CMP $1C
    BCC code_05FC71
    JMP $&code_05FBE5
}

code_05FC71 {
    PLB 
    PLD 
    PLX 
    RTS 
}

code_05FC75 {
    LDA $18
    DEC 
    ASL 
    CLC 
    ADC $FC
    STA $FC
    LDA $18
    DEC 
    DEC 
    STA $18
    STA $1A
    BIT #$FF00
    BEQ code_05FC66
    LDA #$00FF
    STA $1A
    BRA code_05FC66
}

---------------------------------------------

sub_05FC92 {
    PHX 
    PHD 
    PHB 
    LDA #$0000
    TCD 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    JSR $&sub_05FE2C
    BCC code_05FCA9
    JMP $&code_05FDB7
}

code_05FCA9 {
    LDY $02
    LDA #$0001
    STA $0000, Y
    LDA $04
    STA $0001, Y
    LDA #$0000
    STA $0003, Y
    LDA $FE
    BPL code_05FCC3
    JMP $&code_05FDB7
}

code_05FCC3 {
    AND #$FFFE
    STA $FC
    STA $18
    STA $1A
    BIT #$FF00
    BEQ code_05FCD6
    LDA #$00FE
    STA $1A
}

code_05FCD6 {
    LDA $F8
    BMI code_05FCF3
    SEC 
    SBC $18
    BCC code_05FCF3
    JSR $&sub_05FDD7
    LDA $18
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $00
    STA $02
    LDA $18
    ASL 
    BRA code_05FD0B
}

code_05FCF3 {
    LDA $F8
    CLC 
    ADC $FC
    BMI code_05FD0F
    LDA $F8
    PHA 
    ASL 
    EOR #$FFFF
    INC 
    CLC 
    ADC $00
    STA $02
    PLA 
    CLC 
    ADC $18
}

code_05FD0B {
    INC 
    JSR $&sub_05FDFA
}

code_05FD0F {
    LDA #$0001
    STA $0000, Y
    LDA $04
    STA $0001, Y
    LDA #$0000
    STA $0003, Y
    LDA #$0000
    CLC 
    BRA code_05FD29

  code_05FD26:
    LDA $1C
    INC 
}

code_05FD29 {
    STA $1C
    STA $1E
    BIT #$FF00
    BEQ code_05FD37
    LDA #$00FE
    STA $1E
}

code_05FD37 {
    LDA $1C
    BIT #$FF00
    BNE code_05FD6A
    LDA $1E
    ASL 
    PHA 
    CLC 
    ADC $00
    TAX 
    LDA $00
    SEC 
    SBC $01, S
    TAY 
    PLA 
    SEP #$20
    LDA $1A
    CLC 
    ADC $F4
    BCC code_05FD58
    LDA #$FF
}

code_05FD58 {
    XBA 
    LDA $F4
    SEC 
    SBC $1A
    BCS code_05FD62
    LDA #$00
}

code_05FD62 {
    REP #$20
    STA $0000, X
    STA $0000, Y
}

code_05FD6A {
    LDA $18
    BIT #$FF00
    BNE code_05FD9D
    LDA $1A
    ASL 
    PHA 
    CLC 
    ADC $00
    TAX 
    LDA $00
    SEC 
    SBC $01, S
    TAY 
    PLA 
    SEP #$20
    LDA $1E
    CLC 
    ADC $F4
    BCC code_05FD8B
    LDA #$FF
}

code_05FD8B {
    XBA 
    LDA $F4
    SEC 
    SBC $1E
    BCS code_05FD95
    LDA #$00
}

code_05FD95 {
    REP #$20
    STA $0000, X
    STA $0000, Y
}

code_05FD9D {
    LDA $1C
    ASL 
    DEC 
    EOR #$FFFF
    INC 
    CLC 
    ADC $FC
    STA $FC
    BMI code_05FDBB

  code_05FDAC:
    LDA $18
    BMI code_05FDB7
    CMP $1C
    BCC code_05FDB7
    JMP $&code_05FD26
}

code_05FDB7 {
    PLB 
    PLD 
    PLX 
    RTS 
}

code_05FDBB {
    LDA $18
    DEC 
    ASL 
    CLC 
    ADC $FC
    STA $FC
    LDA $18
    DEC 
    STA $18
    STA $1A
    BIT #$FF00
    BEQ code_05FDAC
    LDA #$00FF
    STA $1A
    BRA code_05FDAC
}

---------------------------------------------

sub_05FDD7 {
    BNE code_05FDDA
    RTS 
}

code_05FDDA {
    PHA 
    CMP #$0080
    BCC code_05FDE3
    LDA #$007F
}

code_05FDE3 {
    PHA 
    LDA $03, S
    SEC 
    SBC $01, S
    STA $03, S
    PLA 
    STA $0000, Y
    LDA $04
    STA $0001, Y
    INY 
    INY 
    INY 
    PLA 
    BRA sub_05FDD7
}

---------------------------------------------

sub_05FDFA {
    BNE code_05FDFD
    RTS 
}

code_05FDFD {
    PHA 
    CMP #$0080
    BCC code_05FE06
    LDA #$007F
}

code_05FE06 {
    PHA 
    LDA $03, S
    SEC 
    SBC $01, S
    STA $03, S
    PLA 
    ORA #$0080
    STA $0000, Y
    LDA $02
    STA $0001, Y
    LDA $0000, Y
    AND #$007F
    ASL 
    CLC 
    ADC $02
    STA $02
    INY 
    INY 
    INY 
    PLA 
    BRA sub_05FDFA
}

---------------------------------------------

sub_05FE2C {
    LDA $00FE
    CMP $00FC
    BNE code_05FE49
    LDA $00F6
    CMP $00F4
    BNE code_05FE4F
    LDA $00FA
    CMP $00F8
    BNE code_05FE47
    JMP $&code_05FE98
}

code_05FE47 {
    BRA code_05FE55
}

code_05FE49 {
    STA $00FC
    LDA $00F6
}

code_05FE4F {
    STA $00F4
    LDA $00FA
}

code_05FE55 {
    STA $00F8
    LDA $7F000A, X
    INC 
    STA $7F000A, X
    LSR 
    BCC code_05FE7E
    LDA #$7600
    STA $0000
    LDA #$7000
    STA $0002
    LDA #$00FF
    STA $7E7200
    LDA #$7200
    STA $04
    CLC 
    RTS 
}

code_05FE7E {
    LDA #$7A00
    STA $0000
    LDA #$7100
    STA $0002
    LDA #$00FF
    STA $7E7200
    LDA #$7200
    STA $04
    CLC 
    RTS 
}

code_05FE98 {
    SEC 
    RTS 
}

---------------------------------------------

sub_05FE9A {
    STZ $00F4
    STZ $00F8
    STZ $00FC
    RTS 
}

---------------------------------------------

sub_05FEA4 {
    LDA $00F4
    CMP $00F6
    BNE code_05FEBD
    LDA $00F8
    CMP $00FA
    BNE code_05FEBD
    LDA $00FC
    CMP $00FE
    BNE code_05FEBD
    RTS 
}

code_05FEBD {
    CLC 
    RTS 
}

---------------------------------------------

sub_05FEBF {
    LDA $00F6
    STA $00F4
    LDA $00FA
    STA $00F8
    LDA $00FE
    STA $00FC
    RTS 
}