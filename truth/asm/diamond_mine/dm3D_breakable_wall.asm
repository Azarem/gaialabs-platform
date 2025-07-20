?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00C9B8'

!player_flags                   09AE

---------------------------------------------

h_dm3D_breakable_wall [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_dm3D_breakable_wall {
    COP [D1] ( #$0133, #01, &code_0AAA52 )
    COP [BC] ( #08, #08 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$0031
    TSB $12

  code_0AAA10:
    LDA #$00FF
    STA $7F0026, X
    COP [C1]
    LDA $7F0026, X
    CMP #$00FF
    BNE code_0AAA32
    COP [45] ( #05, #03, #07, #07, &code_0AAA2E )
    COP [CE] ( #00 )
    RTL 
}

code_0AAA2E {
    COP [CC] ( #00 )
    RTL 
}

code_0AAA32 {
    LDA $player_flags
    BIT #$0002
    BNE code_0AAA3F
    DEC $24
    BMI code_0AAA10
    RTL 
}

code_0AAA3F {
    COP [9C] ( @func_00C9B8, #$2000 )
    COP [32] ( #33 )
    COP [33]
    COP [CE] ( #00 )
    COP [CD] ( #$0133 )
}

code_0AAA52 {
    COP [E0]
}