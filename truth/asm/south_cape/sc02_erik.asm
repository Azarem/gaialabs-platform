
!joypad_mask_std                065A

---------------------------------------------

h_sc02_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_sc02_erik {
    COP [D0] ( #4C, #01, &code_04B96F )
    COP [C0] ( &code_04B995 )
    COP [D0] ( #20, #01, &code_04B95F )
    COP [D0] ( #16, #01, &code_04B962 )
    COP [D2] ( #01, #01 )
    COP [D2] ( #02, #01 )
    COP [CC] ( #16 )
    COP [CC] ( #04 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04B9AF )
    COP [86] ( #0F, #03, #02 )
    COP [8A]
    COP [80] ( #0B )
    COP [89]
    COP [DA] ( #3B )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04B9F2 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #03 )
    COP [DA] ( #B3 )
    COP [CE] ( #03 )
    COP [BF] ( &widestring_04BA55 )
    COP [04] ( #1C )
    COP [DA] ( #77 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #11, #02, #11 )
    COP [8A]
    COP [86] ( #0F, #03, #12 )
    COP [8A]
    COP [85] ( #10, #02, #12 )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [D2] ( #05, #01 )
    COP [C0] ( &code_04B99A )
    COP [D2] ( #06, #01 )
    COP [C8] ( &code_04B971 )
    COP [C0] ( &code_04B99F )
    COP [D2] ( #08, #01 )
    COP [C8] ( &code_04B971 )
    COP [BF] ( &widestring_04BC16 )
    COP [CC] ( #09 )
}

code_04B95F {
    COP [C1]
    RTL 
}

code_04B962 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [C0] ( &code_04B99F )
    JMP $&code_04B95F
}

code_04B96F {
    COP [E0]
}

code_04B971 {
    COP [86] ( #0A, #04, #04 )
    COP [8A]
    COP [86] ( #0A, #04, #03 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [86] ( #0A, #04, #04 )
    COP [8A]
    COP [86] ( #0A, #04, #03 )
    COP [8A]
    COP [C5]
}

code_04B995 {
    COP [BF] ( &widestring_04BB59 )
    RTL 
}

code_04B99A {
    COP [BF] ( &widestring_04BB89 )
    RTL 
}

code_04B99F {
    COP [D0] ( #21, #01, &code_04B9AA )
    COP [BF] ( &widestring_04BBB6 )
    RTL 
}

code_04B9AA {
    COP [BF] ( &widestring_04BBDA )
    RTL 
}

widestring_04B9AF `[DLG:3,6][SIZ:D,3][DLY:0]Suddenly Erik rushed in[N][LU1:F0]a desperate look[N]on his face.[PAU:3C][CLD]`

widestring_04B9F2 `[TPL:A][TPL:3]Erik: Ah! [N]News! Big news![FIN]The Princess of [LU1:11][N]Castle has run away![FIN]They say she [LU1:80]to[N][LU1:47]Cape![PAL:0][END]`

widestring_04BA55 `[TPL:B][TPL:4]Lance: That's all? [FIN]You [LU1:80]in [LU1:CE]a hurry[N][LU1:D7]I [LU1:D8]something[N][LU2:95]big had happened![FIN]The princess is probably[N][LU1:D7]spoiled girl, Kara..[N]The one you like[N]so much![FIN][TPL:3]Erik: LIAR![N][LU1:30]the soldiers[N][LU1:EF][LU1:79]here[N][LU1:AB]for her![FIN]The [LU2:A2]from[N][LU1:11]Castle [LU1:A9]so[N]cool. I [LU1:F1]a steel[N]helmet, too.[PAL:0][END]`

widestring_04BB59 `[TPL:A][TPL:3]Erik: [N]And I [LU1:D8]everyone[N][LU1:F3]be surprised...[PAL:0][END]`

widestring_04BB89 `[TPL:A][TPL:3]Erik: [N]Last [LU1:DF]you moved[N]the [LU1:C9]a [LU1:A6]way.[PAL:0][END]`

widestring_04BBB6 `[TPL:A][TPL:3]Erik: [N]If I [LU1:7A]only[N]do that...[PAL:0][END]`

widestring_04BBDA `[TPL:A][TPL:3]Erik: [LU1:64]the matter?[N][LU1:69]not acting like[N]the [LU1:CD]old Will.[PAL:0][END]`

widestring_04BC16 `[TPL:A][TPL:3]Erik: [N]I'm speechless...[FIN][LU1:1C]Seth.[N]This is [LU1:D0]type of[N]psychic power, right?[PAL:0][END]`