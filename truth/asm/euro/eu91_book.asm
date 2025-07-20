

---------------------------------------------

h_eu91_book [
  h_actor < #27, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_book {
    LDA #$0200
    TSB $12
    COP [B6] ( #30 )
    COP [C0] ( &code_07E4CE )
    COP [C1]
    RTL 
}

code_07E4CE {
    COP [BF] ( &widestring_07E4D3 )
    RTL 
}

widestring_07E4D3 `[DEF]This is the book [LU1:D7][N][LU2:2E]wrote [LU1:6B][N]the future of mankind. [END]`