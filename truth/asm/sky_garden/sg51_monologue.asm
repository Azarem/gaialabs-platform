?INCLUDE 'stats_01ABF0'
?INCLUDE 'actor_00E256'
?INCLUDE 'func_00DB8A'

!player_flags                   09AE

---------------------------------------------

h_sg51_monologue [
  h_actor < #3D, #00, #01 >   ;00
]

---------------------------------------------

e_sg51_monologue {
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$0031
    TSB $12
    COP [5B] ( #$0008 )
    COP [0B]
    COP [A2] ( @e_actor_00E256, #$2300 )

  code_05F8DC:
    COP [58] ( &code_05F8EA )
    COP [C1]
    LDA #$00FF
    STA $7F0026, X
    RTL 
}

code_05F8EA {
    LDA $player_flags
    BIT #$0002
    BEQ code_05F8DC
    COP [C7] ( @func_00DB8A )
}

---------------------------------------------

widestring_05F8F7 `Will: There was a [N]tremendous [LU2:C5]at the [N][LU2:19]Cliff. [FIN]That's [LU2:8F][LU1:F7]the [N]old man meant by the [N][LU2:4B]of the spirits.... [FIN]This is the cliff with[N]no wind. My heart[N]beats fast.[PAL:0][END]`