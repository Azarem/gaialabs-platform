
!joypad_mask_std                065A

---------------------------------------------

h_av69_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_av69_lance {
    COP [D0] ( #8D, #01, &av69_lance_destroy )
    COP [D0] ( #75, #01, &av69_lance_destroy )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06BAFA )
    COP [86] ( #07, #02, #02 )
    COP [8A]
    COP [81] ( #08, #12 )
    COP [89]
    COP [80] ( #03 )
    COP [89]
    COP [BF] ( &widestring_06BB50 )
    COP [CC] ( #01 )
    COP [84] ( #05, #1E )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [CC] ( #75 )
    COP [81] ( #08, #12 )
    COP [89]
    COP [86] ( #07, #02, #02 )
    COP [8A]
    COP [81] ( #09, #01 )
    COP [89]
    COP [81] ( #09, #11 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [82] ( #06, #11 )
    COP [89]
    COP [86] ( #07, #02, #13 )
    COP [8A]
}

av69_lance_destroy {
    COP [E0]
}

widestring_06BAFA `[TPL:B][TPL:6][LU1:36][LU2:3F][LU2:73][N]at last. [LU2:41]walked[N][LU1:DC]the tunnel for[N][LU2:47]a month... [FIN][TPL:4]Lance: [N]Look! A sign![PAL:0][END]`

widestring_06BB50 `[TPL:A][TPL:4]Lance: What? [N]Angel Tribe? Travellers, [N][LU2:8E]use [LU1:D6]room?[FIN][TPL:6][LU1:36]Angels [LU1:B1][N]in a [LU2:90][LU1:A5]this? [FIN][TPL:6][LU1:36]They say angels [N][LU1:82][LU1:A5]meeting [N][LU1:F0]people. [FIN][LU2:F]we can [LU2:9C]in[N][LU1:D7]room...[PAL:0][END]`