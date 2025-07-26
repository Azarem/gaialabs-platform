
---------------------------------------------

h_wa79_lily [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

e_wa79_lily {
    COP [D0] ( #97, #01, &code_07A904 )
    COP [D0] ( #96, #01, &code_07A8F3 )
    COP [D0] ( #91, #01, &code_07A8F1 )
    COP [C0] ( &code_07A915 )
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [D2] ( #01, #01 )
    COP [84] ( #24, #0C )
    COP [8A]
    COP [84] ( #22, #0C )
    COP [8A]
    COP [84] ( #25, #0C )
    COP [8A]
    COP [84] ( #22, #28 )
    COP [8A]
    COP [BF] ( &widestring_07A974 )
    COP [CC] ( #02 )
    COP [D2] ( #04, #01 )
    COP [BF] ( &widestring_07A9F2 )
    COP [85] ( #29, #03, #11 )
    COP [8A]
    COP [86] ( #26, #03, #11 )
    COP [8A]
    COP [80] ( #24 )
    COP [89]
    COP [BF] ( &widestring_07AA09 )
    COP [85] ( #28, #02, #12 )
    COP [8A]
    COP [82] ( #26, #13 )
    COP [89]
    COP [82] ( #27, #11 )
    COP [89]
    LDA #$0404
    STA $064A
    COP [26] ( #7F, #$02E0, #$00B0, #00, #$4500 )
}

code_07A8F1 {
    COP [E0]
}

code_07A8F3 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [C0] ( &code_07A91A )
    COP [C1]
    RTL 
}

code_07A904 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [C0] ( &code_07A91F )
    COP [C1]
    RTL 
}

code_07A915 {
    COP [BF] ( &widestring_07A92F )
    RTL 
}

code_07A91A {
    COP [BF] ( &widestring_07AA34 )
    RTL 
}

code_07A91F {
    COP [D0] ( #A5, #01, &code_07A92A )
    COP [BF] ( &widestring_07AA5E )
    RTL 
}

code_07A92A {
    COP [BF] ( &widestring_07AAA3 )
    RTL 
}

widestring_07A92F `[TPL:A][TPL:2][SFX:19][LU1:2A]I [LU1:99][LU1:D7][N]Lance saw [LU1:CF]he [N]knew in town. [FIN]I [LU2:6E]he [LU2:C1]to[N][LU1:A9]for him.[END]`

widestring_07A974 `[TPL:A][TPL:2][LU1:2A]What?[N][LU2:D]remembered[N]my birthday?[FIN][TPL:3]Erik:[N][LU2:7]you expect it?[FIN][LU2:D]kept it secret[N]to surprise you.[FIN][TPL:6][LU1:36]Hey Kara. [N]Bring that.[PAL:0][END]`

widestring_07A9F2 `[TPL:A][TPL:2][LU1:2A]Huh? [N]I [LU1:F9]what? [END]`

widestring_07AA09 `[TPL:A][TPL:2][LU1:2A][N]Excuse me everyone. [N][LU1:1F]be [LU2:94]back.. [END]`

widestring_07AA34 `[TPL:A][TPL:2][LU1:2A][N]I [LU2:71]Lance's [LU2:67][N]recovers quickly.[PAL:0][END]`

widestring_07AA5E `[TPL:A][TPL:2][LU1:2A]I decided to stay[N]in [LU1:D6]town, too.[FIN]Ask Lance [N]the reason why.[PAL:0][END]`

widestring_07AAA3 `[TPL:A][TPL:2]Lilly:[N]Rumor is we're [LU1:93]to[N]collide [LU1:F0]a big star.[FIN]I [LU1:82]believe[N]rumors [LU1:A5]that.[PAL:0][END]`