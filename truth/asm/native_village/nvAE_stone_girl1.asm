

---------------------------------------------

h_nvAE_stone_girl1 [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_nvAE_stone_girl1 {
    COP [0B]
    COP [D0] ( #BF, #01, &code_0892CE )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_0892DA )
    COP [D2] ( #BF, #01 )
    COP [CA] ( #1E )
    COP [80] ( #36 )
    COP [89]
    COP [80] ( #32 )
    COP [89]
    COP [CB]
    LDA #$0200
    TRB $12
}

code_0892CE {
    COP [C0] ( &code_0892DF )
    COP [80] ( #32 )
    COP [89]
    COP [C1]
    RTL 
}

code_0892DA {
    COP [BF] ( &widestring_0892E4 )
    RTL 
}

code_0892DF {
    COP [BF] ( &widestring_089351 )
    RTL 
}

widestring_0892E4 `[DEF]The [LU1:C9]of a [LU2:6C][N][LU1:D5]silently.[END]`

---------------------------------------------

widestring_0892FF `The [LU1:C9]of a [LU2:6C][N][LU1:D5]silently. [END]`

---------------------------------------------

widestring_08931A `[DEF][LU1:49]the [LU1:C9]has[N][LU1:71]a [LU1:9A]girl![FIN]A tear comes to[N]the [LU2:6F]eyes...[END]`

widestring_089351 `[DEF]You [LU1:82]understand...[END]`