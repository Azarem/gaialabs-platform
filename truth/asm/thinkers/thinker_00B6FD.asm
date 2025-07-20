

---------------------------------------------

h_thinker_00B6FD [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B6FD {
    PHX 
    LDA #$0000
    LDX #$0000

  code_00B706:
    STA $7F0A94, X
    INX 
    INX 
    CPX #$000E
    BNE code_00B706
    PLX 
    COP [CC] ( #FF )
    COP [D2] ( #FF, #00 )
    BRA e_thinker_00B6FD
}

---------------------------------------------

func_00B71B {
    COP [3D]
    RTL 
}