
---------------------------------------------

h_ec0A_bed_maid [
  h_actor < #25, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_bed_maid {
    COP [C0] ( &code_04C7BA )
    COP [0B]
    COP [C1]
    RTL 
}

code_04C7BA {
    COP [BF] ( &widestring_04C7BF )
    RTL 
}

widestring_04C7BF `[DEF]Recently, a hunter was[N]hired.[N]I [LU1:F9][LU1:F7]the King[N]is thinking...[END]`