
!joypad_mask_std                065A

---------------------------------------------

h_ir1D_monologue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_ir1D_monologue {
    COP [D0] ( #6C, #01, &code_09D04A )
    COP [CC] ( #6C )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_09D04C )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_09D04A {
    COP [E0]
}

widestring_09D04C `[TPL:E][TPL:0]Will: There was a [N]tremendous [LU2:C5]at the [N][LU2:19]Cliff. [FIN]That's [LU2:8F][LU1:F7]the [N]old man meant by the [N][LU2:4B]of the spirits.... [FIN]This is the cliff with[N]no wind. My heart[N]beats fast.[PAL:0][END]`