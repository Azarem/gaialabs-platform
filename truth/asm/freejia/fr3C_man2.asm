
---------------------------------------------

h_fr3C_man2 [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_fr3C_man2 {
    COP [0B]
    COP [C0] ( &code_05C2B9 )
    COP [C1]
    RTL 
}

code_05C2B9 {
    COP [BF] ( &widestring_05C2BE )
    RTL 
}

widestring_05C2BE `[TPL:E][LU1:5E]laborers are the[N][LU1:CD]age as you.[FIN]Remember.There are[N][LU1:C1]everywhere[N]who [LU1:AF][LU1:D6]way.[END]`