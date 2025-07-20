

---------------------------------------------

h_eu95_neil [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_eu95_neil {
    COP [D0] ( #AA, #01, &code_07E390 )
    COP [0B]
    COP [C0] ( &code_07E392 )
    COP [BC] ( #00, #FE )
    COP [C1]
    RTL 
}

code_07E390 {
    COP [E0]
}

code_07E392 {
    COP [D0] ( #A8, #01, &code_07E39D )
    COP [BF] ( &widestring_07E3B5 )
    RTL 
}

code_07E39D {
    COP [BF] ( &widestring_07E3F4 )
    COP [CC] ( #AA )
    LDA #$0404
    STA $064A
    COP [26] ( #96, #$00A0, #$0090, #03, #$1100 )
    RTL 
}

widestring_07E3B5 `[TPL:B][LU1:36][N]To [LU1:AF]for yourself or [N]for others, that's the [N]question...[END]`

widestring_07E3F4 `[TPL:B][TPL:6][DLY:2][LU1:36][N]. . . . . . . [FIN]I [LU2:66]realize how[N]important my parents[N]are to me. I wish I could[N][LU1:98]told them... [FIN]Will... [N][LU1:24][LU1:AC]me alone [N]for a while... [FIN][TPL:0][DLY:1]I'm ashamed to [LU1:9B]you[N][LU2:AC][LU1:D7]way...[N][LU1:20][LU1:BB][LU2:A7]you[N][LU1:A5][LU1:D6]before.[END]`