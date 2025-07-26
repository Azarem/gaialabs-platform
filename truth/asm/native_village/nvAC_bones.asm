
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_nvAC_bones [
  h_actor < #00, #01, #10 >   ;00
]

---------------------------------------------

e_nvAC_bones {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_08801B )
    COP [C1]
    RTL 
}

code_08801B {
    COP [BF] ( &widestring_088020 )
    RTL 
}

widestring_088020 `[DEF][TPL:0][LU1:5D]not weathered[N]yet... [LU1:38]recently[N]bleached white.[PAL:0][END]`