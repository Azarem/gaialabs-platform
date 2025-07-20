?BANK 00
?INCLUDE 'chunk_00D088'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

h_ramp_east [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ramp_east {
    COP [C1]

  code_00D2D5:
    LDA $14
    CLC 
    ADC #$0008
    STA $0018
    LDA $player_speed_ew
    JSR $&sub_00D4BB
    BCC code_00D2E7
    RTL 
}

code_00D2E7 {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_00D2F6
    EOR #$FFFF
    INC 
}

code_00D2F6 {
    CMP #$0019
    BMI code_00D2FC
    RTL 
}

code_00D2FC {
    LDA $0014, Y
    SEC 
    SBC #$0008
    SEC 
    SBC $0018
    BMI code_00D30A
    RTL 
}

code_00D30A {
    BPL code_00D310
    EOR #$FFFF
    INC 
}

code_00D310 {
    CMP #$000F
    BCC code_00D316
    RTL 
}

code_00D316 {
    COP [C1]
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BEQ code_00D334
    BPL code_00D329
    EOR #$FFFF
    INC 
}

code_00D329 {
    CMP #$0010
    BCS code_00D32F
    RTL 
}

code_00D32F {
    COP [C4] ( @code_00D2D5 )
}

code_00D334 {
    LDA #$&func_00D4D2
    STA $0000, Y
    LDA #$*func_00D4D2
    STA $0002, Y
    JSR $&sub_00D496
    COP [C4] ( @code_00D2D5 )
}

---------------------------------------------

h_ramp_west [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ramp_west {
    COP [C1]

  code_00D34D:
    LDA $14
    SEC 
    SBC #$0008
    STA $0018
    LDA $player_speed_ew
    JSR $&sub_00D4BB
    BCC code_00D35F
    RTL 
}

code_00D35F {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_00D36E
    EOR #$FFFF
    INC 
}

code_00D36E {
    CMP #$0019
    BMI code_00D374
    RTL 
}

code_00D374 {
    LDA $0014, Y
    CLC 
    ADC #$0008
    SEC 
    SBC $0018
    BPL code_00D382
    RTL 
}

code_00D382 {
    CMP #$000F
    BCC code_00D388
    RTL 
}

code_00D388 {
    COP [C1]
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BEQ code_00D3A6
    BPL code_00D39B
    EOR #$FFFF
    INC 
}

code_00D39B {
    CMP #$0010
    BCS code_00D3A1
    RTL 
}

code_00D3A1 {
    COP [C4] ( @code_00D34D )
}

code_00D3A6 {
    LDA #$&func_00D4F5
    STA $0000, Y
    LDA #$*func_00D4F5
    STA $0002, Y
    JSR $&sub_00D496
    COP [C4] ( @code_00D34D )
}

---------------------------------------------

h_ramp_north [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ramp_north {
    COP [C1]

  code_00D3BF:
    LDA $player_speed_ns
    JSR $&sub_00D4BB
    BCC code_00D3C8
    RTL 
}

code_00D3C8 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_00D3D7
    EOR #$FFFF
    INC 
}

code_00D3D7 {
    CMP #$0011
    BMI code_00D3DD
    RTL 
}

code_00D3DD {
    LDA $0016, Y
    SEC 
    SBC #$0010
    SEC 
    SBC $16
    BMI code_00D3EA
    RTL 
}

code_00D3EA {
    BPL code_00D3F0
    EOR #$FFFF
    INC 
}

code_00D3F0 {
    CMP #$000F
    BCC code_00D3F6
    RTL 
}

code_00D3F6 {
    COP [C1]
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BEQ code_00D414
    BPL code_00D409
    EOR #$FFFF
    INC 
}

code_00D409 {
    CMP #$0010
    BCS code_00D40F
    RTL 
}

code_00D40F {
    COP [C4] ( @code_00D3BF )
}

code_00D414 {
    LDA #$&func_00D518
    STA $0000, Y
    LDA #$*func_00D518
    STA $0002, Y
    JSR $&sub_00D496
    COP [C4] ( @code_00D3BF )
}

---------------------------------------------

h_ramp_south [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ramp_south {
    COP [C1]

  code_00D42D:
    LDA $16
    SEC 
    SBC #$0010
    STA $001C
    LDA $player_speed_ns
    JSR $&sub_00D4BB
    BCC code_00D43F
    RTL 
}

code_00D43F {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_00D44E
    EOR #$FFFF
    INC 
}

code_00D44E {
    CMP #$0011
    BMI code_00D454
    RTL 
}

code_00D454 {
    LDA $0016, Y
    SEC 
    SBC $001C
    BPL code_00D45E
    RTL 
}

code_00D45E {
    CMP #$000F
    BCC code_00D464
    RTL 
}

code_00D464 {
    COP [C1]
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BEQ code_00D482
    BPL code_00D477
    EOR #$FFFF
    INC 
}

code_00D477 {
    CMP #$0010
    BCS code_00D47D
    RTL 
}

code_00D47D {
    COP [C4] ( @code_00D42D )
}

code_00D482 {
    LDA #$&func_00D550
    STA $0000, Y
    LDA #$*func_00D550
    STA $0002, Y
    JSR $&sub_00D496
    COP [C4] ( @code_00D42D )
}

---------------------------------------------

sub_00D496 {
    STZ $player_speed_ew
    STZ $player_speed_ns
    LDA $0E
    PHX 
    TYX 
    STA $7F0020, X
    LDA #$0000
    STA $002C, X
    STA $002E, X
    PLX 
    LDA #$0F00
    TSB $joypad_mask_std
    LDA #$0800
    TSB $player_flags
    RTS 
}

---------------------------------------------

sub_00D4BB {
    BPL code_00D4C1
    EOR #$FFFF
    INC 
}

code_00D4C1 {
    CMP #$0006
    BCC code_00D4D0
    LDA $player_flags
    BIT #$0800
    BNE code_00D4D0
    CLC 
    RTS 
}

code_00D4D0 {
    SEC 
    RTS 
}

---------------------------------------------

func_00D4D2 {
    COP [9B] ( @func_00D5C0 )
    PHX 
    LDX $06
    LDA #$FFF8
    STA $7F0012, X
    PLX 
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10

  code_00D4EC:
    COP [92] ( #21, #10, #00 )
    COP [89]
    BRA code_00D4EC
}

---------------------------------------------

func_00D4F5 {
    COP [9B] ( @func_00D5C0 )
    PHX 
    LDX $06
    LDA #$0008
    STA $7F0012, X
    PLX 
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10

  code_00D50F:
    COP [92] ( #24, #0F, #00 )
    COP [89]
    BRA code_00D50F
}

---------------------------------------------

func_00D518 {
    LDA $7F0020, X
    STA $7F0014, X
    LDA #$&loc_00D531
    STA $7F001E, X
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10

  loc_00D531:
    COP [92] ( #1E, #00, #10 )
    COP [89]
    COP [CB]
    LDA #$FFF8
    STA $player_speed_ns
    JSR $&sub_00D58A
    LDA #$0000
    STA $09B6
    LDA #$0007
    STA $09B8
    RTL 
}

---------------------------------------------

func_00D550 {
    LDA $7F0020, X
    STA $7F0014, X
    LDA #$&loc_00D56B
    STA $7F001E, X
    COP [C1]
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10

  loc_00D56B:
    COP [92] ( #19, #00, #0F )
    COP [89]
    COP [CB]
    LDA #$0008
    STA $player_speed_ns
    JSR $&sub_00D58A
    LDA #$0000
    STA $09B6
    LDA #$0007
    STA $09B8
    RTL 
}