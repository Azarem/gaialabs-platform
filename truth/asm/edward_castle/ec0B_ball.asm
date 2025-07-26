
---------------------------------------------

h_ec0B_ball [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_ec0B_ball {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DBE8 )
    COP [C1]
    RTL 
}

code_04DBE8 {
    COP [BF] ( &widestring_04DBF1 )
    COP [CC] ( #04 )
    COP [E0]
}

widestring_04DBF1 `[TPL:E][TPL:0]Will: [LU1:4D]was [N]chained to [LU1:D6]ball...[PAL:0][END]`