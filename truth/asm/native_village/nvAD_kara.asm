
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_nvAD_kara [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_nvAD_kara {
    COP [D0] ( #B2, #01, &code_088B18 )
    COP [D0] ( #AE, #01, &code_088B06 )
    COP [D0] ( #AD, #00, &code_088B18 )
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$0008
    STA $0014, Y
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_088B32 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #AE )
    COP [86] ( #0F, #05, #12 )
    COP [8A]
}

code_088B06 {
    COP [25] ( #07, #08 )
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_088B1A )
    COP [0B]
    COP [C1]
    RTL 
}

code_088B18 {
    COP [E0]
}

code_088B1A {
    COP [CC] ( #B0 )
    COP [BF] ( &widestring_088B8B )
    LDA #$0404
    STA $064A
    COP [26] ( #AC, #$00B0, #$00A0, #00, #$2200 )
    RTL 
}

widestring_088B32 `[TPL:A][TPL:1][LU1:25][N]No one here... The [N][LU1:EC][LU1:AA]abandoned. [FIN][TPL:3]Erik: [N]That's good. We can [N][LU2:9C]if we want.[PAL:0][END]`

widestring_088B8B `[TPL:A][TPL:1][LU1:25][N][LU1:2B][LU2:9C]today.[PAL:0][END]`