?INCLUDE 'hidden_red_jewel'


---------------------------------------------

h_nvAE_stone_girl2 [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_nvAE_stone_girl2 {
    COP [0B]
    COP [D0] ( #C0, #01, &code_089392 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08939E )
    COP [D2] ( #C0, #01 )
    COP [CA] ( #1E )
    COP [80] ( #36 )
    COP [89]
    COP [80] ( #32 )
    COP [89]
    COP [CB]
    LDA #$0200
    TRB $12
}

code_089392 {
    COP [C0] ( &code_0893A3 )
    COP [80] ( #32 )
    COP [89]
    COP [C1]
    RTL 
}

code_08939E {
    COP [BF] ( &widestring_0893BF )
    RTL 
}

code_0893A3 {
    COP [D0] ( #E6, #01, &code_0893BA )
    COP [BF] ( &widestring_08942A )
    COP [D4] ( #01, &code_0893B6 )
    COP [CC] ( #E6 )
    RTL 
}

code_0893B6 {
    JML $@code_00C6A1
}

code_0893BA {
    COP [BF] ( &widestring_089415 )
    RTL 
}

widestring_0893BF `[DEF]The [LU1:C9]of the girl[N][LU1:D5]silently.[END]`

---------------------------------------------

widestring_0893DE `[DEF][LU1:49]the [LU1:C9]has[N][LU1:71]a [LU1:9A]girl![FIN]A tear comes to[N]the [LU2:6F]eyes...[END]`

widestring_089415 `[DEF]You [LU1:82]understand...[END]`

widestring_08942A `[DEF]The [LU2:6C]silently offers[N]a Red Jewel[N]as a reward...[FIN]Will [LU2:6D]a Red Jewel! [END]`