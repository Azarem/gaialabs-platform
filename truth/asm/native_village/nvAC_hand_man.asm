
---------------------------------------------

h_nvAC_hand_man1 [
  h_actor < #1D, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_hand_man1 {
    COP [D0] ( #AF, #00, &nvAC_hand_man1_destroy )
    LDA #$1000
    TSB $12
    COP [C0] ( &code_088CC6 )

  code_088C7F:
    COP [D0] ( #03, #01, &code_088C9F )
    COP [81] ( #21, #01 )
    COP [89]
    COP [82] ( #1E, #01 )
    COP [89]
    COP [81] ( #20, #02 )
    COP [89]
    COP [82] ( #1F, #02 )
    COP [89]
    BRA code_088C7F
}

code_088C9F {
    COP [81] ( #20, #12 )
    COP [89]
    COP [82] ( #1E, #11 )
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

nvAC_hand_man1_destroy {
    COP [E0]
}

code_088CC6 {
    COP [BF] ( &widestring_088CE0 )
    COP [BE] ( #02, #01, &code_list_088CD0 )
}

code_list_088CD0 [
  &code_088CD6   ;00
  &code_088CDB   ;01
  &code_088CD6   ;02
]

code_088CD6 {
    COP [BF] ( &widestring_088D54 )
    RTL 
}

code_088CDB {
    COP [BF] ( &widestring_088D1F )
    RTL 
}

widestring_088CE0 `[TPL:E]The man timidly held[N]out his hand...[FIN]Take his hand?[N] Yes[N] No`

widestring_088D1F `[CLR]We [LU1:82][LU1:E9]each[N]other's language, but[N]I [LU1:DA]we agree...[PAL:0][END]`

widestring_088D54 `[CLR]The man [LU1:AA]lonely...[PAL:0][END]`

---------------------------------------------

h_nvAC_hand_man2 [
  h_actor < #1A, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_hand_man2 {
    COP [D0] ( #AF, #00, &code_08925A )
    COP [0B]
    COP [C0] ( &code_088CC6 )
    COP [C1]
    RTL 
}

code_08925A {
    COP [E0]
}