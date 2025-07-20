
!joypad_mask_std                065A

---------------------------------------------

e_death_message {
    LDA #$CFF0
    TSB $joypad_mask_std
    STZ $0AF8
    COP [DA] ( #02 )
    LDA $0AD4
    BNE code_00D7AD
    COP [BF] ( &widestring_00D7C2 )
    BRA code_00D7BA
}

code_00D7AD {
    DEC 
    BNE code_00D7B6
    COP [BF] ( &widestring_00D818 )
    BRA code_00D7BA
}

code_00D7B6 {
    COP [BF] ( &widestring_00D848 )
}

code_00D7BA {
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

widestring_00D7C2 `[DEF]Will: I am sometimes [N]aware of having fallen [N]in a [LU2:90]I know. Must [N][LU1:98][LU1:70]a nightmare. [END]`

widestring_00D818 `[DEF]Freedan: [LU1:61]I think[N][LU1:6B]it, [LU1:D7]place[N][LU2:A0]familiar...[END]`

widestring_00D848 `[DEF]Shadow: [LU1:61]I think[N][LU1:6B]it, [LU1:D7]place[N][LU2:A0]familiar...[END]`