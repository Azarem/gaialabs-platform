
---------------------------------------------

h_av6B_musician [
  h_actor < #18, #00, #10 >   ;00
]

---------------------------------------------

e_av6B_musician {
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_06D0C1 )
    COP [C1]
    COP [80] ( #98 )
    COP [89]
    RTL 
}

code_06D0C1 {
    COP [BF] ( &widestring_06D0C6 )
    RTL 
}

widestring_06D0C6 `[TPL:A]Woman Playing Harp:[N]Music is the best[N]medicine for the soul.[FIN]The [LU2:94]song [LU1:EF]cure[N]any disease.[END]`