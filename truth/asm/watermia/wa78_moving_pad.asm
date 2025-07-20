
!player_actor                   09AA

---------------------------------------------

h_wa78_moving_pad [
  h_actor < #1F, #01, #03 >   ;00
]

---------------------------------------------

e_wa78_moving_pad {
    COP [BC] ( #08, #00 )
    COP [D2] ( #8D, #01 )
    COP [99] ( @e_actor_079E22 )
    COP [C2]
    STZ $26
    COP [11]
    COP [0C]

  code_079FB6:
    COP [DA] ( #77 )
    JSL $@code_07A018
    COP [86] ( #1F, #84, #02 )
    COP [8A]
    COP [86] ( #1F, #84, #02 )
    COP [8A]
    COP [86] ( #1F, #84, #02 )
    COP [8A]
    COP [86] ( #1F, #84, #02 )
    COP [8A]
    JSL $@code_07A041
    LDA $26
    DEC 
    BEQ code_079FE6
    COP [C2]
    COP [A9]
}

code_079FE6 {
    COP [DA] ( #77 )
    JSL $@code_07A018
    COP [86] ( #1F, #84, #01 )
    COP [8A]
    COP [86] ( #1F, #84, #01 )
    COP [8A]
    COP [86] ( #1F, #84, #01 )
    COP [8A]
    COP [86] ( #1F, #84, #01 )
    COP [8A]
    JSL $@code_07A041
    LDA $26
    DEC 
    BEQ code_079FB6
    COP [C2]
    COP [A9]
    BRA code_079FB6
}

code_07A018 {
    LDA $26
    BNE code_07A020
    PHB 
    PLA 
    PLA 
    RTL 
}

code_07A020 {
    DEC 
    BEQ code_07A036
    COP [9C] ( @code_07A05F, #$2000 )
    LDY $player_actor
    LDA $0010, Y
    AND #$FFF7
    STA $0010, Y
}

code_07A036 {
    COP [0B]
    LDY $04
    LDA #$0001
    STA $0026, Y
    RTL 
}

code_07A041 {
    LDA $26
    DEC 
    BEQ code_07A052
    LDY $player_actor
    LDA $0010, Y
    ORA #$0008
    STA $0010, Y
}

code_07A052 {
    LDY $04
    LDA #$0000
    STA $0026, Y
    COP [11]
    COP [0C]
    RTL 
}

code_07A05F {
    LDY $24
    LDA $0014, Y
    PHA 
    SEC 
    SBC $14
    LDY $player_actor
    CLC 
    ADC $0014, Y
    STA $0014, Y
    PLA 
    STA $14
    LDY $24
    LDA $0016, Y
    PHA 
    SEC 
    SBC $16
    LDY $player_actor
    CLC 
    ADC $0016, Y
    STA $0016, Y
    PLA 
    STA $16
    RTL 
}

---------------------------------------------

e_actor_079E22 {
    STZ $18
    STZ $1A
    STZ $1C
    STZ $1E
    PHX 
    PHB 
    SEP #$20
    LDA $7F0008, X
    PHA 
    PLB 
    REP #$20
    LDA $7F000C, X
    TAX 
    LDA $0000, X
    SEP #$20
    EOR #$FF
    INC 
    STA $1C
    XBA 
    EOR #$FF
    INC 
    STA $1E
    LDA $0004, X
    EOR #$FF
    INC 
    STA $18
    LDA $0006, X
    EOR #$FF
    INC 
    STA $1A
    REP #$20
    PLB 
    PLX 

  code_079E5F:
    COP [C1]
    LDA $26
    BEQ code_079E68
    JMP $&code_079F0D
}

code_079E68 {
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $1C
    STA $0018
    LDA $0014, Y
    CLC 
    ADC $1C
    STA $001A
    LDA $0016, Y
    SEC 
    SBC $1E
    STA $001C
    LDA $0016, Y
    CLC 
    ADC $1E
    STA $001E
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$0008
    CMP $0018
    BCC code_079F04
    LDA $0014, Y
    SEC 
    SBC #$0008
    CMP $001A
    BCS code_079F04
    LDA $0016, Y
    CMP $001C
    BCC code_079F04
    LDA $0016, Y
    SEC 
    SBC #$0010
    CMP $001E
    BCS code_079F04
    LDY $24
    LDA #$0000
    STA $0026, Y
    JSR $&sub_079F77
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC #$0008
    CMP $0018
    BCS code_079ED8
    RTL 
}

code_079ED8 {
    LDA $0014, Y
    CLC 
    ADC #$0008
    CMP $001A
    BCC code_079EE5
    RTL 
}

code_079EE5 {
    LDA $0016, Y
    SEC 
    SBC #$0010
    CMP $001C
    BCS code_079EF2
    RTL 
}

code_079EF2 {
    LDA $0016, Y
    CMP $001E
    BCC code_079EFB
    RTL 
}

code_079EFB {
    LDY $24
    LDA #$0002
    STA $0026, Y
    RTL 
}

code_079F04 {
    LDY $24
    LDA #$0001
    STA $0026, Y
    RTL 
}

code_079F0D {
    COP [C1]
    LDA $26
    BNE code_079F16
    JMP $&code_079E5F
}

code_079F16 {
    LDY $24
    LDA $0026, Y
    DEC 
    BNE code_079F1F
    RTL 
}

code_079F1F {
    JSR $&sub_079F77
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC #$0008
    CMP $0018
    BCS code_079F3B
    LDA $0018
    CLC 
    ADC #$0008
    STA $0014, Y
}

code_079F3B {
    LDA $0014, Y
    CLC 
    ADC #$0008
    CMP $001A
    BCC code_079F51
    LDA $001A
    SEC 
    SBC #$0008
    STA $0014, Y
}

code_079F51 {
    LDA $0016, Y
    SEC 
    SBC #$0010
    CMP $001C
    BCS code_079F67
    LDA $001C
    CLC 
    ADC #$0010
    STA $0016, Y
}

code_079F67 {
    LDA $0016, Y
    CMP $001E
    BCS code_079F70
    RTL 
}

code_079F70 {
    LDA $001E
    STA $0016, Y
    RTL 
}

---------------------------------------------

sub_079F77 {
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $18
    STA $0018
    LDA $0014, Y
    CLC 
    ADC $18
    STA $001A
    LDA $0016, Y
    SEC 
    SBC $1A
    STA $001C
    LDA $0016, Y
    CLC 
    ADC $1A
    STA $001E
    RTS 
}