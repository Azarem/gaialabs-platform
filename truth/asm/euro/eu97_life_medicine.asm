
---------------------------------------------

h_eu97_life_medicine [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_eu97_life_medicine {
    COP [BC] ( #08, #00 )
    COP [A4] ( @code_07CDD4, #00, #EC, #$1000 )
    COP [C0] ( &code_07CD0A )
    COP [C1]
    RTL 
}

code_07CD0A {
    COP [D0] ( #F0, #01, &code_07CD34 )
    COP [BF] ( &widestring_07CD39 )
    COP [BE] ( #02, #02, &code_list_07CD1A )
}

code_list_07CD1A [
  &code_07CD20   ;00
  &code_07CD25   ;01
  &code_07CD20   ;02
]

code_07CD20 {
    COP [BF] ( &widestring_07CD9B )
    RTL 
}

code_07CD25 {
    COP [CC] ( #F0 )
    INC $0ACA
    INC $0ACE
    COP [BF] ( &widestring_07CD64 )
    COP [E0]
}

code_07CD34 {
    COP [BF] ( &widestring_07CDB3 )
    RTL 
}

widestring_07CD39 `[DEF]This is Life Medicine.[N]Try some?[N] Yes[N] No`

widestring_07CD64 `[CLR][TPL:0]That taste makes my[N]mouth pucker.[FIN][LU1:68][LU1:C2]is increased![END]`

widestring_07CD9B `[CLR]Really....[N][LU1:D]you [LU1:A5]it?[END]`

widestring_07CDB3 `[DEF]I'm sorry...[N]One to a customer.[END]`

code_07CDD4 {
    COP [80] ( #26 )
    COP [89]
    RTL 
}