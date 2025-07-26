
?INCLUDE 'chunk_00E683'

!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA

---------------------------------------------

h_mu5F_flasher [
  h_actor < #0D, #00, #20 >   ;00
]

---------------------------------------------

e_mu5F_flasher {
    COP [13] ( &code_0AE28E )
    LDA #$0011
    TSB $12
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X

  code_0AE286:
    COP [C2]
    COP [21] ( #0A, &code_0AE296 )
    RTL 
}

code_0AE28E {
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

code_0AE296 {
    COP [DA] ( #3B )
    COP [23]
    PHA 
    AND #$00F0
    SEC 
    SBC #$0080
    CLC 
    ADC $player_x_pos
    AND #$FFF0
    CLC 
    ADC #$0008
    STA $14
    PLA 
    ASL 
    ASL 
    ASL 
    ASL 
    AND #$00F0
    SEC 
    SBC #$0070
    CLC 
    ADC $player_y_pos
    AND #$FFF0
    CLC 
    ADC #$0010
    STA $16
    LDA $7F100C, X
    SEC 
    SBC $14
    BPL code_0AE2D6
    EOR #$FFFF
    INC 
}

code_0AE2D6 {
    CMP #$0100
    BCS code_0AE286
    LDA $7F100E, X
    SEC 
    SBC $16
    BPL code_0AE2E8
    EOR #$FFFF
    INC 
}

code_0AE2E8 {
    CMP #$0100
    BCS code_0AE286
    COP [13] ( &code_0AE301 )
    COP [21] ( #01, &code_0AE301 )
    COP [C8] ( &code_0AE302 )
    LDA #$2100
    TSB $10
    BRA code_0AE296
}

code_0AE301 {
    RTL 
}

code_0AE302 {
    COP [C2]
    LDA #$2000
    TRB $10
    COP [2C] ( &code_0AE30F, &code_0AE373 )
}

code_0AE30F {
    COP [2A] ( #$0000, &code_0AE319, &code_0AE319, &code_0AE346 )
}

code_0AE319 {
    COP [58] ( &code_0AE33F )
    COP [80] ( #15 )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    COP [A5] ( @code_0AE3D7, #F0, #F0, #$0202 )
    LDA #$000C
    STA $0026, Y
    COP [B0] ( #06, #00 )
}

code_0AE33F {
    COP [80] ( #18 )
    COP [89]
    COP [C5]
}

code_0AE346 {
    COP [58] ( &code_0AE36C )
    COP [80] ( #95 )
    COP [89]
    COP [80] ( #8F )
    COP [89]
    COP [80] ( #92 )
    COP [89]
    COP [A5] ( @code_0AE3D7, #10, #F0, #$0202 )
    LDA #$0004
    STA $0026, Y
    COP [B0] ( #05, #00 )
}

code_0AE36C {
    COP [80] ( #98 )
    COP [89]
    COP [C5]
}

code_0AE373 {
    COP [2B] ( #$0000, &code_0AE37D, &code_0AE37D, &code_0AE3AA )
}

code_0AE37D {
    COP [58] ( &code_0AE3A3 )
    COP [80] ( #14 )
    COP [89]
    COP [80] ( #0E )
    COP [89]
    COP [80] ( #11 )
    COP [89]
    COP [A5] ( @code_0AE3D7, #00, #F0, #$0200 )
    LDA #$0000
    STA $0026, Y
    COP [B0] ( #00, #06 )
}

code_0AE3A3 {
    COP [80] ( #17 )
    COP [89]
    COP [C5]
}

code_0AE3AA {
    COP [58] ( &code_0AE3D0 )
    COP [80] ( #13 )
    COP [89]
    COP [80] ( #0D )
    COP [89]
    COP [80] ( #10 )
    COP [89]
    COP [A5] ( @code_0AE3D7, #00, #F0, #$0202 )
    LDA #$0008
    STA $0026, Y
    COP [B0] ( #00, #05 )
}

code_0AE3D0 {
    COP [80] ( #16 )
    COP [89]
    COP [C5]
}

code_0AE3D7 {
    COP [07] ( #20 )
    COP [5B] ( #$0010 )
    LDA #$0080
    TSB $12
    COP [80] ( #21 )
    COP [89]
    COP [A2] ( @func_00E683, #$2000 )
    LDA #$8021
    STA $7F000A, X
    LDA #$0003
    STA $7F0014, X
    LDA $player_actor
    STA $0024, Y
    PHX 
    TYX 
    LDA $26
    STA $7F000E, X
    PLX 
    LDA #$0002
    TSB $10
    COP [80] ( #21 )
    COP [89]
    PHX 
    LDX $06
    LDA $7F002C, X
    STA $0000
    LDA $7F002E, X
    PLX 
    STA $7F100E, X
    LDA $0000
    STA $7F100C, X
    COP [A9]

  code_0AE432:
    COP [C1]
    COP [8B]
    LDA $08
    STA $24
    STZ $08
    COP [C1]
    LDA $7F100C, X
    STA $7F002C, X
    LDA $7F100E, X
    STA $7F002E, X
    DEC $24
    BMI code_0AE453
    RTL 
}

code_0AE453 {
    LDA $10
    BIT #$4000
    BEQ code_0AE432
    COP [E0]
}