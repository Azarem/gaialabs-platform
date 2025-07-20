?INCLUDE 'dm_func_0ADB6B'


---------------------------------------------

h_dm3D_grundit [
  h_actor < #1A, #00, #22 >   ;00
]

---------------------------------------------

e_dm3D_grundit {
    LDA #$0011
    TSB $12
    LDA #$0000
    STA $7F0010, X

  code_0AB004:
    COP [27] ( #08 )
    COP [21] ( #04, &code_0AB00D )
    RTL 
}

code_0AB00D {
    LDA #$2000
    TRB $10
    COP [CA] ( #05 )
    COP [07] ( #2C )
    COP [80] ( #2D )
    COP [89]
    COP [CB]
    LDA #$0200
    TRB $10
    COP [9C] ( @code_0AB081, #$0200 )
    COP [9C] ( @code_0AB098, #$0200 )
    COP [9C] ( @code_0AB091, #$0200 )
    COP [C2]
    COP [9C] ( @code_0AB0AC, #$0200 )
    COP [A2] ( @code_0AB071, #$0301 )
    COP [80] ( #2F )
    COP [89]
    COP [80] ( #30 )
    COP [89]
    COP [A5] ( @dm_func_0ADB6B, #00, #CE, #$0202 )
    COP [80] ( #30 )
    COP [89]
    COP [80] ( #31 )
    COP [89]
    LDA #$2200
    TSB $10
    COP [DA] ( #77 )
    JMP $&code_0AB004
}

code_0AB071 {
    COP [80] ( #2E )
    COP [89]
    COP [DB] ( #$00DB )
    COP [80] ( #2D )
    COP [89]
    COP [E0]
}

code_0AB081 {
    COP [83] ( #32, #02, #2A )
    COP [89]
    COP [83] ( #32, #02, #2B )
    COP [89]
    COP [E0]
}

code_0AB091 {
    LDA #$4000
    TSB $12
    BRA code_0AB081
}

code_0AB098 {
    COP [BC] ( #00, #06 )
    COP [83] ( #32, #12, #2A )
    COP [89]
    COP [83] ( #32, #12, #2B )
    COP [89]
    COP [E0]
}

code_0AB0AC {
    LDA #$4000
    TSB $12
    BRA code_0AB098
}