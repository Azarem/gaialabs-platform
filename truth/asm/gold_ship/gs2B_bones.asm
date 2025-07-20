?INCLUDE 'table_0EDA00'


---------------------------------------------

h_gs2B_bones [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_gs2B_bones {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [80] ( #02 )
    COP [89]
    COP [C0] ( &code_058BD2 )
    COP [0B]
    COP [BC] ( #00, #04 )
    COP [C1]
    RTL 
}

code_058BD2 {
    COP [BF] ( &widestring_058BD7 )
    RTL 
}

widestring_058BD7 `[TPL:A][TPL:0]Will: [N]This is [LU1:F4]the [LU1:1E][N][LU1:F2]standing...[PAL:0][END]`