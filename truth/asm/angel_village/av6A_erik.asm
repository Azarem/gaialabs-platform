
!joypad_mask_std                065A

---------------------------------------------

h_av6A_erik [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_av6A_erik {
    COP [D0] ( #8D, #01, &av6A_erik_destroy )
    COP [D0] ( #A9, #01, &code_06C513 )
    COP [D0] ( #8C, #01, &code_06C4D7 )
    COP [C0] ( &code_06C52A )
    COP [0B]
    COP [C1]
    RTL 
}

code_06C4D7 {
    COP [25] ( #0F, #0C )
    COP [0B]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [C0] ( &code_06C525 )
    COP [0C]
    COP [81] ( #11, #11 )
    COP [89]
    COP [84] ( #0D, #28 )
    COP [8A]
    COP [85] ( #11, #03, #01 )
    COP [8A]
    COP [80] ( #0D )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_06C568 )
    COP [CC] ( #A9 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_06C513 {
    COP [25] ( #16, #0C )
    COP [80] ( #0D )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06C525 )
    COP [C1]
    RTL 
}

code_06C525 {
    COP [BF] ( &widestring_06C6A0 )
    RTL 
}

code_06C52A {
    COP [BF] ( &widestring_06C52F )
    RTL 
}

widestring_06C52F `[TPL:A][TPL:3]Erik: The sun is [LU2:95][N]bright. I [LU1:BB][N]noticed [LU1:D7]before.[PAL:0][END]`

widestring_06C568 `[TPL:A][TPL:6][SFX:1A][LU1:36][N]Kara! I was worried! [FIN][TPL:2][SFX:19]Lilly:[N]Why are you always[N][LU2:97][LU1:6D]alone?![FIN][LU2:7]you [LU1:DA]about[N]the [LU2:9C]of us?[FIN][TPL:1][SFX:1B][LU1:25][N]Will already yelled [N]at me [LU1:6B]that. [FIN]My apologies to [N]everyone! [FIN][TPL:6][SFX:1A][LU1:36]She understands [N]now. We [LU1:CA][N]forgive her. [FIN]I [LU1:DA]the Floating[N][LU1:8]is [LU1:6B]three days[N]south of here.[FIN]I [LU1:DA]we [LU1:CA]go[N][LU1:D9][LU2:94]away. Tell[N]me [LU1:F6][LU1:FF]ready.[PAL:0][END]`

widestring_06C6A0 `[TPL:A][TPL:3]Erik: I [LU1:DA]I saw [N]a Red Jewel [N]in the Angel Village.[PAL:0][END]`

---------------------------------------------

av6A_erik_destroy {
    COP [E0]
}