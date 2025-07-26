
---------------------------------------------

h_ec11_flower [
  h_actor < #3F, #00, #18 >   ;00
]

---------------------------------------------

e_ec11_flower {
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_09BC4C )
    COP [C1]
    COP [80] ( #3F )
    COP [89]
    RTL 
}

code_09BC4C {
    COP [BF] ( &widestring_09BC51 )
    RTL 
}

widestring_09BC51 `[DEF]Flower in the corner:[N]Try [LU1:C4]the Flute...[N][LU2:27]the melody...[END]`