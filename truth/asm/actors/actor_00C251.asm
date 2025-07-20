
!player_actor                   09AA
!player_speed_ns                09B4

---------------------------------------------

h_actor_00C251 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_00C251 {
    LDY $player_actor
    LDA $14
    CLC 
    ADC #$0008
    SEC 
    SBC $0014, Y
    BPL code_00C267
    EOR #$FFFF
    INC 
}

code_00C267 {
    CMP #$0010
    BCC code_00C26D
    RTL 
}

code_00C26D {
    LDA $16
    SEC 
    SBC $0016, Y
    BPL code_00C279
    EOR #$FFFF
    INC 
}

code_00C279 {
    CMP #$0004
    BCC code_00C27F
    RTL 
}

code_00C27F {
    LDA #$0007
    STA $player_speed_ns
    RTL 
}