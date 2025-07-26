
?INCLUDE 'stats_01ABF0'
?INCLUDE 'table_0EE000'

---------------------------------------------

h_dm3F_switch [
  h_actor < #0F, #01, #01 >   ;00
]

---------------------------------------------

e_dm3F_switch {
    LDA #$&stats_01ABF0+118
    STA $7F0020, X
    LDA #$0030
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #0F )
    COP [89]
    COP [0B]
    SEP #$20
    STZ $0A01
    REP #$20
    COP [58] ( &code_05D050 )
    LDA #$00FF
    STA $7F0026, X
    COP [C1]
    RTL 
}

code_05D050 {
    COP [80] ( #11 )
    COP [89]
    SEP #$20
    INC $0A01
    REP #$20
    COP [C1]
    LDA #$00FF
    STA $7F0026, X
    RTL 
}