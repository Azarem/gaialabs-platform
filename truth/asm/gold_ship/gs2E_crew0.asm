
---------------------------------------------

h_gs2E_crew0 [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_gs2E_crew0 {
    COP [BC] ( #00, #F8 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05879F )
    COP [C1]
    RTL 
}

code_05879F {
    COP [BF] ( &widestring_0587A4 )
    RTL 
}

widestring_0587A4 `[TPL:E]Through the darkness, a [N]bright [LU1:A8]is visible [N]in front of the cave... [FIN]As the ship set sail,[N][LU1:D7][LU1:A8]represented the[N]freedom we had [LU1:A3]won.[END]`