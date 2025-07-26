
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_pyDD_teleporter_left [
  h_actor < #0F, #01, #07 >   ;00
]

---------------------------------------------

e_pyDD_teleporter_left {
    BRA e_pyDD_teleporter_right
}

---------------------------------------------

h_pyDD_teleporter_right [
  h_actor < #0F, #01, #07 >   ;00
]

---------------------------------------------

e_pyDD_teleporter_right {
    COP [8D] ( #0F )
    COP [C1]
    LDY $player_actor
    LDA $0010, Y
    BIT #$2000
    BEQ code_0BADE0
    RTL 
}

code_0BADE0 {
    LDA $player_flags
    BIT #$0002
    BEQ code_0BADE9
    RTL 
}

code_0BADE9 {
    COP [21] ( #01, &code_0BADEF )
    RTL 
}

code_0BADEF {
    COP [CC] ( #01 )
    COP [9C] ( @code_0BAE18, #$2700 )
    LDA #$0001
    STA $24
    COP [C2]
    LDA $24
    BEQ e_pyDD_teleporter_right
    PHX 
    LDX $player_actor
    LDY $06
    LDA $0014, Y
    STA $0014, X
    LDA $0016, Y
    STA $0016, X
    PLX 
    RTL 
}

code_0BAE18 {
    LDA #$0008
    TSB $12
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA $player_x_pos
    CLC 
    ADC #$0008
    STA $14
    LDA $player_y_pos
    CLC 
    ADC #$0010
    STA $16
    COP [22] ( #FF, #04 )
    LDY $player_actor
    LDA $0010, Y
    ORA #$2200
    STA $0010, Y
    LDA #$2000
    TRB $10
    COP [06] ( #0C )
    COP [80] ( #14 )
    COP [89]
    COP [88] ( @table_0EE000 )
    LDA $04
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$00F0
    STA $7F001A, X
    COP [22] ( #27, #08 )
    COP [88] ( $7E4000 )
    COP [06] ( #0C )
    COP [80] ( #14 )
    COP [89]
    COP [88] ( @table_0EE000 )
    LDA $14
    CMP #$0100
    BCC code_0BAE99
    LDA #$4000
    TSB $12
}

code_0BAE99 {
    LDA $14
    CLC 
    ADC #$0020
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [22] ( #27, #04 )
    COP [80] ( #1A )
    COP [89]
    COP [CE] ( #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    PHX 
    PHD 
    TYA 
    TCD 
    TAX 
    LDA $00
    PHA
    LDA $02
    PHA 
    COP [8F] ( #00 )
    JSL $@func_03CA55
    STZ $2A
    STZ $08
    PLA
    STA $02
    PLA 
    STA $00
    PLD 
    PLX 
    LDY $04
    LDA #$0000
    STA $0024, Y
    LDA #$2000
    TSB $10
    LDA #$0028
    STA $24
    LDY $player_actor
    LDA $0010, Y
    ORA #$0200
    STA $0010, Y
    COP [C1]
    DEC $24
    BMI code_0BAF2D
    LDY $player_actor
    LDA $0036
    LSR 
    LDA $0010, Y
    BCS code_0BAF1D
    ORA #$0001
    STA $0010, Y
    LDA $000E, Y
    AND #$CFFF
    BRA code_0BAF29
}

code_0BAF1D {
    AND #$FFFE
    STA $0010, Y
    LDA $000E, Y
    ORA #$3000
}

code_0BAF29 {
    STA $000E, Y
    RTL 
}

code_0BAF2D {
    LDA $joypad_mask_std
    BIT #$0F00
    BNE code_0BAF41
    LDY $player_actor
    LDA $0010, Y
    AND #$FDFF
    STA $0010, Y
}

code_0BAF41 {
    LDY $player_actor
    LDA $000E, Y
    ORA #$3000
    STA $000E, Y
    COP [E0]
}