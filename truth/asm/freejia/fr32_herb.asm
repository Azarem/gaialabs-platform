
---------------------------------------------

h_fr32_herb [
  h_actor < #26, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_herb {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05CF31 )
    COP [0B]
    COP [C1]
    RTL 
}

code_05CF31 {
    COP [D0] ( #53, #01, &code_05CF43 )
    COP [D4] ( #06, &code_05CF44 )
    COP [CC] ( #53 )
    COP [BF] ( &widestring_05CF49 )
}

code_05CF43 {
    RTL 
}

code_05CF44 {
    COP [BF] ( &widestring_05CF5B )
    RTL 
}

widestring_05CF49 `[DEF]You [LU1:8F]the herbs![END]`

widestring_05CF5B `[DEF]You [LU1:8F]the herbs, but[N][LU1:FE]inventory's full![END]`