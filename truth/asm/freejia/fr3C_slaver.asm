

---------------------------------------------

h_fr3C_slaver [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_fr3C_slaver {
    COP [0B]
    COP [C0] ( &code_05C173 )
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05C173 {
    COP [BF] ( &widestring_05C190 )
    COP [BE] ( #02, #02, &code_list_05C17D )
}

code_list_05C17D [
  &code_05C183   ;00
  &code_05C188   ;01
  &code_05C183   ;02
]

code_05C183 {
    COP [BF] ( &widestring_05C21F )
    RTL 
}

code_05C188 {
    COP [BF] ( &widestring_05C1E2 )
    COP [CC] ( #01 )
    RTL 
}

widestring_05C190 `[TPL:B][LU1:1C]boy![N]Kids [LU1:78][LU1:79]here![N]Go [LU2:75]Go home![FIN]Or did you [LU1:79]to [N]get a laborer? [N] Yes [N] No `

widestring_05C1E2 `[CLR]I [LU1:A5][LU1:FE]courage! [N]I [LU1:82][LU1:A4][LU1:F7][N]you'd do here, but [LU1:98][N]a [LU1:A9]around. [END]`

widestring_05C21F `[CLR]Go [LU2:75]Go home![END]`