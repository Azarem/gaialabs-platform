
---------------------------------------------

h_ir21_splop [
  h_actor < #1D, #01, #23 >   ;00
]

---------------------------------------------

e_ir21_splop {
    COP [BC] ( #08, #00 )
    LDA #$0080
    TSB $12
    COP [27] ( #30 )
    COP [C1]
    COP [21] ( #08, &code_0A9805 )
    RTL 
}

code_0A9805 {
    LDA #$2000
    TRB $10
    LDA #$0008
    TRB $12
    LDA $10
    BIT #$4000
    BNE code_0A9819
    COP [07] ( #26 )
}

code_0A9819 {
    COP [80] ( #1D )
    COP [89]
    LDA #$0300
    TRB $10
    LDA #$000F
    STA $7F000A, X

  code_0A982A:
    LDA $7F000A, X
    DEC 
    STA $7F000A, X
    BEQ code_0A9805
    CMP #$0006
    BEQ code_0A9866
    COP [C2]
    COP [23]
    AND #$0007
    DEC 
    BMI code_0A987C
    BEQ code_0A988E
    DEC 
    BEQ code_0A98A0
    DEC 
    BEQ code_0A98AF
    COP [2C] ( &code_0A9852, &code_0A985C )
}

code_0A9852 {
    COP [2A] ( #$0008, &code_0A98A0, &code_0A985C, &code_0A98AF )
}

code_0A985C {
    COP [2B] ( #$0008, &code_0A988E, &code_0A982A, &code_0A987C )
}

code_0A9866 {
    LDA #$0300
    TSB $10
    COP [80] ( #1E )
    COP [89]
    LDA #$2000
    TSB $10
    LDA #$0008
    TSB $12
    BRA code_0A982A
}

code_0A987C {
    COP [16] ( &code_0A982A )
    COP [14] ( #FF, #01, &code_0A982A )
    COP [82] ( #1F, #28 )
    COP [89]
    BRA code_0A982A
}

code_0A988E {
    COP [15] ( &code_0A982A )
    COP [14] ( #FF, #FF, &code_0A982A )
    COP [82] ( #20, #27 )
    COP [89]
    BRA code_0A982A
}

code_0A98A0 {
    COP [14] ( #FE, #00, &code_0A982A )
    COP [81] ( #21, #27 )
    COP [89]
    JMP $&code_0A982A
}

code_0A98AF {
    COP [18] ( &code_0A982A )
    COP [81] ( #A1, #28 )
    COP [89]
    JMP $&code_0A982A
}