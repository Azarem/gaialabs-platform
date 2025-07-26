
?INCLUDE 'player_character'
?INCLUDE 'thinker_00B7EA'

!joypad_mask_std                065A
!player_actor                   09AA
!_TM                            212C
!CGADSUB                        2131
!COLDATA                        2132

---------------------------------------------

h_gs2C_descent [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_gs2C_descent {
    COP [D0] ( #4C, #01, &code_0581FD )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [CD] ( #$0185 )
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$B1
    STA $CGADSUB
    LDA #$FF
    STA $COLDATA
    REP #$20
    LDY $player_actor
    LDA #$00D0
    STA $0014, Y
    LDA #$0020
    STA $0016, Y
    LDA $0010, Y
    AND #$FFF7
    ORA #$0200
    STA $0010, Y
    SEP #$20
    LDA #$^code_02C63B
    STA $0002, Y
    REP #$20
    LDA #$&code_02C63B
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    COP [C1]
    COP [28] ( #$00D0, #$0240, &code_0581DD )
    RTL 
}

code_0581DD {
    COP [CA] ( #3C )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [CB]
    COP [3C] ( @e_thinker_00B7EA )
    COP [DA] ( #BF )
    COP [CC] ( #4C )
    COP [BF] ( &widestring_0581FF )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_0581FD {
    COP [E0]
}

widestring_0581FF `[DLG:3,12][SIZ:D,2][TPL:0]Will: This is the [N]Incan [LU1:19]Ship?! [FIN]What?! I [LU1:91]like[N]someone's there...[PAL:0][END]`