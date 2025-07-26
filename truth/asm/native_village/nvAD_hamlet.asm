
---------------------------------------------

h_nvAD_hamlet [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_nvAD_hamlet {
    COP [D0] ( #B2, #01, &code_088C40 )
    COP [D0] ( #AE, #01, &code_088C32 )
    COP [D0] ( #AD, #00, &code_088C40 )
    COP [C0] ( &code_088C42 )
    COP [D2] ( #AE, #01 )
    COP [86] ( #17, #0C, #12 )
    COP [8A]
}

code_088C32 {
    COP [25] ( #08, #08 )
    COP [80] ( #12 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_088C40 {
    COP [E0]
}

code_088C42 {
    COP [BF] ( &widestring_088C47 )
    RTL 
}

widestring_088C47 `[TPL:8][LU1:3A]oink.[END]`