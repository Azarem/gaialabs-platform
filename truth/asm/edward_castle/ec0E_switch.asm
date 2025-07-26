
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_ec0E_switch [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_ec0E_switch {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]
    LDA #$00FF
    STA $7F0026, X

  code_0A8953:
    COP [CE] ( #01 )
    COP [58] ( &code_0A8962 )
    COP [80] ( #0F )
    COP [89]
    COP [C1]
    RTL 
}

code_0A8962 {
    COP [CC] ( #01 )
    COP [58] ( &code_0A8953 )
    COP [80] ( #10 )
    COP [89]
    COP [C1]
    RTL 
}