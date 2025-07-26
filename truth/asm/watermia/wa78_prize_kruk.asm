
---------------------------------------------

h_wa78_prize_kruk [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_prize_kruk {
    COP [D0] ( #94, #01, &code_079B29 )
    COP [D0] ( #97, #00, &code_079B29 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_079B2B )
    COP [0B]
    COP [27] ( #0F )
    COP [80] ( #1C )
    COP [89]
    RTL 
}

code_079B29 {
    COP [E0]
}

code_079B2B {
    COP [BF] ( &widestring_079B30 )
    RTL 
}

widestring_079B30 `[DEF][TPL:0][LU1:5E]are the Kruks I [N]was given. I [LU1:98]to [N]let [LU1:89]know.[PAL:0][END]`