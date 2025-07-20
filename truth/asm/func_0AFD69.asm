
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

func_0AFD69 {
    COP [23]
    SEC 
    SBC #$0080
    CLC 
    ADC $player_x_pos
    STA $14
    COP [23]
    SEC 
    SBC #$0080
    CLC 
    ADC $player_y_pos
    STA $16
    LDA #$003C
    STA $08
    RTL 
}