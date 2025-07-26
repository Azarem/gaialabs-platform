
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00C9B8'

!player_flags                   09AE

---------------------------------------------

h_it19_actor_04F3CD [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_it19_actor_04F3CD {
    COP [D1] ( #$011A, #01, &code_04F3FE )
    COP [9C] ( @code_04F400, #$2000 )
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$00FF
    STA $7F0026, X
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    LDA #$0030
    TSB $12
    COP [C1]
    RTL 
}

code_04F3FE {
    COP [E0]
}

code_04F400 {
    PHX 
    LDX $04
    LDA $7F0026, X
    CMP #$00FF
    BNE code_04F412
    PLX 
    COP [C4] ( @code_04F400 )
}

code_04F412 {
    PLX 
    LDA $player_flags
    BIT #$0002
    BNE code_04F42B
    PHX 
    LDX $04
    LDA #$00FF
    STA $7F0026, X
    PLX 
    COP [C4] ( @code_04F400 )
}

code_04F42B {
    COP [A0] ( @func_00C9B8, #$0098, #$0060, #$2000 )
    COP [32] ( #1A )
    COP [33]
    COP [CD] ( #$011A )
    COP [E0]
}