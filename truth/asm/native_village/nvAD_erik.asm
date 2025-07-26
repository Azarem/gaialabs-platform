
---------------------------------------------

h_nvAD_erik [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_nvAD_erik {
    COP [D0] ( #B2, #01, &code_088BD1 )
    COP [D0] ( #AE, #01, &code_088BC3 )
    COP [D0] ( #AD, #00, &code_088BD1 )
    COP [C0] ( &code_088BD3 )
    COP [D2] ( #AE, #01 )
    COP [86] ( #07, #04, #12 )
    COP [8A]
}

code_088BC3 {
    COP [25] ( #07, #0A )
    COP [80] ( #03 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_088BD1 {
    COP [E0]
}

code_088BD3 {
    COP [BF] ( &widestring_088BD8 )
    RTL 
}

widestring_088BD8 `[TPL:A][TPL:3]Erik: I'm exhausted. [N]I [LU1:91][LU1:A5]sleeping [N]for days.[PAL:0][END]`