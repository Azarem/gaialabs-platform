
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_ec12_actor_09BF0F [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_ec12_actor_09BF0F {
    LDA $0AD4
    BNE code_09BF1C
    LDA #$0200
    TSB $10
}

code_09BF1C {
    COP [BC] ( #02, #00 )
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [88] ( @table_0EE000 )
    LDA #$00FF
    STA $7F0026, X

  code_09BF38:
    COP [58] ( &code_09BF46 )
    COP [80] ( #0F )
    COP [89]
    COP [C4] ( @code_09BF38 )
}

code_09BF46 {
    COP [80] ( #11 )
    COP [89]
    COP [D1] ( #$0114, #01, &code_09BF68 )
    COP [08] ( #$0F0F )
    COP [32] ( #14 )
    COP [33]
    COP [CD] ( #$0114 )
    COP [32] ( #15 )
    COP [33]
    COP [CD] ( #$0115 )
}

code_09BF68 {
    COP [C1]
    RTL 
}