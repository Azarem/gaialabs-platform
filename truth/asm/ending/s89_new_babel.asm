
!joypad_mask_std                065A
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_s89_new_babel [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_s89_new_babel {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$4001
    TSB $09EC
    SEP #$20
    LDA #$11
    STA $_TM
    LDA #$04
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$01
    STA $CGADSUB
    REP #$20
    COP [DB] ( #$00EF )
    COP [BF] ( &widestring_0BE075 )
    COP [DB] ( #$01DF )
    COP [05] ( #14 )
    COP [DA] ( #B3 )
    LDA #$0404
    STA $064A
    COP [26] ( #F7, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

widestring_0BE075 `[DEF][SFX:0][DLY:8]The [LU2:B][LU1:A9]had[N]changed, but, glowing[N]in the sky, it was[N]as [LU1:76]as ever.[PAU:B4][CLR]Buildings replaced the [N]forests, rivers became [N]roads, but the villages [N]held [LU2:89]smiling faces.[PAU:B4][CLR]But the [LU1:14]was[N]the [LU2:89]one[N][LU1:D7][LU2:80]sad.[PAU:B4][CLR]Tomorrow morning [N][LU1:26]and I [LU1:EF]start [N]our new lives.[PAU:B4][CLR]The Tower of Babel[N][LU1:D5]tall, as if it[N]knows the whole future[N]of the Earth...[PAU:F0][CLD]`