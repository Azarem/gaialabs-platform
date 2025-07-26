
---------------------------------------------

h_it19_inca_statue_a [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it19_inca_statue_a {
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04F373 )
    COP [D2] ( #2D, #01 )
    COP [32] ( #1B )
    COP [33]
    COP [CD] ( #$011B )
    COP [E0]
}

code_04F373 {
    COP [D4] ( #03, &code_04F388 )
    COP [CC] ( #2D )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_04F38D )
    RTL 
}

code_04F388 {
    COP [BF] ( &widestring_04F3A8 )
    RTL 
}

widestring_04F38D `[TPL:A][SFX:0][DLY:9][LU1:67]found[N]Incan [LU1:48]A.[PAU:FF][END]`

widestring_04F3A8 `[TPL:A][LU1:67][LU1:8F]Incan [N][LU1:48]A! But [LU1:FE][N][LU1:A0]is full! [END]`