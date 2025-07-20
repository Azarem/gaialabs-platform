?INCLUDE 'chunk_028000'


---------------------------------------------

func_09BB17 {
    PHX 
    PHD 
    PHB 
    PHP 
    REP #$20
    LDA #$0000
    TCD 
    LDA #$0100
    STA $3E
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    LDA #$7F
    STA $40
    LDA $06BF
    SEC 
    SBC $06C1
    STA $18
    LDA $06C3
    SEC 
    SBC $06C5
    STA $1C
    STZ $19
    STZ $1D

  code_09BB46:
    LDA $19
    CLC 
    ADC $18
    BMI code_09BB89
    CMP $0693
    BCS code_09BB93
    LDA $1D
    CLC 
    ADC $1C
    BMI code_09BB93
    CMP $0697
    BCS code_09BB9F
    LDA $1D
    XBA 
    LDA $0695
    JSL $@func_0281D1
    CLC 
    ADC $19
    XBA 
    LDA #$00
    TAY 
    LDA $1D
    CLC 
    ADC $1C
    XBA 
    LDA $0693
    JSL $@func_0281D1
    CLC 
    ADC $19
    CLC 
    ADC $18
    XBA 
    LDA #$00
    TAX 
    JSR $&sub_09BBA4
}

code_09BB89 {
    LDA $19
    INC 
    STA $19
    CMP $0695
    BCC code_09BB46
}

code_09BB93 {
    STZ $19
    LDA $1D
    INC 
    STA $1D
    CMP $0699
    BCC code_09BB46
}

code_09BB9F {
    PLP 
    PLB 
    PLD 
    PLX 
    RTL 
}

---------------------------------------------

sub_09BBA4 {
    LDA $C000, Y
    BEQ code_09BBB1
    STA $3E
    LDA [$3E]
    STA $7FC000, X
}

code_09BBB1 {
    INY 
    INX 
    TXA 
    BNE sub_09BBA4
    RTS 
}