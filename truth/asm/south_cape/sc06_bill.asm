
!joypad_mask_std                065A
!INIDISP                        2100

---------------------------------------------

h_sc06_bill [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_sc06_bill {
    COP [D0] ( #21, #01, &code_0493EE )
    COP [D0] ( #1C, #01, &code_0493E1 )
    COP [D0] ( #3E, #01, &code_0493D9 )
    COP [D0] ( #1B, #01, &code_049349 )
    COP [D0] ( #16, #01, &code_0492A3 )
    COP [0B]
    COP [C0] ( &code_0493F0 )
    COP [C1]
    RTL 
}

code_0492A3 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [C0] ( &code_0493F5 )
    COP [D2] ( #04, #01 )
    COP [DA] ( #1D )
    COP [04] ( #1B )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04953E )
    COP [04] ( #06 )
    COP [09] ( #0A )
    COP [DA] ( #59 )
    COP [CC] ( #05 )
    COP [84] ( #05, #10 )
    COP [8A]
    COP [84] ( #02, #10 )
    COP [8A]
    COP [84] ( #04, #10 )
    COP [8A]
    COP [84] ( #02, #10 )
    COP [8A]
    COP [BF] ( &widestring_04956D )
    COP [C0] ( #$0000 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #06 )
    LDA #$0800
    TSB $10
    COP [0C]
    COP [82] ( #06, #11 )
    COP [89]
    COP [85] ( #08, #05, #12 )
    COP [8A]
    COP [82] ( #07, #12 )
    COP [89]
    COP [25] ( #03, #19 )
    COP [82] ( #06, #11 )
    COP [89]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #1B, #01 )
    LDA #$1000
    TSB $12
    COP [05] ( #1C )
    COP [85] ( #09, #05, #11 )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #EF )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_049349 {
    COP [80] ( #02 )
    COP [89]
    COP [25] ( #0A, #1A )
    COP [0B]
    COP [C0] ( &code_049413 )
    COP [D2] ( #0A, #01 )
    COP [BF] ( &widestring_0495C9 )
    COP [81] ( #08, #12 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [BF] ( &widestring_0495EB )
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [CC] ( #0B )

  code_04937D:
    COP [C0] ( &code_049418 )
    COP [C1]
    COP [45] ( #03, #17, #04, #19, &code_04938C )
    RTL 
}

code_04938C {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0800
    TSB $10
    COP [CA] ( #09 )
    LDA #$0800
    STA $09AC
    COP [CB]
    LDA #$000F
    STA $7F0010, X

  code_0493A9:
    LDA $7F0010, X
    DEC 
    BMI code_0493C2
    STA $7F0010, X
    SEP #$20
    STA $INIDISP
    REP #$20
    COP [C3] ( @code_0493A9, #$0003 )
}

code_0493C2 {
    LDA #$0001
    STA $0648
    COP [26] ( #06, #$0000, #$0200, #00, #$3120 )
    LDA #$CFF0
    TRB $joypad_mask_std
    RTL 
}

code_0493D9 {
    COP [25] ( #0A, #1A )
    COP [0B]
    BRA code_04937D
}

code_0493E1 {
    COP [25] ( #0A, #1A )
    COP [0B]
    COP [C0] ( &code_049403 )
    COP [C1]
    RTL 
}

code_0493EE {
    COP [E0]
}

code_0493F0 {
    COP [BF] ( &widestring_04941D )
    RTL 
}

code_0493F5 {
    COP [BF] ( &widestring_0494B1 )
    COP [CC] ( #03 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}

code_049403 {
    COP [D0] ( #35, #01, &code_04940E )
    COP [BF] ( &widestring_049828 )
    RTL 
}

code_04940E {
    COP [BF] ( &widestring_04977F )
    RTL 
}

code_049413 {
    COP [BF] ( &widestring_04958A )
    RTL 
}

code_049418 {
    COP [BF] ( &widestring_049685 )
    RTL 
}

widestring_04941D `[TPL:B][TPL:4][LU1:6]Coming home[N]at [LU1:D6]hour probably[N]means you had to stay[N]after school again.[FIN]Ha ha. Excellent! Even[N]if a boy [LU1:78]study,[N]he [LU1:CA]show a[N][LU1:A7]initiative.[PAL:0][END]`

widestring_0494B1 `[TPL:B][TPL:4][LU1:6][N]Oh, my! I haven't sung [N][LU1:A5][LU1:D6]in a [LU1:A6]time.[FIN][LU1:68]grandmother Lola[N][LU2:BB]to be a singer.[FIN]I fell in love [LU1:F0]her[N]voice. That's why I[N]married her.[PAL:0][END]`

widestring_04953E `[TPL:8][TPL:1][DLY:0]No-o-o-o-o!!![FIN][PAL:0][SFX:10]A scream [LU1:8E]downstairs![END]`

widestring_04956D `[TPL:9][TPL:4][LU1:6][LU1:1D]that[N][LU2:6C]screaming!![PAL:0][END]`

widestring_04958A `[TPL:A][TPL:4][LU1:6]So, [LU1:D7]girl[N]likes to play practical[N]jokes. Heh heh heh.[PAL:0][END]`

widestring_0495C9 `[PAU:1E][TPL:A][TPL:4][LU1:6]I [LU2:BB]to be[N]an architect.[PAL:0][END]`

widestring_0495EB `[TPL:B][TPL:4]There's a prison[N][LU1:EA]the castle.[FIN][LU1:1D]built [LU1:A5]a maze[N]to keep the prisoners[N][LU1:8E]escaping.[FIN]I [LU1:91]bad [LU1:D7]I built[N]a [LU2:91][LU1:F4]people[N]disappear and are never[N][LU1:99][LU1:8E]again.[PAL:0][END]`

widestring_049685 `[TPL:B][TPL:4][LU1:6]Will, do you think[N][LU1:2D]meals [LU1:98][LU1:70]a[N][LU1:A7][LU1:C7]lately?[FIN]Last night, licorice and[N]rice. Before that, mouse[N]fritters.[N]I [LU1:78]stand it anymore![FIN][LU1:4A]old people,[N]if [LU2:B0]surrounded by[N]problems, get a little[N]forgetful. [FIN][LU1:30][LU1:DB]something[N]bothering her [LU1:D7]she[N][LU1:78][LU2:AC]about...[PAL:0][END]`

widestring_04977F `[TPL:B][TPL:4]Bill:[N]A crystal ring...?[N]Never [LU1:99]of it.[FIN]There was nothing[N][LU1:A5][LU1:D7]in the luggage[N][LU1:FE]father, Olman,[N][LU1:AE]behind.[FIN][LU1:30]we [LU1:7A]go to[N][LU1:11]Castle. We could[N]see the princess.[N]Heh heh.[PAL:0][END]`

widestring_049828 `[TPL:A][TPL:4][LU1:6]I had [LU1:B7]snail[N]pie for breakfast.[N]I [LU1:AE]you a slice.[PAL:0][END]`