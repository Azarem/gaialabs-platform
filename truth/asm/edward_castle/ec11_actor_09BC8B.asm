
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_ec11_actor_09BC8B [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_ec11_actor_09BC8B {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]

  code_09BCA6:
    LDA #$00FF
    STA $7F0026, X

  code_09BCAD:
    COP [58] ( &code_09BCBB )
    COP [80] ( #0F )
    COP [89]
    COP [C4] ( @code_09BCAD )
}

code_09BCBB {
    LDA #$0200
    TSB $10
    COP [80] ( #11 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    LDA #$0200
    TRB $10
    BRA code_09BCA6
}