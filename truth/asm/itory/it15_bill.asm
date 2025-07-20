

---------------------------------------------

h_it15_bill [
  h_actor < #2A, #00, #10 >   ;00
]

---------------------------------------------

e_it15_bill {
    COP [C0] ( &code_04EFA4 )
    COP [0B]
    COP [D0] ( #47, #01, &code_04EF9E )
    COP [D0] ( #3B, #01, &code_04EF9B )
    COP [D2] ( #3B, #01 )
    COP [80] ( #2C )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [80] ( #2A )
    COP [89]
}

code_04EF9B {
    COP [C1]
    RTL 
}

code_04EF9E {
    COP [C0] ( &code_04EFA9 )
    BRA code_04EF9B
}

code_04EFA4 {
    COP [BF] ( &widestring_04EFAE )
    RTL 
}

code_04EFA9 {
    COP [BF] ( &widestring_04EFDF )
    RTL 
}

widestring_04EFAE `[DEF][TPL:4]Bill:[N]Meet [LU1:F0]the Elder.[N]He knows something.[PAL:0][END]`

widestring_04EFDF `[DEF][TPL:4][LU1:6]How is the [N]Elder? [FIN][LU1:61]you fought the [N]demon at [LU1:11]Castle, [N]did you [LU1:90]a shiny [N]silver stone? [FIN]There's a [LU1:C7]power[N]in [LU1:D7]stone.[FIN][LU1:12]if defeated by an[N]enemy, if you have[N]100 of them, you[N][LU1:EF][LU1:AF]again.[PAL:0][END]`