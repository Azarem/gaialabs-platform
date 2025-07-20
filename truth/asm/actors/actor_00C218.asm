
!player_actor                   09AA
!player_speed_ew                09B2

---------------------------------------------

h_actor_00C218 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_actor_00C218 {
    LDY $player_actor
    LDA $14
    CLC 
    ADC #$0008
    SEC 
    SBC $0014, Y
    BPL code_00C22E
    EOR #$FFFF
    INC 
}

code_00C22E {
    CMP #$0010
    BCC code_00C234
    RTL 
}

code_00C234 {
    LDA $16
    CLC 
    ADC #$0008
    SEC 
    SBC $0016, Y
    BPL code_00C244
    EOR #$FFFF
    INC 
}

code_00C244 {
    CMP #$0010
    BCC code_00C24A
    RTL 
}

code_00C24A {
    LDA #$0007
    STA $player_speed_ew
    RTL 
}