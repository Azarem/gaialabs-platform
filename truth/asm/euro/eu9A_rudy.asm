
---------------------------------------------

h_eu9A_rudy [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_eu9A_rudy {
    COP [D0] ( #A7, #01, &eu9A_rudy_destroy )
    COP [C0] ( &code_07E725 )
    COP [0B]
    COP [C1]
    RTL 
}

code_07E725 {
    COP [BF] ( &widestring_07E72A )
    RTL 
}

widestring_07E72A `[DEF]Rudy: The [LU2:98]are a[N][LU1:95]place. They just[N][LU1:E7]my [LU2:4B]away.[END]`

---------------------------------------------

eu9A_rudy_destroy {
    COP [E0]
}