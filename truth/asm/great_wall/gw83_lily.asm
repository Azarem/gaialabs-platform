
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_gw83_lily [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_gw83_lily {
    COP [D0] ( #93, #01, &code_07B6FD )
    COP [C1]
    COP [45] ( #3B, #08, #3D, #0B, &code_07B68B )
    RTL 
}

code_07B68B {
    LDA #$0080
    TSB $09EC
    COP [CC] ( #93 )
    LDA #$2000
    TRB $10
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_07B6FF )
    COP [88] ( @table_0EE000 )
    COP [85] ( #33, #04, #03 )
    COP [8A]
    COP [85] ( #33, #04, #01 )
    COP [8A]
    COP [81] ( #33, #11 )
    COP [89]
    COP [81] ( #33, #13 )
    COP [89]
    COP [84] ( #33, #04 )
    COP [8A]
    COP [BF] ( &widestring_07B709 )
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07B731 )
    LDA #$EFF0
    TRB $joypad_mask_std
    LDA #$0080
    TRB $09EC
}

code_07B6FD {
    COP [E0]
}

widestring_07B6FF `[TPL:C][TPL:2]Wait![END]`

widestring_07B709 `[TPL:D][TPL:2][LU1:2A][N]Are you [LU1:AB]for Lance?[FIN][LU1:1F]go [LU1:F0]you![END]`

widestring_07B731 `[TPL:E][TPL:2][LU1:2A]Ha ha. [LU1:1D][LU1:70][N]a [LU1:A6][LU1:DF][LU2:A4]I [N]borrowed Will's pocket. [FIN][LU1:63]let's go.[END]`