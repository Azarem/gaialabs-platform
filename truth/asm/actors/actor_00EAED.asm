
!camera_offset_x                06D6
!camera_offset_y                06D8
!camera_bounds_x                06DA
!camera_bounds_y                06DC
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_x_tile                  09A6
!player_y_tile                  09A8
!player_flags                   09AE

---------------------------------------------

h_actor_00EAED [
  h_actor < #00, #00, #2C >   ;00
]

---------------------------------------------

e_actor_00EAED {
    LDA #$1000
    TSB $12
    COP [C1]
    LDA $06EE
    BIT #$0200
    BEQ code_00EB00
    RTL 
}

code_00EB00 {
    PHD 
    LDA $09F4
    TCD 
    LDA $14
    SEC 
    SBC #$0008
    STA $player_x_pos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $player_x_tile
    LDA $16
    SEC 
    SBC #$0010
    STA $player_y_pos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $player_y_tile
    LDA $player_flags
    BIT #$0100
    BNE code_00EB85
    LDA $14
    SEC 
    SBC #$0080
    BMI code_00EB4D
    CMP $camera_offset_x
    BMI code_00EB4D
    CLC 
    ADC #$0100
    CMP $camera_bounds_x
    BMI code_00EB52
    LDA $camera_bounds_x
    BRA code_00EB52
    LDA $camera_bounds_x
    BRA code_00EB52
}

code_00EB4D {
    LDA $camera_offset_x
    BRA code_00EB56
}

code_00EB52 {
    SEC 
    SBC #$0100
}

code_00EB56 {
    STA $06BE
    LDA $16
    SEC 
    SBC #$0080
    BMI code_00EB79
    CMP $camera_offset_y
    BMI code_00EB79
    CLC 
    ADC #$0100
    CMP $camera_bounds_y
    BMI code_00EB7E
    LDA $camera_bounds_y
    BRA code_00EB7E
    LDA $camera_bounds_y
    BRA code_00EB7E
}

code_00EB79 {
    LDA $camera_offset_y
    BRA code_00EB82
}

code_00EB7E {
    SEC 
    SBC #$0100
}

code_00EB82 {
    STA $06C2
}

code_00EB85 {
    LDA $06BE
    SEC 
    SBC $068A
    STA $06E4
    LDA $06C2
    SEC 
    SBC $068E
    STA $06E6
    PLD 
    RTL 
}