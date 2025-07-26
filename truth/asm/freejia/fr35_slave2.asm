
---------------------------------------------

h_fr35_slave2 [
  h_actor < #27, #00, #10 >   ;00
]

---------------------------------------------

e_fr35_slave2 {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C3B6 )
    COP [C1]
    RTL 
}

code_05C3B6 {
    COP [BF] ( &widestring_05C3BB )
    RTL 
}

widestring_05C3BB `[TPL:B][LU1:20][LU1:DD]not to think. [N]The [LU1:B7]I think, the [N][LU1:B7]empty I become...[END]`