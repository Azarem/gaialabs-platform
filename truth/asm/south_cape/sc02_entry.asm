?BANK 04

!joypad_mask_std                065A
!player_y_pos                   09A4

---------------------------------------------

h_sc02_entry [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sc02_entry {
    COP [D0] ( #15, #01, &code_04BE57 )
    COP [CC] ( #15 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04BE87 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04BE57 {
    COP [C1]
    LDA $player_y_pos
    CMP #$00D0
    BEQ code_04BE62
    RTL 
}

code_04BE62 {
    COP [D0] ( #04, #01, &code_04BE73 )
    COP [26] ( #01, #$0290, #$02B0, #03, #$4300 )
    RTL 
}

code_04BE73 {
    COP [40] ( #$0400, &code_04BE7E )
    COP [C4] ( @code_04BE57 )
}

code_04BE7E {
    COP [BF] ( &widestring_04BF35 )
    COP [C4] ( @code_04BE57 )
}

widestring_04BE87 `[DLG:3,6][SIZ:D,4][TPL:0]It was natural for the[N]four friends to call [N][LU1:D6]seaside cave their[N]second home.[FIN]Usually, [LU1:F6]lessons[N][LU1:F2]done at the school,[FIN][LU2:AB]gathered [LU1:D9]to[N][LU2:AC]and play games[N][LU2:BC]sundown.[PAL:0][END]`

widestring_04BF35 `[TPL:A][TPL:4]Lance: [N]What, Will? [N]Going [LU2:72]already?[FIN][LU1:1D]not dinner [LU1:DF][N]yet. [LU1:2B]play a little[N][LU2:BF]longer.[PAL:0][END]`