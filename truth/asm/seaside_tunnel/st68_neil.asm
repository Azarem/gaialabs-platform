
!joypad_mask_std                065A

---------------------------------------------

h_st68_neil [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_st68_neil {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06AAE4 )
}

code_list_06AAE4 [
  &code_06AAEA   ;00
  &code_06AB2E   ;01
  &code_06AB30   ;02
]

code_06AAEA {
    COP [0B]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06AB53 )
    COP [CC] ( #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [DA] ( #3F )
    COP [80] ( #14 )
    COP [89]
    COP [C0] ( &code_06AB4E )
    COP [D2] ( #02, #01 )
    COP [C1]
    COP [45] ( #0B, #00, #0C, #10, &code_06AB1D )
    RTL 
}

code_06AB1D {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #03 )
    COP [80] ( #12 )
    COP [89]
    COP [C1]
    RTL 
}

code_06AB2E {
    COP [E0]
}

code_06AB30 {
    COP [25] ( #18, #1A )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06AD22 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06AD64 )
    COP [CC] ( #01 )
    COP [C1]
    RTL 
}

code_06AB4E {
    COP [BF] ( &widestring_06ACB9 )
    RTL 
}

widestring_06AB53 `[TPL:A][TPL:0]Five days [LU1:98]passed[N][LU2:A4]we entered[N]the tunnel.[FIN]The [LU1:CD]scenery goes [N]on and on. [LU1:1D]hard to [N]keep track of time...[WAI][CLD][PAU:28][TPL:A][TPL:6][LU1:36][N][LU1:2B][LU2:9C][LU2:73][N]today. [FIN][TPL:3]Erik: I'm so tired. [N]I [LU1:B2][LU1:98]walked [N]500 miles today. [FIN][TPL:4]Lance: [N]This is crazy! [N]Having to walk so far! [FIN][TPL:1][LU1:25]Enough!! [LU1:67][N][LU1:70]tired [LU2:5D][LU2:A4][N]we [LU1:CB][LU1:D6]trip. [FIN][TPL:2][LU1:2A]Lance's right, Kara[N]I [LU1:DA]all of us [LU1:91]the[N][LU1:CD]way! [FIN][LU1:2B]eat,[N]I'm hungry.[PAL:0][END]`

widestring_06ACB9 `[TPL:A][TPL:6][LU1:36]Thousands of [N][LU2:C6]ago [LU1:C1]walked [N][LU1:DC][LU1:D6]tunnel. [FIN]Somehow, [LU1:F6]I [LU1:DA][N]of the [LU1:85]past, I [N][LU1:91]so insignificant.[PAL:0][END]`

widestring_06AD22 `[TPL:A][TPL:0]Two weeks since[N]entering the tunnel.[N]Still no end in sight.[PAL:0][END]`

widestring_06AD64 `[TPL:A][TPL:1][LU1:25]Last night [LU1:F6]I [N]was sleeping I [LU1:99]an [N]odd sound [LU1:8E]above. [FIN][TPL:4]Lance: [N][LU1:26]is [LU1:ED]concerned [N][LU1:6B][LU1:D7]sound... [FIN]I'm too tired to[N]do anything.[PAL:0][END]`