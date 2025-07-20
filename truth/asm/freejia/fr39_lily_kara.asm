
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_fr39_lily [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

e_fr39_lily {
    COP [D0] ( #65, #01, &code_05C629 )
    COP [D0] ( #58, #01, &code_05C629 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [86] ( #26, #02, #11 )
    COP [8A]
    COP [81] ( #28, #02 )
    COP [89]
    COP [82] ( #26, #01 )
    COP [89]
    COP [84] ( #22, #1E )
    COP [8A]
    COP [0B]
    COP [BF] ( &widestring_05C654 )
    COP [CC] ( #01 )
    COP [C0] ( &code_05C634 )
    LDA #$0800
    TSB $10
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [25] ( #0D, #1C )
    COP [85] ( #29, #06, #11 )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    LDA #$0800
    TRB $10
    COP [C2]
    COP [84] ( #22, #1E )
    COP [8A]
    COP [BF] ( &widestring_05C67C )
    LDA #$CFF0
    TRB $joypad_mask_std

  code_05C620:
    COP [0B]
    COP [C0] ( &code_05C639 )
    COP [C1]
    RTL 
}

code_05C629 {
    COP [25] ( #16, #1C )
    COP [80] ( #23 )
    COP [89]
    BRA code_05C620
}

code_05C634 {
    COP [BF] ( &widestring_05C4CD+M )
    RTL 
}

code_05C639 {
    COP [D0] ( #68, #01, &code_05C64F )
    COP [D0] ( #65, #01, &code_05C64A )
    COP [BF] ( &widestring_05C70B )
    RTL 
}

code_05C64A {
    COP [BF] ( &widestring_05C67C+M )
    RTL 
}

code_05C64F {
    COP [BF] ( &widestring_05C74D )
    RTL 
}

widestring_05C654 `[TPL:A][TPL:2]Lilly:[N][LU1:9]in...[FIN]Will and Kara...?![PAL:0][END]`

widestring_05C67C `[TPL:A][TPL:2][LU1:2A]Lance hit his [N]head escaping [LU1:8E][N]the Incan ship... [FIN]The doctor [LU1:D4][LU1:D7]he[N]has [LU2:B4]amnesia.[FIN][::][TPL:A][TPL:2]Meanwhile, I [LU1:DA][N]Lance [LU1:CA]stay [LU2:73][N][LU2:BC]he recovers.[PAL:0][END]`

widestring_05C70B `[TPL:A][TPL:2][LU1:2A]Also, I haven't [N][LU2:A7]Erik [LU2:A4][N][LU2:79]night. [FIN]I [LU1:F9]what's happened?[PAL:0][END]`

widestring_05C74D `[TPL:A][TPL:2]Lilly:[N][LU1:20]experienced much[N]in my travels...[PAL:0][END]`

---------------------------------------------

h_fr39_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_fr39_kara {
    COP [D0] ( #65, #01, &code_05C4B7 )
    COP [D0] ( #58, #01, &code_05C4B7 )
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC #$0008
    STA $0014, Y
    COP [D2] ( #01, #01 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [CC] ( #58 )
    COP [BF] ( &widestring_05C4CD )
    COP [85] ( #21, #04, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #21, #03, #01 )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [81] ( #21, #01 )
    COP [89]

  code_05C4A9:
    COP [80] ( #1D )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05C4BD )
    COP [C1]
    RTL 
}

code_05C4B7 {
    COP [25] ( #14, #1A )
    BRA code_05C4A9
}

code_05C4BD {
    COP [D0] ( #68, #01, &code_05C4C8 )
    COP [BF] ( &widestring_05C571 )
    RTL 
}

code_05C4C8 {
    COP [BF] ( &widestring_05C597 )
    RTL 
}

widestring_05C4CD `[TPL:A][TPL:1][LU1:25][N]Lilly?[N]Is it Lilly?! [FIN][TPL:2][LU1:2A]I was worried![N][LU1:1D][LU1:70][LU2:47]a month[N][LU2:A4]we separated![FIN][LU1:20][LU1:70]working and[N][LU1:B1]in [LU1:D6]hotel.[FIN][::][TPL:A][TPL:2]Lance is in the room[N]on the right,[N]go in there...[PAL:0][END]`

widestring_05C571 `[TPL:A][TPL:1][LU1:25][N]I am glad [LU1:89][N]is safe, but...[PAL:0][END]`

widestring_05C597 `[TPL:A][TPL:1][LU1:25][LU1:64]wrong? [N][LU1:69]crying.[PAL:0][END]`