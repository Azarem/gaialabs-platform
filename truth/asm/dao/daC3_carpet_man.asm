
---------------------------------------------

h_daC3_carpet_man [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_carpet_man {
    COP [0B]
    COP [C0] ( &code_08AB94 )
    COP [C1]
    RTL 
}

code_08AB94 {
    COP [BF] ( &widestring_08AB99 )
    RTL 
}

widestring_08AB99 `[DEF]This [LU1:E2]is famous for[N]spices and carpet.[FIN][LU1:1D][LU1:D4]the carpets[N]of [LU1:11]Castle took[N]40 [LU2:C6]to weave here.[END]`