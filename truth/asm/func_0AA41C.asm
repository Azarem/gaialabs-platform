
---------------------------------------------

func_0AA41C {
    PHX 
    LDY $04
    LDX $06
    LDA $0014, Y
    CLC 
    ADC $0014, X
    CLC 
    BPL code_0AA42C
    SEC 
}

code_0AA42C {
    ROR 
    STA $14
    LDA $0016, Y
    CLC 
    ADC $0016, X
    CLC 
    BPL code_0AA43A
    SEC 
}

code_0AA43A {
    ROR 
    STA $16
    PLX 
    RTL 
}