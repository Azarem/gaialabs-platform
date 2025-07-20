

---------------------------------------------

h_nvAC_dumpling_man1 [
  h_actor < #1C, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_dumpling_man1 {
    COP [D0] ( #AF, #00, &code_088DC2 )
    LDA #$1000
    TSB $12
    COP [C0] ( &code_088DC4 )

  code_088D7D:
    COP [D0] ( #03, #01, &code_088D9D )
    COP [81] ( #20, #02 )
    COP [89]
    COP [82] ( #1F, #02 )
    COP [89]
    COP [81] ( #21, #01 )
    COP [89]
    COP [82] ( #1E, #01 )
    COP [89]
    BRA code_088D7D
}

code_088D9D {
    COP [82] ( #1E, #11 )
    COP [89]
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [82] ( #1F, #03 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_088DC2 {
    COP [E0]
}

code_088DC4 {
    COP [BF] ( &widestring_088DDE )
    COP [BE] ( #02, #01, &code_list_088DCE )
}

code_list_088DCE [
  &code_088DD4   ;00
  &code_088DD9   ;01
  &code_088DD4   ;02
]

code_088DD4 {
    COP [BF] ( &widestring_088E72 )
    RTL 
}

code_088DD9 {
    COP [BF] ( &widestring_088E0F )
    RTL 
}

widestring_088DDE `[TPL:E]The man holds out[N][LU1:D0]food...[FIN]Eat some?[N] Yes[N] No`

widestring_088E0F `[CLR]It tastes [LU1:A5]dumplings[N][LU1:B3]of insects...[FIN]My heart was filled.[N]It [LU2:A0]as if we[N]understood each other.[PAL:0][END]`

widestring_088E72 `[CLR]The man [LU2:80]sad...[PAL:0][END]`

---------------------------------------------

h_nvAC_dumpling_man2 [
  h_actor < #1A, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_dumpling_man2 {
    COP [D0] ( #AF, #00, &code_089246 )
    COP [0B]
    COP [C0] ( &code_088DC4 )
    COP [D2] ( #03, #01 )
    COP [0C]
    COP [81] ( #21, #11 )
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

code_089246 {
    COP [E0]
}