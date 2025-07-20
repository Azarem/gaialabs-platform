
!joypad_mask_std                065A

---------------------------------------------

h_sc01_jar_door [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_jar_door {
    COP [B2]
    COP [4B] ( #2C, #0E, #F8 )
    COP [4B] ( #15, #24, #F8 )
    COP [D0] ( #11, #01, &code_048A46 )
    COP [C1]
    COP [28] ( #$0078, #$025E, &code_048A12 )
    RTL 
}

code_048A12 {
    COP [CC] ( #11 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [82] ( #3F, #21 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [B4]
    COP [BF] ( &widestring_048A48 )
    COP [CA] ( #10 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [C2]
    COP [CB]
}

code_048A46 {
    COP [E0]
}

widestring_048A48 `[TPL:10][TPL:0]No sooner was the door[N]to Seth's [LU2:70]opened[N][LU2:B5]a jar [LU1:80]flying[N]out![END]`