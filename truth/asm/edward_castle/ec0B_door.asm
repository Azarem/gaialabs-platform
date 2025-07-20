

---------------------------------------------

h_ec0B_door [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_ec0B_door {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DB24 )
    COP [D2] ( #24, #01 )
    COP [E0]
}

code_04DB24 {
    COP [BF] ( &widestring_04DB2D )
    COP [CC] ( #02 )
    COP [E0]
}

widestring_04DB2D `[DLG:3,12][SIZ:D,3][TPL:0]Will: [N][LU1:1D]locked...[PAL:0][END]`