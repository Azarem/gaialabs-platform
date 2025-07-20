

---------------------------------------------

h_thinker_00B671 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B671 {
    COP [D0] ( #52, #01, &func_00B69B )
    COP [D0] ( #4D, #01, &func_00B686 )

  code_00B67F:
    COP [37] ( #1A )
    COP [39]
    BRA code_00B67F
}

---------------------------------------------

func_00B686 {
    COP [37] ( #34 )
    COP [39]
    COP [CC] ( #FF )

  code_00B68E:
    COP [37] ( #33 )
    COP [39]
    COP [D0] ( #FF, #01, &code_00B68E )
    BRA func_00B686
}

---------------------------------------------

func_00B69B {
    PHX 
    LDX $005A
    COP [3D]
    TXA 
    CLC 
    ADC #$0010
    TAX 
    COP [3D]
    PLX 

  code_00B6AA:
    PHX 
    LDA #$1421
    LDX #$0000

  code_00B6B1:
    STA $7F0A40, X
    INX 
    INX 
    CPX #$0020
    BNE code_00B6B1
    PLX 
    LDA #$1442
    STA $7F0A00
    COP [37] ( #36 )
    COP [39]
    COP [CC] ( #FF )
    COP [D2] ( #FF, #00 )
    BRA code_00B6AA
}