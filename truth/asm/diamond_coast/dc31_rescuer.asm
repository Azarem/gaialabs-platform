?INCLUDE 'entry_points_00C418'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_dc31_rescuer [
  h_actor < #04, #00, #18 >   ;00
]

---------------------------------------------

e_dc31_rescuer {
    COP [0B]
    COP [C0] ( &code_05ABC1 )
    COP [D0] ( #56, #01, &code_05ABBE )
    COP [D0] ( #76, #01, &code_05ABBE )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA #$*func_00C45E
    STA $0002, Y
    LDA #$&func_00C45E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0800
    TRB $10
    COP [DA] ( #03 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [DA] ( #95 )
    COP [BF] ( &widestring_05ABC6 )
    COP [CC] ( #01 )
    COP [D2] ( #02, #01 )
    COP [84] ( #03, #1E )
    COP [8A]
    COP [BF] ( &widestring_05AEA3 )
    COP [CC] ( #76 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_05ABBE {
    COP [C1]
    RTL 
}

code_05ABC1 {
    COP [BF] ( &widestring_05ABC6+M )
    RTL 
}

widestring_05ABC6 `[TPL:A][TPL:6][LU2:1C]voice:[N]You can wake him[N]up now.[FIN]He'll be fine if he[N]takes Vitamin C.[FIN][LU1:1D]scurvy, a disease[N]caused by a long-term[N]lack of vitamin C.[FIN][TPL:1][LU1:25][N]Hmmmm... [FIN][TPL:6]Columbus's crew[N]contracted it once.[N]Nothing to worry about.[FIN][LU1:61]it [LU2:6D]worse, the [N]blood [LU2:6D]bad and the [N]skin turns black. [FIN]The gums bleed, and the[N][LU1:72]starts decaying...[FIN][TPL:1][LU1:25]Stop! I [LU1:82][N][LU1:F1]to listen to [N][LU1:CE]talk!! [FIN][TPL:6]Man:[N]Ha ha ha.[N]I'm glad [LU1:FF]OK.[FIN][TPL:1][LU1:25][N]But you [LU1:A4]best. [N]Thank [LU2:C7][FIN][::][TPL:B][TPL:6]You [LU1:CA]thank [N]the dog outside, He [N][LU1:8F][LU1:FE]raft and [N][LU1:80]to get me.[PAL:0][END]`

---------------------------------------------

widestring_05AEA3 `[TPL:E][TPL:6][LU1:32]This is the south [N][LU2:8C]of Oakton. [FIN]The city of [N]Freejia is half a day[N]to the north. [FIN]If [LU1:FF][LU1:AB]for[N][LU1:FE]friend, you should[N][LU1:A9]in a big town.[PAL:0][END]`