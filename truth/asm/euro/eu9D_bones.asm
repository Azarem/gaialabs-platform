?INCLUDE 'table_0EDA00'


---------------------------------------------

h_eu9D_bones [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_eu9D_bones {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [BC] ( #00, #04 )
    COP [C1]
    RTL 
}