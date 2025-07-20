?INCLUDE 'stats_01ABF0'
?INCLUDE 'actor_00E256'
?INCLUDE 'func_00DB8A'

!player_flags                   09AE

---------------------------------------------

h_ir26_statue [
  h_actor < #1E, #00, #01 >   ;00
]

---------------------------------------------

e_ir26_statue {
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$1111
    STA $20
    STA $22
    LDA #$0031
    TSB $12
    COP [5B] ( #$0008 )
    COP [0B]
    COP [A2] ( @e_actor_00E256, #$2300 )

  code_0A88B9:
    LDA #$00FF
    STA $7F0026, X
    COP [C1]
    LDA $7F0026, X
    CMP #$00FF
    BNE code_0A88CC
    RTL 
}

code_0A88CC {
    LDA $player_flags
    BIT #$0002
    BNE code_0A88D9
    DEC $24
    BMI code_0A88B9
    RTL 
}

code_0A88D9 {
    COP [C7] ( @code_00DBB6 )
}