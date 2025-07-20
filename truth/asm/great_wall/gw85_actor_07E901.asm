
!player_actor                   09AA

---------------------------------------------

h_gw85_actor_07E901 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_gw85_actor_07E901 {
    COP [C1]
    COP [28] ( #$0458, #$00D0, &code_07E90F )
    RTL 
}

code_07E90F {
    LDA $0AD4
    BNE code_07E91C
    LDA $0AA2
    BIT #$0004
    BEQ code_07E91D
}

code_07E91C {
    RTL 
}

code_07E91D {
    LDY $player_actor
    LDA #$03C0
    STA $0014, Y
    RTL 
}