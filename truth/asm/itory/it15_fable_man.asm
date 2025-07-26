
---------------------------------------------

h_it15_fable_man [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_it15_fable_man {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DEC4 )
    COP [0B]
    COP [C1]
    RTL 
}

code_04DEC4 {
    COP [BF] ( &widestring_04DEC9 )
    RTL 
}

widestring_04DEC9 `[DEF][LU1:1D][LU1:D4][LU1:D7]a messenger[N]appeared [LU2:73][LU1:F6]the[N][LU1:6F][LU1:F5]was about[N]to be destroyed.[END]`