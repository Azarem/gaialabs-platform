
---------------------------------------------

h_fr3A_sympathetic [
  h_actor < #27, #00, #10 >   ;00
]

---------------------------------------------

e_fr3A_sympathetic {
    COP [D0] ( #5A, #01, &code_05C325 )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C327 )
    COP [C1]
    RTL 
}

code_05C325 {
    COP [E0]
}

code_05C327 {
    COP [BF] ( &widestring_05C32F )
    COP [CC] ( #59 )
    RTL 
}

widestring_05C32F `[TPL:A]Please! [N][LU1:D]tell! [FIN]I [LU1:82][LU2:57][LU1:6B]myself,[N]I [LU1:A3][LU1:82][LU1:F1]to get [N]him in trouble...[END]`