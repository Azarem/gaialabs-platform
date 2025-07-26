
---------------------------------------------

h_wa79_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_wa79_erik {
    COP [D0] ( #94, #01, &code_07A44A )
    COP [D0] ( #97, #01, &code_07A459 )
    COP [D0] ( #96, #01, &code_07A44C )
    COP [0B]
    COP [BC] ( #00, #F8 )
    COP [C0] ( &code_07A466 )
    COP [C1]
    RTL 
}

code_07A44A {
    COP [E0]
}

code_07A44C {
    COP [25] ( #05, #09 )
    COP [0B]
    COP [C0] ( &code_07A46B )
    COP [C1]
    RTL 
}

code_07A459 {
    COP [25] ( #05, #09 )
    COP [0B]
    COP [C0] ( &code_07A470 )
    COP [C1]
    RTL 
}

code_07A466 {
    COP [BF] ( &widestring_07A475 )
    RTL 
}

code_07A46B {
    COP [BF] ( &widestring_07A4C8 )
    RTL 
}

code_07A470 {
    COP [BF] ( &widestring_07A506 )
    RTL 
}

widestring_07A475 `[TPL:A][TPL:3]Erik: Heh heh. [LU1:20][N][LU1:8F][LU1:C8]good. [FIN]Go [LU1:BF]and [LU1:A9][N][LU2:51]the house. I [LU1:91][N]a [LU1:A7]guilty, but ...[END]`

widestring_07A4C8 `[TPL:A][TPL:3]Erik: There is a full[N]moon tonight. The [N][LU1:EC][LU1:CC]different.[PAL:0][END]`

widestring_07A506 `[TPL:A][TPL:3]Erik: I wish Lance [N]and [LU1:2C][LU1:F2]coming,[N]too...[PAL:0][END]`