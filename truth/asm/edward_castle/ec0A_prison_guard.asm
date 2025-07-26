
---------------------------------------------

h_ec0A_prison_guard [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_prison_guard {
    COP [D0] ( #21, #01, &code_04D1B7 )
    COP [C0] ( &code_04D1B9 )
    COP [0B]
    COP [0D] ( #00, #01 )
    COP [BC] ( #00, #08 )
    COP [C1]
    RTL 
}

code_04D1B7 {
    COP [E0]
}

code_04D1B9 {
    COP [BF] ( &widestring_04D1BE )
    RTL 
}

widestring_04D1BE `[TPL:B]Soldier:[N]This is the underground[N]prison. Innocent people[N][LU1:78]enter.[END]`