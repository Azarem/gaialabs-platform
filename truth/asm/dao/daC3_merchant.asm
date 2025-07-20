

---------------------------------------------

h_daC3_merchant [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_merchant {
    COP [C0] ( &code_08A8B2 )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [85] ( #08, #40, #12 )
    COP [8A]
    COP [E0]
}

code_08A8B2 {
    COP [BF] ( &widestring_08A8B7 )
    RTL 
}

widestring_08A8B7 `[DEF]Merchant:[N]I [LU1:98]fine goods for[N]sale today. [LU1:67]never[N][LU2:A7]carpets [LU1:D6]nice.[END]`