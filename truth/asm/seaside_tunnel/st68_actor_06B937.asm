
---------------------------------------------

h_st68_actor_06B937 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_st68_actor_06B937 {
    LDA #$1000
    TSB $12
    LDA $0036
    AND #$003F
    BEQ code_06B948
    RTL 
}

code_06B948 {
    COP [23]
    AND #$0003
    BEQ code_06B957
    COP [9C] ( @code_06B95F, #$0B02 )
    RTL 
}

code_06B957 {
    COP [9C] ( @code_06B99E, #$0B02 )
    RTL 
}

code_06B95F {
    JSR $&code_06B9E4
    COP [86] ( #35, #08, #11 )
    COP [8A]
    COP [86] ( #35, #08, #01 )
    COP [8A]
    COP [86] ( #35, #08, #03 )
    COP [8A]
    COP [86] ( #35, #08, #05 )
    COP [8A]

  code_06B97E:
    COP [82] ( #35, #07 )
    COP [89]
    COP [13] ( &code_06B97E )

  code_06B988:
    COP [82] ( #35, #07 )
    COP [89]
    LDA $10
    BIT #$4000
    BNE code_06B99C
    COP [23]
    AND #$0007
    BNE code_06B988
}

code_06B99C {
    COP [E0]
}

code_06B99E {
    JSR $&code_06B9E4
    COP [86] ( #34, #08, #11 )
    COP [8A]
    COP [86] ( #34, #08, #01 )
    COP [8A]
    COP [86] ( #34, #08, #03 )
    COP [8A]
    COP [86] ( #34, #08, #05 )
    COP [8A]
    COP [86] ( #34, #08, #07 )
    COP [8A]

  code_06B9C4:
    COP [82] ( #34, #0B )
    COP [89]
    COP [13] ( &code_06B9C4 )

  code_06B9CE:
    COP [82] ( #34, #0B )
    COP [89]
    LDA $10
    BIT #$4000
    BNE code_06B9E2
    COP [23]
    AND #$0007
    BNE code_06B9CE
}

code_06B9E2 {
    COP [E0]
}

code_06B9E4 {
    LDA $06C2
    STA $16
    COP [23]
    CLC 
    ADC $06BE
    STA $14
    RTS 
}