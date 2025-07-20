
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_sc06_kara_return [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_sc06_kara_return {
    COP [D0] ( #26, #01, &code_04A693 )
    COP [D0] ( #25, #01, &code_04A695 )
    COP [D0] ( #21, #00, &code_04A734 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$0008
    STA $0014, Y
    COP [9C] ( @e_sc06_actor_04AF48, #$2000 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_04A746 )
    COP [84] ( #1D, #1E )
    COP [8A]
    COP [BF] ( &widestring_04A766 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [BF] ( &widestring_04A7A8 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [81] ( #20, #02 )
    COP [89]
    COP [86] ( #1F, #02, #02 )
    COP [8A]
    COP [25] ( #03, #08 )
    COP [82] ( #1E, #01 )
    COP [89]
    COP [85] ( #21, #04, #01 )
    COP [8A]
    COP [82] ( #1E, #01 )
    COP [89]
    COP [84] ( #1C, #18 )
    COP [8A]
    COP [84] ( #1A, #18 )
    COP [8A]
    COP [84] ( #1D, #18 )
    COP [8A]
    COP [84] ( #1A, #28 )
    COP [8A]
    COP [82] ( #1F, #02 )
    COP [89]
    COP [81] ( #20, #02 )
    COP [89]
    COP [82] ( #1F, #02 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_04A7E1 )
    COP [C0] ( &code_04A736 )
    COP [D2] ( #01, #01 )
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [81] ( #20, #12 )
    COP [89]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_04A945 )
    COP [CE] ( #02 )
    COP [CC] ( #25 )
    COP [CF] ( #$0119 )
    COP [C0] ( &code_04A73E )
    COP [C1]
    RTL 
}

code_04A693 {
    COP [E0]
}

code_04A695 {
    COP [25] ( #0C, #1B )
    COP [C0] ( &code_04A73E )
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [82] ( #1F, #12 )
    COP [89]
    COP [81] ( #20, #12 )
    COP [89]
    COP [BF] ( &widestring_04A9F8 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [81] ( #20, #14 )
    COP [89]
    COP [BF] ( &widestring_04AA0D )
    COP [CC] ( #03 )
    COP [D2] ( #03, #00 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [85] ( #20, #02, #12 )
    COP [8A]
    COP [80] ( #1A )
    COP [89]
    COP [CC] ( #26 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04AA20 )
    COP [BE] ( #02, #00, &code_list_04A6F7 )
}

code_list_04A6F7 [
  &code_04A703   ;00
  &code_04A6FD   ;01
  &code_04A703   ;02
]

code_04A6FD {
    COP [BF] ( &widestring_04AA7D )
    BRA code_04A707
}

code_04A703 {
    COP [BF] ( &widestring_04AAAD )
}

code_04A707 {
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0002
    STA $0D64
    LDA #$0404
    STA $064A
    COP [65] ( #$00D4, #$03A4, #00, #03 )
    COP [26] ( #15, #$02D8, #$0370, #00, #$4500 )
    COP [C1]
    RTL 
}

code_04A734 {
    COP [E0]
}

code_04A736 {
    COP [BF] ( &widestring_04A81F )
    COP [CC] ( #01 )
    RTL 
}

code_04A73E {
    COP [BF] ( &widestring_04A9D7 )
    COP [CC] ( #01 )
    RTL 
}

widestring_04A746 `[TPL:A][TPL:0]Will: What![N][LU1:64]happened...[PAL:0][END]`

widestring_04A766 `[TPL:A][TPL:1][LU1:25][LU1:1D]awful! Who[N][LU1:F3]do [LU1:CE]a thing...[FIN][TPL:0]Will: [N]My Grandparents?![PAL:0][END]`

widestring_04A7A8 `[DLG:3,6][SIZ:D,3][TPL:1][LU1:25][N][LU1:1A]Bill![FIN][TPL:0]Will: [N][LU1:17]Lola![FIN][TPL:1][LU1:25][N][LU1:1F][LU1:A9]upstairs![PAL:0][END]`

widestring_04A7E1 `[TPL:E][TPL:1][LU1:25]Ooooh!!! Will!! [N][LU1:9]here! Quick![N][LU1:1D]terrible, terrible![PAL:0][END]`

widestring_04A81F `[TPL:E][TPL:0]Will: [LU1:62]happened?![FIN][TPL:1][LU1:25]Look at the wall![FIN]This mark, a jackal...[N]The Jackal's here![FIN][TPL:0]Will: [N]Jackal...?[FIN][TPL:1][LU1:25]He's the[N]hunter hired by[N]my mother!![FIN]An evil man who will[N]stop at nothing![FIN][LU1:39]he starts after you,[N][LU1:DB]no stopping him.[FIN]He has no regard[N]for [LU1:9A]life![FIN][TPL:0]Will: My Grandpa[N]and Grandma....[PAL:0][END]`

widestring_04A945 `[TPL:E][TPL:1][LU1:25][N]Who are you?![FIN][TPL:2][LU1:2A][N]I'm Will's friend.[FIN][TPL:0]Will: Lilly, do you know[N][LU1:6C][LU1:6B]this?[FIN][TPL:2][LU1:2A][LU1:1D]OK.[N][LU1:68][LU1:1A]and[N][LU1:17]are safe.[FIN][LU1:5D]in my village.[FIN][TPL:1][LU1:25][LU1:68]village?[PAL:0][END]`

widestring_04A9D7 `[TPL:E][TPL:1]I [LU1:DA][LU1:C8]good[N]is [LU1:93]to happen.[PAL:0][END]`

widestring_04A9F8 `[TPL:A][TPL:1][LU1:25][N][LU1:69]nitpicking.[END]`

widestring_04AA0D `[TPL:A][TPL:1][LU1:25][N]Crazy girl![END]`

widestring_04AA20 `[TPL:B][TPL:1][LU1:25][LU1:1C]Will, [N]aren't you my friend,[N]too!?[FIN][PAL:0] [LU1:6A]of course.[N] I, umm,  I'm [LU1:93][N] to the village.`

widestring_04AA7D `[CLR][TPL:1][LU1:25][N]I'm glad, Will. Let's[N]go hand in hand.[FIN][JMP:&widestring_04AAAD+M]`

widestring_04AAAD `[TPL:2][CLR]Lilly:[N]I'm [LU1:93][LU1:F0]you.[N][LU1:2B]go.[FIN][::][SFX:10][PAL:0]Together,[N]the three set off for[N][LU2:18]village.[END]`

---------------------------------------------

e_sc06_actor_04AF48 {
    COP [0F] ( #05, #1D )
    COP [0F] ( #06, #1D )

  code_04AF50:
    COP [C1]
    COP [D0] ( #25, #01, &code_04AF75 )
    COP [45] ( #05, #1C, #07, #1D, &code_04AF61 )
    RTL 
}

code_04AF61 {
    COP [40] ( #$0400, &code_04AF6C )
    COP [C4] ( @code_04AF50 )
}

code_04AF6C {
    COP [BF] ( &widestring_04AF7F )
    COP [C4] ( @code_04AF50 )
}

code_04AF75 {
    COP [10] ( #05, #1D )
    COP [10] ( #06, #1D )
    COP [E0]
}

widestring_04AF7F `[TPL:A][TPL:0]Will: [N](I suspect [LU1:DB]a[N] clue in the house...)[PAL:0][END]`