
!player_actor                   09AA
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

e_actor_02B20E {
    LDA $0AD4
    CMP #$0002
    BEQ code_02B218
    COP [E0]
}

code_02B218 {
    COP [A2] ( @func_02B28D, #$2800 )

  code_02B21F:
    LDY $06
    LDA #$&func_02B28D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    COP [C1]
    JSR $&sub_02B264
    LDA $player_speed_ew
    ORA $player_speed_ns
    BNE code_02B241
    COP [D0] ( #00, #01, &code_02B241 )
    RTL 
}

code_02B241 {
    LDY $06
    LDA #$&func_02B294
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    COP [C1]
    JSR $&sub_02B264
    LDA $player_speed_ew
    ORA $player_speed_ns
    BEQ code_02B25D
    RTL 
}

code_02B25D {
    COP [D0] ( #00, #00, &code_02B21F )
    RTL 
}

---------------------------------------------

sub_02B264 {
    LDA $0AD4
    CMP #$0002
    BNE code_02B28A
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BNE code_02B278
    RTS 
}

code_02B278 {
    PLA 
    LDY $06
    LDA #$&func_02B29B
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    COP [C1]
    RTL 
}

code_02B28A {
    PLA 
    COP [E0]
}

---------------------------------------------

func_02B28D {
    COP [37] ( #23 )
    COP [39]
    BRA func_02B28D
}

---------------------------------------------

func_02B294 {
    COP [37] ( #24 )
    COP [39]
    BRA func_02B294
}

---------------------------------------------

func_02B29B {
    COP [C1]
    RTL 
}