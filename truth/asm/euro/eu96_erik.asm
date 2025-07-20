

---------------------------------------------

h_eu96_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_eu96_erik {
    COP [D0] ( #AC, #01, &code_07DAAF )
    COP [0B]
    COP [C0] ( &code_07DAB1 )
    COP [C1]
    RTL 
}

code_07DAAF {
    COP [E0]
}

code_07DAB1 {
    COP [D0] ( #AA, #01, &code_07DABC )
    COP [BF] ( &widestring_07DAC1 )
    RTL 
}

code_07DABC {
    COP [BF] ( &widestring_07DB09 )
    RTL 
}

widestring_07DAC1 `[TPL:B][TPL:3]Erik: I'm scared! [N][LU1:62]if I [LU1:98]to go [N]to the bathroom and [N]I [LU1:78][LU1:90]it?[PAL:0][END]`

widestring_07DB09 `[TPL:A][TPL:3]Erik: I [LU1:A3][N][LU1:82][LU1:E9]women.[PAL:0][END]`