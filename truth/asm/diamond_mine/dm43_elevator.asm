
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A
!map_bounds_x                   0692
!map_bounds_y                   0696
!player_x_pos                   09A2
!player_actor                   09AA
!COLDATA                        2132

---------------------------------------------

h_dm43_elevator [
  h_actor < #34, #01, #03 >   ;00
]

---------------------------------------------

e_dm43_elevator {
    SEP #$20
    LDA #$23
    STA $COLDATA
    LDA #$42
    STA $COLDATA
    REP #$20
    LDA $player_x_pos
    CMP #$0030
    BCS code_0AA5FE
    COP [25] ( #04, #08 )
    COP [C1]
    COP [28] ( #$0048, #$0080, &code_0AA5CE )
    RTL 
}

code_0AA5CE {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [C1]

  code_0AA5D6:
    COP [83] ( #34, #03, #01 )
    COP [89]
    JSR $&sub_0AA63D
    LDY $player_actor
    LDA $14
    INC 
    STA $0014, Y
    LDA $16
    STA $0016, Y
    CMP #$0340
    BEQ code_0AA5F5
    BRA code_0AA5D6
}

code_0AA5F5 {
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_0AA5FE {
    COP [25] ( #5C, #34 )
    COP [C1]
    COP [28] ( #$05C8, #$0340, &code_0AA60D )
    RTL 
}

code_0AA60D {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [C1]

  code_0AA615:
    COP [83] ( #34, #04, #02 )
    COP [89]
    JSR $&sub_0AA63D
    LDY $player_actor
    LDA $14
    DEC 
    STA $0014, Y
    LDA $16
    STA $0016, Y
    CMP #$0080
    BEQ code_0AA634
    BRA code_0AA615
}

code_0AA634 {
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

---------------------------------------------

sub_0AA63D {
    LDA $0036
    AND #$000F
    BNE code_0AA648
    COP [06] ( #0C )
}

code_0AA648 {
    COP [40] ( #$0801, &code_0AA661 )
    COP [40] ( #$0401, &code_0AA666 )
    COP [40] ( #$0201, &code_0AA66B )
    COP [40] ( #$0101, &code_0AA670 )
    RTS 
}

code_0AA661 {
    LDA #$0001
    BRA code_0AA673
}

code_0AA666 {
    LDA #$0000
    BRA code_0AA673
}

code_0AA66B {
    LDA #$0002
    BRA code_0AA673
}

code_0AA670 {
    LDA #$0003
}

code_0AA673 {
    JSL $@func_00C6E4
    RTS 
}

---------------------------------------------

h_dm43_elevator_stop_y [
  h_actor < #34, #01, #13 >   ;00
]

---------------------------------------------

e_dm43_elevator_stop_y {
    COP [BC] ( #05, #00 )

  code_0AA67F:
    COP [C1]
    COP [AB] ( #01 )
    LDA $16
    CMP $map_bounds_y
    BEQ code_0AA68C
    RTL 
}

code_0AA68C {
    COP [C1]
    COP [AB] ( #02 )
    LDA $16
    CMP #$0000
    BEQ code_0AA67F
    RTL 
}

---------------------------------------------

h_dm43_elevator_stop_x [
  h_actor < #34, #01, #13 >   ;00
]

---------------------------------------------

e_dm43_elevator_stop_x {
    COP [C1]
    COP [AA] ( #01 )
    LDA $14
    CMP $map_bounds_x
    BEQ code_0AA6A9
    RTL 
}

code_0AA6A9 {
    COP [C1]
    COP [AA] ( #02 )
    LDA $14
    CMP #$0000
    BEQ e_dm43_elevator_stop_x
    RTL 
}