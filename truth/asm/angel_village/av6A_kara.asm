

---------------------------------------------

h_av6A_kara [
  h_actor < #1A, #00, #30 >   ;00
]

---------------------------------------------

e_av6A_kara {
    COP [D0] ( #8D, #01, &av6A_kara_destroy )
    COP [D2] ( #8C, #01 )
    LDA #$2000
    TRB $10
    COP [C0] ( &code_06C3AC )
    COP [D2] ( #A9, #01 )
    COP [81] ( #21, #11 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_06C3AC {
    COP [BF] ( &widestring_06C417 )
    RTL 
}

---------------------------------------------

av6A_kara_destroy {
    COP [E0]
}

---------------------------------------------

widestring_06C417 `[TPL:A][TPL:1][LU1:25]In the Floating [N]City, [LU1:B6][LU2:77][N]are built on rafts. [FIN]Kind of romantic.[N]I [LU1:A5]it.[PAL:0][END]`