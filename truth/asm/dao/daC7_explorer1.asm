

---------------------------------------------

h_daC7_explorer1 [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_daC7_explorer1 {
    COP [C0] ( &code_08A99A )
    COP [0B]
    COP [C1]
    RTL 
}

code_08A99A {
    COP [BF] ( &widestring_08A99F )
    RTL 
}

widestring_08A99F `[DEF]The [LU1:3F]is [LU1:B3]of[N][LU1:9C]stones. Strange[N][LU1:D7]it [LU1:84]sink[N][LU1:A1]the desert....[END]`