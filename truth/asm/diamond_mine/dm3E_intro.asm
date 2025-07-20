
!scene_current                  0644
!joypad_mask_std                065A

---------------------------------------------

h_dm3E_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_dm3E_intro {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA $scene_current
    CMP #$003E
    BEQ code_05F9BA
    CMP #$004C
    BEQ code_05F9CC

  code_05F9B2:
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_05F9BA {
    COP [D0] ( #6A, #01, &code_05F9B2 )
    COP [CC] ( #6A )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_05F9DE )
    BRA code_05F9B2
}

code_05F9CC {
    COP [D0] ( #6B, #01, &code_05F9B2 )
    COP [CC] ( #6B )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_05FA59 )
    BRA code_05F9B2
}

widestring_05F9DE `[TPL:B][TPL:0]Will: [N]The [LU1:E]Mine was [N]as quiet as a tomb. [FIN]A chill ran down Will's [N]spine [LU1:F6]he [LU1:99]the [N]screams [LU1:8E]the [N][LU1:73]of the cave.[PAL:0][END]`

widestring_05FA59 `[TPL:F][TPL:0]Will: There's a strange[N]garden floating in the [N]sky [LU1:BE]Nazca... [FIN]On the ground, [LU2:23]and [N]my friends [LU1:A9][LU1:A5][N]tiny ants [LU1:93][N][LU1:73]and forth. [FIN]Could the paintings[N]be an airport[N]for the Sky Garden?[PAL:0][END]`