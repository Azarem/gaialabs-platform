
?INCLUDE 'wa7B_competitor_right'

---------------------------------------------

h_wa7B_competitor_left [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_wa7B_competitor_left {
    LDA #$0200
    TSB $12
    COP [9E] ( @code_07A192, #$0010, #$0000, #$1000 )
    COP [9E] ( @code_07A192, #$000C, #$FFF6, #$1000 )
    COP [9E] ( @code_07A192, #$0018, #$0008, #$1000 )
    COP [9E] ( @code_07A192, #$0020, #$0002, #$1000 )
    COP [0B]
    COP [C0] ( &code_07A12D )
    COP [C1]
    RTL 
}

code_07A12D {
    COP [BF] ( &widestring_07A132 )
    RTL 
}

widestring_07A132 `[TPL:A]You can [LU1:D3]do it!![END]`