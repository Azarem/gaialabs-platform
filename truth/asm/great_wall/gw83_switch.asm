
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00C9B8'

---------------------------------------------

h_gw83_switch [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_gw83_switch {
    COP [D1] ( #$0152, #01, &code_07BDE6 )
    COP [D2] ( #01, #01 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #29 )
    COP [89]
    LDA #$2000
    TRB $10
    LDA #$0278
    STA $7F0018, X
    LDA #$0190
    STA $7F001A, X
    COP [52] ( #29, #04, #FF )
    COP [53]
    COP [9C] ( @func_00C9B8, #$2000 )
    COP [32] ( #52 )
    COP [33]
    COP [CD] ( #$0152 )
}

code_07BDE6 {
    COP [E0]
}