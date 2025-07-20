
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

func_00F3B3 {
    LDA #$0000
    STA $player_speed_ew
    STA $player_speed_ns
    STA $0008, Y
    LDA $0010, Y
    ORA #$0200
    STA $0010, Y
    RTL 
}