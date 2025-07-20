
!joypad_mask_std                065A

---------------------------------------------

h_mtA0_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mtA0_intro {
    COP [D0] ( #A7, #01, &code_07E77C )
    COP [CC] ( #A7 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07E77E )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07E77C {
    COP [E0]
}

widestring_07E77E `[TPL:F][TPL:0]There's a [LU1:C7][LU2:90][N]at the summit [N]of Mt.Kress. [FIN]There are [LU2:83][N][LU1:B6][LU2:AA]bigger [LU2:B5] [N]me, and plant stalks [N]are [LU2:9F]around.[PAL:0][END]`