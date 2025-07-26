
---------------------------------------------

h_fr3B_tornado [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr3B_tornado {
    COP [C0] ( &code_05BBFB )
    COP [0B]
    COP [C1]
    RTL 
}

code_05BBFB {
    COP [BF] ( &widestring_05BC00 )
    RTL 
}

widestring_05BC00 `[TPL:A][LU1:1D]not [LU1:A5]a tornado [N][LU1:80][LU1:DC][LU2:74][FIN][LU1:30]you'd be more[N]comfortable in a place[N]not quite so neat?[END]`