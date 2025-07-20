

---------------------------------------------

h_av74_ishtar [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_av74_ishtar {
    COP [BC] ( #00, #FC )
    LDA #$0200
    TSB $12
    COP [9E] ( @code_06CEB8, #$0000, #$FFF0, #$0300 )
    COP [C0] ( &code_06CEDA )
    COP [D0] ( #89, #00, &code_06CEA5 )
    COP [E0]
}

code_06CEA5 {
    COP [C1]
    COP [80] ( #12 )
    COP [89]
    RTL 
}

---------------------------------------------

h_av74_ishtar_unused [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_av74_ishtar_unused {
    COP [0F] ( #25, #08 )
    COP [BC] ( #08, #00 )
}

code_06CEB8 {
    COP [D0] ( #89, #00, &code_06CECE )
    LDA #$1000
    TSB $10
    COP [C0] ( &code_06CEDF )
    COP [80] ( #15 )
    COP [89]
    BRA code_06CED3
}

code_06CECE {
    COP [80] ( #13 )
    COP [89]
}

code_06CED3 {
    COP [0F] ( #25, #08 )
    COP [C1]
    RTL 
}

code_06CEDA {
    COP [BF] ( &widestring_06CEF2 )
    RTL 
}

code_06CEDF {
    COP [D0] ( #8B, #01, &code_06CEED )
    COP [CC] ( #8B )
    COP [BF] ( &widestring_06CF5E )
    RTL 
}

code_06CEED {
    COP [BF] ( &widestring_06D039 )
    RTL 
}

widestring_06CEF2 [
  `[TPL:A][TPL:3]Ishtar: I [LU1:F9]if you're[N][LU2:73]to get Kara. [FIN]Go [LU1:A1][LU1:D6]room.[FIN]If you solve all the[N]riddles, [LU1:1F][LU1:97]back[N]the girl. [END]`   ;00
  `[PAL:0][END]`   ;01
]

widestring_06CF5E `[TPL:A][TPL:3]Ishtar:[N]I [LU1:98]been[N][LU1:FD]for you.[FIN]Sprinkle magic powder[N]on the painting, and[N][LU1:97]it a kiss.[FIN]If you [LU2:57][LU1:6B]her [N]deeply, [LU1:C8][LU1:EF][N]happen. You'll see. [FIN]I painted a[N]self-portrait.[FIN][LU2:38]I [LU1:EF]become[N]the painting...[FIN]You [LU1:B2][LU1:E7]care[N]of her...[PAL:0][END]`

widestring_06D039 `[TPL:A][TPL:3].............[PAL:0][END]`