

---------------------------------------------

h_daC3_kruk1 [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_kruk1 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08AC0C )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08AC0C {
    COP [BF] ( &widestring_08AC11 )
    RTL 
}

widestring_08AC11 `[DEF]Kiaaa...Kiaaa...[END]`