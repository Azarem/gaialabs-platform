
?INCLUDE 'chunk_02CFD0'

!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!player_speed_ns                09B4

---------------------------------------------

e_actor_02B29E {
    LDA $14
    ASL 
    ASL 
    STA $14
    LDA $16
    ASL 
    ASL 
    STA $16
    COP [C1]
    PHX 
    LDX $player_actor
    LDA $0010, X
    BIT #$0080
    BEQ code_02B2C0
    LDA $7F0028, X
    BMI code_02B2C0
    PLX 
    RTL 
}

code_02B2C0 {
    PLX 
    LDA $player_flags
    BIT #$0A00
    BEQ code_02B2D0
    STZ $0408
    STZ $040A
    RTL 
}

code_02B2D0 {
    LDY $player_actor
    LDA $14
    LSR 
    LSR 
    CMP $0014, Y
    BEQ code_02B2E3
    LDA $0014, Y
    ASL 
    ASL 
    STA $14
}

code_02B2E3 {
    LDA $16
    LSR 
    LSR 
    CMP $0016, Y
    BEQ code_02B2F3
    LDA $0016, Y
    ASL 
    ASL 
    STA $16
}

code_02B2F3 {
    LDA $player_flags
    BIT #$3000
    BEQ code_02B300
    LDA #$0000
    BRA code_02B303
}

code_02B300 {
    JSR $&sub_02B3C6
}

code_02B303 {
    PHA 
    LDA $14
    STA $0022
    STZ $0020
    LDA $player_speed_ew
    BNE code_02B327
    LDA $01, S
    AND #$00FF
    BIT #$0080
    BEQ code_02B31E
    ORA #$FF00
}

code_02B31E {
    CLC 
    ADC $0408
    STA $0020
    BRA code_02B336
}

code_02B327 {
    ASL 
    ASL 
    CLC 
    ADC $0408
    STA $0020
    LDA #$1000
    TRB $player_flags
}

code_02B336 {
    STZ $0408
    STZ $0024
    LDA $16
    STA $0026
    LDA $player_speed_ns
    BNE code_02B360
    STZ $09C6
    LDA $01, S
    XBA 
    AND #$00FF
    BIT #$0080
    BEQ code_02B357
    ORA #$FF00
}

code_02B357 {
    CLC 
    ADC $040A
    STA $0024
    BRA code_02B36F
}

code_02B360 {
    ASL 
    ASL 
    CLC 
    ADC $040A
    STA $0024
    LDA #$1000
    TRB $player_flags
}

code_02B36F {
    STZ $040A
    PLA 
    LDY $player_actor
    LDA $0010, Y
    BIT #$0008
    BNE code_02B394
    LDA $0020
    CLC 
    ADC $0022
    STA $0022
    LDA $0024
    CLC 
    ADC $0026
    STA $0026
    BRA code_02B39C
}

code_02B394 {
    STX $000A
    TXY 
    JSL $@func_02CFD0
}

code_02B39C {
    LDY $player_actor
    LDA $0022
    STA $14
    LSR 
    LSR 
    STA $0014, Y
    LDA $0026
    STA $16
    LSR 
    LSR 
    STA $0016, Y
    LDA $0010, Y
    AND #$FFFB
    PHA 
    LDA $10
    AND #$0004
    ORA $01, S
    STA $0010, Y
    PLA 
    RTL 
}

---------------------------------------------

sub_02B3C6 {
    PHP 
    SEP #$20
    LDA $0657
    BIT #$02
    BNE code_02B3E3
    BIT #$01
    BNE code_02B400
    BIT #$08
    BNE code_02B41D
    BIT #$04
    BNE code_02B424
    LDA #$00
    XBA 
    LDA #$00
    BRA code_02B3FE
}

code_02B3E3 {
    BIT #$0C
    BEQ code_02B3F9
    BIT #$08
    BNE code_02B3F2
    LDA #$06
    XBA 
    LDA #$FA
    BRA code_02B3FE
}

code_02B3F2 {
    LDA #$FA
    XBA 
    LDA #$FA
    BRA code_02B3FE
}

code_02B3F9 {
    LDA #$00
    XBA 
    LDA #$F8
}

code_02B3FE {
    PLP 
    RTS 
}

code_02B400 {
    BIT #$0C
    BEQ code_02B416
    BIT #$08
    BNE code_02B40F
    LDA #$06
    XBA 
    LDA #$06
    BRA code_02B41B
}

code_02B40F {
    LDA #$FA
    XBA 
    LDA #$06
    BRA code_02B41B
}

code_02B416 {
    LDA #$00
    XBA 
    LDA #$08
}

code_02B41B {
    PLP 
    RTS 
}

code_02B41D {
    LDA #$F8
    XBA 
    LDA #$00
    PLP 
    RTS 
}

code_02B424 {
    LDA #$08
    XBA 
    LDA #$00
    PLP 
    RTS 
}