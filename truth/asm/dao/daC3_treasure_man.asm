
---------------------------------------------

h_daC3_treasure_man [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_treasure_man {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08B349 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08B349 {
    COP [BF] ( &widestring_08B34E )
    RTL 
}

widestring_08B34E `[DEF]There's a [LU1:9C]pyramid[N]near here.[FIN][LU2:20]explorers [LU1:98]come[N]for the [LU2:BA]but[N]no one's [LU1:8F]it yet.[END]`