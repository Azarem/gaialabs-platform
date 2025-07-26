
---------------------------------------------

h_sg55_falling_tile [
  h_actor < #0A, #01, #03 >   ;00
]

---------------------------------------------

e_sg55_falling_tile {
    COP [11]
    COP [C1]
    COP [2B] ( #$0020, &code_0ACFF7, &code_0ACFF6, &code_0ACFF6 )
}

code_0ACFF6 {
    RTL 
}

code_0ACFF7 {
    COP [0B]
    COP [80] ( #0B )
    COP [89]
    COP [E0]
}