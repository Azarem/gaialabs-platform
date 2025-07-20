

---------------------------------------------

h_it17_kara [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_it17_kara {
    COP [D0] ( #37, #01, &code_04E1EF )
    COP [C0] ( &code_04E1F1 )
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [BF] ( &widestring_04E223 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [81] ( #19, #01 )
    COP [89]
    COP [86] ( #16, #02, #01 )
    COP [8A]
    COP [CC] ( #03 )
}

code_04E1EF {
    COP [E0]
}

code_04E1F1 {
    COP [BF] ( &widestring_04E1F6 )
    RTL 
}

widestring_04E1F6 `[TPL:A][TPL:1][LU1:25][LU1:1D]a  [N][LU1:95][LU2:BD]The [N]breeze is refreshing.[PAL:0][END]`

widestring_04E223 `[TPL:A][TPL:1][LU1:25]I'm going, too! [N]I [LU1:F1]to see [N]the [LU1:31]Tribe. [FIN]Since I escaped the[N]confinement of the[N]castle, [FIN]I [LU1:F1]to[N]see and [LU1:9B]everything.[PAL:0][END]`