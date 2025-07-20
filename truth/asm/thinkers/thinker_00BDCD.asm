
!COLDATA                        2132

---------------------------------------------

h_thinker_00BDCD [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00BDCD {
    COP [D0] ( #7B, #01, &func_00BDE5 )
    SEP #$20
    LDA #$2A
    STA $COLDATA
    LDA #$44
    STA $COLDATA
    REP #$20
    BRA code_00BDF3
}

---------------------------------------------

func_00BDE5 {
    SEP #$20
    LDA #$28
    STA $COLDATA
    LDA #$41
    STA $COLDATA
    REP #$20
}

code_00BDF3 {
    LDA #$0001
    STA $7F0008, X
    COP [5F] ( #$8800, #08 )
    COP [C2]
    COP [D0] ( #FF, #00, &e_thinker_00BDCD )
    COP [60] ( #03, #02 )
    COP [61] ( $7E8800, #0D )
    COP [61] ( $7E8C00, #0E )
    RTL 
}