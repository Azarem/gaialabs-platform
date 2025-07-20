

---------------------------------------------

h_na4B_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_na4B_lance {
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_05EF23 )
    COP [0C]
    COP [86] ( #06, #0B, #11 )
    COP [8A]
    COP [84] ( #02, #20 )
    COP [8A]
    COP [84] ( #05, #20 )
    COP [8A]
    COP [85] ( #09, #06, #11 )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [25] ( #11, #09 )
    COP [80] ( #03 )
    COP [89]
    COP [0B]
    COP [D2] ( #08, #01 )
    COP [80] ( #04 )
    COP [89]
    COP [D2] ( #09, #01 )
    COP [C0] ( &code_05EF28 )
    COP [0C]
    COP [86] ( #06, #0B, #01 )
    COP [8A]
    COP [85] ( #09, #05, #01 )
    COP [8A]
    COP [86] ( #06, #06, #01 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [D2] ( #0C, #01 )
    COP [80] ( #02 )
    COP [89]
    COP [C1]
    RTL 
}

code_05EF23 {
    COP [BF] ( &widestring_05EF2D )
    RTL 
}

code_05EF28 {
    COP [BF] ( &widestring_05EF98 )
    RTL 
}

widestring_05EF2D `[DEF][TPL:4]Lance: [N]Up [LU2:BC]now all [LU1:20][N]done is go to school, [N]study, and play. [FIN][LU1:4A]I [LU1:F9]if[N]my [LU1:77][LU2:73]isn't[N]all a dream...[PAL:0][END]`

widestring_05EF98 `[DEF][TPL:4]Lance: [LU2:3F]working on a [N]puzzle [LU1:D7]explorers [N]and archeologists [LU1:98][N][LU1:BB]solved...[PAL:0][END]`