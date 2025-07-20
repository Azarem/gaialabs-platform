

---------------------------------------------

h_wa78_kruk [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_kruk {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_079AEA )
    COP [0B]
    COP [27] ( #0F )
    COP [80] ( #1C )
    COP [89]
    RTL 
}

code_079AEA {
    COP [BF] ( &widestring_079AEF )
    RTL 
}

widestring_079AEF `[DEF]Kyaah!!... kyaah!!...[END]`