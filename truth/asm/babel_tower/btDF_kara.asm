?INCLUDE 'func_00C6E4'
?INCLUDE 'func_00C806'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_btDF_kara [
  h_actor < #1A, #00, #30 >   ;00
]

---------------------------------------------

e_btDF_kara {
    COP [D0] ( #D4, #01, &code_099EA0 )
    COP [C1]
    COP [45] ( #70, #09, #72, #0D, &code_099EA2 )
    RTL 
}

code_099EA0 {
    COP [E0]
}

code_099EA2 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_099F1B )
    LDA #$0003
    JSL $@func_00C6E4
    COP [25] ( #75, #09 )
    LDA #$2000
    TRB $10
    COP [82] ( #1E, #01 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [BF] ( &widestring_099F2A )
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$0010
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #20, #01 )
    COP [04] ( #04 )
    COP [DA] ( #77 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0004
    STA $7F0010, X
    LDA #$001A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [CC] ( #D4 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

widestring_099F1B `[TPL:A][TPL:1]Wait....[PAL:0][END]`

widestring_099F2A `[TPL:B][TPL:0][DLY:0]Will: [N]Kara!!!? [FIN][TPL:1][LU1:25]I'm sorry. [N]I [LU1:A3][LU1:91]that, if [N]we part now, we'll [N][LU1:BB][LU2:87]again... [FIN][TPL:0]Will: [N]But Kara, why [LU1:98]you [N][LU1:79]here? [FIN]You [LU1:78][LU1:79]here[N]unless you [LU1:98]the[N][LU1:7]Ring...[FIN][TPL:1][LU1:25]Could [LU1:D7][N]be the ring... [N][LU2:7]you [LU1:90]it [N]in the Incan [LU1:19]Ship? [FIN][TPL:0]This [LU1:7]Ring is[N][LU2:5C]blue...[FIN]The ring you [LU1:98]is[N][LU1:A8]blue...[FIN]A [LU1:A8]one[N]and a [LU2:5C]one...[FIN]Will: I understand.. [N]No [LU1:B8][LU1:F7]happens, [N][LU1:82][LU1:AC]me.[PAL:0][END]`