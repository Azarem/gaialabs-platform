
!joypad_mask_std                065A

---------------------------------------------

h_sc06_main_soldier [
  h_actor < #1A, #00, #30 >   ;00
]

---------------------------------------------

e_sc06_main_soldier {
    COP [D0] ( #1B, #01, &code_04A3B9 )
    COP [D2] ( #04, #01 )
    LDA #$2000
    TRB $10
    COP [25] ( #0A, #19 )
    COP [80] ( #1D )
    COP [89]
    COP [C1]
    COP [45] ( #04, #19, #0E, #1D, &code_04A386 )
    RTL 
}

code_04A386 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [81] ( #21, #11 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [BF] ( &widestring_04A3BB )
    COP [CC] ( #07 )
    COP [D2] ( #08, #01 )
    COP [81] ( #21, #11 )
    COP [89]
    COP [85] ( #20, #06, #12 )
    COP [8A]
    COP [86] ( #1E, #0A, #11 )
    COP [8A]
}

code_04A3B9 {
    COP [E0]
}

widestring_04A3BB `[TPL:B][LU1:45]Princess! I've[N][LU1:70][LU1:AB]for you![FIN][TPL:1][LU1:25][N]I [LU1:82][LU1:A4]you.[N]Be gone![FIN][PAL:0][SFX:10][LU1:45][LU1:62]are you [N]saying? If I [LU1:82][LU1:E7][N]you home,[N][LU1:1F][LU2:81]my head? [END]`