?BANK 00

?INCLUDE 'chunk_00E683'

---------------------------------------------

e_actor_00E4DB {
    STZ $002A, X
    COP [A2] ( @code_00E4FC, #$2000 )
    CPY #$1FC0
    BEQ code_00E4FA
    LDA $24
    STA $0024, Y

  code_00E4EF:
    COP [C1]
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_00E4EF
}

code_00E4FA {
    COP [E0]
}

code_00E4FC {
    TXY 
    LDX $0004, Y
    LDA $7F0014, X
    TYX 
    STA $7F0014, X
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $14
    BMI code_00E53D
    STA $0018
    LDA $0016, Y
    SEC 
    SBC #$0008
    SEC 
    SBC $16
    BMI code_00E52F
    STA $001C
    CMP $0018
    BCC code_00E52D
    JMP $&code_00E5C1
}

code_00E52D {
    BRA code_00E5A6
}

code_00E52F {
    EOR #$FFFF
    INC 
    STA $001C
    CMP $0018
    BCS code_00E570
    BRA code_00E58B
}

code_00E53D {
    EOR #$FFFF
    INC 
    STA $0018
    LDA $0016, Y
    SEC 
    SBC #$0008
    SEC 
    SBC $16
    BMI code_00E55E
    STA $001C
    CMP $0018
    BCC code_00E55B
    JMP $&code_00E5DC
}

code_00E55B {
    JMP $&code_00E5F6
}

code_00E55E {
    EOR #$FFFF
    INC 
    STA $001C
    CMP $0018
    BCC code_00E56D
    JMP $&code_00E62A
}

code_00E56D {
    JMP $&code_00E610
}

code_00E570 {
    JSR $&sub_00EDA8
    COP [C1]
    JSR $&sub_00EE1C
    LDA $16
    SEC 
    SBC $0000
    STA $16
    LDA $14
    CLC 
    ADC $0002
    STA $14
    JMP $&code_00E644
}

code_00E58B {
    JSR $&code_00EDC3
    COP [C1]
    JSR $&sub_00EE1C
    LDA $14
    CLC 
    ADC $0000
    STA $14
    LDA $16
    SEC 
    SBC $0002
    STA $16
    JMP $&code_00E644
}

code_00E5A6 {
    JSR $&code_00EDC3
    COP [C1]
    JSR $&sub_00EE1C
    LDA $14
    CLC 
    ADC $0000
    STA $14
    LDA $16
    CLC 
    ADC $0002
    STA $16
    JMP $&code_00E644
}

code_00E5C1 {
    JSR $&sub_00EDA8
    COP [C1]
    JSR $&sub_00EE1C
    LDA $16
    CLC 
    ADC $0000
    STA $16
    LDA $14
    CLC 
    ADC $0002
    STA $14
    JMP $&code_00E644
}

code_00E5DC {
    JSR $&sub_00EDA8
    COP [C1]
    JSR $&sub_00EE1C
    LDA $16
    CLC 
    ADC $0000
    STA $16
    LDA $14
    SEC 
    SBC $0002
    STA $14
    BRA code_00E644
}

code_00E5F6 {
    JSR $&code_00EDC3
    COP [C1]
    JSR $&sub_00EE1C
    LDA $14
    SEC 
    SBC $0000
    STA $14
    LDA $16
    CLC 
    ADC $0002
    STA $16
    BRA code_00E644
}

code_00E610 {
    JSR $&code_00EDC3
    COP [C1]
    JSR $&sub_00EE1C
    LDA $14
    SEC 
    SBC $0000
    STA $14
    LDA $16
    SEC 
    SBC $0002
    STA $16
    BRA code_00E644
}

code_00E62A {
    JSR $&sub_00EDA8
    COP [C1]
    JSR $&sub_00EE1C
    LDA $16
    SEC 
    SBC $0000
    STA $16
    LDA $14
    SEC 
    SBC $0002
    STA $14
    BRA code_00E644
}

code_00E644 {
    LDA $0004, X
    TAY 
    LDA $0014, X
    STA $0014, Y
    LDA $0016, X
    STA $0016, Y
    RTL 
}