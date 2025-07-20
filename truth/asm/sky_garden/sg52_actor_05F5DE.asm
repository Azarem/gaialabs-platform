?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'


---------------------------------------------

h_sg52_actor_05F5DE [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_sg52_actor_05F5DE {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$00FF
    STA $7F0026, X
    LDA #$0030
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]
    COP [D1] ( #$0126, #01, &code_05F62E )

  code_05F607:
    COP [58] ( &code_05F62E )
    COP [80] ( #0F )
    COP [89]
    COP [32] ( #90 )
    COP [33]
    COP [CF] ( #$0125 )
    COP [CF] ( #$0126 )
    COP [C1]
    COP [D1] ( #$0126, #01, &code_05F62E )
    LDA #$00FF
    STA $7F0026, X
    RTL 
}

code_05F62E {
    COP [58] ( &code_05F607 )
    COP [80] ( #10 )
    COP [89]
    COP [32] ( #26 )
    COP [33]
    COP [CD] ( #$0125 )
    COP [CD] ( #$0126 )
    COP [C1]
    COP [D1] ( #$0126, #00, &code_05F607 )
    LDA #$00FF
    STA $7F0026, X
    RTL 
}