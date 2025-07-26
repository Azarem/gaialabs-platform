
---------------------------------------------

h_fr32_fragrance [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_fragrance {
    COP [0B]
    COP [C0] ( &code_05BA18 )
    COP [C1]
    RTL 
}

code_05BA18 {
    COP [BF] ( &widestring_05BA1D )
    RTL 
}

widestring_05BA1D `[DEF]The Freejia is the city[N]flower. Smells good,[N][LU1:84]it?[END]`