
?INCLUDE 'actor_00E256'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'entry_points_00C418'
?INCLUDE 'func_00C397'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_gw83_stone_archer1 [
  h_actor < #07, #00, #03 >   ;00
]

---------------------------------------------

e_gw83_stone_archer1 {
    BRA e_gw83_stone_archer3
}

---------------------------------------------

h_gw83_stone_archer2 [
  h_actor < #07, #00, #03 >   ;00
]

---------------------------------------------

e_gw83_stone_archer2 {
    COP [BB]
    BRA e_gw83_stone_archer3
}

---------------------------------------------

h_gw83_stone_archer3 [
  h_actor < #05, #00, #03 >   ;00
]

---------------------------------------------

e_gw83_stone_archer3 {
    COP [B7] ( #06 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [0B]
    COP [C1]
    COP [21] ( #03, &code_0B8F15 )
    RTL 
}

code_0B8F15 {
    COP [1F] ( &code_0B8F1B )
    BRA code_0B8F20
}

code_0B8F1B {
    COP [C4] ( @code_0B8F15 )
}

code_0B8F20 {
    COP [A9]
    COP [CA] ( #1E )
    COP [B7] ( #06 )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #06 )
    COP [C2]
    COP [C2]
    COP [B7] ( #00 )
    COP [C2]
    COP [CB]
    LDA #$0010
    TRB $12
    LDA #$0300
    TRB $10
    COP [0C]
    JMP $&e_gw82_archer3
}

---------------------------------------------

h_gw83_stone_archer4 [
  h_actor < #05, #00, #01 >   ;00
]

---------------------------------------------

e_gw83_stone_archer4 {
    LDA #$0010
    TSB $12
    COP [B7] ( #06 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [0B]
    COP [58] ( &code_0B8F6A )
    COP [C1]
    RTL 
}

code_0B8F6A {
    LDA #$0200
    TSB $10
    JMP $&code_0B8F15
}

---------------------------------------------

h_gw87_statue_archer [
  h_actor < #05, #00, #01 >   ;00
]

---------------------------------------------

e_gw87_statue_archer {
    LDA #$0020
    TSB $12
    COP [B7] ( #06 )
    COP [A2] ( @code_0B8FFB, #$2700 )
    COP [0B]
    LDA $7F0026, X
    STA $26

  code_0B8F8C:
    LDA $14
    STA $7F0010, X
    LDA $16
    STA $7F0012, X
    LDA $26
    STA $7F0026, X
    COP [C1]
    LDA $14
    CMP $7F0010, X
    BNE code_0B8FBF
    LDA $16
    CMP $7F0012, X
    BNE code_0B8FBF
    LDA $7F0026, X
    CMP $26
    BNE code_0B8F8C
    COP [D0] ( #0F, #01, &code_0B8FDD )
    RTL 
}

code_0B8FBF {
    LDA $14
    PHA 
    LDA $16
    PHA 
    LDA $7F0010, X
    STA $14
    LDA $7F0012, X
    STA $16
    COP [0C]
    PLA 
    STA $16
    PLA 
    STA $14
    COP [0B]
    BRA code_0B8F8C
}

code_0B8FDD {
    LDA #$0200
    TSB $10
    LDA #$0020
    TRB $12
    LDA #$&stats_01ABF0+CC
    STA $7F0020, X
    LDA $&stats_01ABF0+CC
    AND #$00FF
    STA $7F0026, X
    JMP $&code_0B8F15
}

code_0B8FFB {
    COP [C6] ( &code_0B8FFB )
    COP [C2]
    LDY $24
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA $0010, Y
    BIT #$0080
    BEQ code_0B9016
    RTL 
}

code_0B9016 {
    COP [40] ( #$0031, &code_0B901D )

  code_0B901C:
    RTL 
}

code_0B901D {
    COP [21] ( #0F, &code_0B9023 )
    RTL 
}

code_0B9023 {
    COP [2A] ( #$000F, &code_0B90B0, &code_0B902D, &code_0B90B0 )
}

code_0B902D {
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC $16
    BPL code_0B9077
    BPL code_0B903E
    EOR #$FFFF
    INC 
}

code_0B903E {
    CMP #$0020
    BCC code_0B9075
    LDA $0028, Y
    CMP #$003A
    BNE code_0B9075
    JSL $@func_03F0CA
    CMP #$0000
    BNE code_0B9075
    COP [14] ( #00, #FF, &code_0B9075 )
    JSR $&sub_0B913D
    COP [BC] ( #00, #F0 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    DEC 
    STA $0016, Y
    COP [CB]
    JSR $&sub_0B9149
}

code_0B9075 {
    COP [C5]
}

code_0B9077 {
    CMP #$0020
    BCC code_0B90AE
    LDA $0028, Y
    CMP #$003B
    BNE code_0B90AE
    JSL $@func_03F0CA
    CMP #$0001
    BNE code_0B90AE
    COP [14] ( #00, #01, &code_0B90AE )
    JSR $&sub_0B913D
    COP [BC] ( #00, #10 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [CB]
    JSR $&sub_0B9149
}

code_0B90AE {
    COP [C5]
}

code_0B90B0 {
    COP [2B] ( #$000F, &code_0B901C, &code_0B90BA, &code_0B901C )
}

code_0B90BA {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC $14
    BPL code_0B9104
    BPL code_0B90CB
    EOR #$FFFF
    INC 
}

code_0B90CB {
    CMP #$0020
    BCC code_0B9102
    LDA $0028, Y
    CMP #$003D
    BNE code_0B9102
    JSL $@func_03F0CA
    CMP #$0003
    BNE code_0B9102
    COP [14] ( #FF, #00, &code_0B9102 )
    JSR $&sub_0B913D
    COP [BC] ( #F0, #00 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    DEC 
    STA $0014, Y
    COP [CB]
    JSR $&sub_0B9149
}

code_0B9102 {
    COP [C5]
}

code_0B9104 {
    CMP #$0020
    BCC code_0B913B
    LDA $0028, Y
    CMP #$003C
    BNE code_0B913B
    JSL $@func_03F0CA
    CMP #$0002
    BNE code_0B913B
    COP [14] ( #01, #00, &code_0B913B )
    JSR $&sub_0B913D
    COP [BC] ( #10, #00 )
    COP [07] ( #2C )
    COP [CA] ( #10 )
    LDY $04
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [CB]
    JSR $&sub_0B9149
}

code_0B913B {
    COP [C5]
}

---------------------------------------------

sub_0B913D {
    LDY $24
    LDA $0012, Y
    ORA #$0010
    STA $0012, Y
    RTS 
}

---------------------------------------------

sub_0B9149 {
    LDY $24
    LDA $0012, Y
    AND #$FFEF
    STA $0012, Y
    RTS 
}

---------------------------------------------

h_gw82_archer1 [
  h_actor < #07, #00, #00 >   ;00
]

---------------------------------------------

e_gw82_archer1 {
    COP [58] ( &e_gw82_archer3 )

  code_0B915C:
    COP [27] ( #09 )
    COP [C8] ( &code_0B91AF )
    BRA code_0B915C
}

---------------------------------------------

h_gw82_archer2 [
  h_actor < #07, #00, #00 >   ;00
]

---------------------------------------------

e_gw82_archer2 {
    COP [BB]
    COP [58] ( &e_gw82_archer3 )

  code_0B916E:
    COP [27] ( #09 )
    COP [C8] ( &code_0B91C6 )
    BRA code_0B916E
}

---------------------------------------------

h_gw82_archer3 [
  h_actor < #05, #00, #00 >   ;00
]

---------------------------------------------

e_gw82_archer3 {
    COP [27] ( #09 )
    COP [C6] ( &code_0B918B )
    COP [2A] ( #$0000, &code_0B91AF, &code_0B91AF, &code_0B91C6 )
}

code_0B918B {
    LDA $10
    BIT #$4000
    BNE e_gw82_archer3
    COP [C6] ( &code_0B918B )
    COP [21] ( #04, &code_0B91FF )
    COP [2B] ( #$000E, &code_0B91DD, &code_0B91A5, &code_0B91E9 )
}

code_0B91A5 {
    COP [2A] ( #$0000, &code_0B91AF, &code_0B91AF, &code_0B91C6 )
}

code_0B91AF {
    COP [80] ( #0B )
    COP [89]
    COP [9E] ( @code_0B926C, #$0000, #$FFF5, #$0300 )
    COP [80] ( #0E )
    COP [89]
    COP [C5]
}

code_0B91C6 {
    COP [80] ( #8B )
    COP [89]
    COP [9E] ( @code_0B9253, #$0000, #$FFF5, #$0300 )
    COP [80] ( #8E )
    COP [89]
    COP [C5]
}

code_0B91DD {
    COP [15] ( &code_0B91F5 )
    COP [82] ( #09, #12 )
    COP [89]
    COP [C5]
}

code_0B91E9 {
    COP [16] ( &code_0B91F5 )
    COP [82] ( #08, #11 )
    COP [89]
    COP [C5]
}

code_0B91F5 {
    COP [2A] ( #$0000, &code_0B91AF, &code_0B91AF, &code_0B91C6 )
}

code_0B91FF {
    COP [2A] ( #$0000, &code_0B922E, &code_0B922E, &code_0B9209 )
}

code_0B9209 {
    COP [CA] ( #02 )
    COP [17] ( &code_0B91F5 )
    COP [8D] ( #8A )
    COP [AA] ( #04 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2C
    COP [17] ( &code_0B91F5 )
    COP [AA] ( #04 )
    COP [C1]
    COP [89]
    COP [CB]
    BRA code_0B91F5
}

code_0B922E {
    COP [CA] ( #02 )
    COP [18] ( &code_0B91F5 )
    COP [8D] ( #0A )
    COP [AA] ( #03 )
    COP [C1]
    COP [8C] ( #02 )
    COP [C2]
    STZ $2C
    COP [18] ( &code_0B91F5 )
    COP [AA] ( #03 )
    COP [C1]
    COP [89]
    COP [CB]
    BRA code_0B91F5
}

code_0B9253 {
    COP [5E] ( &func_0B92E9 )
    COP [5B] ( #$0010 )
    COP [A2] ( @code_0B931A, #$2000 )
    COP [80] ( #8C )
    COP [89]
    COP [AA] ( #05 )
    BRA code_0B9283
}

code_0B926C {
    COP [5E] ( &code_0B92F9 )
    COP [5B] ( #$0010 )
    COP [A2] ( @code_0B9375, #$2000 )
    COP [80] ( #0C )
    COP [89]
    COP [AA] ( #06 )
}

code_0B9283 {
    COP [07] ( #1E )
    LDA #$0064
    STA $24
    COP [C1]
    COP [62] ( #0F, &code_0B92A8 )
    DEC $24
    BMI code_0B9297
    RTL 
}

code_0B9297 {
    COP [C1]
    COP [62] ( #0F, &code_0B92A8 )
    LDA $10
    BIT #$4000
    BNE code_0B92A6
    RTL 
}

code_0B92A6 {
    COP [E0]
}

code_0B92A8 {
    STZ $2C
    LDA $0E
    BIT #$4000
    BNE code_0B92C0
    COP [A9]
    COP [84] ( #0D, #0A )
    COP [8A]
    COP [80] ( #12 )
    COP [89]
    COP [E0]
}

code_0B92C0 {
    COP [A9]
    COP [84] ( #8D, #0A )
    COP [8A]
    COP [80] ( #92 )
    COP [89]
    COP [E0]
}

---------------------------------------------

func_0B92CF {
    COP [84] ( #0D, #06 )
    COP [8A]
    COP [80] ( #12 )
    COP [89]
    COP [E0]
}

---------------------------------------------

func_0B92DC {
    COP [84] ( #8D, #06 )
    COP [8A]
    COP [80] ( #92 )
    COP [89]
    COP [E0]
}

---------------------------------------------

func_0B92E9 {
    LDA #$0004
    STA $0408
    LDA $14
    CLC 
    ADC #$000E
    STA $14
    BRA code_0B9307
}

code_0B92F9 {
    LDA #$FFFC
    STA $0408
    LDA $14
    SEC 
    SBC #$000E
    STA $14
}

code_0B9307 {
    LDA $16
    SEC 
    SBC #$000E
    STA $16
    COP [A5] ( @code_00C423, #00, #00, #$0302 )
    COP [E0]
}

code_0B931A {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B9328
    COP [C1]
    RTL 
}

code_0B9328 {
    BIT #$2280
    BEQ code_0B932E
    RTL 
}

code_0B932E {
    LDA #$0000
    JSR $&sub_0B9408
    CLC 
    ADC #$0008
    BPL code_0B933E
    EOR #$FFFF
    INC 
}

code_0B933E {
    CMP #$0005
    BCC code_0B9344
    RTL 
}

code_0B9344 {
    LDA $0016, Y
    SEC 
    SBC #$0014
    SEC 
    SBC $001C
    BPL code_0B9355
    EOR #$FFFF
    INC 
}

code_0B9355 {
    CMP #$000F
    BCC code_0B935B
    RTL 
}

code_0B935B {
    LDA #$0F00
    TSB $joypad_mask_std
    PHY 
    LDA #$0002
    LDY #$0003
    JSL $@func_00C397
    PLY 
    LDA #$&func_0B92DC
    JSR $&code_0B93FB
    BRA code_0B93C8
}

code_0B9375 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B9383
    COP [C1]
    RTL 
}

code_0B9383 {
    BIT #$2280
    BEQ code_0B9389
    RTL 
}

code_0B9389 {
    LDA #$0010
    JSR $&sub_0B9408
    SEC 
    SBC #$0008
    BPL code_0B9399
    EOR #$FFFF
    INC 
}

code_0B9399 {
    CMP #$0005
    BCC code_0B939F
    RTL 
}

code_0B939F {
    LDA $0016, Y
    SEC 
    SBC #$0014
    SEC 
    SBC $001C
    BPL code_0B93B0
    EOR #$FFFF
    INC 
}

code_0B93B0 {
    CMP #$000F
    BCC code_0B93B6
    RTL 
}

code_0B93B6 {
    PHY 
    LDA #$0002
    LDY #$0002
    JSL $@func_00C397
    PLY 
    LDA #$&func_0B92CF
    JSR $&code_0B93FB
}

code_0B93C8 {
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
}

---------------------------------------------

sub_0B93FA {
    RTL 
}

code_0B93FB {
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002C, Y
    RTS 
}

---------------------------------------------

sub_0B9408 {
    CLC 
    ADC $player_x_pos
    STA $0018
    LDA $player_y_pos
    SEC 
    SBC #$0001
    STA $001C
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $0018
    RTS 
}