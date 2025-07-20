

---------------------------------------------

h_sp5E_passageway [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sp5E_passageway {
    COP [D0] ( #7D, #01, &code_069751 )
    COP [C1]
    COP [45] ( #14, #08, #16, #0C, &code_06974A )
    RTL 
}

code_06974A {
    COP [CC] ( #7D )
    COP [BF] ( &widestring_069753 )
}

code_069751 {
    COP [E0]
}

widestring_069753 `[TPL:A][TPL:2][LU1:2C]speaks from[N]his pocket.[FIN][TPL:2][LU1:2A]A passageway... [N]I [LU1:F9]if it goes [N]clear to Mu? [PAL:0][END]`