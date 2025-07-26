
---------------------------------------------

h_sc04_eriks_father [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_sc04_eriks_father {
    COP [C0] ( &code_048FEA )
    COP [0B]
    COP [C1]
    RTL 
}

code_048FEA {
    COP [BF] ( &widestring_048FEF )
    RTL 
}

widestring_048FEF `[DEF]Erik's father:[N]Everyone is jealous[N]of [LU1:D6]big house...[FIN][LU1:1D]nothing.[N]We moved to [LU1:D6]town[N][LU1:74]anyone else.[END]`