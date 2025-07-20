?INCLUDE 'actor_00E3BA'

!player_x_pos                   09A2
!player_y_pos                   09A4
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

h_mu60_force_ball [
  h_actor < #25, #00, #01 >   ;00
]

---------------------------------------------

e_mu60_force_ball {
    COP [13] ( &code_069E3A )
    LDA #$0021
    TSB $12
    COP [B6] ( #30 )
    COP [A2] ( @e_actor_00E3BA, #$2400 )
    COP [A1] ( @code_069D79, #$2000 )
    COP [C1]
    COP [80] ( #25 )
    COP [89]
    LDA #$00FF
    STA $7F0026, X
    RTL 
}

code_069D79 {
    COP [C1]
    LDY $06
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA $player_x_pos
    CLC 
    ADC #$0008
    CMP $14
    BNE code_069DAF
    LDA $player_y_pos
    CLC 
    ADC #$0010
    CMP $16
    BNE code_069DAF
    COP [17] ( &code_069DA3 )
    BRA code_069E1D
}

code_069DA3 {
    COP [18] ( &code_069DA9 )
    BRA code_069DE3
}

code_069DA9 {
    COP [15] ( &code_069E00 )
    BRA code_069DC6
}

code_069DAF {
    COP [35]
    CMP #$0000
    BEQ code_069DC6
    CMP #$0001
    BEQ code_069DE3
    CMP #$0002
    BEQ code_069E00
    CMP #$0003
    BEQ code_069E1D
    RTL 
}

code_069DC6 {
    LDA $16
    SEC 
    SBC $player_y_pos
    SEC 
    SBC #$0010
    CMP #$0010
    BCC code_069DD6
    RTL 
}

code_069DD6 {
    STZ $player_speed_ew
    LDA #$FFF8
    STA $player_speed_ns
    COP [06] ( #1D )
    RTL 
}

code_069DE3 {
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $14
    CMP #$0010
    BCC code_069DF3
    RTL 
}

code_069DF3 {
    LDA #$0008
    STA $player_speed_ew
    STZ $player_speed_ns
    COP [06] ( #1D )
    RTL 
}

code_069E00 {
    LDA $player_y_pos
    CLC 
    ADC #$0010
    SEC 
    SBC $16
    CMP #$0010
    BCC code_069E10
    RTL 
}

code_069E10 {
    STZ $player_speed_ew
    LDA #$0008
    STA $player_speed_ns
    COP [06] ( #1D )
    RTL 
}

code_069E1D {
    LDA $14
    SEC 
    SBC $player_x_pos
    SEC 
    SBC #$0008
    CMP #$0010
    BCC code_069E2D
    RTL 
}

code_069E2D {
    LDA #$FFF8
    STA $player_speed_ew
    STZ $player_speed_ns
    COP [06] ( #1D )
    RTL 
}

code_069E3A {
    COP [E0]
}