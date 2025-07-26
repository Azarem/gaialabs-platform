
---------------------------------------------

h_daC3_moving_kruk [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_moving_kruk {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08AB0C )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [9C] ( @code_08AB03, #$1001 )
    COP [87] ( #1B, #40, #53, #54 )
    COP [8A]
    COP [E0]
}

code_08AB03 {
    COP [85] ( #1C, #40, #53 )
    COP [8A]
    COP [E0]
}

code_08AB0C {
    COP [BF] ( &widestring_08AB11 )
    RTL 
}

widestring_08AB11 `[DEF]Kiaaa...kiaaa...[END]`