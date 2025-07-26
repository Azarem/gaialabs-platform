
---------------------------------------------

h_actor_00E8D7 [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

e_actor_00E8D7 {
    LDA #$1000
    TSB $12
    LDA $14
    LSR 
    LSR 
    LSR 
    LSR 
    BIT #$0080
    BEQ code_00E8F1
    AND #$FF7F
    EOR #$FFFF
    INC 
}

code_00E8F1 {
    STA $2C
    LDA $16
    LSR 
    LSR 
    LSR 
    LSR 
    DEC 
    BIT #$0080
    BEQ code_00E906
    AND #$FF7F
    EOR #$FFFF
    INC 
}

code_00E906 {
    STA $2E
    LDA #$0000
    STA $14
    STA $068C
    STA $06C0
    STA $16
    STA $0690
    STA $06C4
    COP [DA] ( #01 )
    LDA $14
    CLC 
    ADC $2C
    CLC 
    ADC $06E4
    STA $14
    ORA #$8000
    STA $06C8
    LDA $16
    CLC 
    ADC $2E
    CLC 
    ADC $06E6
    STA $16
    STA $06C4
    LDA $2C
    STA $06E8
    LDA $06C4
    SEC 
    SBC $0690
    STA $06EA
    RTL 
}