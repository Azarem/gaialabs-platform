
?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_008000'
?INCLUDE 'sg55_actor_0AD000'
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'func_0AA36E'
?INCLUDE 'func_00DB8A'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!camera_bounds_x                06DA
!camera_bounds_y                06DC
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btF3_neo_viper [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_btF3_neo_viper {
    LDA #$0011
    TSB $12
    LDA #$0100
    STA $camera_bounds_y
    COP [A5] ( @code_0AD125, #00, #00, #$2000 )
    LDA $0AD4
    CMP #$0002
    BNE code_0AD0F7
    JMP $&code_0AD1D5
}

code_0AD0F7 {
    LDY $player_actor
    LDA #$*func_08F5F9
    STA $0002, Y
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0AD11D
    RTL 
}

code_0AD11D {
    COP [57] ( @func_0AD945 )
    JMP $&code_0AD1D5
}

code_0AD125 {
    COP [C1]
    LDA $0AEC
    BEQ code_0AD12D
    RTL 
}

code_0AD12D {
    LDY $player_actor
    LDA #$*func_08F3B1
    STA $0002, Y
    LDA #$&func_08F3B1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0AD153
    RTL 
}

code_0AD153 {
    COP [CD] ( #$0176 )
    LDA #$0003
    STA $0648
    LDA #$0403
    STA $064A
    COP [26] ( #E0, #$03F8, #$02A0, #03, #$3820 )
    COP [E0]
}

---------------------------------------------

h_sg55_viper [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_sg55_viper {
    LDA #$0001
    JSL $@func_00B05E
    BCC code_0AD183
    STZ $0AEC
    STZ $0AEE
    COP [E0]
}

code_0AD183 {
    LDA #$0011
    TSB $12
    COP [57] ( @func_0AD945 )
    LDA #$*binary_0AD93D
    AND #$00FF
    STA $0AF6
    LDA #$&binary_0AD93D
    STA $0AF4
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #01 )
    COP [04] ( #0F )
    COP [DA] ( #27 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    LDA $player_y_pos
    CMP #$00A0
    BCC code_0AD1BC
    RTL 
}

code_0AD1BC {
    LDA #$0130
    STA $camera_bounds_y
    COP [CA] ( #30 )
    LDA $camera_bounds_y
    DEC 
    STA $camera_bounds_y
    COP [CB]
    COP [9A] ( @e_sg55_actor_0AD000, #$2800 )
}

code_0AD1D5 {
    COP [9B] ( @code_0AD27E )
    LDA #$FFD0
    STA $0018, Y
    LDA #$0030
    STA $001C, Y
    LDA #$0000
    STA $001A, Y
    LDA #$0080
    STA $001E, Y
    LDA #$0001
    STA $0028, Y
    LDA #$0000
    STA $002C, Y
    LDA #$0006
    STA $002E, Y

  code_0AD204:
    LDA #$0010
    STA $24
    COP [C8] ( &code_0AD306 )
    STZ $24
    COP [C8] ( &code_0AD2DA )
    COP [C8] ( &code_0AD380 )
    STZ $24
    COP [C8] ( &code_0AD2DA )
    STZ $24
    COP [C8] ( &code_0AD306 )
    LDA #$FFA0
    STA $24
    COP [C8] ( &code_0AD306 )
    LDA #$FFD0
    STA $24
    COP [C8] ( &code_0AD2DA )
    COP [63] ( #00, #09, #00 )
    COP [8D] ( #00 )

  code_0AD23D:
    COP [64]
    COP [C2]
    LDA $16
    BMI code_0AD23D
    CMP #$0030
    BCC code_0AD23D
    COP [82] ( #00, #03 )
    COP [89]
    COP [86] ( #01, #02, #13 )
    COP [8A]
    COP [C6] ( &code_0AD265 )
    COP [2A] ( #$0020, &code_0AD65F, &code_0AD63D, &code_0AD686 )
}

code_0AD265 {
    STZ $24
    COP [C8] ( &code_0AD306 )
    STZ $24
    COP [C8] ( &code_0AD2DA )
    COP [C8] ( &code_0AD4B3 )
    COP [84] ( #00, #02 )
    COP [8A]
    JMP $&code_0AD204
}

code_0AD27E {
    LDY $24
    LDA $0028, Y
    CMP $28
    BNE code_0AD2D9
    LDA $0014, Y
    SEC 
    SBC #$0008
    CLC 
    ADC $18
    CMP $player_x_pos
    BCS code_0AD2D9
    SEC 
    SBC $18
    CLC 
    ADC $1C
    CMP $player_x_pos
    BCC code_0AD2D9
    LDA $0016, Y
    SEC 
    SBC #$0010
    CLC 
    ADC $1A
    CMP $player_y_pos
    BCS code_0AD2D9
    SEC 
    SBC $1A
    CLC 
    ADC $1E
    CMP $player_y_pos
    BCC code_0AD2D9
    LDY #$1000
    LDA $0010, Y
    BIT #$0080
    BEQ code_0AD2C7
    RTL 
}

code_0AD2C7 {
    LDA $2C
    CLC 
    ADC $0408
    STA $0408
    LDA $2E
    CLC 
    ADC $040A
    STA $040A
}

code_0AD2D9 {
    RTL 
}

code_0AD2DA {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $player_x_pos
    STA $7F0018, X
    LDA $0410
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC #$0050
    CLC 
    ADC $24
    STA $7F001A, X
    COP [22] ( #00, #04 )
    COP [C5]
}

code_0AD306 {
    LDA $16
    CLC 
    ADC $24
    STA $7F100E, X
    LDA #$0000
    STA $7F0010, X
    COP [2A] ( #$0000, &code_0AD320, &code_0AD320, &code_0AD325 )
}

code_0AD320 {
    LDA #$4000
    TSB $12
}

code_0AD325 {
    LDA #$2000
    TSB $12
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_0AD339
    EOR #$FFFF
    INC 
}

code_0AD339 {
    LSR 
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    INC 
    STA $26
    COP [84] ( #01, #02 )
    COP [8A]
    COP [63] ( #03, #09, #00 )
    COP [8D] ( #00 )

  code_0AD352:
    COP [C2]
    LDA $26
    STA $7F002C, X
    COP [64]
    LDA $7F0010, X
    DEC 
    BPL code_0AD36B
    COP [C1]
    COP [8B]
    LDA $08
    STZ $08
}

code_0AD36B {
    STA $7F0010, X
    LDA $16
    BMI code_0AD379
    CMP $7F100E, X
    BCS code_0AD352
}

code_0AD379 {
    LDA #$6000
    TRB $12
    COP [C5]
}

code_0AD380 {
    COP [84] ( #01, #03 )
    COP [8A]
    COP [AB] ( #13 )
    COP [DA] ( #27 )
    COP [AB] ( #00 )
    COP [9C] ( @code_0AD398, #$0200 )
    COP [C5]
}

code_0AD398 {
    COP [07] ( #1E )
    LDA $player_x_pos
    STA $7F0018, X
    LDA $player_y_pos
    STA $7F001A, X
    COP [22] ( #05, #02 )
    COP [CA] ( #0A )
    COP [B7] ( #08 )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    COP [07] ( #1D )
    COP [9C] ( @code_0AD3E6, #$0200 )
    COP [9C] ( @code_0AD451, #$0200 )
    COP [9C] ( @code_0AD3DD, #$0200 )
    COP [9C] ( @code_0AD448, #$0200 )
    COP [C2]
    COP [E0]
}

code_0AD3DD {
    COP [BB]
    COP [B9]
    LDA #$6002
    TSB $12
}

code_0AD3E6 {
    COP [5B] ( #$0010 )
    LDY $24
    LDA $002A, Y
    DEC 
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AD3FC )
}

code_list_0AD3FC [
  &code_0AD404   ;00
  &code_0AD415   ;01
  &code_0AD426   ;02
  &code_0AD437   ;03
]

code_0AD404 {
    COP [87] ( #1D, #20, #02, #00 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD404
    COP [E0]
}

code_0AD415 {
    COP [87] ( #1E, #20, #17, #14 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD415
    COP [E0]
}

code_0AD426 {
    COP [87] ( #1F, #20, #12, #12 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD426
    COP [E0]
}

code_0AD437 {
    COP [87] ( #20, #20, #14, #17 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD437
    COP [E0]
}

code_0AD448 {
    COP [BB]
    COP [B9]
    LDA #$6002
    TSB $12
}

code_0AD451 {
    COP [5B] ( #$0010 )
    LDY $24
    LDA $002A, Y
    DEC 
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AD467 )
}

code_list_0AD467 [
  &code_0AD46F   ;00
  &code_0AD480   ;01
  &code_0AD491   ;02
  &code_0AD4A2   ;03
]

code_0AD46F {
    COP [87] ( #19, #20, #00, #01 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD46F
    COP [E0]
}

code_0AD480 {
    COP [87] ( #1A, #20, #14, #16 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD480
    COP [E0]
}

code_0AD491 {
    COP [87] ( #1B, #20, #12, #11 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD491
    COP [E0]
}

code_0AD4A2 {
    COP [87] ( #1C, #20, #17, #13 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0AD4A2
    COP [E0]
}

code_0AD4B3 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    STA $7F0010, X
    COP [84] ( #01, #03 )
    COP [8A]
    LDA #$0000

  code_0AD4C9:
    STA $24
    COP [9C] ( @code_0AD4EE, #$2200 )
    TXA 
    TYX 
    TAY 
    LDA $24
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA $24
    INC 
    CMP #$0006
    BCC code_0AD4C9
    LDA $7F0010, X
    STA $24
    COP [C5]
}

code_0AD4EE {
    COP [07] ( #1E )
    COP [5B] ( #$0010 )
    LDA $7F0010, X
    CMP #$0006
    BCC code_0AD501
    LDA #$0005
}

code_0AD501 {
    STA $0000
    COP [D9] ( #$0000, &code_list_0AD50A )
}

code_list_0AD50A [
  &code_0AD516   ;00
  &code_0AD51F   ;01
  &code_0AD528   ;02
  &code_0AD531   ;03
  &code_0AD53A   ;04
  &code_0AD543   ;05
]

code_0AD516 {
    COP [BC] ( #10, #E0 )
    LDA #$0020
    BRA code_0AD54A
}

code_0AD51F {
    COP [BC] ( #F0, #E0 )
    LDA #$0040
    BRA code_0AD54A
}

code_0AD528 {
    COP [BC] ( #20, #E0 )
    LDA #$0030
    BRA code_0AD54A
}

code_0AD531 {
    COP [BC] ( #E0, #E0 )
    LDA #$0030
    BRA code_0AD54A
}

code_0AD53A {
    COP [BC] ( #30, #E0 )
    LDA #$0040
    BRA code_0AD54A
}

code_0AD543 {
    COP [BC] ( #D0, #E0 )
    LDA #$0020
}

code_0AD54A {
    STA $7F100E, X
    COP [C2]
    LDA #$2000
    TRB $10
    LDY $24
    LDA $0024, Y
    BPL code_0AD565
    COP [BA]
    LDA #$4000
    TSB $12
    BRA code_0AD56C
}

code_0AD565 {
    COP [BB]
    LDA #$0002
    TSB $12
}

code_0AD56C {
    LDA $7F100E, X
    TAY 
    LDA #$0005
    SEP #$20
    JSL $@func_0281E8
    REP #$20
    AND #$00FF
    STA $7F0010, X
    STA $7F0012, X
    COP [8D] ( #19 )
    LDA #$0000
    STA $7F100C, X
    STA $7F1010, X
    STA $7F1012, X
    COP [C1]
    LDA $7F100E, X
    BEQ code_0AD5D2
    DEC 
    STA $7F100E, X
    LDA $7F100C, X
    INC 
    STA $7F100C, X
    LDA $7F0012, X
    DEC 
    STA $7F0012, X
    BNE code_0AD5D2
    LDA $7F0010, X
    STA $7F0012, X
    LDA $28
    INC 
    CMP #$001E
    BCS code_0AD5D2
    STA $28
    STZ $2A
    JSL $@func_03CA55
}

code_0AD5D2 {
    LDA $7F100C, X
    CLC 
    ADC $7F1010, X
    STA $7F1010, X
    LSR 
    LSR 
    LSR 
    LSR 
    STA $7F002C, X
    ASL 
    ASL 
    ASL 
    ASL 
    SEC 
    SBC $7F1010, X
    EOR #$FFFF
    INC 
    STA $7F1010, X
    LDA $7F100E, X
    CLC 
    ADC $7F1012, X
    STA $7F1012, X
    LSR 
    LSR 
    LSR 
    LSR 
    STA $7F002E, X
    ASL 
    ASL 
    ASL 
    ASL 
    SEC 
    SBC $7F1012, X
    EOR #$FFFF
    INC 
    STA $7F1012, X
    LDA $0036
    LSR 
    BCC code_0AD629
    COP [B7] ( #08 )
    BRA code_0AD62C
}

code_0AD629 {
    COP [B7] ( #00 )
}

code_0AD62C {
    LDA $14
    BMI code_0AD63B
    SEC 
    SBC $camera_bounds_x
    CLC 
    ADC #$0010
    BPL code_0AD63B
    RTL 
}

code_0AD63B {
    COP [E0]
}

code_0AD63D {
    COP [80] ( #02 )
    COP [89]
    COP [A4] ( @code_0AD779, #00, #E1, #$0202 )
    COP [80] ( #02 )
    COP [89]
    COP [A4] ( @func_0AD848, #00, #00, #$0202 )
    COP [58] ( &code_0AD6F6 )
    BRA code_0AD6AB
}

code_0AD65F {
    COP [80] ( #04 )
    COP [89]
    COP [80] ( #03 )
    COP [89]
    COP [A4] ( @code_0AD7DA, #FD, #DD, #$0202 )
    COP [80] ( #03 )
    COP [89]
    COP [A4] ( @code_0AD880, #F4, #FE, #$0202 )
    COP [58] ( &code_0AD6BC )
    BRA code_0AD6AB
}

code_0AD686 {
    COP [80] ( #84 )
    COP [89]
    COP [80] ( #83 )
    COP [89]
    COP [A4] ( @code_0AD7C9, #03, #DD, #$0202 )
    COP [80] ( #83 )
    COP [89]
    COP [A4] ( @code_0AD8B8, #0C, #FE, #$0202 )
    COP [58] ( &code_0AD6D9 )
}

code_0AD6AB {
    LDA #$0003
    STA $7F0016, X
    COP [C1]
    COP [8A]
    COP [58] ( #$0000 )
    COP [C5]
}

code_0AD6BC {
    COP [2A] ( #$0020, &code_0AD751, &code_0AD6C6, &code_0AD6CD )
}

code_0AD6C6 {
    COP [80] ( #09 )
    COP [89]
    BRA code_0AD70E
}

code_0AD6CD {
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #84 )
    COP [89]
    BRA code_0AD725
}

code_0AD6D9 {
    COP [2A] ( #$0020, &code_0AD6EA, &code_0AD6E3, &code_0AD751 )
}

code_0AD6E3 {
    COP [80] ( #89 )
    COP [89]
    BRA code_0AD70E
}

code_0AD6EA {
    COP [80] ( #89 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    BRA code_0AD73C
}

code_0AD6F6 {
    COP [2A] ( #$0020, &code_0AD700, &code_0AD751, &code_0AD707 )
}

code_0AD700 {
    COP [80] ( #04 )
    COP [89]
    BRA code_0AD73C
}

code_0AD707 {
    COP [80] ( #84 )
    COP [89]
    BRA code_0AD725
}

code_0AD70E {
    COP [8D] ( #02 )
    COP [A4] ( @code_0AD771, #00, #E1, #$0202 )
    COP [A4] ( @func_0AD848, #00, #00, #$0202 )
    BRA code_0AD751
}

code_0AD725 {
    COP [8D] ( #83 )
    COP [A4] ( @code_0AD7BA, #03, #DD, #$0202 )
    COP [A4] ( @code_0AD8B8, #0C, #FE, #$0202 )
    BRA code_0AD751
}

code_0AD73C {
    COP [8D] ( #03 )
    COP [A4] ( @code_0AD7D2, #03, #DD, #$0202 )
    COP [A4] ( @code_0AD880, #F4, #FE, #$0202 )
}

code_0AD751 {
    COP [C1]
    COP [89]
    LDA #$6000
    TRB $12
    LDA $14
    STA $7F0018, X
    LDA $06C2
    SEC 
    SBC #$0040
    STA $7F001A, X
    COP [22] ( #00, #04 )
    COP [C5]
}

code_0AD771 {
    LDA $24
    STA $7F0010, X
    BRA code_0AD79C
}

code_0AD779 {
    LDA $24
    STA $7F0010, X
    COP [8D] ( #24 )
    COP [CA] ( #30 )
    JSR $&sub_0AD832
    BCC code_0AD78D
    JMP $&code_0AD818
}

code_0AD78D {
    COP [CB]
    LDA #$2000
    TSB $10
    COP [DA] ( #17 )
    LDA #$2000
    TRB $10
}

code_0AD79C {
    COP [8D] ( #25 )
    STZ $24

  code_0AD7A1:
    COP [C1]
    JSR $&sub_0AD832
    BCS code_0AD818
    DEC $24
    BMI code_0AD7AD
    RTL 
}

code_0AD7AD {
    COP [C1]
    COP [8B]
    LDA $08
    INC 
    STA $24
    STZ $08
    BRA code_0AD7A1
}

code_0AD7BA {
    LDA #$0002
    TSB $12
    COP [BB]
    LDA $24
    STA $7F0010, X
    BRA code_0AD7FA
}

code_0AD7C9 {
    LDA #$0002
    TSB $12
    COP [BB]
    BRA code_0AD7DA
}

code_0AD7D2 {
    LDA $24
    STA $7F0010, X
    BRA code_0AD7FA
}

code_0AD7DA {
    LDA $24
    STA $7F0010, X
    COP [8D] ( #26 )
    COP [CA] ( #30 )
    JSR $&sub_0AD832
    BCS code_0AD818
    COP [CB]
    LDA #$2000
    TSB $10
    COP [DA] ( #17 )
    LDA #$2000
    TRB $10
}

code_0AD7FA {
    COP [8D] ( #27 )
    STZ $24

  code_0AD7FF:
    COP [C1]
    JSR $&sub_0AD832
    BCS code_0AD818
    DEC $24
    BMI code_0AD80B
    RTL 
}

code_0AD80B {
    COP [C1]
    COP [8B]
    LDA $08
    INC 
    STA $24
    STZ $08
    BRA code_0AD7FF
}

code_0AD818 {
    COP [E0]
}

---------------------------------------------

func_0AD81A {
    COP [C1]
    COP [8B]
    LDA $08
    STA $24
    STZ $08
    COP [C2]
    JSR $&sub_0AD832
    BCS code_0AD818
    DEC $24
    BMI code_0AD830
    RTL 
}

code_0AD830 {
    COP [C5]
}

---------------------------------------------

sub_0AD832 {
    LDA $7F0010, X
    TAY 
    LDA $0028, Y
    CMP #$0002
    BEQ code_0AD844
    CMP #$0003
    BNE code_0AD846
}

code_0AD844 {
    CLC 
    RTS 
}

code_0AD846 {
    SEC 
    RTS 
}

---------------------------------------------

func_0AD848 {
    COP [80] ( #0C )
    COP [89]
    LDA $24
    STA $7F0010, X
    LDA #$0000
    STA $7F0012, X
    COP [07] ( #21 )
    COP [8D] ( #0D )

  code_0AD860:
    COP [CA] ( #04 )
    COP [C8] ( &func_0AD81A )
    COP [CB]
    LDA $7F0012, X
    INC 
    STA $7F0012, X
    LSR 
    BCC code_0AD860
    COP [A5] ( @code_0AD8F7, #00, #30, #$0200 )
    BRA code_0AD860
}

code_0AD880 {
    COP [80] ( #0E )
    COP [89]
    LDA #$0000
    STA $7F0012, X
    LDA $24
    STA $7F0010, X
    COP [07] ( #21 )
    COP [8D] ( #0F )

  code_0AD898:
    COP [CA] ( #04 )
    COP [C8] ( &func_0AD81A )
    COP [CB]
    LDA $7F0012, X
    INC 
    STA $7F0012, X
    LSR 
    BCC code_0AD898
    COP [A5] ( @code_0AD8F7, #C0, #20, #$0200 )
    BRA code_0AD898
}

code_0AD8B8 {
    LDA #$0002
    TSB $12
    COP [BB]
    COP [80] ( #0E )
    COP [89]
    LDA #$0000
    STA $7F0012, X
    LDA $24
    STA $7F0010, X
    COP [07] ( #21 )
    COP [8D] ( #0F )

  code_0AD8D7:
    COP [CA] ( #04 )
    COP [C8] ( &func_0AD81A )
    COP [CB]
    LDA $7F0012, X
    INC 
    STA $7F0012, X
    LSR 
    BCC code_0AD8D7
    COP [A5] ( @code_0AD8F7, #40, #20, #$0200 )
    BRA code_0AD8D7
}

code_0AD8F7 {
    COP [5B] ( #$0010 )
    LDA #$0000
    STA $7F001A, X
    COP [23]
    AND #$0007
    CMP #$0007
    BNE code_0AD90F
    LDA #$0003
}

code_0AD90F {
    STA $7F0018, X
    LSR 
    LDA #$0000
    ADC #$0021
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    COP [B1]
    COP [C2]
    COP [63] ( #03, #04, #01 )
    COP [C1]
    COP [64]
    CMP #$0000
    BMI code_0AD935
    RTL 
}

code_0AD935 {
    COP [84] ( #23, #04 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

binary_0AD93D #4CF8003000000022

---------------------------------------------

func_0AD945 {
    LDA $player_flags
    BIT #$0200
    BEQ code_0AD950
    COP [C1]
    RTL 
}

code_0AD950 {
    LDA #$0020
    TSB $player_flags
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    COP [A5] ( @code_0AD970, #00, #00, #$2300 )
    COP [DA] ( #27 )
    COP [C7] ( @func_00DB8A )
}

code_0AD970 {
    COP [88] ( @table_0EE000 )
    COP [CA] ( #0A )
    COP [A5] ( @code_0AD994, #00, #E0, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0AD9A1, #00, #E0, #$0302 )
    COP [DA] ( #02 )
    COP [CB]
    COP [E0]
}

code_0AD994 {
    JSR $&sub_0AD9AB
    COP [07] ( #06 )
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0AD9A1 {
    JSR $&sub_0AD9AB
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0AD9AB {
    COP [23]
    COP [23]
    COP [24] ( #50 )
    LDA $0420
    SEC 
    SBC #$0028
    CLC 
    ADC $14
    STA $14
    COP [23]
    COP [23]
    COP [24] ( #60 )
    LDA $0420
    SEC 
    SBC #$0030
    CLC 
    ADC $16
    STA $16
    RTS 
}