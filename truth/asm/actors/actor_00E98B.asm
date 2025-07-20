?INCLUDE 'chunk_028000'


---------------------------------------------

e_actor_00E98B {
    COP [C1]
    PEA $&func_00E9CA-1
    LDA $14
    BIT #$8000
    BNE code_00E9A7
    BIT #$FF00
    BEQ code_00E9BA
    LDY $06BE
    JSL $@func_028000
    STA $06C8
    RTS 
}

code_00E9A7 {
    AND #$00FF
    BIT #$0080
    BEQ code_00E9B2
    ORA #$FF00
}

code_00E9B2 {
    CLC 
    ADC $06C8
    STA $06C8
    RTS 
}

code_00E9BA {
    BIT #$0080
    BEQ code_00E9C2
    ORA #$FF00
}

code_00E9C2 {
    CLC 
    ADC $06C8
    STA $06C8
    RTS 
}

---------------------------------------------

func_00E9CA {
    LDA $16
    BIT #$FF00
    BEQ code_00E9DC
    LDY $06C2
    JSL $@func_028000
    STA $06C4
    RTL 
}

code_00E9DC {
    BIT #$0080
    BEQ code_00E9E4
    ORA #$FF00
}

code_00E9E4 {
    CLC 
    ADC $06C4
    STA $06C4
    RTL 
}