?INCLUDE 'actor_00E256'
?INCLUDE 'func_00C397'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_ir1F_stone_guard1 [
  h_actor < #00, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_guard1 {
    BRA code_0A9077
}

---------------------------------------------

h_ir1F_stone_guard2 [
  h_actor < #01, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_guard2 {
    BRA code_0A9077
}

---------------------------------------------

h_ir1F_stone_guard3 [
  h_actor < #02, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_guard3 {
    BRA code_0A9077
}

---------------------------------------------

h_ir1F_stone_guard4 [
  h_actor < #02, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_guard4 {
    COP [BB]
    BRA code_0A9077
}

code_0A9077 {
    LDA #$0010
    TSB $12
    LDA $0F
    AND #$0010
    LSR 
    LSR 
    LSR 
    LSR 
    STA $7F0010, X
    COP [B7] ( #0E )
    COP [B6] ( #20 )
    COP [0B]
    COP [27] ( #08 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    LDA $7F0010, X
    BEQ code_0A90BB
    BRA code_0A90C3
}

---------------------------------------------

func_0A90A3_noref {
    LDA #$0200
    TRB $10
    COP [C1]
    LDA $7F0026, X
    CMP #$000A
    BNE code_0A90B4
    RTL 
}

code_0A90B4 {
    LDA #$0200
    TSB $10
    BRA code_0A90C7
}

code_0A90BB {
    COP [C1]
    COP [21] ( #02, &code_0A90C7 )
    RTL 
}

code_0A90C3 {
    COP [D2] ( #0F, #01 )
}

code_0A90C7 {
    COP [1F] ( &code_0A90CD )
    BRA code_0A90D2
}

code_0A90CD {
    COP [C4] ( @code_0A90C7 )
}

code_0A90D2 {
    COP [A9]
    COP [CA] ( #1E )
    COP [B7] ( #0E )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #0E )
    COP [C2]
    COP [C2]
    COP [B7] ( #00 )
    COP [C2]
    COP [CB]
    LDA #$0300
    TRB $10
    LDA #$0010
    TRB $12
    COP [0C]
    JMP $&code_0A910A
}

---------------------------------------------

h_ir1F_stone_guard5 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_ir1F_stone_guard5 {
    COP [B6] ( #20 )

  code_0A9107:
    COP [27] ( #0E )
}

code_0A910A {
    COP [C2]

  code_0A910C:
    LDA $10
    BIT #$4000
    BNE code_0A9107
    COP [2C] ( &code_0A9119, &code_0A9123 )
}

code_0A9119 {
    COP [2A] ( #$0008, &code_0A9146, &code_0A9123, &code_0A9161 )
}

code_0A9123 {
    COP [2B] ( #$0008, &code_0A917C, &code_0A912D, &code_0A9198 )
}

code_0A912D {
    RTL 
}

---------------------------------------------

func_0A912E {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A913E )
}

code_list_0A913E [
  &code_0A9146   ;00
  &code_0A9161   ;01
  &code_0A917C   ;02
  &code_0A9198   ;03
]

code_0A9146 {
    COP [21] ( #04, &code_0A91B4 )

  code_0A914B:
    COP [17] ( &func_0A912E )
    COP [81] ( #07, #02 )
    COP [89]
    COP [17] ( &func_0A912E )
    COP [81] ( #08, #02 )
    COP [89]
    BRA code_0A910C
}

code_0A9161 {
    COP [21] ( #04, &code_0A91C9 )

  code_0A9166:
    COP [18] ( &func_0A912E )
    COP [81] ( #87, #01 )
    COP [89]
    COP [18] ( &func_0A912E )
    COP [81] ( #88, #01 )
    COP [89]
    BRA code_0A910C
}

code_0A917C {
    COP [21] ( #04, &code_0A91DE )

  code_0A9181:
    COP [15] ( &func_0A912E )
    COP [82] ( #05, #02 )
    COP [89]
    COP [15] ( &func_0A912E )
    COP [82] ( #06, #02 )
    COP [89]
    JMP $&code_0A910C
}

code_0A9198 {
    COP [21] ( #04, &code_0A91F3 )

  code_0A919D:
    COP [16] ( &func_0A912E )
    COP [82] ( #03, #01 )
    COP [89]
    COP [16] ( &func_0A912E )
    COP [82] ( #04, #01 )
    COP [89]
    JMP $&code_0A910C
}

code_0A91B4 {
    COP [44] ( #FA, #FF, #00, #01, &code_0A9208 )
    COP [80] ( #0B )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    JMP $&code_0A914B
}

code_0A91C9 {
    COP [44] ( #00, #FF, #06, #01, &code_0A923C )
    COP [80] ( #8B )
    COP [89]
    COP [80] ( #9A )
    COP [89]
    JMP $&code_0A9166
}

code_0A91DE {
    COP [44] ( #FF, #FA, #01, #00, &code_0A92A4 )
    COP [80] ( #0A )
    COP [89]
    COP [80] ( #19 )
    COP [89]
    JMP $&code_0A9181
}

code_0A91F3 {
    COP [44] ( #FF, #00, #01, #06, &code_0A9270 )
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #18 )
    COP [89]
    JMP $&code_0A919D
}

code_0A9208 {
    COP [80] ( #2D )
    COP [89]
    COP [A4] ( @code_0A92D8, #FC, #E8, #$0202 )
    COP [84] ( #2E, #20 )
    COP [8A]
    COP [80] ( #2F )
    COP [89]
    COP [07] ( #1E )
    COP [9E] ( @code_0A92F2, #$FFF0, #$FFE0, #$0300 )
    COP [80] ( #2F )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    JMP $&code_0A910C
}

code_0A923C {
    COP [80] ( #AD )
    COP [89]
    COP [A4] ( @code_0A9310, #04, #E8, #$0202 )
    COP [84] ( #AE, #20 )
    COP [8A]
    COP [80] ( #AF )
    COP [89]
    COP [07] ( #1E )
    COP [9E] ( @code_0A932A, #$0010, #$FFE0, #$0300 )
    COP [80] ( #AF )
    COP [89]
    COP [80] ( #82 )
    COP [89]
    JMP $&code_0A910C
}

code_0A9270 {
    COP [80] ( #27 )
    COP [89]
    COP [A4] ( @code_0A9348, #F6, #EC, #$0202 )
    COP [84] ( #28, #20 )
    COP [8A]
    COP [80] ( #29 )
    COP [89]
    COP [07] ( #1E )
    COP [9E] ( @code_0A9362, #$FFFC, #$0010, #$0300 )
    COP [80] ( #2F )
    COP [89]
    COP [80] ( #00 )
    COP [89]
    JMP $&code_0A910C
}

code_0A92A4 {
    COP [80] ( #2A )
    COP [89]
    COP [A4] ( @code_0A9380, #0B, #ED, #$0202 )
    COP [84] ( #2B, #20 )
    COP [8A]
    COP [80] ( #2C )
    COP [89]
    COP [07] ( #1E )
    COP [9E] ( @code_0A939A, #$0004, #$FFF8, #$0300 )
    COP [80] ( #2F )
    COP [89]
    COP [80] ( #01 )
    COP [89]
    JMP $&code_0A910C
}

code_0A92D8 {
    JSR $&sub_0A93B8
    COP [CA] ( #20 )

  code_0A92DE:
    COP [8B]
    LDA $2A
    BEQ code_0A92DE
    JSR $&sub_0A93D2
    COP [C1]
    DEC $26
    BMI code_0A92EE
    RTL 
}

code_0A92EE {
    COP [CB]
    COP [E0]
}

code_0A92F2 {
    COP [A2] ( @code_0A94EE, #$2000 )

  code_0A92F9:
    COP [81] ( #11, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A92F9
    COP [E0]
}

---------------------------------------------

func_0A9308 {
    COP [84] ( #94, #06 )
    COP [8A]
    COP [E0]
}

code_0A9310 {
    JSR $&sub_0A93B8
    COP [CA] ( #20 )

  code_0A9316:
    COP [8B]
    LDA $2A
    BEQ code_0A9316
    JSR $&sub_0A93D2
    COP [C1]
    DEC $26
    BMI code_0A9326
    RTL 
}

code_0A9326 {
    COP [CB]
    COP [E0]
}

code_0A932A {
    COP [A2] ( @code_0A9497, #$2000 )

  code_0A9331:
    COP [81] ( #91, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A9331
    COP [E0]
}

---------------------------------------------

func_0A9340 {
    COP [84] ( #14, #06 )
    COP [8A]
    COP [E0]
}

code_0A9348 {
    JSR $&sub_0A93B8
    COP [CA] ( #20 )

  code_0A934E:
    COP [8B]
    LDA $2A
    BEQ code_0A934E
    JSR $&sub_0A93D2
    COP [C1]
    DEC $26
    BMI code_0A935E
    RTL 
}

code_0A935E {
    COP [CB]
    COP [E0]
}

code_0A9362 {
    COP [A2] ( @func_0A93E9, #$2000 )

  code_0A9369:
    COP [82] ( #0F, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A9369
    COP [E0]
}

---------------------------------------------

func_0A9378 {
    COP [84] ( #12, #06 )
    COP [8A]
    COP [E0]
}

code_0A9380 {
    JSR $&sub_0A93B8
    COP [CA] ( #20 )

  code_0A9386:
    COP [8B]
    LDA $2A
    BEQ code_0A9386
    JSR $&sub_0A93D2
    COP [C1]
    DEC $26
    BMI code_0A9396
    RTL 
}

code_0A9396 {
    COP [CB]
    COP [E0]
}

code_0A939A {
    COP [A2] ( @code_0A9441, #$2000 )

  code_0A93A1:
    COP [82] ( #10, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A93A1
    COP [E0]
}

---------------------------------------------

func_0A93B0 {
    COP [84] ( #13, #06 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

sub_0A93B8 {
    LDY $24
    LDA $14
    SEC 
    SBC $0014, Y
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $0016, Y
    STA $7F100E, X
    COP [8D] ( #0E )
    RTS 
}

---------------------------------------------

sub_0A93D2 {
    LDY $24
    LDA $0014, Y
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $0016, Y
    CLC 
    ADC $7F100E, X
    STA $16
    RTS 
}

---------------------------------------------

func_0A93E9 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0A93F7
    COP [C1]
    RTL 
}

code_0A93F7 {
    BIT #$2280
    BEQ code_0A93FD
    RTL 
}

code_0A93FD {
    LDA #$0008
    JSR $&sub_0A9598
    BPL code_0A9409
    EOR #$FFFF
    INC 
}

code_0A9409 {
    CMP #$0005
    BCC code_0A940F
    RTL 
}

code_0A940F {
    LDA $0014, Y
    SEC 
    SBC $0018
    BPL code_0A941C
    EOR #$FFFF
    INC 
}

code_0A941C {
    CMP #$0007
    BCC code_0A9422
    RTL 
}

code_0A9422 {
    LDA #$0F00
    TSB $joypad_mask_std
    PHY 
    LDA $0B02
    CLC 
    ADC #$0002
    LDY #$0000
    JSL $@func_00C397
    PLY 
    LDA #$&func_0A9378
    JSR $&sub_0A9570
    JMP $&code_0A953D
}

code_0A9441 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0A944F
    COP [C1]
    RTL 
}

code_0A944F {
    BIT #$2280
    BEQ code_0A9455
    RTL 
}

code_0A9455 {
    LDA #$0008
    JSR $&sub_0A9598
    SEC 
    SBC #$0020
    BPL code_0A9465
    EOR #$FFFF
    INC 
}

code_0A9465 {
    CMP #$0005
    BCC code_0A946B
    RTL 
}

code_0A946B {
    LDA $0014, Y
    SEC 
    SBC $0018
    BPL code_0A9478
    EOR #$FFFF
    INC 
}

code_0A9478 {
    CMP #$0007
    BCC code_0A947E
    RTL 
}

code_0A947E {
    PHY 
    LDA $0B02
    CLC 
    ADC #$0002
    LDY #$0001
    JSL $@func_00C397
    PLY 
    LDA #$&func_0A93B0
    JSR $&sub_0A9570
    JMP $&code_0A953D
}

code_0A9497 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0A94A5
    COP [C1]
    RTL 
}

code_0A94A5 {
    BIT #$2280
    BEQ code_0A94AB
    RTL 
}

code_0A94AB {
    LDA #$0000
    JSR $&sub_0A957D
    CLC 
    ADC #$0004
    BPL code_0A94BB
    EOR #$FFFF
    INC 
}

code_0A94BB {
    CMP #$0005
    BCC code_0A94C1
    RTL 
}

code_0A94C1 {
    LDA $0016, Y
    SEC 
    SBC $001C
    BPL code_0A94CE
    EOR #$FFFF
    INC 
}

code_0A94CE {
    CMP #$000D
    BCC code_0A94D4
    RTL 
}

code_0A94D4 {
    LDA #$0F00
    TSB $joypad_mask_std
    PHY 
    LDA #$0002
    LDY #$0003
    JSL $@func_00C397
    PLY 
    LDA #$&func_0A9308
    JSR $&sub_0A9570
    BRA code_0A953D
}

code_0A94EE {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0A94FC
    COP [C1]
    RTL 
}

code_0A94FC {
    BIT #$2280
    BEQ code_0A9502
    RTL 
}

code_0A9502 {
    LDA #$0010
    JSR $&sub_0A957D
    SEC 
    SBC #$0004
    BPL code_0A9512
    EOR #$FFFF
    INC 
}

code_0A9512 {
    CMP #$0005
    BCC code_0A9518
    RTL 
}

code_0A9518 {
    LDA $0016, Y
    SEC 
    SBC $001C
    BPL code_0A9525
    EOR #$FFFF
    INC 
}

code_0A9525 {
    CMP #$000D
    BCC code_0A952B
    RTL 
}

code_0A952B {
    PHY 
    LDA #$0002
    LDY #$0002
    JSL $@func_00C397
    PLY 
    LDA #$&func_0A9340
    JSR $&sub_0A9570
}

code_0A953D {
    PHX 
    LDX $player_actor
    LDA $0014, Y
    SEC 
    SBC $0014, X
    STA $14
    LDA $0016, Y
    SEC 
    SBC $0016, X
    STA $16
    PLX 
    COP [C1]
    PHX 
    LDX $player_actor
    LDY $24
    LDA $0014, X
    CLC 
    ADC $14
    STA $0014, Y
    LDA $0016, X
    CLC 
    ADC $16
    STA $0016, Y
    PLX 
    RTL 
}

---------------------------------------------

sub_0A9570 {
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002C, Y
    RTS 
}

---------------------------------------------

sub_0A957D {
    CLC 
    ADC $player_x_pos
    STA $0018
    LDA $player_y_pos
    CLC 
    ADC #$0004
    STA $001C
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $0018
    RTS 
}

---------------------------------------------

sub_0A9598 {
    CLC 
    ADC $player_y_pos
    STA $001C
    LDA $player_x_pos
    CLC 
    ADC #$0008
    STA $0018
    LDY $24
    LDA $0016, Y
    SEC 
    SBC $001C
    RTS 
}