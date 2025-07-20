?INCLUDE 'player_character'
?INCLUDE 'thinker_00B7EA'

!player_actor                   09AA
!player_flags                   09AE
!_TM                            212C
!CGADSUB                        2131
!COLDATA                        2132

---------------------------------------------

h_awB4_actor_08992A [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_awB4_actor_08992A {
    COP [28] ( #$0578, #$0010, &code_089937 )
    BRA code_089988
}

code_089937 {
    LDY $player_actor
    LDA $0010, Y
    AND #$FFF7
    ORA #$0200
    STA $0010, Y
    SEP #$20
    LDA #$^code_02C63B
    STA $0002, Y
    REP #$20
    LDA #$&code_02C63B
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0800
    TSB $player_flags
    COP [D0] ( #B5, #01, &code_089988 )
    COP [CC] ( #B5 )
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$A1
    STA $CGADSUB
    LDA #$FF
    STA $COLDATA
    REP #$20
    COP [DA] ( #B3 )
    COP [3C] ( @e_thinker_00B7EA )
}

code_089988 {
    COP [C1]
    COP [40] ( #$0F01, &code_089991 )
    RTL 
}

code_089991 {
    COP [45] ( #3D, #0C, #43, #1B, &code_0899A2 )
    COP [45] ( #43, #06, #5D, #1B, &code_0899A2 )
    RTL 
}

code_0899A2 {
    LDA $0036
    AND #$0007
    BEQ code_0899AB
    RTL 
}

code_0899AB {
    COP [06] ( #08 )
    RTL 
}