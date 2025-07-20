

---------------------------------------------

func_00CFEF {
    COP [23]
    STA $28
    LDA #$0002
    STA $2A
    COP [C1]
    PHB 
    PHK 
    PLB 
    LDA $28
    INC $28
    AND #$0007
    ASL 
    TAY 
    LDA $&binary_00D068, Y
    PHA 
    CLC 
    ADC $06C2
    STA $06C2
    BPL code_00D016
    STZ $06C2
}

code_00D016 {
    LDA $24
    CMP #$FFFF
    BEQ code_00D02C
    PLA 
    CLC 
    ADC $06C4
    STA $06C4
    BPL code_00D02D
    STZ $06C4
    BRA code_00D02D
}

code_00D02C {
    PLA 
}

code_00D02D {
    LDA $28
    AND #$0007
    ASL 
    TAY 
    LDA $&binary_00D068, Y
    PHA 
    CLC 
    ADC $06BE
    STA $06BE
    BPL code_00D044
    STZ $06BE
}

code_00D044 {
    LDA $24
    CMP #$FFFF
    BEQ code_00D05A
    PLA 
    CLC 
    ADC $06C0
    STA $06C0
    BPL code_00D05B
    STZ $06C0
    BRA code_00D05B
}

code_00D05A {
    PLA 
}

code_00D05B {
    PLB 
    LDA #$0003
    STA $08
    DEC $2A
    BMI code_00D066
    RTL 
}

code_00D066 {
    COP [E0]
}

---------------------------------------------

binary_00D068 #0100FFFFFEFF010002000000FEFF01000500FCFFFEFF04000100FBFF0400FDFF