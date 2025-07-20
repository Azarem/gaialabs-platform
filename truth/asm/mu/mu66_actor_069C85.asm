
!joypad_mask_std                065A
!camera_bounds_y                06DC

---------------------------------------------

h_mu66_actor_069C85 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mu66_actor_069C85 {
    COP [45] ( #20, #00, #30, #10, &code_069CAF )
    COP [D0] ( #82, #01, &code_069CAC )
    COP [CC] ( #82 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_069CB7 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_069CAC {
    COP [C1]
    RTL 
}

code_069CAF {
    LDA #$0100
    STA $camera_bounds_y
    COP [E0]
}

widestring_069CB7 `[TPL:B][TPL:0]This [LU1:AA][LU1:A5]an [N][LU1:6F]burial [LU1:96][N]for the [LU1:C1]of Mu. [N][PAL:0][END]`