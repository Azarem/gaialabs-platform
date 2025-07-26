
---------------------------------------------

h_nvAC_staring_man1 [
  h_actor < #1D, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_staring_man1 {
    COP [D0] ( #AF, #00, &code_088EC0 )
    COP [0B]
    COP [C0] ( &code_088EC2 )
    COP [D2] ( #03, #01 )
    COP [0C]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [81] ( #21, #01 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [81] ( #21, #04 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_088EC0 {
    COP [E0]
}

code_088EC2 {
    COP [BF] ( &widestring_088EDC )
    COP [BE] ( #02, #01, &code_list_088ECC )
}

code_list_088ECC [
  &code_088ED2   ;00
  &code_088ED7   ;01
  &code_088ED2   ;02
]

code_088ED2 {
    COP [BF] ( &widestring_088F71 )
    RTL 
}

code_088ED7 {
    COP [BF] ( &widestring_088F15 )
    RTL 
}

widestring_088EDC `[TPL:E]The man [LU1:AA]deeply [N][LU1:A1]Will's eyes. [FIN]Stare back?[N] Yes[N] No`

widestring_088F15 `[CLR]The man [LU1:CC]to [LU1:A9][N][LU2:94][LU1:A1][LU1:FE]heart... [FIN]We [LU1:82][LU1:E9]each[N]other's language, but[N]a seed has sprouted...[PAL:0][END]`

widestring_088F71 `[CLR]The man [LU2:80]lonely...[PAL:0][END]`

---------------------------------------------

h_nvAC_staring_man2 [
  h_actor < #1A, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_staring_man2 {
    COP [D0] ( #AF, #00, &nvAC_staring_man2_destroy )
    COP [0B]
    COP [C0] ( &code_088EC2 )
    COP [D2] ( #03, #01 )
    COP [0C]
    COP [81] ( #20, #12 )
    COP [89]
    COP [82] ( #1E, #01 )
    COP [89]
    COP [84] ( #1A, #1E )
    COP [8A]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [82] ( #1E, #04 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

---------------------------------------------

nvAC_staring_man2_destroy {
    COP [E0]
}