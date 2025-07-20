?INCLUDE 'binary_01C384'


---------------------------------------------

h_ir21_whirligig [
  h_actor < #1B, #00, #00 >   ;00
]

---------------------------------------------

e_ir21_whirligig {
    COP [5B] ( #$0020 )
    COP [BC] ( #08, #08 )
    COP [27] ( #10 )
    COP [C1]
    COP [21] ( #06, &code_0A98D2 )
    RTL 
}

code_0A98D2 {
    COP [86] ( #1B, #40, #14 )
    COP [8A]
    COP [B2]
    COP [A2] ( @code_0A98E9, #$2300 )

  code_0A98E2:
    COP [80] ( #1C )
    COP [89]
    BRA code_0A98E2
}

code_0A98E9 {
    LDA #$0000
    STA $7F000A, X
    LDA $16
    SEC 
    SBC #$0040
    STA $16
    LDY $04
    LDA $0014, Y
    STA $7F0010, X
    LDA $0016, Y
    STA $7F0012, X
    COP [C2]
    PHX 
    LDX $04
    TXY 
    LDA $7F0028, X
    BEQ code_0A991A
    BMI code_0A991A
    PLX 
    JMP $&code_0A99C2
}

code_0A991A {
    PLX 
    LDA $7F0010, X
    SEC 
    SBC $0014, Y
    EOR #$FFFF
    INC 
    CLC 
    ADC $14
    STA $14
    LDA $7F0012, X
    SEC 
    SBC $0016, Y
    EOR #$FFFF
    INC 
    CLC 
    ADC $16
    STA $16
    COP [2A] ( #$0028, &code_0A9947, &code_0A994D, &code_0A994B )
}

code_0A9947 {
    DEC $14
    BRA code_0A994D
}

code_0A994B {
    INC $14
}

code_0A994D {
    COP [2B] ( #$0028, &code_0A9957, &code_0A995D, &code_0A995B )
}

code_0A9957 {
    DEC $16
    BRA code_0A995D
}

code_0A995B {
    INC $16
}

code_0A995D {
    LDA $14
    STA $0018
    LDA $16
    STA $001C
    PHX 
    LDY $0004, X
    LDA $7F000A, X
    AND #$007F
    ASL 
    TAX 
    SEP #$20
    LDA #$00
    XBA 
    LDA $&binary_01C455, X
    BPL code_0A9985
    XBA 
    DEC 
    XBA 
    SEC 
    ROR 
    BRA code_0A9986
}

code_0A9985 {
    LSR 
}

code_0A9986 {
    REP #$20
    CLC 
    ADC $0018
    STA $0014, Y
    SEP #$20
    LDA #$00
    XBA 
    LDA $&binary_01C495, X
    BPL code_0A99A0
    XBA 
    DEC 
    XBA 
    SEC 
    ROR 
    BRA code_0A99A1
}

code_0A99A0 {
    LSR 
}

code_0A99A1 {
    REP #$20
    CLC 
    ADC $001C
    STA $0016, Y
    PLX 
    LDA $0014, Y
    STA $7F0010, X
    LDA $0016, Y
    STA $7F0012, X
    LDA $7F000A, X
    INC 
    STA $7F000A, X
}

code_0A99C2 {
    RTL 
}