
!joypad_mask_std                065A
!player_y_pos                   09A4
!player_speed_ew                09B2

---------------------------------------------

h_ir1E_actor_09C4B2 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_ir1E_actor_09C4B2 {
    COP [C2]
    LDA $player_y_pos
    CMP #$0110
    BCS code_09C4C4
    COP [CC] ( #00 )
    BRA code_09C4C7
}

code_09C4C4 {
    COP [CE] ( #00 )
}

code_09C4C7 {
    COP [D0] ( #30, #00, &e_ir1E_actor_09C4B2 )
    COP [D0] ( #31, #00, &e_ir1E_actor_09C4B2 )
    COP [CC] ( #00 )
    COP [08] ( #$1616 )

  code_09C4DA:
    COP [C1]
    COP [28] ( #$01E8, #$0120, &code_09C4ED )
    COP [28] ( #$01E7, #$0120, &code_09C4ED )
    RTL 
}

code_09C4ED {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [08] ( #$1616 )
    COP [CA] ( #28 )
    COP [9C] ( @code_09C51B, #$1000 )
    COP [C3] ( @code_09C508, #$0008 )
}

code_09C508 {
    COP [CB]
    LDA #$FFF8
    STA $player_speed_ew
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [DA] ( #3B )
    BRA code_09C4DA
}

code_09C51B {
    LDA #$02A0
    STA $14
    COP [23]
    CLC 
    ADC #$0090
    STA $16
    COP [23]
    AND #$0003
    BEQ code_09C53B
    DEC 
    BEQ code_09C544
    COP [85] ( #1A, #40, #0C )
    COP [8A]
    COP [E0]
}

code_09C53B {
    COP [85] ( #1B, #40, #0E )
    COP [8A]
    COP [E0]
}

code_09C544 {
    COP [85] ( #1C, #40, #10 )
    COP [8A]
    COP [E0]
}