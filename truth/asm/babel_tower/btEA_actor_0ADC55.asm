
!scene_current                  0644
!player_x_tile                  09A6
!player_y_tile                  09A8

---------------------------------------------

h_btEA_actor_0ADC55 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_btEA_actor_0ADC55 {
    PHX 
    SEP #$20
    LDX #$0000

  code_0ADC5E:
    LDA $@sc_ix_0ADCFE, X
    BNE code_0ADC69

  code_0ADC64:
    REP #$20
    PLX 
    COP [E0]
}

code_0ADC69 {
    CMP $scene_current
    BEQ code_0ADC75
    BCS code_0ADC64
    INX 
    INX 
    INX 
    BRA code_0ADC5E
}

code_0ADC75 {
    REP #$20
    LDA $@sc_ix_0ADCFE+1, X
    SEC 
    SBC #$sc_ix_0ADCFE
    STA $24
    PLX 
    COP [DA] ( #01 )
    PHX 
    LDX $24
    PHD 
    LDA #$0000
    TCD 
    LDA $player_x_tile
    STA $18
    INC 
    STA $1A
    LDA $player_y_tile
    STA $1C
    INC 
    STA $1E
    SEP #$20

  code_0ADC9F:
    LDA $@sc_ix_0ADCFE, X
    BMI code_0ADCF9
    CMP $1A
    BCS code_0ADCF1
    LDA $@sc_ix_0ADCFE+1, X
    CMP $1E
    BCS code_0ADCF1
    LDA $@sc_ix_0ADCFE+2, X
    CMP $18
    BCC code_0ADCF1
    LDA $@sc_ix_0ADCFE+3, X
    CMP $1C
    BCC code_0ADCF1
    LDA $@sc_ix_0ADCFE+4, X
    REP #$20
    AND #$00FF
    BIT #$0080
    BEQ code_0ADCD2
    ORA #$FF00
}

code_0ADCD2 {
    CLC 
    ADC $0408
    STA $0408
    LDA $@sc_ix_0ADCFE+5, X
    AND #$00FF
    BIT #$0080
    BEQ code_0ADCE8
    ORA #$FF00
}

code_0ADCE8 {
    CLC 
    ADC $040A
    STA $040A
    SEP #$20
}

code_0ADCF1 {
    INX 
    INX 
    INX 
    INX 
    INX 
    INX 
    BRA code_0ADC9F
}

code_0ADCF9 {
    REP #$20
    PLD 
    PLX 
    RTL 
}

---------------------------------------------

sc_ix_0ADCFE [
  sc_ix < #55, &sc_data_0ADD05 >   ;00
  sc_ix < #EA, &sc_data_0ADD0B >   ;01
]

---------------------------------------------

sc_data_0ADD05 [
  sc_data < #02, #04, #16, #0A, #00, #04 >   ;00
]

sc_data_0ADD0B [
  sc_data < #03, #07, #04, #09, #00, #04 >   ;00
  sc_data < #07, #06, #08, #08, #00, #FC >   ;01
  sc_data < #0B, #07, #0C, #09, #00, #04 >   ;02
]