?INCLUDE 'entry_points_00C418'

!scene_current                  0644
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_awBD_actor_08985E [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_awBD_actor_08985E {
    PHX 
    LDX #$0000

  code_089865:
    LDA $@array_0898A8, X
    CMP #$FFFF
    BEQ code_0898A5
    CMP $scene_current
    BNE code_089885
    LDA $@array_0898A8+2, X
    CMP $player_x_pos
    BNE code_089885
    LDA $@array_0898A8+4, X
    CMP $player_y_pos
    BEQ code_08988D
}

code_089885 {
    TXA 
    CLC 
    ADC #$0006
    TAX 
    BRA code_089865
}

code_08988D {
    LDY $player_actor
    LDA #$*func_00C479
    STA $0002, Y
    LDA #$&func_00C479
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
}

code_0898A5 {
    PLX 
    COP [E0]
}

---------------------------------------------

array_0898A8 [
  unk9 < #$00BB, #$00A0, #$0120 >   ;00
  unk9 < #$00BB, #$0110, #$0120 >   ;01
  unk9 < #$00BB, #$0280, #$01A0 >   ;02
  unk9 < #$00BB, #$00F0, #$0210 >   ;03
  unk9 < #$00BD, #$0248, #$01F0 >   ;04
]