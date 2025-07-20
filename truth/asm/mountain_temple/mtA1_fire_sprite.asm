?INCLUDE 'func_00F3C9'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_mtA1_fire_sprite [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_mtA1_fire_sprite {
    LDA #$0011
    TSB $12
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X

  code_0B984F:
    COP [27] ( #09 )

  code_0B9852:
    LDA $10
    BIT #$4000
    BNE code_0B984F
    LDA #$000A
    STA $24
    COP [C1]
    COP [21] ( #06, &code_0B9880 )
    DEC $24
    BMI code_0B986A
    RTL 
}

code_0B986A {
    COP [C8] ( &code_0B9901 )
    BRA code_0B9852
}

---------------------------------------------

func_0B9870 {
    LDA $7F0018, X
    STA $14
    LDA $7F001A, X
    STA $16
    COP [C2]
    BRA code_0B9893
}

code_0B9880 {
    COP [5C] ( #$FFFD )
    LDA #$0200
    TRB $12
    COP [A2] ( @code_0B992B, #$2200 )
    COP [CA] ( #06 )
}

code_0B9893 {
    LDA $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    JSR $&sub_0BA5D5
    CLC 
    ADC $player_x_pos
    AND #$FFF0
    CLC 
    ADC #$0008
    STA $14
    JSR $&sub_0BA5D5
    CLC 
    ADC $player_y_pos
    AND #$FFF0
    CLC 
    ADC #$0010
    STA $16
    COP [13] ( &func_0B9870 )
    LDA $14
    PHA 
    LDA $16
    PHA 
    LDA $7F0018, X
    STA $14
    LDA $7F001A, X
    STA $16
    PLA 
    STA $7F001A, X
    PLA 
    STA $7F0018, X
    COP [22] ( #00, #01 )
    COP [84] ( #00, #04 )
    COP [8A]
    COP [CB]
    COP [58] ( #$0000 )

  code_0B98EF:
    COP [5C] ( #$FFFD )
    LDA #$0200
    TSB $12
    COP [84] ( #00, #0C )
    COP [8A]
    JMP $&code_0B9852
}

code_0B9901 {
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $7F100C, X
    STA $7F0018, X
    COP [23]
    AND #$007F
    SEC 
    SBC #$003F
    CLC 
    ADC $7F100E, X
    STA $7F001A, X
    COP [22] ( #00, #01 )
    COP [C5]
}

code_0B992B {
    COP [CA] ( #04 )
    COP [9C] ( @code_0B994D, #$0300 )
    LDA $24
    STA $0024, Y
    COP [DA] ( #3F )
    COP [CB]
    PHX 
    PHD 
    LDA $24
    TCD 
    TAX 
    COP [58] ( &code_0B98EF )
    PLD 
    PLX 
    COP [E0]
}

code_0B994D {
    COP [07] ( #26 )
    LDA #$0080
    STA $7F0012, X
    LDA #$0080
    STA $7F0010, X
    LDA #$0000
    STA $7F100C, X
    COP [8D] ( #1D )
    BRA code_0B998D
}

---------------------------------------------

func_0B996A {
    LDA $28
    CMP #$001F
    BCS code_0B998D
    LDA $7F100C, X
    INC 
    STA $7F100C, X
    AND #$0001
    BNE code_0B998D
    INC $28
    LDA $28
    CMP #$001F
    BCC code_0B998D
    LDA #$0100
    TRB $10
}

code_0B998D {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ func_0B996A
    JSR $&sub_0B9B9A
    COP [C1]
    DEC $26
    BMI code_0B998D
    LDY $24
    LDA $0012, Y
    BIT #$0200
    BNE code_0B99D1
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B99B3
    JMP $&code_0B9A9D
}

code_0B99B3 {
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0010, X
    CLC 
    ADC #$0001
    STA $7F0010, X
    RTL 
}

---------------------------------------------

func_0B99C6 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ func_0B99C6
    JSR $&sub_0B9B9A
}

code_0B99D1 {
    COP [C1]
    DEC $26
    BMI func_0B99C6
    LDA $7F0012, X
    BEQ code_0B9A01
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0012, X
    SEC 
    SBC #$0002
    BPL code_0B99F0
    LDA #$0000
}

code_0B99F0 {
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC #$0001
    STA $7F0010, X
    RTL 
}

code_0B9A01 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9A01
    JSR $&sub_0B9B9A
    COP [C1]
    DEC $26
    BMI code_0B9A01
    LDY $24
    JSL $@func_00F3C9
    LDA $7F0012, X
    CLC 
    ADC #$0008
    CLC 
    ADC $0B02
    BIT #$FF00
    BNE code_0B9A5C
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC #$0001
    STA $7F0010, X
    LDA $14
    SEC 
    SBC $7F100C, X
    STA $7F0018, X
    LDA $14
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $7F100E, X
    STA $7F001A, X
    LDA $16
    STA $7F100E, X
    RTL 
}

code_0B9A5C {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9A5C
    JSR $&sub_0B9B9A
    COP [C1]
    DEC $26
    BMI code_0B9A5C
    LDA $7F0018, X
    STA $7F002C, X
    LDA $7F001A, X
    STA $7F002E, X
    LDA $10
    BIT #$4000
    BNE code_0B9A85
    RTL 
}

code_0B9A85 {
    LDA #$2000
    TSB $10
    COP [DA] ( #13 )
    LDA $7F001C, X
    TAY 
    LDA $0012, Y
    AND #$FDFF
    STA $0012, Y
    COP [E0]
}

code_0B9A9D {
    LDY $24
    LDA $0014, Y
    STA $7F0000, X
    LDA $0016, Y
    STA $7F0002, X
    BRA code_0B9ABA
}

---------------------------------------------

func_0B9AAF {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ func_0B9AAF
    JSR $&sub_0B9B9A
}

code_0B9ABA {
    COP [C1]
    DEC $26
    BMI func_0B9AAF
    LDA $7F0012, X
    BEQ code_0B9AF4
    LDA $7F0000, X
    STA $14
    LDA $7F0002, X
    STA $16
    JSL $@code_00F3D3
    LDA $7F0012, X
    SEC 
    SBC #$0002
    BPL code_0B9AE3
    LDA #$0000
}

code_0B9AE3 {
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC #$0001
    STA $7F0010, X
    RTL 
}

code_0B9AF4 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9AF4
    JSR $&sub_0B9B9A
    COP [C1]
    DEC $26
    BMI code_0B9AF4
    LDA $7F0000, X
    STA $14
    LDA $7F0002, X
    STA $16
    JSL $@code_00F3D3
    LDA $7F0012, X
    CLC 
    ADC #$0008
    CLC 
    ADC $0B02
    BIT #$FF00
    BNE code_0B9B59
    STA $7F0012, X
    LDA $7F0010, X
    CLC 
    ADC #$0001
    STA $7F0010, X
    LDA $14
    SEC 
    SBC $7F100C, X
    STA $7F0018, X
    LDA $14
    STA $7F100C, X
    LDA $16
    SEC 
    SBC $7F100E, X
    STA $7F001A, X
    LDA $16
    STA $7F100E, X
    RTL 
}

code_0B9B59 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9B59
    JSR $&sub_0B9B9A
    COP [C1]
    DEC $26
    BMI code_0B9B59
    LDA $7F0018, X
    STA $7F002C, X
    LDA $7F001A, X
    STA $7F002E, X
    LDA $10
    BIT #$4000
    BNE code_0B9B82
    RTL 
}

code_0B9B82 {
    LDA #$2000
    TSB $10
    COP [DA] ( #13 )
    LDA $7F001C, X
    TAY 
    LDA $0012, Y
    AND #$FDFF
    STA $0012, Y
    COP [E0]
}

---------------------------------------------

sub_0B9B9A {
    LDA $08
    INC 
    STA $26
    STZ $08
    RTS 
}

---------------------------------------------

sub_0BA5D5 {
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    RTS 
}