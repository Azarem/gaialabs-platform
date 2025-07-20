
!joypad_mask_std                065A
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_s90_changed_world [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_s90_changed_world {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$4001
    TSB $09EC
    SEP #$20
    LDA #$02
    STA $CGWSEL
    LDA #$41
    STA $CGADSUB
    REP #$20
    COP [DA] ( #77 )
    COP [37] ( #77 )
    COP [39]
    COP [32] ( #80 )
    COP [33]
    COP [37] ( #78 )
    COP [39]
    COP [DA] ( #77 )
    COP [37] ( #77 )
    COP [39]
    COP [32] ( #81 )
    COP [33]
    COP [37] ( #78 )
    COP [39]
    COP [DA] ( #77 )
    COP [37] ( #77 )
    COP [39]
    COP [32] ( #82 )
    COP [33]
    COP [37] ( #78 )
    COP [39]
    COP [DA] ( #77 )
    COP [37] ( #77 )
    COP [39]
    COP [32] ( #83 )
    COP [33]
    COP [37] ( #78 )
    COP [39]
    COP [DA] ( #77 )
    COP [37] ( #77 )
    COP [39]
    COP [32] ( #84 )
    COP [33]
    COP [37] ( #78 )
    COP [39]
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_0BDED4 )
    COP [DA] ( #B3 )
    LDA #$0404
    STA $064A
    COP [26] ( #E5, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

widestring_0BDED4 `[DLG:3,13][SIZ:D,3][SFX:0][TPL:0][SFX:0][DLY:6]Will: [N][LU1:49]the land [N]has [LU2:AF]on [N]a [LU1:C7]shape.[PAU:B4][CLR][TPL:4][SFX:0]Will's father: [N]That's the new world.[PAU:B4][CLR][TPL:1][SFX:0][LU1:25][N]New world?[PAU:B4][CLR][TPL:4][SFX:0]Will's father: The path [N]of evolution, [LU1:7F][N]by the comet, has [N]continued [LU2:BC]now.[PAU:B4][CLR]The Earth, too,[N]has a life.[N][PAU:3C]It, [LU2:B7]has evolved and[N][LU1:7F]its shape.[PAU:B4][CLR]Now [LU1:D7]the [LU1:7B]has[N]no influence on the[N]world, [LU1:9F][LU2:96]to[N]its [LU1:C0]condition.[PAU:B4][CLD]`