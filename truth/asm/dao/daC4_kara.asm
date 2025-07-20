
!joypad_mask_std                065A

---------------------------------------------

h_daC4_kara [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_daC4_kara {
    COP [D0] ( #D2, #01, &code_08A4CF )
    COP [D0] ( #D0, #01, &code_08A4C0 )
    COP [D0] ( #BB, #01, &code_08A4CF )
}

code_08A4C0 {
    COP [0B]
    COP [C0] ( &code_08A4D1 )
    COP [D0] ( #B6, #00, &code_08A4D6 )
    COP [C1]
    RTL 
}

code_08A4CF {
    COP [E0]
}

code_08A4D1 {
    COP [BF] ( &widestring_08A51E )
    RTL 
}

code_08A4D6 {
    COP [CC] ( #B6 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08A4EF )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

widestring_08A4EF `[TPL:A][TPL:0]A [LU1:E2]shining in the [N]desert. We [LU2:C1]to Dao.[PAL:0][END]`

widestring_08A51E `[TPL:B][TPL:1][LU1:25]This [LU2:90]is [N]supposed to be famous [N]for [LU1:AD]merchants. [N]It [LU1:84][LU1:A9][LU1:A5]it.[PAL:0][END]`