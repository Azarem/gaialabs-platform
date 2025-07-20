
!joypad_mask_std                065A

---------------------------------------------

h_awB0_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_awB0_intro {
    COP [D0] ( #BE, #01, &code_089805 )
    COP [D0] ( #B3, #01, &code_089805 )
    COP [CC] ( #B3 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_089807 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_089805 {
    COP [E0]
}

widestring_089807 `[TPL:B][TPL:0]Through the jungle, [N]three days journey [N][LU1:8E]the native village, [N][LU1:D9]is a [LU1:9C]temple.[PAL:0][END]`