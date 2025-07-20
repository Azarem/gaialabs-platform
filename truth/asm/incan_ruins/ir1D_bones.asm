

---------------------------------------------

h_ir1D_bones [
  h_actor < #2E, #01, #10 >   ;00
]

---------------------------------------------

e_ir1D_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_09C280 )
    COP [C1]
    RTL 
}

code_09C280 {
    COP [BF] ( &widestring_09C285 )
    RTL 
}

widestring_09C285 `[DEF][TPL:0]There's [LU1:C8]on the[N][LU1:96]there...[FIN][PAL:0]If I can [LU1:B5][LU1:D7]gold [N]statue, I can pass... [END]`