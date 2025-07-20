?INCLUDE 'func_00DB8A'
?INCLUDE 'func_00C397'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_gw83_asp [
  h_actor < #13, #00, #00 >   ;00
]

---------------------------------------------

e_gw83_asp {
    STZ $24

  code_0B9428:
    COP [27] ( #0A )

  code_0B942B:
    LDA $10
    BIT #$4000
    BNE code_0B9428
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $14
    BMI code_0B945F
    LDA $24
    AND #$0040
    BNE code_0B9456
    COP [80] ( #93 )
    COP [89]
    COP [21] ( #05, &code_0B9547 )
    INC $24
    COP [C4] ( @code_0B942B )
}

code_0B9456 {
    STZ $24
    COP [80] ( #94 )
    COP [89]
    BRA code_0B942B
}

code_0B945F {
    LDA $24
    AND #$0040
    BNE code_0B9477
    COP [80] ( #13 )
    COP [89]
    COP [21] ( #05, &code_0B950A )
    INC $24
    COP [C4] ( @code_0B942B )
}

code_0B9477 {
    STZ $24
    COP [80] ( #14 )
    COP [89]
    BRA code_0B942B
}

---------------------------------------------

func_0B9480 {
    COP [23]
    AND #$0007
    STA $08
    COP [C2]
    JSR $&sub_0B9638
    BPL code_0B9492
    EOR #$FFFF
    INC 
}

code_0B9492 {
    CMP #$0040
    BCC code_0B949A
    LDA #$0040
}

code_0B949A {
    EOR #$FFFF
    INC 
    CLC 
    ADC $14
    STA $7F0018, X
    LDA #$0008
    TSB $10
    COP [22] ( #15, #01 )
    LDA #$0008
    TRB $10

  code_0B94B3:
    COP [2A] ( #$0000, &code_0B94BD, &code_0B94BD, &code_0B942B )
}

code_0B94BD {
    COP [44] ( #FB, #FF, #00, #00, &code_0B957A )
    BRA func_0B9480
}

---------------------------------------------

func_0B94C7 {
    COP [23]
    AND #$0007
    STA $08
    COP [C2]
    JSR $&sub_0B9638
    BPL code_0B94D9
    EOR #$FFFF
    INC 
}

code_0B94D9 {
    CMP #$0040
    BCC code_0B94E1
    LDA #$0040
}

code_0B94E1 {
    CLC 
    ADC $14
    STA $7F0018, X
    LDA #$0008
    TSB $10
    COP [22] ( #95, #01 )
    LDA #$0008
    TRB $10

  code_0B94F6:
    COP [2A] ( #$0000, &code_0B942B, &code_0B9500, &code_0B9500 )
}

code_0B9500 {
    COP [44] ( #00, #FF, #05, #00, &code_0B959C )
    BRA func_0B94C7
}

code_0B950A {
    COP [23]
    AND #$0003
    STA $08
    COP [C2]
    COP [80] ( #14 )
    COP [89]
    COP [07] ( #1D )
    COP [80] ( #17 )
    COP [89]
    COP [A2] ( @code_0B96B1, #$2000 )
    LDA #$4000
    TSB $12
    LDA #$0008
    TSB $10
    COP [83] ( #1B, #48, #49 )
    COP [89]
    LDA #$4000
    TRB $12
    LDA #$0008
    TRB $10
    COP [A9]
    JMP $&func_0B9480
}

code_0B9547 {
    COP [23]
    AND #$0003
    STA $08
    COP [C2]
    COP [80] ( #94 )
    COP [89]
    COP [07] ( #1D )
    COP [80] ( #97 )
    COP [89]
    COP [A2] ( @func_0B964E, #$2000 )
    LDA #$0008
    TSB $10
    COP [83] ( #9B, #48, #49 )
    COP [89]
    LDA #$0008
    TRB $10
    COP [A9]
    JMP $&func_0B94C7
}

code_0B957A {
    COP [80] ( #16 )
    COP [89]
    COP [A2] ( @code_0B96B1, #$2000 )
    LDA #$4000
    TSB $12
    COP [83] ( #1B, #48, #49 )
    COP [89]
    LDA #$4000
    TRB $12
    COP [A9]
    JMP $&code_0B94B3
}

code_0B959C {
    COP [80] ( #96 )
    COP [89]
    COP [A2] ( @func_0B964E, #$2000 )
    LDA #$0008
    TSB $10
    COP [83] ( #9B, #48, #49 )
    COP [89]
    LDA #$0008
    TRB $10
    COP [A9]
    JMP $&code_0B94F6
}

---------------------------------------------

func_0B95BE {
    LDA #$8000
    TSB $joypad_mask_std
    COP [57] ( @code_0B962D )

  code_0B95C9:
    COP [80] ( #1A )
    COP [89]
    BRA code_0B95C9
}

---------------------------------------------

func_0B95D0 {
    COP [57] ( $000000 )
    LDA #$0200
    TRB $10
    LDA $14
    CLC 
    ADC $26
    STA $7F0018, X
    LDA $16
    CLC 
    ADC $26
    STA $7F001A, X
    LDA #$0010
    TRB $12
    LDA #$0008
    TSB $10
    COP [22] ( #1A, #02 )
    COP [83] ( #1A, #47, #45 )
    COP [89]
    LDA #$0008
    TRB $10

  code_0B9606:
    COP [C2]

  code_0B9608:
    COP [68] ( &code_0B9606 )
    COP [13] ( &code_0B9613 )
    JMP $&code_0B942B
}

code_0B9613 {
    PHX 
    TYX 
    LDA $7FC000, X
    PLX 
    AND #$00FF
    BIT #$000F
    BNE code_0B9625
    JMP $&code_0B942B
}

code_0B9625 {
    COP [82] ( #1A, #01 )
    COP [89]
    BRA code_0B9608
}

code_0B962D {
    LDA #$8000
    TRB $joypad_mask_std
    COP [C7] ( @func_00DB8A )
}

---------------------------------------------

sub_0B9638 {
    LDA $player_y_pos
    CLC 
    ADC #$0010
    STA $7F001A, X
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $14
    RTS 
}

---------------------------------------------

func_0B964E {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B965C
    COP [C1]
    RTL 
}

code_0B965C {
    BIT #$2280
    BEQ code_0B9662
    RTL 
}

code_0B9662 {
    LDA #$0000
    JSR $&sub_0B9820
    CLC 
    ADC #$0014
    BPL code_0B9672
    EOR #$FFFF
    INC 
}

code_0B9672 {
    CMP #$0003
    BCC code_0B9678
    RTL 
}

code_0B9678 {
    LDA $0016, Y
    SEC 
    SBC #$0004
    SEC 
    SBC $001C
    BPL code_0B9689
    EOR #$FFFF
    INC 
}

code_0B9689 {
    CMP #$000B
    BCC code_0B968F
    RTL 
}

code_0B968F {
    PHY 
    LDA #$0001
    LDY #$0004
    JSL $@func_00C397
    PLY 
    LDA $0012, Y
    ORA #$0010
    STA $0012, Y
    LDA #$&func_0B95BE
    JSR $&sub_0B97F8
    BCC code_0B96AD
    RTL 
}

code_0B96AD {
    STZ $2C
    BRA code_0B970C
}

code_0B96B1 {
    LDY $player_actor
    LDA $0010, Y
    BIT #$0040
    BEQ code_0B96BF
    COP [C1]
    RTL 
}

code_0B96BF {
    BIT #$2280
    BEQ code_0B96C5
    RTL 
}

code_0B96C5 {
    LDA #$0013
    JSR $&sub_0B9820
    SEC 
    SBC #$0010
    BPL code_0B96D5
    EOR #$FFFF
    INC 
}

code_0B96D5 {
    CMP #$0003
    BCC code_0B96DB
    RTL 
}

code_0B96DB {
    LDA $0016, Y
    SEC 
    SBC #$0004
    SEC 
    SBC $001C
    BPL code_0B96EC
    EOR #$FFFF
    INC 
}

code_0B96EC {
    CMP #$000B
    BCC code_0B96F2
    RTL 
}

code_0B96F2 {
    PHY 
    LDA #$0001
    LDY #$0004
    JSL $@func_00C397
    PLY 
    LDA #$&func_0B95BE
    JSR $&sub_0B97F8
    BCC code_0B9707
    RTL 
}

code_0B9707 {
    LDA #$0001
    STA $2C
}

code_0B970C {
    LDA $0012, Y
    AND #$9FFF
    ORA #$0002
    STA $0012, Y
    PHX 
    LDX $player_actor
    LDA $0014, Y
    SEC 
    SBC $0014, X
    BPL code_0B9729
    EOR #$FFFF
    INC 
}

code_0B9729 {
    STA $14
    LDA $0016, Y
    SEC 
    SBC $0016, X
    BPL code_0B9738
    EOR #$FFFF
    INC 
}

code_0B9738 {
    STA $16
    PLX 
    STZ $2A
    STZ $28
    COP [C1]
    LDY $player_actor
    LDA $0010, Y
    BIT #$2040
    BEQ code_0B974F
    JMP $&code_0B97CF
}

code_0B974F {
    LDA $28
    INC 
    STA $28
    CMP #$0078
    BCC code_0B9765
    STZ $28
    LDA #$8001
    LDY #$0004
    JSL $@func_00C397
}

code_0B9765 {
    PHX 
    LDX $player_actor
    LDY $24
    LDA $2C
    BEQ code_0B977D
    LDA $0656
    BIT #$0100
    BEQ code_0B9787
    INC $2A
    STZ $2C
    BRA code_0B9787
}

code_0B977D {
    LDA $0656
    BIT #$0200
    BEQ code_0B9787
    INC $2C
}

code_0B9787 {
    LDA $2A
    CMP #$0004
    BCS code_0B97CC
    LDA $2C
    BNE code_0B97AF
    LDA $000E, Y
    ORA #$4000
    STA $000E, Y
    LDA $0014, X
    SEC 
    SBC $14
    STA $0014, Y
    LDA $0016, X
    SEC 
    SBC $16
    STA $0016, Y
    PLX 
    RTL 
}

code_0B97AF {
    LDA $000E, Y
    AND #$BFFF
    STA $000E, Y
    LDA $0014, X
    CLC 
    ADC $14
    STA $0014, Y
    LDA $0016, X
    SEC 
    SBC $16
    STA $0016, Y
    PLX 
    RTL 
}

code_0B97CC {
    PLX 
    COP [C2]
}

code_0B97CF {
    LDY $24
    LDA #$&func_0B95D0
    JSR $&sub_0B97F8
    BCS code_0B97F0
    LDA $0012, Y
    AND #$BFFD
    STA $0012, Y
    LDA $player_y_pos
    CLC 
    ADC #$0010
    SEC 
    SBC $0016, Y
    STA $0026, Y
}

code_0B97F0 {
    LDA #$8000
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

sub_0B97F8 {
    PHA 
    LDA $0010, Y
    BIT #$0040
    BNE code_0B981B
    SEP #$20
    LDA $0002, Y
    CMP #$8B
    BNE code_0B981B
    REP #$20
    PLA 
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002C, Y
    CLC 
    RTS 
}

code_0B981B {
    REP #$20
    PLA 
    SEC 
    RTS 
}

---------------------------------------------

sub_0B9820 {
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