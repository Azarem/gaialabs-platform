
---------------------------------------------

h_nvAC_beckon_kid [
  h_actor < #24, #00, #18 >   ;00
]

---------------------------------------------

e_nvAC_beckon_kid {
    COP [D0] ( #AF, #00, &code_089102 )
    COP [C0] ( &code_089104 )
    COP [0B]
    COP [D0] ( #B2, #01, &code_0890C1 )
    COP [D2] ( #03, #01 )
    COP [0C]
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
}

code_0890C1 {
    COP [D2] ( #06, #01 )
    COP [C0] ( #$0000 )
    LDA #$0800
    TRB $10
    COP [0C]
    LDA #$0148
    STA $7F0018, X
    LDA #$0120
    STA $7F001A, X
    COP [22] ( #29, #01 )
    LDA #$0188
    STA $7F0018, X
    LDA #$0140
    STA $7F001A, X
    COP [22] ( #29, #01 )
    COP [0B]
    COP [C0] ( &code_089121 )
    LDA #$0200
    TSB $12
    COP [C1]
    RTL 
}

code_089102 {
    COP [E0]
}

code_089104 {
    COP [BF] ( &widestring_089126 )
    COP [BE] ( #02, #01, &code_list_08910E )
}

code_list_08910E [
  &code_089114   ;00
  &code_089119   ;01
  &code_089114   ;02
]

code_089114 {
    COP [BF] ( &widestring_089190 )
    RTL 
}

code_089119 {
    COP [BF] ( &widestring_089178 )
    COP [CC] ( #06 )
    RTL 
}

code_089121 {
    COP [BF] ( &widestring_0891A2 )
    RTL 
}

widestring_089126 `[TPL:E]He tugs on Will's[N]sleeve, as if he wants[N]to [LU1:E7]him somewhere.[FIN]Go [LU1:F0]him?[N] Yes[N] No`

widestring_089178 `[CLR]He beckons to him...[PAL:0][END]`

widestring_089190 `[CLR]He [LU1:AA]lonely...[PAL:0][END]`

widestring_0891A2 `[TPL:9][TPL:0]He faces the skeleton[N][LU1:F0]tears in his eyes...[FIN]Is [LU1:D6]the skeleton of[N]a relative? A friend?[PAL:0][END]`