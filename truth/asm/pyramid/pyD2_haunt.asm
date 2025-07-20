?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_00DB8A'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_pyD2_haunt1 [
  h_actor < #0A, #00, #01 >   ;00
]

---------------------------------------------

e_pyD2_haunt1 {
    COP [57] ( @code_0BC2C2 )
    COP [C1]
    COP [21] ( #03, &code_0BC194 )
    RTL 
}

code_0BC194 {
    COP [14] ( #00, #01, &code_0BC1A0 )
    COP [82] ( #0A, #01 )
    COP [89]
}

code_0BC1A0 {
    LDA #$0100
    TRB $10
    BRA code_0BC1B4
}

---------------------------------------------

h_pyD5_haunt2 [
  h_actor < #07, #00, #00 >   ;00
]

---------------------------------------------

e_pyD5_haunt2 {
    COP [57] ( @code_0BC2C2 )

  code_0BC1AF:
    COP [C2]
    COP [27] ( #08 )
}

code_0BC1B4 {
    LDA $14
    SEC 
    SBC $player_x_pos
    BPL code_0BC1C0
    EOR #$FFFF
    INC 
}

code_0BC1C0 {
    CMP #$0100
    BCS code_0BC1AF
    LDA $16
    SEC 
    SBC $player_y_pos
    BPL code_0BC1D1
    EOR #$FFFF
    INC 
}

code_0BC1D1 {
    CMP #$0100
    BCS code_0BC1AF
    COP [2C] ( &code_0BC1DC, &code_0BC228 )
}

code_0BC1DC {
    COP [2A] ( #$0000, &code_0BC1E6, &code_0BC1E6, &code_0BC207 )
}

code_0BC1E6 {
    COP [CA] ( #03 )
    COP [17] ( &code_0BC276 )
    COP [81] ( #0C, #02 )
    COP [89]
    COP [17] ( &code_0BC276 )
    COP [81] ( #18, #02 )
    COP [89]
    COP [2C] ( &code_0BC203, &code_0BC228 )
}

code_0BC203 {
    COP [CB]
    BRA code_0BC1B4
}

code_0BC207 {
    COP [CA] ( #03 )
    COP [18] ( &code_0BC276 )
    COP [81] ( #8C, #01 )
    COP [89]
    COP [18] ( &code_0BC276 )
    COP [81] ( #98, #01 )
    COP [89]
    COP [2C] ( &code_0BC224, &code_0BC228 )
}

code_0BC224 {
    COP [CB]
    BRA code_0BC1B4
}

code_0BC228 {
    COP [2B] ( #$0000, &code_0BC232, &code_0BC232, &code_0BC254 )
}

code_0BC232 {
    COP [CA] ( #03 )
    COP [15] ( &code_0BC276 )
    COP [82] ( #0B, #02 )
    COP [89]
    COP [15] ( &code_0BC276 )
    COP [82] ( #17, #02 )
    COP [89]
    COP [2C] ( &code_0BC24F, &code_0BC1DC )
}

code_0BC24F {
    COP [CB]
    JMP $&code_0BC1B4
}

code_0BC254 {
    COP [CA] ( #03 )
    COP [16] ( &code_0BC276 )
    COP [82] ( #0A, #01 )
    COP [89]
    COP [16] ( &code_0BC276 )
    COP [82] ( #16, #01 )
    COP [89]
    COP [2C] ( &code_0BC271, &code_0BC1DC )
}

code_0BC271 {
    COP [CB]
    JMP $&code_0BC1B4
}

code_0BC276 {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BC286 )
}

code_list_0BC286 [
  &code_0BC28E   ;00
  &code_0BC29B   ;01
  &code_0BC2A8   ;02
  &code_0BC2B5   ;03
]

code_0BC28E {
    COP [17] ( &code_0BC276 )
    COP [81] ( #18, #02 )
    COP [89]
    JMP $&code_0BC1B4
}

code_0BC29B {
    COP [18] ( &code_0BC276 )
    COP [81] ( #8C, #01 )
    COP [89]
    JMP $&code_0BC1B4
}

code_0BC2A8 {
    COP [15] ( &code_0BC276 )
    COP [82] ( #0B, #02 )
    COP [89]
    JMP $&code_0BC1B4
}

code_0BC2B5 {
    COP [16] ( &code_0BC276 )
    COP [82] ( #0A, #01 )
    COP [89]
    JMP $&code_0BC1B4
}

code_0BC2C2 {
    COP [9C] ( @code_0BC2E4, #$0000 )
    COP [80] ( #0E )
    COP [89]
    COP [C7] ( @func_00DB8A )
    ORA $0000
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    BRA code_0BC334
}

code_0BC2E4 {
    COP [5B] ( #$0090 )
    LDA #$&stats_01ABF0+134
    STA $7F0020, X
    LDA $&stats_01ABF0+134
    AND #$00FF
    STA $7F0026, X
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    COP [8D] ( #0D )
    COP [DA] ( #17 )
    COP [08] ( #$0606 )
    COP [CA] ( #03 )
    COP [AB] ( #0C )
    COP [CB]
    COP [CA] ( #03 )
    COP [AB] ( #08 )
    COP [CB]
    COP [CA] ( #03 )
    COP [AB] ( #04 )
    COP [CB]
    COP [CA] ( #03 )
    COP [AB] ( #02 )
    COP [CB]
    COP [80] ( #0D )
    COP [89]
}

code_0BC334 {
    COP [68] ( &code_0BC342 )

  code_0BC338:
    COP [27] ( #15 )

  code_0BC33B:
    LDA $10
    BIT #$4000
    BNE code_0BC338
}

code_0BC342 {
    LDA $7F100C, X
    SEC 
    SBC $player_x_pos
    BPL code_0BC350
    EOR #$FFFF
    INC 
}

code_0BC350 {
    CMP #$0070
    BCS code_0BC396
    LDA $7F100E, X
    SEC 
    SBC $player_y_pos
    BPL code_0BC363
    EOR #$FFFF
    INC 
}

code_0BC363 {
    CMP #$0070
    BCS code_0BC396
    COP [23]
    AND #$003F
    CLC 
    ADC $player_x_pos
    SEC 
    SBC #$001F
    STA $7F0018, X
    LDA $0410
    LSR 
    LSR 
    LSR 
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $player_y_pos
    CLC 
    ADC #$0010
    STA $7F001A, X
    COP [22] ( #FF, #02 )
}

code_0BC396 {
    COP [80] ( #0D )
    COP [89]
    BRA code_0BC33B
}