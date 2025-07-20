
!player_x_tile                  09A6
!APUIO0                         2140

---------------------------------------------

h_av73_actor_06D6F4 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av73_actor_06D6F4 {
    COP [45] ( #00, #00, #40, #10, &code_06D72E )
    COP [9C] ( @code_06D733, #$2000 )
    COP [C1]
    LDA $0036
    AND #$0003
    BEQ code_06D711
    RTL 
}

code_06D711 {
    SEP #$20
    LDA $player_x_tile
    SEC 
    SBC #$2C
    BPL code_06D71E
    EOR #$FF
    INC 
}

code_06D71E {
    ASL 
    CMP #$30
    BCC code_06D725
    LDA #$30
}

code_06D725 {
    CLC 
    ADC #$40
    STA $APUIO0
    REP #$20
    RTL 
}

code_06D72E {
    COP [CC] ( #00 )
    COP [E0]
}

code_06D733 {
    COP [C1]
    COP [45] ( #2A, #17, #2F, #1D, &code_06D741 )
    COP [CE] ( #00 )
    RTL 
}

code_06D741 {
    COP [CC] ( #00 )
    RTL 
}