
---------------------------------------------

h_daC3_freedom_man [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_freedom_man {
    COP [0B]
    COP [C0] ( &code_08AB2F )
    COP [C1]
    RTL 
}

code_08AB2F {
    COP [BF] ( &widestring_08AB34 )
    RTL 
}

widestring_08AB34 `[DEF]A freedom movement [N]has [LU1:CB]recently. [FIN]The [LU2:8D]of [LU1:44][N][LU1:CB]the [LU1:AD]trade [N]freedom movement. [END]`