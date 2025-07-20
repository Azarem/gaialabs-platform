

---------------------------------------------

h_nvAE_stone_girl3 [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_nvAE_stone_girl3 {
    COP [0B]
    COP [D0] ( #C1, #01, &code_08949D )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_0894A9 )
    COP [D2] ( #C1, #01 )
    COP [CA] ( #1E )
    COP [80] ( #36 )
    COP [89]
    COP [80] ( #32 )
    COP [89]
    COP [CB]
    LDA #$0200
    TRB $12
}

code_08949D {
    COP [C0] ( &code_0894AE )
    COP [80] ( #32 )
    COP [89]
    COP [C1]
    RTL 
}

code_0894A9 {
    COP [BF] ( &widestring_0894B3 )
    RTL 
}

code_0894AE {
    COP [BF] ( &widestring_089509 )
    RTL 
}

widestring_0894B3 `[DEF]The [LU1:C9]of the girl[N][LU1:D5]silently.[END]`

---------------------------------------------

widestring_0894D2 `[DEF][LU1:49]the [LU1:C9]has[N][LU1:71]a [LU1:9A]girl![FIN]A tear comes to[N]the [LU2:6F]eyes...[END]`

widestring_089509 `[DEF]You [LU1:82]understand...[END]`