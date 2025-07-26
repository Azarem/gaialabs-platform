
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_sg52_actor_05F655 [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_sg52_actor_05F655 {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [D1] ( #$0127, #01, &code_05F68C )
    BRA code_05F6BB
}

---------------------------------------------

func_05F672 {
    COP [80] ( #0F )
    COP [89]
    COP [32] ( #28 )
    COP [33]
    COP [CD] ( #$0127 )
    COP [CD] ( #$0128 )
    COP [CF] ( #$0129 )
    COP [CF] ( #$012A )
}

code_05F68C {
    COP [80] ( #0F )
    COP [89]
    COP [0B]
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &code_05F6A1 )
    COP [C1]
    RTL 
}

code_05F6A1 {
    COP [80] ( #10 )
    COP [89]
    COP [32] ( #2A )
    COP [33]
    COP [CD] ( #$0129 )
    COP [CD] ( #$012A )
    COP [CF] ( #$0127 )
    COP [CF] ( #$0128 )
}

code_05F6BB {
    COP [80] ( #10 )
    COP [89]
    COP [0B]
    LDA #$00FF
    STA $7F0026, X
    COP [58] ( &func_05F672 )
    COP [C1]
    RTL 
}