
!joypad_mask_std                065A
!jewels_collected               0AB0

---------------------------------------------

h_wa7D_glass_opponent [
  h_actor < #2C, #00, #10 >   ;00
]

---------------------------------------------

e_wa7D_glass_opponent {
    COP [D0] ( #95, #01, &code_078DB3 )
    COP [D0] ( #97, #01, &code_078D8F )
    COP [D0] ( #96, #01, &code_078DB3 )
    COP [0B]
    COP [C0] ( &code_078DFC )
    COP [C1]
    RTL 
}

code_078D8F {
    COP [CC] ( #95 )
    LDA #$2000
    TSB $10
    COP [25] ( #00, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_078E2D )
    COP [D4] ( #18, &code_078DB5 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_078DB3 {
    COP [E0]
}

code_078DB5 {
    COP [D6] ( #01, &code_078DBF )
    COP [D6] ( #06, &code_078DE8 )
}

code_078DBF {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [D5] ( #01 )
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0001
    STA $jewels_collected
    CLD 
    COP [D4] ( #18, &code_078DDC )
}

code_078DDC {
    COP [BF] ( &widestring_078F0B )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_078DE8 {
    COP [D5] ( #06 )
    COP [D4] ( #18, &code_078DF0 )
}

code_078DF0 {
    COP [BF] ( &widestring_078F69 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_078DFC {
    COP [BF] ( &widestring_078E01 )
    RTL 
}

widestring_078E01 `[TPL:A][LU1:32]Cough, cough.[N]I [LU2:9E]to [LU1:98]caught[N]a [LU1:A7]cold.[END]`

widestring_078E2D `[TPL:B]Woman:[N][LU1:69]the Russian[N]Glass player.[FIN]My husband [LU1:D4][LU1:D7]once [N]he [LU1:8F]a job we [LU1:F3]be[N]OK, but I was [LU2:A5][N]at [LU1:F7]he did. [FIN]This is my husband's [N]will. It says [LU2:73][N]"To My Opponentˮ. [N][LU1:3B]read it. [FIN]There are four Kruks[N]outside. [N][LU1:3B]use them. [END]`

widestring_078F0B `[TPL:B][LU1:66]Oh. Your[N][LU1:A0]is full.[FIN][LU1:1F]hold on to one of[N][LU1:FE]Red Jewels. Don't[N]worry, [LU1:1F][LU1:E7]it[N]to the jeweler.[END]`

widestring_078F69 `[TPL:B][LU1:66]Oh. Your[N][LU1:A0]is full.[FIN][LU1:1F]hold on to one of[N][LU1:FE]Red Jewels. Don't[N]worry, [LU1:1F][LU1:E7]it[N]to the jeweler.[END]`