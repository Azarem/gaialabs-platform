
---------------------------------------------

h_sc05_seths_mother [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_sc05_seths_mother {
    COP [C0] ( &code_04910B )
    COP [0B]
    COP [C1]
    RTL 
}

code_04910B {
    COP [BF] ( &widestring_049110 )
    RTL 
}

widestring_049110 `[TPL:B]Seth's mother:[N][LU1:1D]no joke![N]That man![FIN]I put up [LU1:F0]it for[N]Seth's sake, but if it[N]weren't for him, I'd have[N][LU1:AE][LU1:A6]ago![END]`