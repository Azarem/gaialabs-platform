

---------------------------------------------

h_daC3_kruk2 [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_kruk2 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_08AC38 )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08AC38 {
    COP [BF] ( &widestring_08AC3D )
    RTL 
}

widestring_08AC3D `[DEF]Kiaaa...Kiaaa...[END]`