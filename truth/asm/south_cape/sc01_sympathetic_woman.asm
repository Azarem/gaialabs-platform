

---------------------------------------------

h_sc01_sympathetic_woman [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_sympathetic_woman {
    COP [C0] ( &code_048999 )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [85] ( #19, #0C, #11 )
    COP [8A]
    COP [82] ( #17, #12 )
    COP [89]
    COP [80] ( #18 )
    COP [89]
    COP [4B] ( #15, #24, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3A )
    COP [89]
    LDA #$0200
    TRB $12
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #30, #0C, #12 )
    COP [8A]
    LDA #$0200
    TSB $12
    COP [80] ( #3B )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #09, #25, #F8 )
    COP [80] ( #14 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_048999 {
    COP [BF] ( &widestring_04899E )
    RTL 
}

widestring_04899E `[DEF]I [LU1:91]sorry[N]for Seth.[FIN]I [LU1:E9]why.  [N]He hates to see[N]his parents fighting[N]every day.[END]`