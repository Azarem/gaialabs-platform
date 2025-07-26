
---------------------------------------------

h_it1B_inca_statue_b [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_it1B_inca_statue_b {
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04FADF )
    COP [D2] ( #48, #01 )
    COP [32] ( #1D )
    COP [33]
    COP [CD] ( #$011D )
    COP [E0]
}

code_04FADF {
    COP [D4] ( #04, &code_04FAF4 )
    COP [CC] ( #48 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_04FAF9 )
    RTL 
}

code_04FAF4 {
    COP [BF] ( &widestring_04FB16 )
    RTL 
}

widestring_04FAF9 `[DLG:3,6][SIZ:D,3][SFX:0][DLY:9][LU1:67]got[N]Incan [LU1:48]B![PAU:FF][END]`

widestring_04FB16 `[DLG:3,6][SIZ:D,3][LU1:67][LU1:8F]Incan [N][LU1:48]B! But [LU1:FE][N][LU1:A0]is full! [END]`