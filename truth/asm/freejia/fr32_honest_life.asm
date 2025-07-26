
---------------------------------------------

h_fr32_honest_life [
  h_actor < #35, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_honest_life {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05BE1F )
    COP [C1]
    RTL 
}

code_05BE1F {
    COP [BF] ( &widestring_05BE24 )
    RTL 
}

widestring_05BE24 `[DEF]A [LU1:B0]lived[N]honestly. A life[N]of fun and laughter.[END]`