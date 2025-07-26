
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_x_tile                  09A6
!player_y_tile                  09A8
!player_actor                   09AA

---------------------------------------------

h_dark_space1 [
  h_actor < #24, #00, #0B >   ;00
]

---------------------------------------------

e_dark_space1 {
    LDA $0E
    STA $24
    LDA #$3000
    STA $0E
    BRA code_08D6B5
}

---------------------------------------------

h_dark_space2 [
  h_actor < #24, #00, #0B >   ;00
]

---------------------------------------------

e_dark_space2 {
    LDA $0E
    STA $24
    LDA #$2000
    STA $0E
}

code_08D6B5 {
    LDA #$0004
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [8D] ( #24 )
    COP [0B]
    LDA #$2000
    TRB $10
    LDA #$0B00
    TSB $10
    COP [5B] ( #$0200 )
    COP [9C] ( @code_08D713, #$2300 )
    LDA $24
    STA $0024, Y

  code_08D6DE:
    COP [8D] ( #24 )

  code_08D6E1:
    COP [21] ( #05, &code_08D6EE )
    COP [C1]
    COP [8B]
    COP [C2]
    BRA code_08D6E1
}

code_08D6EE {
    LDA $10
    BIT #$4000
    BNE code_08D6F5
}

code_08D6F5 {
    COP [80] ( #1F )
    COP [89]
    COP [8D] ( #20 )

  code_08D6FD:
    COP [21] ( #05, &code_08D704 )
    BRA code_08D70C
}

code_08D704 {
    COP [C1]
    COP [8B]
    COP [C2]
    BRA code_08D6FD
}

code_08D70C {
    COP [80] ( #21 )
    COP [89]
    BRA code_08D6DE
}

code_08D713 {
    COP [C1]
    NOP 
    NOP 
    LDA $09EC
    BIT #$0080
    BEQ code_08D720
    RTL 
}

code_08D720 {
    COP [44] ( #FF, #00, #01, #01, &code_08D729 )
    RTL 
}

code_08D729 {
    COP [40] ( #$0801, &code_08D730 )
    RTL 
}

code_08D730 {
    LDA #$CFF0
    TSB $joypad_mask_std
    PHX 
    LDX $player_actor
    LDA $0010, X
    ORA #$2000
    STA $0010, X
    LDA $0014, X
    STA $14
    LDA $0016, X
    STA $16
    PLX 
    COP [08] ( #$0C0C )
    LDA #$2000
    TRB $10
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    PHX 
    LDX $player_actor
    LDY $04
    LDA $0014, Y
    STA $0014, X
    SEC 
    SBC #$0008
    STA $player_x_pos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $player_x_tile
    LDA $0016, Y
    STA $0016, X
    SEC 
    SBC #$0010
    STA $player_y_pos
    LSR 
    LSR 
    LSR 
    LSR 
    STA $player_y_tile
    PLX 
    LDA #$0101
    STA $064A
    LDA #$0200
    STA $0648
    LDA #$0200
    TSB $06EE
    LDA $24
    STA $0AAC
    COP [C1]
    RTL 
}