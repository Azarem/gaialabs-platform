
!player_actor                   09AA
!player_speed_ns                09B4

---------------------------------------------

h_actor_00C286 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_00C286 {
    LDY $player_actor
    LDA $14
    CLC 
    ADC #$0008
    SEC 
    SBC $0014, Y
    BPL code_00C29C
    EOR #$FFFF
    INC 
}

code_00C29C {
    CMP #$0010
    BCC code_00C2A2
    RTL 
}

code_00C2A2 {
    LDA $16
    SEC 
    SBC $0016, Y
    BPL code_00C2AE
    EOR #$FFFF
    INC 
}

code_00C2AE {
    CMP #$0004
    BCC code_00C2B4
    RTL 
}

code_00C2B4 {
    LDA #$FFF9
    STA $player_speed_ns
    RTL 
}