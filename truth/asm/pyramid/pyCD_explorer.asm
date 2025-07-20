

---------------------------------------------

h_pyCD_explorer [
  h_actor < #1F, #00, #10 >   ;00
]

---------------------------------------------

e_pyCD_explorer {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08C254 )
    COP [0B]
    COP [D0] ( #C2, #01, &code_08C250 )
    COP [D0] ( #C3, #01, &code_08C250 )
    COP [D0] ( #C4, #01, &code_08C250 )
    COP [D0] ( #C5, #01, &code_08C250 )
    COP [D0] ( #C6, #01, &code_08C250 )
    COP [D0] ( #C7, #01, &code_08C250 )
    COP [D6] ( #1E, &code_08C250 )
    COP [D6] ( #1F, &code_08C250 )
    COP [D6] ( #20, &code_08C250 )
    COP [D6] ( #21, &code_08C250 )
    COP [D6] ( #22, &code_08C250 )
    COP [D6] ( #23, &code_08C250 )
    COP [C1]
    RTL 
}

code_08C250 {
    COP [0C]
    COP [E0]
}

code_08C254 {
    COP [BF] ( &widestring_08C259 )
    RTL 
}

widestring_08C259 `[DEF]Explorer: There are[N]traps [LU2:9F]around[N]to prevent entry.[FIN]There's a booby trap in[N][LU1:D6]room [LU1:D7]responds[N]to sound.....So[N][LU1:82][LU2:84]any noise...[END]`