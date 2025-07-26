
---------------------------------------------

h_eu92_erasquez [
  h_actor < #2D, #00, #10 >   ;00
]

---------------------------------------------

e_eu92_erasquez {
    COP [0B]
    COP [C0] ( &code_07D7AA )
    COP [C1]
    RTL 
}

code_07D7AA {
    COP [D6] ( #19, &code_07D7C2 )
    COP [D0] ( #9F, #01, &code_07D7BD )
    COP [CC] ( #9F )
    COP [BF] ( &widestring_07D7C7 )
    RTL 
}

code_07D7BD {
    COP [BF] ( &widestring_07D892 )
    RTL 
}

code_07D7C2 {
    COP [BF] ( &widestring_07D8D2 )
    RTL 
}

widestring_07D7C7 `[TPL:B][TPL:4][LU2:9][LU1:1C]you![N]I [LU1:91]a [LU1:C7]power[N][LU1:81][LU1:8E]you...[FIN]My intuition is so[N]developed, I can sense[N][LU1:E0]even if I can't[N]see them.[FIN]At the [LU2:94]time, go to[N]Mt.Kress and [LU1:E7][N]a [LU1:A9]at the Teapot. [FIN][TPL:0][LU2:2E]marked Mt.Kress [N]on Will's map![PAL:0][END]`

widestring_07D892 `[TPL:B][TPL:4][LU2:9]The spirits' [N]tears in the teapot [N]reflect [LU1:FE]true form.[PAL:0][END]`

widestring_07D8D2 `[TPL:A][TPL:4][LU2:9]I [LU1:91]the [N]presence of evil [LU1:8E][N][LU2:A9]in town... [FIN][LU1:30]the townspeople[N][LU1:98][LU1:70]changed[N][LU1:A1]demons.[FIN]It may be [LU1:CF]in the[N][LU1:E2]square, or one[N]of [LU1:FE]friends.[FIN]Use the Teapot on anyone[N]you suspect.[PAL:0][END]`