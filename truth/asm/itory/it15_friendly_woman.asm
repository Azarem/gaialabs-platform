
---------------------------------------------

h_it15_friendly_woman [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_it15_friendly_woman {
    COP [C0] ( &code_04E02E )
    COP [0B]
    COP [C1]
    RTL 
}

code_04E02E {
    COP [BF] ( &widestring_04E033 )
    RTL 
}

widestring_04E033 `[DEF]There are no other[N][LU1:7D][LU2:18]age[N]in the [LU2:BD]Please[N][LU1:71]friends.[END]`