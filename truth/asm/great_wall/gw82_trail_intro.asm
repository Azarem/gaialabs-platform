
!joypad_mask_std                065A

---------------------------------------------

h_gw82_trail_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_gw82_trail_intro {
    COP [D0] ( #9D, #01, &code_07B54E )
    COP [CC] ( #9D )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07B550 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07B54E {
    COP [E0]
}

widestring_07B550 `[TPL:9][TPL:0]I [LU2:63]Lance's trail [N]to the [LU1:16]Wall. [FIN]A corridor stretched[N]to the [LU1:85]horizon.[END]`