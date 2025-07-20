
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

func_00B528 {
    LDY $player_actor
    LDA $0028, Y
    STA $7F000C, X
    COP [3C] ( @func_00B592 )
    TYA 
    STA $7F000A, X
    COP [C1]
    LDA $player_flags
    BIT #$0002
    BNE code_00B56F
    PHX 
    LDY $player_actor
    TYX 
    SEP #$20
    LDA $7F0008, X
    PLX 
    CMP #$8F
    BNE code_00B562
    REP #$20
    LDA $0028, Y
    CMP $7F000C, X
    BNE code_00B562
    RTL 
}

code_00B562 {
    REP #$20
    JSR $&sub_00B5A6
    COP [37] ( #0B )
    COP [39]
    COP [3D]
    RTL 
}

code_00B56F {
    JSR $&sub_00B5A6
    COP [3C] ( @func_00B59E )
    TYA 
    STA $7F000A, X
    COP [C1]
    LDA $player_flags
    BIT #$0002
    BEQ code_00B587
    RTL 
}

code_00B587 {
    JSR $&sub_00B5A6
    COP [37] ( #0B )
    COP [39]
    COP [3D]
    RTL 
}

---------------------------------------------

func_00B592 {
    COP [37] ( #20 )
    COP [39]

  code_00B597:
    COP [37] ( #21 )
    COP [39]
    BRA code_00B597
}

---------------------------------------------

func_00B59E {
    COP [37] ( #22 )
    COP [39]
    COP [C1]
    RTL 
}

---------------------------------------------

sub_00B5A6 {
    PHX 
    PHD 
    LDA $7F000A, X
    TCD 
    TAX 
    COP [3D]
    PLD 
    PLX 
    RTS 
}