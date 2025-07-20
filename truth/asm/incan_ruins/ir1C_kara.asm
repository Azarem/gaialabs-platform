
!joypad_mask_std                065A

---------------------------------------------

h_ir1C_kara [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_ir1C_kara {
    COP [D0] ( #4B, #01, &code_09CF07 )
    COP [C1]
    COP [45] ( #1A, #0F, #1B, #11, &code_09CEB7 )
    RTL 
}

code_09CEB7 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #01 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [81] ( #19, #01 )
    COP [89]
    COP [82] ( #17, #02 )
    COP [89]
    COP [80] ( #13 )
    COP [89]
    COP [BF] ( &widestring_09CF19 )
    COP [04] ( #02 )
    COP [DA] ( #77 )
    COP [CC] ( #03 )
    COP [D2] ( #02, #01 )
    LDA #$0800
    TSB $10
    COP [82] ( #17, #12 )
    COP [89]
    COP [CE] ( #02 )
    COP [85] ( #18, #05, #12 )
    COP [8A]
    COP [80] ( #12 )
    COP [89]
    LDA #$0800
    TRB $10
}

code_09CF07 {
    COP [25] ( #15, #13 )
    COP [0B]
    COP [C0] ( &code_09CF14 )
    COP [C1]
    RTL 
}

code_09CF14 {
    COP [BF] ( &widestring_09CF59 )
    RTL 
}

widestring_09CF19 `[DLG:3,6][SIZ:D,3][TPL:1][LU1:25][LU1:69]so mean!! [N]Leaving me behind! How [N][LU1:7A]you do that![PAL:0][END]`

widestring_09CF59 `[DLG:3,6][SIZ:D,3][TPL:1][LU1:25]Well? Did you [N][LU1:90][LU1:F7]you [LU1:F2][N][LU1:AB]for?[PAL:0][END]`