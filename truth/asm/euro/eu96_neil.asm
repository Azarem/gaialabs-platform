
!joypad_mask_std                065A

---------------------------------------------

h_eu96_neil [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_eu96_neil {
    COP [D0] ( #AC, #01, &code_07DB5D )
    COP [D0] ( #AB, #01, &code_07DBD2 )
    COP [D0] ( #AA, #01, &code_07DB5F )
    COP [D0] ( #A4, #01, &code_07DB5D )
    COP [CC] ( #A4 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07DBE9 )
    COP [86] ( #16, #02, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07DB5D {
    COP [E0]
}

code_07DB5F {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [25] ( #0A, #11 )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07DC37 )
    COP [DA] ( #1D )
    COP [86] ( #17, #04, #12 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_07DC63 )
    COP [DA] ( #27 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07DD70 )
    COP [CC] ( #01 )
    COP [D2] ( #01, #00 )
    COP [84] ( #14, #10 )
    COP [8A]
    COP [84] ( #12, #10 )
    COP [8A]
    COP [BF] ( &widestring_07DDBF )
    COP [9E] ( @code_07DECB, #$0000, #$0020, #$1800 )
    COP [D2] ( #02, #01 )
    COP [04] ( #02 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_07DDD2 )
    COP [CC] ( #AB )
    COP [C0] ( &code_07DBE4 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_07DBD2 {
    COP [25] ( #0A, #0A )
    COP [80] ( #12 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_07DBE4 )
    COP [C1]
    RTL 
}

code_07DBE4 {
    COP [BF] ( &widestring_07DEAD )
    RTL 
}

widestring_07DBE9 `[TPL:A][TPL:6][LU1:36][N][LU1:63][LU2:84]yourself at [N]home.. [FIN]I [LU1:F1]to [LU2:AC]to my[N]parents. [LU1:1D]been[N]three years.[PAL:0][END]`

widestring_07DC37 `[TPL:A][TPL:0]The [LU1:BC]morning.[N]Disappointment awaits...[END]`

widestring_07DC63 `[TPL:B][TPL:6][LU1:36]Good morning. [N][LU2:35][LU1:6B]yesterday.[FIN]I [LU1:D8][LU1:6B]it all[N]night. I'm [LU1:BC]in line[N]to inherit [LU1:D6]company.[FIN]If I [LU1:F1]to stop the[N][LU1:AD]trade, I [LU1:98]to[N][LU2:52]the company[N][LU1:D7][LU1:CB]it...[FIN]They [LU2:84]money on[N][LU1:9A]misfortune.[FIN][TPL:1][LU1:25][LU1:69][LU1:93]to [N][LU1:71]the [LU2:8D]of [N]the company? Amazing! [FIN][TPL:6][LU1:36]Heh heh. Stop it.[N][LU1:69]embarrassing me.[END]`

widestring_07DD70 `[TPL:B][TPL:6][DLY:2][LU1:36]Kara, someone's [N][LU1:79]asking [LU1:6B][LU2:C7][N][LU1:4B][LU1:6B][LU1:77][N]an old friend. [FIN][TPL:1][DLY:0][LU1:25][N]What!!!? [END]`

widestring_07DDBF `[TPL:A][TPL:6][LU1:36][N][LU2:15][LU1:9]on in! [END]`

widestring_07DDD2 `[TPL:B][TPL:1][LU1:25][N]Hamlet!! [FIN][TPL:6][DLY:1][LU1:3A]oink![FIN][TPL:1][LU1:62]happened?[N]Are you OK!?[FIN][TPL:6][LU1:36]Ha ha. [N]He's [LU1:79]all [LU1:D6]way [N][LU1:AB]for [LU2:C7][FIN][LU1:2C][LU1:8F]him in [N]Watermia and sent him by[N]Rolek's Delivery[N]Service.[FIN][LU1:12]if I'm losing my[N][LU2:B1]companions,[N]my allies are increasing![PAL:0][END]`

widestring_07DEAD `[TPL:A][TPL:6][LU1:36][N]Take care, everyone.[PAL:0][END]`

code_07DECB {
    COP [82] ( #2F, #02 )
    COP [89]
    COP [81] ( #30, #12 )
    COP [89]
    COP [82] ( #2F, #02 )
    COP [89]
    COP [85] ( #30, #02, #12 )
    COP [8A]
    COP [C1]
    COP [8B]
    COP [0B]
    COP [C0] ( &code_07DEF4 )
    COP [CC] ( #02 )
    COP [C1]
    RTL 
}

code_07DEF4 {
    COP [BF] ( &widestring_07DEF9 )
    RTL 
}

widestring_07DEF9 `[TPL:8][LU1:3A]oink[PAL:0][END]`