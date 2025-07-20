
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_gw8B_lance [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_gw8B_lance {
    COP [D0] ( #C8, #01, &code_07B7FA )
    COP [0B]
    COP [C1]
    COP [45] ( #07, #17, #09, #1B, &code_07B789 )
    RTL 
}

code_07B789 {
    COP [9C] ( @e_gw8B_lily, #$1000 )
    COP [C0] ( &code_07B7FC )
    COP [D2] ( #02, #01 )
    COP [C1]
    COP [45] ( #12, #17, #14, #1B, &code_07B7A3 )
    RTL 
}

code_07B7A3 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [05] ( #15 )
    COP [DB] ( #$0167 )
    COP [BF] ( &widestring_07B960 )
    COP [DA] ( #3B )
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07B9B1 )
    COP [CC] ( #03 )
    COP [D2] ( #04, #01 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07BA2E )
    COP [CC] ( #05 )
    COP [85] ( #09, #0A, #01 )
    COP [8A]
    COP [CC] ( #96 )
    COP [CC] ( #C8 )
    LDA #$0404
    STA $064A
    COP [26] ( #79, #$0070, #$00B0, #80, #$1100 )
    COP [C1]
    RTL 
}

code_07B7FA {
    COP [E0]
}

code_07B7FC {
    COP [D0] ( #02, #01, &code_07B81F )
    COP [D5] ( #17 )
    COP [BF] ( &widestring_07B8AD )
    COP [CC] ( #02 )
    LDA #$0200
    TSB $06EE
    LDA #$2000
    TSB $joypad_mask_std
    LDA #$2000
    TRB $0656
    RTL 
}

code_07B81F {
    COP [BF] ( &widestring_07B8AD+M )
    RTL 
}

---------------------------------------------

widestring_07B824 `[TPL:A][TPL:2]Lilly:[N][LU1:69]crazy! I've[N][LU1:70]worried sick![FIN][LU1:62]if you'd [LU1:70][N]attacked! [FIN][TPL:4]Lance: [N][LU2:35]to [LU1:98][N]worried [LU2:C7][FIN]But I got [LU1:D0]medicine[N]to cure my father.[PAL:0][END]`

widestring_07B8AD `[TPL:A][TPL:4]Lance: [N]Oh. That [LU2:9D]. . . [FIN][TPL:0]Will: If you follow the [N][LU2:9D]chips, the trail [N]leads here.[FIN][LU1:1F][LU1:97][LU1:E6]back[N]to [LU2:C7][WAI][CLD][PAU:3C][::][TPL:A][TPL:4][SFX:0][DLY:2]Lance whispers... [FIN]Lance: [N]Will...will you [LU1:E7][N][LU2:57]of [LU1:2C]for me? [END]`

widestring_07B960 `[TPL:A][TPL:4][DLY:2]Lance:[N]I was saved thanks[N]to [LU1:E4]stones...[FIN]This was the necklace [N]I [LU1:B3]for [LU2:C7][END]`

widestring_07B9B1 `[TPL:A][TPL:4]Lance: There aren't [LU1:B6][N]necklace stones left. [N]Will you [LU1:E7]them? [FIN][SFX:0][TPL:6][DLY:2]Lance, fixing the [N]necklace, puts it [N][LU1:6D]her neck. [END]`

widestring_07BA2E `[TPL:A][TPL:4][DLY:0]Lance: Wow!! [LU1:20][LU1:BB][N][DLY:1]felt [LU1:D6]way before![FIN][LU1:1D][LU1:A5]a million [N]summer days! [FIN][TPL:2][DLY:1]Lilly:[N](Sob).[N]I [LU1:91]the [LU1:CD]way.[FIN][LU1:2B]go [LU1:73]to the[N][LU2:BD]I'm sure[N][LU1:8B]worried.[END]`

---------------------------------------------

e_gw8B_lily {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA #$0068
    STA $7F0018, X
    LDA #$01A0
    STA $7F001A, X
    COP [22] ( #33, #01 )
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #24, #1E )
    COP [8A]
    COP [0B]
    COP [BF] ( &widestring_07B824 )
    COP [CC] ( #01 )
    COP [C0] ( &code_07BB84 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #03, #01 )
    COP [DA] ( #3B )
    COP [81] ( #28, #11 )
    COP [89]
    COP [84] ( #24, #3C )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #33, #04 )
    COP [8A]
    COP [BF] ( &widestring_07BBB0 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07BC42 )
    COP [84] ( #33, #06 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [80] ( #24 )
    COP [89]
    COP [DA] ( #EF )
    COP [BF] ( &widestring_07BCAA )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [85] ( #29, #0A, #01 )
    COP [8A]
    COP [C1]
    RTL 
}

code_07BB84 {
    COP [BF] ( &widestring_07BB89 )
    RTL 
}

widestring_07BB89 `[TPL:A][TPL:2]Lilly:[N]Already? You're[N]selfish....[END]`

widestring_07BBB0 `[TPL:A][TPL:4][DLY:0]Lance: Aaah... [WAI][CLD][PAU:3C][TPL:A][TPL:2][DLY:2][LU1:2A][N]I [LU1:FA]run [LU1:D6]time. [FIN]This [LU1:9D]so [N]suddenly, I [LU1:83][LU1:A4][N][LU1:F7]to do... [FIN]I [LU1:82][LU1:F1]to show [N]my face now. [FIN]I'm crying[N][LU1:8E]happiness...[END]`

widestring_07BC42 `[TPL:A][TPL:2][DLY:2][LU1:2A][LU1:20][LU2:44]felt[N][LU1:D9]was something[N][LU1:86][LU1:6B]you.[FIN]Now I [LU1:91]I know[N][LU1:F7]the difference is.[FIN]I [LU1:F1]to [LU1:97]you[N]an answer...[END]`

widestring_07BCAA `[TPL:A][TPL:2]Lilly:[N][DLY:3]I love you, too.[FIN][DLY:2]I [LU1:F1]to be with[N]you forever...[END]`