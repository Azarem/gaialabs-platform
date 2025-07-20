?INCLUDE 'table_0EDA00'
?INCLUDE 'func_0AA3FD'

!joypad_mask_std                065A
!player_flags                   09AE

---------------------------------------------

h_fr32_kidnapper [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_kidnapper {
    COP [D0] ( #67, #01, &code_05B39F )
    COP [0F] ( #04, #0D )
    COP [B6] ( #10 )
    COP [BC] ( #08, #02 )
    COP [27] ( #08 )
    COP [45] ( #05, #0E, #0B, #12, &code_05B38E )
    RTL 
}

code_05B38E {
    COP [81] ( #20, #02 )
    COP [89]
    COP [A0] ( @code_05B3A1, #$0048, #$00E0, #$1000 )
}

code_05B39F {
    COP [E0]
}

code_05B3A1 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [B6] ( #20 )
    COP [C0] ( &code_05B40B )
    COP [06] ( #0E )
    COP [80] ( #01 )
    COP [89]
    COP [0B]
    COP [D2] ( #67, #01 )
    PHX 
    LDX #$0000

  code_05B3C4:
    LDA $@pal_sc01_actors+E0, X
    STA $7F0BE0, X
    INX 
    INX 
    CPX #$0020
    BNE code_05B3C4
    PLX 
    LDA #$2000
    TSB $joypad_mask_std
    LDA #$0008
    TRB $player_flags
    JSL $@func_0AA3FD
    LDA #$0005
    STA $7F0026, X
    LDA #$1000
    TRB $10
    LDA #$0100
    TSB $10
    COP [5B] ( #$0008 )
    COP [C1]
    COP [45] ( #07, #0E, #08, #12, &code_05B404 )
    RTL 
}

code_05B404 {
    COP [BF] ( &widestring_05B55F )
    COP [C1]
    RTL 
}

code_05B40B {
    COP [D0] ( #66, #01, &code_05B416 )
    COP [BF] ( &widestring_05B42E )
    RTL 
}

code_05B416 {
    COP [BF] ( &widestring_05B45E )
    COP [CC] ( #67 )
    COP [0F] ( #08, #0E )
    COP [0F] ( #08, #0F )
    COP [0F] ( #08, #10 )
    COP [0F] ( #08, #11 )
    RTL 
}

widestring_05B42E `[DEF][LU2:1C]voice: If you[N][LU1:82][LU1:F1]to lose[N][LU1:FE]lives, go home!![END]`

widestring_05B45E `[DEF][LU2:1C]voice: If you[N][LU1:82][LU1:F1]to lose[N][LU1:FE]lives, go home!![FIN][TPL:0]Will: [N]Is a man [LU2:54][N]Erik there? [FIN][PAL:0][LU2:1C]voice:[N][LU1:20][LU1:BB][LU1:99]of[N][LU1:CE]a name. Why[N]do you ask?[FIN][TPL:3]Will? Is [LU1:D7]Will's [N]voice? Save me... [PAL:0][PAU:B4]Bonk![FIN][LU2:1C]voice: Shhhh...[N][LU1:1C]boy, be quiet...![FIN][TPL:0]Will: (I'll break [N]down the door..) [N][PAL:0][END]`

widestring_05B55F `[DEF][TPL:0]Will: [N]If I [LU1:82][LU1:D1]Erik...[PAL:0][END]`