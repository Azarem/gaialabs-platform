
---------------------------------------------

h_daC7_explorer3 [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_daC7_explorer3 {
    COP [C0] ( &code_08AAA7 )
    COP [0B]
    COP [C1]
    RTL 
}

code_08AAA7 {
    COP [BF] ( &widestring_08AAAC )
    RTL 
}

widestring_08AAAC `[DEF][LU2:3F]explorers. I hear[N][LU1:DB]a treasure[N][LU1:A2]the Pyramid...[END]`