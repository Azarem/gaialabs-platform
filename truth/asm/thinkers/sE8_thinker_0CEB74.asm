?BANK 0C

!BG1SC                          2107
!BG2SC                          2108
!WOBJSEL                        2125
!WH0                            2126
!WH1                            2127
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_sE8_thinker_0CEB74 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_sE8_thinker_0CEB74 {
    SEP #$20
    LDA #$16
    STA $_TM
    LDA #$00
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$02
    STA $CGADSUB
    LDA #$10
    STA $BG1SC
    LDA #$18
    STA $BG2SC
    REP #$20
    COP [C2]
    COP [D0] ( #FF, #00, &e_sE8_thinker_0CEB74 )
    RTL 
}

---------------------------------------------

e_sE8_thinker_0CEBA1 {
    SEP #$20
    LDA #$17
    STA $_TM
    LDA #$02
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$11
    STA $CGADSUB
    LDA #$10
    STA $BG1SC
    LDA #$18
    STA $BG2SC
    REP #$20
    COP [C2]
    COP [D0] ( #FF, #00, &e_sE8_thinker_0CEBA1 )
    RTL 
}

---------------------------------------------

e_sE8_thinker_0CEBCC {
    SEP #$20
    LDA #$17
    STA $_TM
    LDA #$00
    STA $_TS
    LDA #$80
    STA $CGWSEL
    LDA #$80
    STA $CGADSUB
    LDA #$10
    STA $BG1SC
    LDA #$18
    STA $BG2SC
    REP #$20
    COP [C2]
    COP [D0] ( #FF, #00, &e_sE8_thinker_0CEBCC )
    RTL 
}

---------------------------------------------

e_sE8_thinker_0CEBF7 {
    SEP #$20
    LDA #$00
    STA $WH0
    STA $WH1
    LDA #$17
    STA $_TM
    LDA #$00
    STA $_TS
    LDA #$30
    STA $WOBJSEL
    LDA #$22
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    LDA #$57
    STA $7F0C02
    LDA #$10
    STA $BG1SC
    LDA #$18
    STA $BG2SC
    REP #$20
    COP [C2]
    COP [D0] ( #FF, #00, &e_sE8_thinker_0CEBF7 )
    RTL 
}

---------------------------------------------

e_sE8_thinker_0CEC35 {
    SEP #$20
    LDA #$00
    STA $WOBJSEL
    LDA #$17
    STA $_TM
    LDA #$00
    STA $_TS
    LDA #$80
    STA $CGWSEL
    LDA #$3F
    STA $CGADSUB
    LDA #$10
    STA $BG1SC
    LDA #$18
    STA $BG2SC
    REP #$20
    COP [C2]
    COP [D0] ( #FF, #00, &e_sE8_thinker_0CEC35 )
    RTL 
}