
---------------------------------------------

e_pr_actor_0BCF52 {
    PHB 
    PHX 
    SEP #$20
    LDY $24
    LDA $0002, Y
    PHA 
    PLB 
    LDX #$0000
    LDY $26

  code_0BCF62:
    LDA $0000, Y
    CMP #$CA
    BEQ code_0BCF6D
    INX 
    INY 
    BRA code_0BCF62
}

code_0BCF6D {
    REP #$20
    TXA 
    AND #$FFFE
    SEC 
    SBC #$0020
    EOR #$FFFF
    INC 
    AND #$FFFE
    ASL 
    ASL 
    PLX 
    STA $14
    LDA #$0038
    STA $16
    LDA #$2300
    STA $0E
    BRA code_0BCFB3
}

code_0BCF8F {
    PHB 
    LDA #$0000
    STA $7F0BE0
    STA $7F0BE2
    STA $7F0BE4
    STA $7F0BE6
    LDA #$2F00
    STA $0E
    SEP #$20
    LDY $24
    LDA $0002, Y
    PHA 
    PLB 
    REP #$20
}

code_0BCFB3 {
    LDY $26
    STZ $00DA
    LDA $14
    STA $18
    STA $26
    LDA $16
    STA $1A
    SEP #$20
    STA $27
    REP #$20
    PHX 
    LDX #$0000
    SEP #$20

  code_0BCFCE:
    LDA $0000, Y
    INY 
    CMP #$C0
    BCS code_0BD00B
    CMP #$57
    BEQ code_0BCFFD
    REP #$20
    AND #$00FF
    ASL 
    ORA $0E
    STA $7F0602, X
    LDA $26
    STA $7F0600, X
    CLC 
    ADC #$0008
    STA $26
    INC $00DA
    INX 
    INX 
    INX 
    INX 
    SEP #$20
    BRA code_0BCFCE
}

code_0BCFFD {
    REP #$20
    LDA $26
    CLC 
    ADC #$0008
    STA $26
    SEP #$20
    BRA code_0BCFCE
}

code_0BD00B {
    CMP #$CA
    BEQ code_0BD025
    CMP #$CB
    BEQ code_0BD016
    NOP 
    BRA code_0BD00B
}

code_0BD016 {
    LDA $18
    STA $26
    LDA $1A
    CLC 
    ADC #$10
    STA $27
    STA $1A
    BRA code_0BCFCE
}

code_0BD025 {
    PLX 
    REP #$20
    PLB 
    ASL $00DA
    ASL $00DA
    COP [E0]
}