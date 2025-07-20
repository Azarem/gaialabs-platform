
!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_av6D_steelbones [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_av6D_steelbones {
    COP [27] ( #10 )
    COP [58] ( &code_0AECF0 )
    COP [C6] ( &e_av6D_steelbones )
    COP [21] ( #06, &code_0AEA7F )
    LDA #$0004
    STA $24
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AEA77 )
}

code_list_0AEA77 [
  &code_0AEB3F   ;00
  &code_0AEB65   ;01
  &code_0AEB83   ;02
  &code_0AEBA9   ;03
]

code_0AEA7F {
    COP [21] ( #02, &code_0AEAE1 )
    LDA #$0002
    STA $24
    COP [2A] ( #$0030, &code_0AEACD, &code_0AEA93, &code_0AEAD7 )
}

code_0AEA93 {
    COP [35]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AEAA1 )
}

code_list_0AEAA1 [
  &code_0AEAA9   ;00
  &code_0AEAB5   ;01
  &code_0AEAAF   ;02
  &code_0AEAC1   ;03
]

code_0AEAA9 {
    COP [C8] ( &code_0AEBC7 )
    BRA e_av6D_steelbones
}

code_0AEAAF {
    COP [C8] ( &code_0AEBD3 )
    BRA e_av6D_steelbones
}

code_0AEAB5 {
    COP [84] ( #82, #1E )
    COP [8A]
    COP [C8] ( &code_0AEC0A )
    BRA e_av6D_steelbones
}

code_0AEAC1 {
    COP [84] ( #02, #1E )
    COP [8A]
    COP [C8] ( &code_0AEBFE )
    BRA e_av6D_steelbones
}

code_0AEACD {
    COP [C8] ( &code_0AEC0A )
    COP [C8] ( &code_0AED06 )
    BRA code_0AEA93
}

code_0AEAD7 {
    COP [C8] ( &code_0AEBFE )
    COP [C8] ( &code_0AED2C )
    BRA code_0AEA93
}

code_0AEAE1 {
    COP [35]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0AEAEF )
}

code_list_0AEAEF [
  &code_0AEAF7   ;00
  &code_0AEB1B   ;01
  &code_0AEB09   ;02
  &code_0AEB2D   ;03
]

code_0AEAF7 {
    COP [84] ( #01, #1E )
    COP [8A]
    COP [80] ( #06 )
    COP [89]
    COP [C8] ( &code_0AEC38 )
    JMP $&e_av6D_steelbones
}

code_0AEB09 {
    COP [84] ( #00, #1E )
    COP [8A]
    COP [80] ( #04 )
    COP [89]
    COP [C8] ( &code_0AEC66 )
    JMP $&e_av6D_steelbones
}

code_0AEB1B {
    COP [84] ( #82, #1E )
    COP [8A]
    COP [80] ( #88 )
    COP [89]
    COP [C8] ( &code_0AECC2 )
    JMP $&e_av6D_steelbones
}

code_0AEB2D {
    COP [84] ( #02, #1E )
    COP [8A]
    COP [80] ( #08 )
    COP [89]
    COP [C8] ( &code_0AEC94 )
    JMP $&e_av6D_steelbones
}

code_0AEB3F {
    COP [58] ( &code_0AEB53 )
    COP [84] ( #00, #3C )
    COP [8A]
    COP [84] ( #09, #02 )
    COP [8A]
    COP [58] ( #$0000 )
}

code_0AEB53 {
    COP [44] ( #FE, #00, #02, #08, &code_0AEC66 )

  code_0AEB5B:
    COP [2A] ( #$0000, &code_0AEC94, &code_0AEC94, &code_0AECC2 )
}

code_0AEB65 {
    COP [58] ( &code_0AEB79 )
    COP [84] ( #01, #3C )
    COP [8A]
    COP [84] ( #0A, #02 )
    COP [8A]
    COP [58] ( #$0000 )
}

code_0AEB79 {
    COP [44] ( #FE, #F8, #02, #00, &code_0AEC38 )
    BRA code_0AEB5B
}

code_0AEB83 {
    COP [58] ( &code_0AEB97 )
    COP [84] ( #02, #3C )
    COP [8A]
    COP [84] ( #0B, #02 )
    COP [8A]
    COP [58] ( #$0000 )
}

code_0AEB97 {
    COP [44] ( #F8, #FE, #00, #02, &code_0AEC94 )

  code_0AEB9F:
    COP [2B] ( #$0000, &code_0AEC38, &code_0AEC38, &code_0AEC66 )
}

code_0AEBA9 {
    COP [58] ( &code_0AEBBD )
    COP [84] ( #82, #3C )
    COP [8A]
    COP [84] ( #8B, #02 )
    COP [8A]
    COP [58] ( #$0000 )
}

code_0AEBBD {
    COP [44] ( #00, #FE, #08, #02, &code_0AECC2 )
    BRA code_0AEB9F
}

code_0AEBC7 {
    COP [15] ( &code_0AEBDF )
    COP [82] ( #05, #12 )
    COP [89]
    COP [C5]
}

code_0AEBD3 {
    COP [16] ( &code_0AEBDF )
    COP [82] ( #03, #11 )
    COP [89]
    COP [C5]
}

code_0AEBDF {
    COP [C2]
    COP [23]
    AND #$0003
    BNE code_0AEBF4
    LDA $0410
    LSR 
    LSR 
    AND #$0001
    BEQ code_0AEC0A
    BRA code_0AEBFE
}

code_0AEBF4 {
    COP [2A] ( #$0000, &code_0AEBFE, &code_0AEBFE, &code_0AEC0A )
}

code_0AEBFE {
    COP [17] ( &code_0AEC16 )
    COP [81] ( #07, #12 )
    COP [89]
    COP [C5]
}

code_0AEC0A {
    COP [18] ( &code_0AEC16 )
    COP [81] ( #87, #11 )
    COP [89]
    COP [C5]
}

code_0AEC16 {
    COP [2B] ( #$0000, &code_0AEC20, &code_0AEC20, &code_0AEC2C )
}

code_0AEC20 {
    COP [15] ( &code_0AEBDF )
    COP [82] ( #05, #12 )
    COP [89]
    COP [C5]
}

code_0AEC2C {
    COP [16] ( &code_0AEBDF )
    COP [82] ( #03, #11 )
    COP [89]
    COP [C5]
}

code_0AEC38 {
    COP [8D] ( #05 )
    COP [CA] ( #02 )
    COP [15] ( &code_0AEC62 )
    COP [AB] ( #04 )
    LDA #$0001
    STA $26
    COP [C1]
    COP [8B]
    LDA #$0003
    STA $08
    DEC $26
    BMI code_0AEC58
    RTL 
}

code_0AEC58 {
    COP [CB]
    COP [C2]
    DEC $24
    BPL code_0AEC38
    STZ $24
}

code_0AEC62 {
    STZ $2E
    COP [C5]
}

code_0AEC66 {
    COP [8D] ( #03 )
    COP [CA] ( #02 )
    COP [16] ( &code_0AEC90 )
    COP [AB] ( #03 )
    LDA #$0001
    STA $26
    COP [C1]
    COP [8B]
    LDA #$0003
    STA $08
    DEC $26
    BMI code_0AEC86
    RTL 
}

code_0AEC86 {
    COP [CB]
    COP [C2]
    DEC $24
    BPL code_0AEC66
    STZ $24
}

code_0AEC90 {
    STZ $2E
    COP [C5]
}

code_0AEC94 {
    COP [8D] ( #07 )
    COP [CA] ( #02 )
    COP [17] ( &code_0AECBE )
    COP [AA] ( #04 )
    LDA #$0001
    STA $26
    COP [C1]
    COP [8B]
    LDA #$0003
    STA $08
    DEC $26
    BMI code_0AECB4
    RTL 
}

code_0AECB4 {
    COP [CB]
    COP [C2]
    DEC $24
    BPL code_0AEC94
    STZ $24
}

code_0AECBE {
    STZ $2C
    COP [C5]
}

code_0AECC2 {
    COP [8D] ( #87 )
    COP [CA] ( #02 )
    COP [18] ( &code_0AECEC )
    COP [AA] ( #03 )
    LDA #$0001
    STA $26
    COP [C1]
    COP [8B]
    LDA #$0003
    STA $08
    DEC $26
    BMI code_0AECE2
    RTL 
}

code_0AECE2 {
    COP [CB]
    COP [C2]
    DEC $24
    BPL code_0AECC2
    STZ $24
}

code_0AECEC {
    STZ $2C
    COP [C5]
}

code_0AECF0 {
    COP [43]
    COP [AC] ( #00, #00 )
    COP [58] ( #$0000 )
    COP [C2]
    COP [2A] ( #$0000, &code_0AED06, &code_0AED06, &code_0AED2C )
}

code_0AED06 {
    COP [58] ( #$0000 )
    LDA #$0001
    TSB $12
    COP [80] ( #0C )
    COP [89]
    COP [DA] ( #1D )
    COP [A4] ( @code_0AED52, #F8, #F0, #$0202 )
    COP [80] ( #0D )
    COP [89]
    LDA #$0001
    TRB $12
    COP [C5]
}

code_0AED2C {
    COP [58] ( #$0000 )
    LDA #$0001
    TSB $12
    COP [80] ( #8C )
    COP [89]
    COP [DA] ( #1D )
    COP [A4] ( @code_0AEDA9, #08, #F0, #$0202 )
    COP [80] ( #8D )
    COP [89]
    LDA #$0001
    TRB $12
    COP [C5]
}

code_0AED52 {
    COP [07] ( #1E )
    LDA $24
    STA $7F100C, X
    COP [5B] ( #$0010 )
    LDA $14
    SEC 
    SBC $player_x_pos
    BPL code_0AED6B
    EOR #$FFFF
    INC 
}

code_0AED6B {
    PHA 
    COP [23]
    AND #$003F
    CLC 
    ADC $01, S
    EOR #$FFFF
    INC 
    CLC 
    ADC $14
    STA $7F0018, X
    PLA 
    LDA $player_y_pos
    SEC 
    SBC $16
    PHP 
    BPL code_0AED8D
    EOR #$FFFF
    INC 
}

code_0AED8D {
    CMP #$0030
    BCC code_0AED95
    AND #$001F
}

code_0AED95 {
    PLP 
    BCS code_0AED9C
    EOR #$FFFF
    INC 
}

code_0AED9C {
    CLC 
    ADC $16
    STA $7F001A, X
    COP [22] ( #0E, #02 )
    BRA code_0AEDFA
}

code_0AEDA9 {
    COP [07] ( #1E )
    LDA $24
    STA $7F100C, X
    COP [5B] ( #$0010 )
    LDA $player_x_pos
    SEC 
    SBC $14
    BPL code_0AEDC2
    EOR #$FFFF
    INC 
}

code_0AEDC2 {
    PHA 
    COP [23]
    AND #$003F
    CLC 
    ADC $01, S
    CLC 
    ADC $14
    STA $7F0018, X
    PLA 
    LDA $player_y_pos
    SEC 
    SBC $16
    PHP 
    BPL code_0AEDE0
    EOR #$FFFF
    INC 
}

code_0AEDE0 {
    CMP #$0030
    BCC code_0AEDE8
    AND #$001F
}

code_0AEDE8 {
    PLP 
    BCS code_0AEDEF
    EOR #$FFFF
    INC 
}

code_0AEDEF {
    CLC 
    ADC $16
    STA $7F001A, X
    COP [22] ( #0E, #02 )
}

code_0AEDFA {
    LDA $7F100C, X
    STA $26

  code_0AEE00:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BEQ code_0AEE00
    LDY $26
    LDA $0014, Y
    SEC 
    SBC $14
    STA $0000
    BPL code_0AEE20
    EOR #$FFFF
    INC 
}

code_0AEE20 {
    CMP #$0003
    BCC code_0AEE3C
    LDA $0000
    BPL code_0AEE34
    LDA #$FFFE
    CLC 
    ADC $14
    STA $14
    BRA code_0AEE3C
}

code_0AEE34 {
    LDA #$0002
    CLC 
    ADC $14
    STA $14
}

code_0AEE3C {
    LDA $0016, Y
    SEC 
    SBC #$0010
    SEC 
    SBC $16
    STA $0000
    BPL code_0AEE4F
    EOR #$FFFF
    INC 
}

code_0AEE4F {
    CMP #$0003
    BCC code_0AEE6B
    LDA $0000
    BPL code_0AEE63
    LDA #$FFFE
    CLC 
    ADC $16
    STA $16
    BRA code_0AEE6B
}

code_0AEE63 {
    LDA #$0002
    CLC 
    ADC $16
    STA $16
}

code_0AEE6B {
    LDA $0000
    BPL code_0AEE74
    EOR #$FFFF
    INC 
}

code_0AEE74 {
    STA $0000
    LDA $14
    SEC 
    SBC $0014, Y
    BPL code_0AEE83
    EOR #$FFFF
    INC 
}

code_0AEE83 {
    CLC 
    ADC $0000
    CMP #$0006
    BCC code_0AEE94
    DEC $24
    BPL code_0AEE93
    JMP $&code_0AEE00
}

code_0AEE93 {
    RTL 
}

code_0AEE94 {
    COP [E0]
}