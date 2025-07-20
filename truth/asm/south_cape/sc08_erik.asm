
!joypad_mask_std                065A

---------------------------------------------

h_sc08_erik [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_sc08_erik {
    COP [D0] ( #10, #01, &code_048DCF )
    COP [D2] ( #10, #01 )
    COP [84] ( #0C, #1E )
    COP [8A]
    COP [BF] ( &widestring_048DD1 )
    COP [CC] ( #01 )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_048E00 )
    COP [81] ( #11, #01 )
    COP [89]
    COP [82] ( #0F, #02 )
    COP [89]
    COP [85] ( #11, #02, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_048DCF {
    COP [E0]
}

widestring_048DD1 `[TPL:B][TPL:5]Seth:[N][LU1:1F]see you guys[N]at the usual place![PAL:0][END]`

widestring_048E00 `[TPL:B][TPL:3]Erik:[N]I [LU1:98]to go home[N]first. [LU1:1F]see you guys[N][LU1:D9]later.[FIN]If you [LU1:82]hurry home, [N][LU1:FE][LU2:85][LU1:EF][LU1:DA][N][LU1:D7]you [LU1:F2]kept after [N]school....Heh heh heh.[PAL:0][END]`