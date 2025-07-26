
---------------------------------------------

h_wa7F_lance [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_wa7F_lance {
    COP [BC] ( #08, #00 )
    COP [D2] ( #01, #01 )
    COP [9E] ( @code_07B1C2, #$000A, #$FFF4, #$1002 )
    COP [80] ( #38 )
    COP [89]
    COP [D2] ( #02, #01 )
    COP [80] ( #05 )
    COP [89]
    COP [DA] ( #1D )
    COP [D2] ( #03, #01 )
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07B0A2 )
    COP [DA] ( #1D )
    COP [80] ( #05 )
    COP [89]
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07B0E1 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_07B108 )
    COP [DA] ( #77 )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [9C] ( @code_07B077, #$2000 )
    LDA #$0800
    TSB $10
    LDA #$02F8
    STA $7F0018, X
    LDA #$0120
    STA $7F001A, X
    COP [22] ( #06, #02 )
    LDA #$0800
    TRB $10
    COP [C2]
    COP [9C] ( @code_07B07D, #$2000 )
    LDA #$0800
    TSB $10
    COP [84] ( #02, #78 )
    COP [8A]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [84] ( #02, #78 )
    COP [8A]
    COP [86] ( #07, #06, #14 )
    COP [8A]
    COP [80] ( #03 )
    COP [89]
    COP [C1]
    RTL 
}

code_07B077 {
    COP [BF] ( &widestring_07B158 )
    COP [E0]
}

code_07B07D {
    COP [DA] ( #77 )
    COP [BF] ( &widestring_07B174 )
    COP [DA] ( #3B )
    COP [CC] ( #91 )
    LDA #$0404
    STA $064A
    LDA #$0200
    STA $0648
    COP [26] ( #79, #$0070, #$00B0, #00, #$1100 )
    COP [E0]
}

widestring_07B0A2 `[DEF][TPL:4]Lance: [LU1:6A]the words are [N]harder to say [LU2:B5][N]a tongue twister. [END]`

widestring_07B0E1 `[DEF][TPL:4][DLY:2]Lance: [N]Lilly... [N][PAU:1E]I love you...[END]`

widestring_07B108 `[DEF][TPL:4][DLY:2]Lance: [N]You [LU1:82][LU1:98]to [N]answer [LU2:94]away... [FIN]But, [PAU:1E]I [LU1:FC]to [N][LU2:AD]you how I feel...[PAL:0][END]`

widestring_07B158 `[TPL:A][TPL:4]Lance: [N]Lilly! Wait![PAU:3C][CLD]`

widestring_07B174 `[TPL:A][TPL:0]Will: [N]We had no idea [N][LU1:F7]had happened. [FIN]That day, [LU1:2C][LU1:83][N][LU1:79][LU1:73]to her room.[PAL:0][END]`

code_07B1C2 {
    COP [80] ( #3A )
    COP [89]
    COP [D2] ( #02, #01 )
    COP [E0]
}