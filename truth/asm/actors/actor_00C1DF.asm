
!player_actor                   09AA
!player_speed_ew                09B2

---------------------------------------------

h_actor_00C1DF [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_00C1DF {
    LDY $player_actor
    LDA $14
    CLC 
    ADC #$0008
    SEC 
    SBC $0014, Y
    BPL code_00C1F5
    EOR #$FFFF
    INC 
}

code_00C1F5 {
    CMP #$0010
    BCC code_00C1FB
    RTL 
}

code_00C1FB {
    LDA $16
    CLC 
    ADC #$0008
    SEC 
    SBC $0016, Y
    BPL code_00C20B
    EOR #$FFFF
    INC 
}

code_00C20B {
    CMP #$0010
    BCC code_00C211
    RTL 
}

code_00C211 {
    LDA #$FFF9
    STA $player_speed_ew
    RTL 
}