
---------------------------------------------

h_it15_fable_woman [
  h_actor < #0B, #00, #10 >   ;00
]

---------------------------------------------

e_it15_fable_woman {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DF1D )
    COP [0B]
    COP [C1]
    RTL 
}

code_04DF1D {
    COP [BF] ( &widestring_04DF22 )
    RTL 
}

widestring_04DF22 `[DEF]Then, all [LU1:6D]the[N]world, disease and[N]famine began to[N]increase...[FIN]This planet had always[N][LU1:70]peaceful.[END]`