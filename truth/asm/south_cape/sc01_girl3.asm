

---------------------------------------------

h_sc01_girl3 [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_girl3 {
    COP [C0] ( &code_0481D1 )

  code_0481AF:
    COP [0B]

  code_0481B1:
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [85] ( #20, #02, #14 )
    COP [8A]
    COP [0B]
    COP [D0] ( #03, #00, &code_0481B1 )
    COP [0C]
    COP [85] ( #21, #06, #11 )
    COP [8A]
    BRA code_0481AF
}

code_0481D1 {
    COP [BF] ( &widestring_0481D6 )
    RTL 
}

widestring_0481D6 `[DEF]How [LU1:A6][LU1:98]we [LU1:70][N][LU1:C4]this?[END]`