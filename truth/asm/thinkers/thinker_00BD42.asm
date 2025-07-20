

---------------------------------------------

h_thinker_00BD42 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00BD42 {
    LDA #$0002
    STA $7F0008, X
    COP [5F] ( #$8000, #08 )
    COP [C2]
    COP [D0] ( #FF, #00, &h_thinker_00BD42 )
    COP [D0] ( #01, #01, &func_00BD69 )
    COP [60] ( #05, #02 )
    COP [61] ( $7E8400, #0D )
    RTL 
}

---------------------------------------------

func_00BD69 {
    LDA #$0070
    STA $7F0008, X
    COP [5F] ( #$8000, #04 )
    COP [C2]
    COP [D0] ( #FF, #00, &func_00BD69 )
    LDA $7F0008, X
    DEC 
    STA $7F0008, X
    BEQ code_00BD93
    COP [60] ( #05, #02 )
    COP [61] ( $7E8400, #0D )
    RTL 
}

code_00BD93 {
    COP [C1]
    RTL 
}