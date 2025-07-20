?INCLUDE 'player_character'

!player_actor                   09AA

---------------------------------------------

h_pyD0_actor_08B592 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyD0_actor_08B592 {
    LDA #$0000
    STA $24
    LDA $0E
    STA $26
    BEQ code_08B5A9
    COP [D1] ( #$0171, #01, &code_08B666 )
    BRA code_08B5B0
}

code_08B5A9 {
    COP [D1] ( #$0170, #01, &code_08B666 )
}

code_08B5B0 {
    COP [C1]
    PHX 
    LDX $player_actor
    LDA $7F0008, X
    AND #$00FF
    CMP #$0095
    BEQ code_08B5C7
    CMP #$008E
    BNE code_08B5CF
}

code_08B5C7 {
    LDA $0028, X
    CMP #$001C
    BEQ code_08B5D1
}

code_08B5CF {
    PLX 
    RTL 
}

code_08B5D1 {
    PLX 
    COP [C1]
    COP [21] ( #01, &code_08B5DA )
    RTL 
}

code_08B5DA {
    LDA $24
    BNE code_08B617
    INC $24
    LDA $14
    STA $7F0010, X
    LSR 
    LSR 
    LSR 
    LSR 
    STA $14
    LDA $16
    STA $7F0012, X
    LSR 
    LSR 
    LSR 
    LSR 
    DEC 
    STA $16
    COP [4C] ( #E8 )
    INC $14
    COP [4C] ( #E9 )
    LDA $7F0010, X
    STA $14
    LDA $7F0012, X
    STA $16
    COP [C1]
    COP [21] ( #01, &code_08B616 )
    BRA code_08B5B0
}

code_08B616 {
    RTL 
}

code_08B617 {
    COP [07] ( #15 )
    LDA $26
    STA $0000
    COP [D9] ( #$0000, &code_list_08B625 )
}

code_list_08B625 [
  &code_08B629   ;00
  &code_08B634   ;01
]

code_08B629 {
    COP [32] ( #70 )
    COP [33]
    COP [CD] ( #$0170 )
    BRA code_08B63F
}

code_08B634 {
    COP [32] ( #71 )
    COP [33]
    COP [CD] ( #$0171 )
    BRA code_08B63F
}

code_08B63F {
    LDY $player_actor
    LDA $0010, Y
    AND #$FFF7
    ORA #$0200
    STA $0010, Y
    SEP #$20
    LDA #$^func_02C61E
    STA $0002, Y
    REP #$20
    LDA #$&func_02C61E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
}

code_08B666 {
    COP [E0]
}