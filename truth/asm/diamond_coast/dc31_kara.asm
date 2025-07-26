
?INCLUDE 'entry_points_00C418'
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_dc31_kara [
  h_actor < #2D, #00, #10 >   ;00
]

---------------------------------------------

e_dc31_kara {
    COP [D0] ( #56, #01, &code_05B007 )
    COP [C0] ( &code_05B016 )
    COP [D0] ( #76, #01, &code_05B009 )
    COP [D2] ( #01, #01 )
    COP [82] ( #2F, #12 )
    COP [89]
    COP [85] ( #31, #02, #11 )
    COP [8A]
    COP [80] ( #2D )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_05ADAE )
    LDY $player_actor
    LDA #$*func_00C46D
    STA $0002, Y
    LDA #$&func_00C46D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0000
    JSL $@func_00C6E4
    COP [DA] ( #3B )
    LDA #$0002
    JSL $@func_00C6E4
    COP [DA] ( #13 )
    COP [BF] ( &widestring_05AE00 )
    COP [CC] ( #02 )

  code_05AFE7:
    COP [D2] ( #56, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [85] ( #30, #02, #02 )
    COP [8A]
    COP [86] ( #2E, #04, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_05B007 {
    COP [E0]
}

code_05B009 {
    COP [25] ( #07, #09 )
    COP [80] ( #2A )
    COP [89]
    COP [0B]
    BRA code_05AFE7
}

code_05B016 {
    COP [BF] ( &widestring_05AF2F )
    COP [CC] ( #56 )
    RTL 
}

---------------------------------------------

widestring_05ADAE `[TPL:E][TPL:1][LU1:25][N]Will! Will!! [N]Wake up! ! ! [FIN][LU2:41]reached land!![N][LU2:3F]saved!!![FIN][TPL:0]Will: [N]Uhhh...[PAL:0][END]`

widestring_05AE00 `[TPL:E][TPL:0]Will: Kara...? [N][LU1:65]am I...? [FIN][TPL:1][LU1:25][N][LU2:3F]at the [LU2:72]of the [N]kind man who saved us. [FIN][LU1:67][LU1:70]tossing[N]in [LU1:FE]sleep.[FIN]I kept putting the[N]blankets on you, but[N]you threw [LU1:E6]off.[PAL:0][END]`

---------------------------------------------

widestring_05AF2F `[TPL:A][TPL:1][LU1:25]At any rate, [N]let's go to Freejia. [FIN]I'm [LU1:93]to thank the[N]dog. [LU1:9]back[N][LU1:F6][LU1:FF]ready.[PAL:0][END]`