?INCLUDE 'table_0EE000'


---------------------------------------------

h_ec0F_rusty_switch [
  h_actor < #0F, #01, #03 >   ;00
]

---------------------------------------------

e_ec0F_rusty_switch {
    COP [88] ( @table_0EE000 )

  code_0A8979:
    COP [C1]
    COP [28] ( #$00D8, #$0298, &code_0A899D )
    COP [21] ( #01, &code_0A898F )
    COP [80] ( #0F )
    COP [89]
    BRA code_0A8979
}

code_0A898F {
    COP [BF] ( &widestring_0A89BF )
    COP [C1]
    COP [21] ( #01, &code_0A899C )
    BRA code_0A8979
}

code_0A899C {
    RTL 
}

code_0A899D {
    COP [DA] ( #0F )
    COP [80] ( #10 )
    COP [89]
    COP [DA] ( #0F )
    COP [D1] ( #$0104, #01, &code_0A89BC )
    COP [08] ( #$0E0E )
    COP [32] ( #04 )
    COP [33]
    COP [CD] ( #$0104 )
}

code_0A89BC {
    COP [C1]
    RTL 
}

widestring_0A89BF `[TPL:E][TPL:0]It [LU1:FA]go in![N][LU1:30][LU1:9F]rusty...[PAL:0][END]`