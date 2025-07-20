
!player_actor                   09AA
!CGADSUB                        2131

---------------------------------------------

h_thinker_00B818 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B818 {
    COP [D2] ( #2B, #01 )
    COP [C1]
    LDY $player_actor
    LDA $0014, Y
    CMP #$01B0
    BCC code_00B835
    SEP #$20
    LDA #$00
    STA $CGADSUB
    REP #$20
    RTL 
}

code_00B835 {
    SEP #$20
    LDA #$50
    STA $CGADSUB
    REP #$20
    RTL 
}