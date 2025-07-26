
---------------------------------------------

h_thinker_00B5FE [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B5FE {
    COP [37] ( #03 )
    COP [C1]
    COP [D0] ( #01, #01, &func_00B60C )
    RTL 
}

---------------------------------------------

func_00B60C {
    COP [3C] ( @func_00B62A )
    TYA 
    STA $7F000A, X
    COP [C1]
    COP [D2] ( #01, #00 )
    PHX 
    PHD 
    LDA $7F000A, X
    TAX 
    TCD 
    COP [3D]
    PLD 
    PLX 
    BRA e_thinker_00B5FE
}

---------------------------------------------

func_00B62A {
    COP [37] ( #03 )
    COP [39]
    BRA func_00B62A
}