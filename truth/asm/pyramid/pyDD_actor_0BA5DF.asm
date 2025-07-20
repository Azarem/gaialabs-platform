
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_pyDD_actor_0BA5DF [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_pyDD_actor_0BA5DF {
    LDY $player_actor
    LDA $0010, Y
    AND #$FFFE
    STA $0010, Y
    COP [C1]
    COP [45] ( #08, #0C, #0D, #0E, &code_0BA601 )
    COP [45] ( #14, #0C, #19, #0E, &code_0BA601 )
    RTL 
}

code_0BA601 {
    LDY $player_actor
    LDA $0010, Y
    ORA #$0001
    STA $0010, Y
    COP [C1]
    LDA $player_y_pos
    CMP #$01B0
    BEQ code_0BA618
    RTL 
}

code_0BA618 {
    BRA e_pyDD_actor_0BA5DF
}