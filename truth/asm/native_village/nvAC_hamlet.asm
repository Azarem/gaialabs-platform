?INCLUDE 'table_0EE000'

!joypad_mask_std                065A

---------------------------------------------

h_nvAC_hamlet [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_nvAC_hamlet {
    LDA #$0200
    TSB $12
    COP [D0] ( #B3, #01, &code_0886BD )
    COP [D0] ( #CF, #01, &code_0886BD )
    COP [D0] ( #B2, #01, &code_08873E )
    COP [D0] ( #AF, #01, &code_0886BF )
    COP [D0] ( #AD, #01, &code_0886BD )
    COP [D0] ( #AC, #01, &code_0886A5 )
    COP [D2] ( #AC, #01 )
    COP [82] ( #17, #12 )
    COP [89]
    COP [87] ( #18, #10, #02, #14 )
    COP [8A]
    COP [85] ( #18, #02, #02 )
    COP [8A]
    COP [86] ( #17, #0B, #02 )
    COP [8A]
}

code_0886A5 {
    COP [25] ( #0B, #0F )
    COP [80] ( #13 )
    COP [89]
    COP [0B]
    COP [D2] ( #AD, #01 )
    COP [0C]
    COP [86] ( #17, #07, #02 )
    COP [8A]
}

code_0886BD {
    COP [E0]
}

code_0886BF {
    COP [0A] ( #01 )
    LDA #$0800
    TSB $10
    COP [25] ( #0B, #12 )
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [DA] ( #3B )
    COP [85] ( #18, #0A, #12 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [DA] ( #3B )
    COP [86] ( #16, #02, #01 )
    COP [8A]
    COP [85] ( #19, #02, #01 )
    COP [8A]
    COP [08] ( #$2121 )
    COP [84] ( #AB, #28 )
    COP [8A]
    COP [CC] ( #03 )
    COP [84] ( #AC, #3C )
    COP [8A]
    COP [80] ( #AD )
    COP [89]
    COP [D2] ( #03, #00 )
    LDA #$0800
    TRB $10
    COP [04] ( #11 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_08885C )
    COP [DA] ( #3B )
    COP [9C] ( @code_088755, #$1002 )
    COP [C0] ( &code_088750 )
    COP [C1]
    RTL 
}

code_08873E {
    COP [25] ( #08, #13 )
    COP [80] ( #AD )
    COP [89]
    COP [0B]
    COP [C0] ( &code_088750 )
    COP [C1]
    RTL 
}

code_088750 {
    COP [BF] ( &widestring_0888AD )
    RTL 
}

code_088755 {
    COP [88] ( @table_0EE000 )
    COP [08] ( #$0F0F )
    COP [80] ( #25 )
    COP [89]
    LDA #$4000
    STA $7F0006, X
    SEP #$20
    LDA #$7E
    STA $7F0008, X
    REP #$20
    COP [82] ( #2A, #14 )
    COP [89]
    COP [CC] ( #04 )
    COP [82] ( #2A, #14 )
    COP [89]
    COP [9A] ( @code_0887BA, #$2000 )
    LDA #$0800
    TSB $10

  code_08878F:
    COP [D0] ( #05, #01, &code_08879C )
    COP [80] ( #2A )
    COP [89]
    BRA code_08878F
}

code_08879C {
    COP [82] ( #2A, #14 )
    COP [89]
    COP [82] ( #2A, #12 )
    COP [89]
    COP [86] ( #2A, #08, #02 )
    COP [8A]
    COP [CC] ( #B2 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_0887BA {
    COP [DA] ( #59 )
    COP [BF] ( &widestring_08890E )
    COP [CC] ( #05 )
    COP [E0]
}

---------------------------------------------

widestring_08885C `[TPL:A][TPL:3]Erik: Poor Hamlet... [N]To eat or not to eat...?[FIN][TPL:1][LU1:25][N]Hamlet...! [N](Sob).....[PAL:0][END]`

widestring_0888AD `[TPL:A][TPL:0]Sniff sniff.[FIN][LU1:1F][LU1:BB][LU1:9B][LU1:D7][N]snort again... [FIN]The air is filled with[N]the aroma of roasting[N]Hamlet.[PAL:0][END]`

widestring_08890E `[TPL:A][TPL:0]A familiar [LU1:EE]echoed[N]in [LU1:E1]heads.[FIN][TPL:2][DLY:0]Listen, everyone. It was[N]Hamlet's wish to be [N]food for [LU1:E4]people. [FIN]One baby pig [LU1:7A]save[N][LU1:B6]villagers.[FIN][TPL:0]Will: [N]Mother...? [FIN][TPL:2]Will... and [LU1:89][N]in [LU1:D6]place... [FIN]Darkness is approaching[N]the world. [FIN]You [LU1:B2]combine [LU1:FE][N]strength to [LU1:D1][N]the planet.[FIN]So, Will, [LU1:90]the [N]Mystic Statues and go[N]to the Tower of Babel...[PAL:0][END]`