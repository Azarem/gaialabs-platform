
---------------------------------------------

h_wa7B_competitor_right [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_wa7B_competitor_right {
    LDA #$0200
    TSB $12
    COP [9E] ( @code_07A192, #$FFEE, #$FFF4, #$1000 )
    COP [9E] ( @code_07A192, #$FFF4, #$0008, #$1000 )
    COP [9E] ( @code_07A192, #$FFE8, #$0000, #$1000 )
    COP [9E] ( @code_07A192, #$FFE0, #$FFF6, #$1000 )
    COP [0B]
    COP [C0] ( &code_07A183 )
    COP [C1]
    RTL 
}

code_07A183 {
    COP [BF] ( &widestring_07A188 )
    RTL 
}

widestring_07A188 `[TPL:A]Uhnn...[END]`

code_07A192 {
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}