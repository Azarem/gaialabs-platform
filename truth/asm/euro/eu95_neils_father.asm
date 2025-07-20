
!joypad_mask_std                065A

---------------------------------------------

h_eu95_neils_father [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_eu95_neils_father {
    COP [D0] ( #A8, #01, &code_07E21A )
    LDA #$1200
    TSB $12
    COP [0B]
    COP [C0] ( &code_07E21C )
    COP [BC] ( #00, #FE )
    COP [D2] ( #A8, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #03 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [0C]
    COP [BC] ( #00, #F0 )
    COP [86] ( #2F, #02, #12 )
    COP [8A]
    COP [84] ( #2F, #06 )
    COP [8A]
    COP [BF] ( &widestring_07E259 )
    LDA #$0268
    STA $7F0018, X
    LDA #$0060
    STA $7F001A, X
    COP [22] ( #2F, #01 )
    COP [04] ( #04 )
    COP [DA] ( #77 )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_07E21A {
    COP [E0]
}

code_07E21C {
    COP [BF] ( &widestring_07E221 )
    RTL 
}

widestring_07E221 `[TPL:A][LU1:37]father: You [LU1:78][N]go wrong by taking [LU1:BE][N]the [LU1:44]Company.[END]`

widestring_07E259 `[TPL:B][LU1:31]Tribe: Ku ku ku...[N][LU2:38][LU1:D6][LU1:F5][LU1:EF]be[N]wrapped in darkness.[FIN]The previous owner of [N][LU1:D6][LU1:72]is now a [N]skeleton sleeping [N][LU1:EA]the shrine. [END]`