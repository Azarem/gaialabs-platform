
!player_actor                   09AA

---------------------------------------------

func_0AA36E {
    LDY $player_actor
    LDA $0010, Y
    ORA #$0200
    STA $0010, Y
    RTL 
}