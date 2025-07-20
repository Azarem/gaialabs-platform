
!joypad_mask_std                065A

---------------------------------------------

h_fr32_kara [
  h_actor < #2B, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_kara {
    COP [D0] ( #65, #01, &code_05B0F6 )
    COP [D0] ( #57, #01, &code_05B0F6 )
    COP [D0] ( #64, #01, &code_05B0B8 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [82] ( #2F, #12 )
    COP [89]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [BF] ( &widestring_05B100 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [80] ( #2A )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_05B14B )
    COP [CC] ( #64 )
    COP [CC] ( #03 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [DA] ( #1F )
    COP [81] ( #31, #11 )
    COP [89]
    COP [86] ( #2F, #02, #02 )
    COP [8A]
    COP [85] ( #31, #09, #01 )
    COP [8A]
    COP [86] ( #2F, #06, #02 )
    COP [8A]
}

code_05B0B8 {
    COP [80] ( #2D )
    COP [89]
    COP [25] ( #27, #25 )
    COP [0B]
    COP [C0] ( &code_05B0F8 )
    COP [D2] ( #04, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [80] ( #2B )
    COP [89]
    COP [DA] ( #1D )
    COP [CC] ( #05 )
    COP [DA] ( #1D )
    COP [82] ( #2F, #12 )
    COP [89]
    COP [CC] ( #57 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_05B0F6 {
    COP [E0]
}

code_05B0F8 {
    COP [BF] ( &widestring_05B16F )
    COP [CC] ( #04 )
    RTL 
}

widestring_05B100 `[TPL:E][TPL:1][LU1:25]Oh, [LU1:9F]nice!! [N][LU1:62]a [LU1:95][N]city!!! [FIN][LU1:3D]who [LU1:AF]in [LU1:CE][N]a [LU2:92][LU2:90][LU1:B2][N][LU1:98][LU1:76]hearts...[PAL:0][END]`

widestring_05B14B `[TPL:E][TPL:1][LU1:25][N][LU1:D]you [LU1:A5]it, Will!! [N][LU1:2B]go!![PAL:0][END]`

widestring_05B16F `[TPL:E][TPL:1][LU1:25][N]This is the hotel! [N][LU1:2B]go in![PAL:0][END]`