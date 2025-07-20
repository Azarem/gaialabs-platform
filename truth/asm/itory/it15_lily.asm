?INCLUDE 'thinker_00B7CC'
?INCLUDE 'thinker_00B7D6'
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_actor                   09AA
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_it15_lily [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_it15_lily {
    COP [D0] ( #2B, #00, &code_04E2B9 )
    COP [D0] ( #3B, #01, &code_04E3CC )
    COP [25] ( #41, #26 )
    JMP $&code_04E398
}

code_04E2B9 {
    COP [D0] ( #26, #00, &code_04E3CC )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04E3D5 )
    LDA #$6000
    TRB $joypad_mask_std
    LDA #$1000
    TRB $10

  code_04E2D7:
    COP [C1]
    COP [D0] ( #40, #01, &code_04E2E6 )
    COP [40] ( #$0F01, &code_04E3CE )
    RTL 
}

code_04E2E6 {
    LDA #$1000
    TSB $10
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$80
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    REP #$20
    COP [3C] ( @e_thinker_00B7CC )
    COP [DA] ( #7F )
    COP [CC] ( #01 )
    COP [CA] ( #10 )
    LDA $06C2
    SEC 
    SBC #$0010
    STA $06C2
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $0016, Y
    LDA $16
    SEC 
    SBC #$0010
    STA $16
    COP [CB]
    LDA #$0300
    STA $camera_bounds_y
    COP [CE] ( #01 )
    COP [DA] ( #3B )
    COP [3C] ( @e_thinker_00B7D6 )
    COP [DA] ( #9D )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04E46F )
    COP [CC] ( #02 )
    COP [D2] ( #03, #01 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [CC] ( #2B )
    LDA #$0800
    TSB $10
    COP [82] ( #1E, #11 )
    COP [89]
    COP [81] ( #21, #01 )
    COP [89]
    COP [86] ( #1E, #02, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #21, #06, #01 )
    COP [8A]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #02, #01 )
    COP [8A]
    COP [86] ( #1F, #06, #12 )
    COP [8A]
    COP [81] ( #21, #11 )
    COP [89]
}

code_04E398 {
    COP [80] ( #1D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #04, #01 )
    LDA #$0001
    JSL $@func_00C6E4
    COP [80] ( #1A )
    COP [89]
    COP [BF] ( &widestring_04E53C )
    LDA #$0800
    TSB $10
    COP [86] ( #1F, #02, #12 )
    COP [8A]
    COP [CC] ( #05 )
    COP [86] ( #1F, #04, #12 )
    COP [8A]
}

code_04E3CC {
    COP [E0]
}

code_04E3CE {
    COP [BF] ( &widestring_04E440 )
    JMP $&code_04E2D7
}

widestring_04E3D5 `[TPL:F][TPL:2][LU1:2A]This is my[N]village, but you're[N][LU2:8F][LU2:A5]that[N][LU1:D9]are no houses.[FIN]Will, try [LU1:C4]the [N][LU1:B4][LU1:D7][LU2:54]to me [N][LU1:EA][LU1:11]Castle.[PAL:0][END]`

widestring_04E440 `[TPL:E][TPL:2][LU1:2A]Will. [LU1:65][N]are you going? [N][LU2:27]the [LU1:B4]here.[PAL:0][END]`

widestring_04E46F `[TPL:F][TPL:2]Lilly:[N]Were you surprised?[FIN]There's a barrier [LU1:6D][N][LU1:D6][LU2:BD]Most [N][LU1:C1][LU1:78]see it. [FIN]The princess is [N]getting to be [N]a bother.... [FIN]On the road, all I [LU1:99][N]was "My feet hurt, I'm [N]thirsty.ˮ I'm tired [N]of hearing it.[PAL:0][END]`

widestring_04E53C `[TPL:F][TPL:2][LU1:2A]We [LU1:83]ask her[N]to [LU1:79]along.[FIN]Will. This is my house. [N]You can [LU1:A9][LU1:6D][N]the village, but [LU2:B6][N][LU1:79][LU1:73]here.[PAL:0][END]`