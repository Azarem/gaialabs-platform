

---------------------------------------------

h_av69_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_av69_kara {
    COP [D0] ( #8D, #01, &av69_kara_destroy )
    COP [D0] ( #75, #01, &av69_kara_destroy )
    COP [D2] ( #02, #01 )
    COP [80] ( #1D )
    COP [89]
    COP [BF] ( &widestring_06C3B1 )
    LDA #$0800
    TSB $10
    COP [81] ( #20, #02 )
    COP [89]
    COP [86] ( #1F, #02, #02 )
    COP [8A]
    COP [CC] ( #03 )
    COP [85] ( #20, #05, #02 )
    COP [8A]
}

av69_kara_destroy {
    COP [E0]
}

---------------------------------------------

widestring_06C3B1 `[TPL:A][TPL:1][LU1:25]What! [N]Will! [LU1:9][LU1:F0]me! [FIN][LU1:62]are you [N]grinning about? [FIN][LU1:1F]explore [LU1:D6][LU2:90][N]myself. [LU1:D][N]try to follow me![PAL:0][END]`