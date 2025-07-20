
!effect_bounds_x                0694
!effect_bounds_y                0698

---------------------------------------------

h_actor_00E9EC [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

e_actor_00E9EC {
    LDA #$1000
    TSB $12
    LDA $14
    LSR 
    LSR 
    LSR 
    LSR 
    BIT #$0080
    BEQ code_00EA06
    AND #$FF7F
    EOR #$FFFF
    INC 
}

code_00EA06 {
    STA $2C
    LDA $16
    LSR 
    LSR 
    LSR 
    LSR 
    DEC 
    BIT #$0080
    BEQ code_00EA1B
    AND #$FF7F
    EOR #$FFFF
    INC 
}

code_00EA1B {
    STA $2E
    LDA #$0000
    STA $14
    STA $16
    COP [C1]
    LDA $14
    CLC 
    ADC $2C
    CLC 
    ADC $06E4
    STA $14
    STA $06C0
    BPL code_00EA43
    LDA $effect_bounds_x
    STA $06C0
    STA $068C
    STA $14
    BRA code_00EA53
}

code_00EA43 {
    CMP $effect_bounds_x
    BCC code_00EA53
    LDA #$0000
    STA $06C0
    STA $14
    STA $068C
}

code_00EA53 {
    LDA $16
    CLC 
    ADC $2E
    CLC 
    ADC $06E6
    STA $16
    STA $06C4
    BPL code_00EA71
    LDA $effect_bounds_y
    DEC 
    STA $06C4
    STA $0690
    STA $16
    BRA code_00EA81
}

code_00EA71 {
    CMP $effect_bounds_y
    BCC code_00EA81
    LDA #$0000
    STA $06C4
    STA $16
    STA $0690
}

code_00EA81 {
    LDA $06C0
    SEC 
    SBC $068C
    STA $06E8
    LDA $06C4
    SEC 
    SBC $0690
    STA $06EA
    RTL 
}