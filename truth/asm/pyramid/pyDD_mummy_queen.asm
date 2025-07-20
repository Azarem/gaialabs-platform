?BANK 0B
?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_0AFD69'
?INCLUDE 'actor_00E4DB'
?INCLUDE 'py_queen_actor_0BAAAA'
?INCLUDE 'py_queen_actor_0BABB3'
?INCLUDE 'py_queen_actor_0BACBC'
?INCLUDE 'func_0AA36E'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00DB8A'

!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btF6_neo_queen [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_h_btF6_neo_queen {
    LDA #$8191
    TSB $12
    COP [A5] ( @code_0BA65F, #00, #00, #$2000 )
    LDA $0AD4
    CMP #$0002
    BNE code_0BA636
    JMP $&code_0BA6CF
}

code_0BA636 {
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
    BEQ code_0BA65C
    RTL 
}

code_0BA65C {
    JMP $&code_0BA6CF
}

code_0BA65F {
    COP [C1]
    LDA $0AEC
    BEQ code_0BA667
    RTL 
}

code_0BA667 {
    COP [D2] ( #01, #00 )
    LDA $player_flags
    BIT #$0800
    BEQ code_0BA674
    RTL 
}

code_0BA674 {
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
    BEQ code_0BA69A
    RTL 
}

code_0BA69A {
    COP [CD] ( #$0179 )
    LDA #$0002
    STA $0648
    LDA #$0403
    STA $064A
    COP [26] ( #E3, #$01F8, #$03A0, #03, #$4430 )
    COP [E0]
}

---------------------------------------------

h_pyDD_mummy_queen [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_pyDD_mummy_queen {
    LDA #$0004
    JSL $@func_00B05E
    BCC code_0BA6CA
    STZ $0AEC
    STZ $0AEE
    COP [E0]
}

code_0BA6CA {
    LDA #$8191
    TSB $12
}

code_0BA6CF {
    LDY $player_actor
    LDA $0012, Y
    ORA #$0008
    STA $0012, Y
    LDA #$0A0A
    STA $20
    LDA #$1858
    STA $22
    LDA #$0000
    STA $7F0010, X
    COP [A2] ( @func_0AFD69, #$2000 )
    TYA 
    STA $7F1016, X
    COP [57] ( @code_0BA9C2 )

  code_0BA6FD:
    LDA $7F0010, X
    CMP #$0002
    BCC code_0BA70C
    COP [58] ( &code_0BA7BD )
    BRA code_0BA710
}

code_0BA70C {
    COP [58] ( &func_0BA8AA )
}

code_0BA710 {
    COP [C6] ( &code_0BA6FD )
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0BA722 )
}

code_list_0BA722 [
  &code_0BA96D   ;00
  &code_0BA96D   ;01
  &code_0BA769   ;02
  &code_0BA769   ;03
  &code_0BA732   ;04
  &code_0BA732   ;05
  &code_0BA732   ;06
  &code_0BA732   ;07
]

code_0BA732 {
    LDA $7F0010, X
    CLC 
    ADC #$0000
    STA $28
    COP [8D] ( #FF )
    COP [23]
    PHA 
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $player_x_pos
    STA $7F0018, X
    PLA 
    LSR 
    LSR 
    SEC 
    SBC #$001F
    CLC 
    ADC $player_y_pos
    STA $7F001A, X
    COP [52] ( #FF, #01, #FF )
    COP [53]
    COP [C5]
}

code_0BA769 {
    COP [9A] ( @code_0BA782, #$2202 )
    LDA $7F0010, X
    CLC 
    ADC #$0000
    STA $28
    COP [84] ( #FF, #0A )
    COP [8A]
    COP [C5]
}

code_0BA782 {
    COP [BC] ( #0C, #B2 )
    LDA #$2000
    TRB $10
    COP [07] ( #1E )
    COP [80] ( #13 )
    COP [89]
    COP [07] ( #20 )
    LDA #$0004
    CLC 
    ADC $0B02
    STA $7F0014, X
    COP [A2] ( @code_00E4FC, #$2000 )
    LDA $player_actor
    STA $0024, Y

  code_0BA7AE:
    COP [84] ( #0C, #08 )
    COP [8A]
    LDA $10
    BIT #$4000
    BEQ code_0BA7AE
    COP [E0]
}

code_0BA7BD {
    LDA #$0007
    STA $26

  code_0BA7C2:
    COP [9E] ( @e_py_actor_0BAAAA, #$0000, #$FFFC, #$2200 )
    LDA #$0000
    STA $0026, Y
    DEC $26
    BPL code_0BA7C2
    LDA #$0001
    STA $0026, Y
    LDA #$0200
    TSB $10
    COP [07] ( #0C )
    LDA $7F0010, X
    CLC 
    ADC #$0009
    STA $28
    COP [80] ( #FF )
    COP [89]
    LDA #$2000
    TSB $10
    LDA #$0008
    TSB $12
    LDA #$0001
    STA $7F0018, X
    LDA #$0001
    STA $7F001A, X
    COP [C2]
    LDA $26
    BEQ code_0BA829
    JSR $&sub_0BA842
    JSR $&sub_0BA876
    LDA $7F0018, X
    STA $7F002C, X
    LDA $7F001A, X
    STA $7F002E, X
    RTL 
}

code_0BA829 {
    LDA #$0008
    TRB $12
    LDA #$00FF
    STA $24
    LDA #$0007
    STA $0000
    LDA #$&loc_0BAC7F
    JSR $&sub_0BAA4A
    JMP $&code_0BA8FB
}

---------------------------------------------

sub_0BA842 {
    LDA $7F0018, X
    BPL code_0BA85F
    LDA $14
    BMI code_0BA852
    CMP #$0050
    BCC code_0BA852
    RTS 
}

code_0BA852 {
    LDA $7F0018, X
    EOR #$FFFF
    INC 
    STA $7F0018, X
    RTS 
}

code_0BA85F {
    LDA $14
    BMI code_0BA868
    CMP #$01B0
    BCS code_0BA869
}

code_0BA868 {
    RTS 
}

code_0BA869 {
    LDA $7F0018, X
    EOR #$FFFF
    INC 
    STA $7F0018, X
    RTS 
}

---------------------------------------------

sub_0BA876 {
    LDA $7F001A, X
    BPL code_0BA893
    LDA $16
    BMI code_0BA886
    CMP #$0080
    BCC code_0BA886
    RTS 
}

code_0BA886 {
    LDA $7F001A, X
    EOR #$FFFF
    INC 
    STA $7F001A, X
    RTS 
}

code_0BA893 {
    LDA $16
    BMI code_0BA89C
    CMP #$01B0
    BCS code_0BA89D
}

code_0BA89C {
    RTS 
}

code_0BA89D {
    LDA $7F001A, X
    EOR #$FFFF
    INC 
    STA $7F001A, X
    RTS 
}

---------------------------------------------

func_0BA8AA {
    LDA #$0007
    STA $26

  code_0BA8AF:
    COP [9E] ( @e_py_actor_0BABB3, #$0000, #$FFFC, #$2200 )
    DEC $26
    BPL code_0BA8AF
    STZ $26
    LDA #$0200
    TSB $10
    LDA #$00FF
    STA $24
    COP [07] ( #0C )
    LDA $7F0010, X
    CLC 
    ADC #$0009
    STA $28
    COP [80] ( #FF )
    COP [89]
    LDA #$2000
    TSB $10
    LDA $0B02
    XBA 
    LSR 
    LSR 
    CLC 
    ADC #$0168
    STA $08
    COP [C2]
    LDA #$0007
    STA $0000
    LDA #$&func_0BAC7D
    JSR $&sub_0BAA63
}

code_0BA8FB {
    COP [C1]
    LDA $24
    BEQ code_0BA902
    RTL 
}

code_0BA902 {
    LDA #$0007
    STA $0000
    LDA #$&func_0BACAF
    JSR $&sub_0BAA4A
    LDA $7F0026, X
    CMP #$0014
    BCC code_0BA936
    CMP #$001E
    BCC code_0BA91E
    BRA code_0BA94E
}

code_0BA91E {
    LDA $7F0010, X
    CMP #$0001
    BEQ code_0BA94E
    LDA #$0001
    STA $7F0010, X
    COP [3B] ( #5C, @func_00B519 )
    BRA code_0BA94E
}

code_0BA936 {
    LDA $7F0010, X
    CMP #$0002
    BEQ code_0BA94E
    LDA #$0002
    STA $7F0010, X
    COP [3B] ( #5D, @func_00B519 )
    BRA code_0BA94E
}

code_0BA94E {
    COP [07] ( #29 )
    LDA #$2000
    TRB $10
    LDA $7F0010, X
    CLC 
    ADC #$0010
    STA $28
    COP [80] ( #FF )
    COP [89]
    LDA #$0200
    TRB $10
    JMP $&code_0BA6FD
}

code_0BA96D {
    COP [58] ( &code_0BA9B7 )
    COP [07] ( #15 )
    LDA $7F0010, X
    CLC 
    ADC #$0003
    STA $28
    COP [80] ( #FF )
    COP [89]
    LDA $28
    CLC 
    ADC #$0003
    STA $28
    COP [80] ( #FF )
    COP [89]
    COP [A2] ( @e_py_queen_actor_0BACBC, #$2800 )
    COP [84] ( #FF, #0A )
    COP [8A]
    LDY $06
    LDA #$0001
    STA $0024, Y
    LDA $7F0010, X
    CLC 
    ADC #$0000
    STA $28
    COP [84] ( #FF, #12 )
    COP [8A]
    COP [C5]
}

code_0BA9B7 {
    LDY $06
    LDA #$0001
    STA $0024, Y
    JMP $&func_0BA8AA
}

code_0BA9C2 {
    LDY $06
    LDA #$0001
    STA $0024, Y
    LDA $player_flags
    BIT #$0200
    BEQ code_0BA9D5
    COP [C1]
    RTL 
}

code_0BA9D5 {
    LDA #$0020
    TSB $player_flags
    COP [A5] ( @func_0AA36E, #00, #00, #$2000 )
    COP [A5] ( @code_0BA9F2, #00, #E0, #$2300 )
    COP [DA] ( #3B )
    COP [E0]
}

code_0BA9F2 {
    COP [88] ( @table_0EE000 )
    COP [CA] ( #0C )
    COP [A5] ( @code_0BAA19, #00, #00, #$0302 )
    COP [DA] ( #01 )
    COP [A5] ( @code_0BAA23, #00, #00, #$0302 )
    COP [DA] ( #03 )
    COP [CB]
    COP [C7] ( @func_00DB8A )
}

code_0BAA19 {
    JSR $&sub_0BAA2D
    COP [80] ( #07 )
    COP [89]
    COP [E0]
}

code_0BAA23 {
    JSR $&sub_0BAA2D
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

---------------------------------------------

sub_0BAA2D {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $14
    STA $14
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $16
    STA $16
    RTS 
}

---------------------------------------------

sub_0BAA4A {
    LDY $06
    PHA 

  code_0BAA4D:
    LDA #$0000
    STA $0008, Y
    LDA $01, S
    STA $0000, Y
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_0BAA4D
    PLA 
    RTS 
}

---------------------------------------------

sub_0BAA63 {
    LDY $06
    STZ $0018
    STZ $001C
    PHA 

  code_0BAA6C:
    LDA #$0000
    STA $0008, Y
    LDA $01, S
    STA $0000, Y
    LDA $0014, Y
    CLC 
    ADC $0018
    STA $0018
    LDA $0016, Y
    CLC 
    ADC $001C
    STA $001C
    LDA $0006, Y
    TAY 
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_0BAA6C
    LDA $0018
    LSR 
    LSR 
    LSR 
    STA $14
    LDA $001C
    LSR 
    LSR 
    LSR 
    STA $16
    PLA 
    RTS 
}

---------------------------------------------

func_0BAC7D {
    COP [A9]

  loc_0BAC7F:
    LDA #$2000
    TRB $10
    LDY $26
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    CLC 
    ADC #$FFFC
    STA $7F001A, X
    COP [52] ( #FF, #02, #FF )
    COP [53]
    LDY $26
    LDA $0024, Y
    LSR 
    STA $0024, Y

  code_0BACA8:
    COP [80] ( #0E )
    COP [89]
    BRA code_0BACA8
}

---------------------------------------------

func_0BACAF {
    COP [DA] ( #07 )
    COP [E0]
}