
!joypad_mask_std                065A

---------------------------------------------

h_eu92_rofsky [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_eu92_rofsky {
    COP [D0] ( #9E, #01, &code_07D606 )
    COP [CC] ( #9E )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07D6C2 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07D606 {
    COP [0B]
    COP [C0] ( &code_07D60F )
    COP [C1]
    RTL 
}

code_07D60F {
    COP [D6] ( #19, &code_07D619 )
    COP [BF] ( &widestring_07D61E )
    RTL 
}

code_07D619 {
    COP [BF] ( &widestring_07D764 )
    RTL 
}

widestring_07D61E `[TPL:B][TPL:3]Rofsky:[N]There is a dispute about[N]the teapot enshrined[N]at Mt.Kress temple.[FIN]On Mt.Kress, [LU1:D9]are [N]enshrined tears once [N]shed by a spirit. Legend[N]says [LU2:AB][LU1:D1]people.[PAL:0][END]`

widestring_07D6C2 `[TPL:9][TPL:0]Two old [LU1:C1]are[N]arguing [LU1:6B]something.[WAI][CLD][PAU:1E][TPL:B][TPL:3]Rofsky:[N]True genius is a violent[N]thing![N]It sounds [LU1:A5]a tempest![FIN][TPL:3][TPL:4]Erasquez:[N]You [LU1:A3]dash off[N]packs of lies!![N][LU1:D]brag![END]`

widestring_07D764 `[TPL:A][TPL:3]Rofsky:[N]Oh, that's the Teapot...[N]It [LU2:95]does exist...[PAL:0][END]`