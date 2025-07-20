
!scene_current                  0644
!joypad_mask_std                065A

---------------------------------------------

h_sp5A_monologue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sp5A_monologue {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA $scene_current
    CMP #$005A
    BEQ code_0684B9
    CMP #$005F
    BEQ code_0684CB
    CMP #$0061
    BEQ code_0684DD

  code_0684B1:
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_0684B9 {
    COP [D0] ( #6E, #01, &code_0684B1 )
    COP [CC] ( #6E )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0684F5 )
    BRA code_0684B1
}

code_0684CB {
    COP [D0] ( #77, #01, &code_0684B1 )
    COP [CC] ( #77 )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06856E )
    BRA code_0684B1
}

code_0684DD {
    COP [D0] ( #7C, #01, &code_0684B1 )
    COP [D0] ( #7B, #00, &code_0684B1 )
    COP [CC] ( #7C )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0685D3 )
    BRA code_0684B1
}

widestring_0684F5 `[TPL:A][TPL:0]The [LU1:BC][LU1:E3]he knew, [N]Will was standing in a [N][LU1:9C]palace. [FIN]Will: I couldn't [N]remember [LU1:6C]since[N]my [LU2:C0]landing...[FIN]Is [LU1:89]safe?[PAL:0][END]`

widestring_06856E `[TPL:F][TPL:0]Will: [LU1:2C]and I set [N]foot on Mu. [FIN]They [LU1:EF][LU2:8F][N]welcome us after waking [N][LU1:8E]a sleep of [N][LU2:B8]of years...[PAL:0][END]`

widestring_0685D3 [
  `[TPL:E][TPL:2][LU1:2A]Ah! There's less[N][LU2:C0][LU2:B5]before![FIN]It [LU1:AA][LU1:A5]we can now[N]explore new areas.[END]`   ;00
  `[PAL:0][END]`   ;01
]