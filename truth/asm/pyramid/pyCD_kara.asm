
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_pyCD_kara [
  h_actor < #03, #00, #30 >   ;00
]

---------------------------------------------

e_pyCD_kara {
    COP [D0] ( #D0, #01, &code_08BE0D )
    COP [D2] ( #C2, #01 )
    COP [D2] ( #C3, #01 )
    COP [D2] ( #C4, #01 )
    COP [D2] ( #C5, #01 )
    COP [D2] ( #C6, #01 )
    COP [D2] ( #C7, #01 )
    COP [D0] ( #BB, #01, &code_08BE0F )
    COP [D2] ( #02, #01 )
    LDA #$2000
    TRB $10
    COP [86] ( #07, #03, #12 )
    COP [8A]
    COP [85] ( #09, #03, #11 )
    COP [8A]
    COP [84] ( #02, #06 )
    COP [8A]
    COP [80] ( #04 )
    COP [89]
    COP [D2] ( #04, #01 )
    LDA #$0800
    TSB $10
    COP [CA] ( #04 )
    COP [81] ( #09, #14 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    COP [CB]
    COP [D2] ( #05, #01 )
    COP [DA] ( #0F )
    COP [CA] ( #06 )
    COP [81] ( #09, #14 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    COP [CB]
    COP [D2] ( #06, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$000A
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #08, #01 )
    COP [80] ( #04 )
    COP [89]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08BE66 )
    COP [DA] ( #3B )
    LDA #$0068
    STA $7F0018, X
    LDA #$00B0
    STA $7F001A, X
    COP [22] ( #08, #01 )
    COP [80] ( #04 )
    COP [89]
    COP [0B]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08BEA9 )
    COP [80] ( #05 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_08BE61 )
    COP [C1]
    RTL 
}

code_08BE0D {
    COP [E0]
}

code_08BE0F {
    LDA #$2000
    TRB $10
    COP [25] ( #08, #0B )
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_08BE61 )
    COP [D2] ( #FC, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [80] ( #05 )
    COP [89]
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08BFC7 )
    COP [DA] ( #3B )
    COP [80] ( #03 )
    COP [89]
    COP [BF] ( &widestring_08C127 )
    COP [CC] ( #D0 )
    LDA #$0404
    STA $064A
    COP [26] ( #C8, #$0070, #$00A0, #00, #$1100 )
    COP [C1]
    RTL 
}

code_08BE61 {
    COP [BF] ( &widestring_08BF8F )
    RTL 
}

widestring_08BE66 `[TPL:9][TPL:1][DLY:2][LU1:25][N]Will... [FIN]Why [LU1:B2]everyone[N]hate each other...?[FIN]I...[N][PAU:3C]I...[PAL:0][END]`

widestring_08BEA9 `[TPL:A][TPL:1][DLY:0][LU1:25][N]I'm sorry... [N]I got upset... [FIN]You are doing [LU1:FE][N][LU2:4D]to [LU1:D1]the world.[FIN]At [LU2:61]I [LU1:A3]wanted[N]to [LU1:90]my father...[FIN]But somehow it got[N]to be a trial.....[FIN]But me.[N]I [LU1:82]regret coming[N]on [LU1:D6]journey...[FIN][LU1:2B]go and [N][LU1:90]the fifth [N]Mystic Statue...[PAL:0][END]`

widestring_08BF8F `[TPL:B][TPL:1]Kara:[N]The [LU1:B4]you played[N]became the Jackal's[N]dirge.[PAL:0][END]`

widestring_08BFC7 `[TPL:A]I [LU1:99]a [LU1:EE][LU1:8E]the[N]Flute! [FIN]The [LU1:CD][LU1:EE]I[N][LU1:99]in the prison[N]at [LU1:11]Castle...[FIN][TPL:4][DLY:1][LU2:E][N]Will. [LU1:67]done well to [N][LU1:98][LU1:79][LU1:D6]far. [FIN][TPL:0]Will: [N]Father?! [FIN][TPL:4]Flute:[N]I'm at the Tower now.[FIN]Bring the five Mystic [N]Statues to the Tower. [FIN]The [LU1:D2]you've [N]collected hold the key [N]to the [LU2:6B]of humanity. [FIN]Will..Hurry...The comet[N]is approaching. [FIN][PAL:0][SFX:0]The [LU1:EE]of the Flute[N]quiets and disappears.[PAL:0][END]`

widestring_08C127 `[TPL:B][TPL:1][LU1:25]It [LU1:CC][N][LU1:C8][LU1:DE]has [N][LU1:9D][LU1:D7][N]we [LU1:82][LU1:A4]about... [FIN][TPL:0]Will: [LU1:62]to do... [N]I was told to go to the [N]Tower of Babel, but [N][LU1:D7][LU1:A7]island... [FIN][TPL:1][LU1:25][N]I [LU1:9B][LU2:23]has built [N][LU1:6E]airplane. [FIN]It [LU1:CC]he's flying to [N]the desert town. [LU1:2B][N]go [LU1:73]there.[PAL:0][END]`