?BANK 00

!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

h_large_ramp_e [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_large_ramp_e {
    LDA $player_speed_ew
    ORA $player_speed_ns
    BNE code_00C96F
    RTL 
}

code_00C96F {
    COP [C1]
    COP [21] ( #02, &code_00C977 )
    RTL 
}

code_00C977 {
    LDA $player_speed_ew
    BMI code_00C981
    INC $player_speed_ew
    BRA code_00C984
}

code_00C981 {
    DEC $player_speed_ew
}

code_00C984 {
    COP [C1]
    COP [21] ( #03, &code_00C98D )
    BRA e_large_ramp_e
}

code_00C98D {
    RTL 
}