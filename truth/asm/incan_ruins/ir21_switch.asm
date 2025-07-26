
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_s21_switch [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_s21_switch {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0030
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]

  code_0A9041:
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &code_0A9054 )
    COP [80] ( #0F )
    COP [89]
    COP [C1]
    RTL 
}

code_0A9054 {
    COP [80] ( #10 )
    COP [89]
    COP [CC] ( #0F )
    COP [DA] ( #3B )
    BRA code_0A9041
}