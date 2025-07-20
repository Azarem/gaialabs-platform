

---------------------------------------------

h_av6B_door [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av6B_door {
    SEP #$20
    LDA #$0F
    STA $7FC568
    STA $7FC56A
    STA $7FCA52
    STA $7FCA54
    REP #$20
    COP [BC] ( #08, #00 )
    COP [21] ( #01, &code_06D76F )
    COP [C0] ( &code_06D780 )
    COP [D2] ( #01, #01 )
}

code_06D76F {
    COP [06] ( #06 )
    COP [32] ( #45 )
    COP [33]
    LDA #$0000
    STA $0AA6
    COP [C1]
    RTL 
}

code_06D780 {
    COP [CC] ( #01 )
    RTL 
}