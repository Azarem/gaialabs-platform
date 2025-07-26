
?INCLUDE 'table_0EE000'

---------------------------------------------

func_00DF15 {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [80] ( #01 )
    COP [89]
    LDA #$2000
    TSB $10
    COP [E0]
}