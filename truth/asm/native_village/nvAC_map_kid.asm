

---------------------------------------------

h_nvAC_map_kid [
  h_actor < #24, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_map_kid {
    COP [D0] ( #AF, #00, &code_088FC2 )
    COP [C0] ( &code_088FC4 )
    COP [0B]
    COP [D2] ( #03, #01 )
    COP [0C]
    COP [82] ( #26, #11 )
    COP [89]
    COP [81] ( #28, #02 )
    COP [89]
    COP [80] ( #24 )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [81] ( #28, #03 )
    COP [89]
    COP [80] ( #24 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_088FC2 {
    COP [E0]
}

code_088FC4 {
    COP [BF] ( &widestring_088FE1 )
    COP [BE] ( #02, #01, &code_list_088FCE )
}

code_list_088FCE [
  &code_088FD4   ;00
  &code_088FD9   ;01
  &code_088FD4   ;02
]

code_088FD4 {
    COP [BF] ( &widestring_089078 )
    RTL 
}

code_088FD9 {
    COP [BF] ( &widestring_08901E )
    COP [CC] ( #B1 )
    RTL 
}

widestring_088FE1 `[TPL:E]The boy points to[N]the northeast...[FIN][LU2:37]him the map?[N] Yes[N] No`

widestring_08901E `[CLR]He drew a picture of the[N][LU1:E5]on the map![FIN]I [LU1:DA]he's saying[N]he wants to go to[N]the temple...[PAL:0][END]`

widestring_089078 `[CLR]He [LU1:AA]lonely...[PAL:0][END]`