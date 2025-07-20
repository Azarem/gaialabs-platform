

---------------------------------------------

h_nvAC_bonfire [
  h_actor < #31, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_bonfire {
    COP [D0] ( #AF, #00, &code_088C6B )
    LDA #$1000
    TSB $12
    COP [8D] ( #31 )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_088C6B {
    COP [E0]
}