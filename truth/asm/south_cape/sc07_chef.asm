

---------------------------------------------

h_sc07_chef [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_sc07_chef {
    COP [C0] ( &code_0491E8 )
    COP [0B]
    COP [C1]
    RTL 
}

code_0491E8 {
    COP [BF] ( &widestring_0491ED )
    RTL 
}

widestring_0491ED `[TPL:A]Mmmm, nice smell.[N]There's no stove, so[N]I'm cooking in [LU1:D6]pot.[END]`