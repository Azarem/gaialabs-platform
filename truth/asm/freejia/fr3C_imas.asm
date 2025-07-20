

---------------------------------------------

h_fr3C_imas [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_fr3C_imas {
    COP [D0] ( #6A, #01, &code_05BEFD )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05BEFF )
    COP [C1]
    RTL 
}

code_05BEFD {
    COP [E0]
}

code_05BEFF {
    COP [BF] ( &widestring_05BF04 )
    RTL 
}

widestring_05BF04 `[DEF][TPL:5]I am Imas. I was[N][LU1:75][LU2:73]by boat[N][LU1:8E]far-off Asia.[FIN]We are a hunting tribe.[N][LU1:61]we're hungry[N]we hunt for food.[FIN]All of the [LU2:46]here[N][LU1:98]fallen victim[N]to an unknown disease...[PAL:0][END]`