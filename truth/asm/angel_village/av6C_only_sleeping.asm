
---------------------------------------------

h_av6C_only_sleeping [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_av6C_only_sleeping {
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_06D05E )
    COP [C1]
    RTL 
}

code_06D05E {
    COP [BF] ( &widestring_06D063 )
    RTL 
}

widestring_06D063 `[TPL:A][TPL:0]Will: She appears to be [N]sleeping. [LU1:1D][LU1:A5]the [N]spirit's drawn out...[PAL:0][END]`