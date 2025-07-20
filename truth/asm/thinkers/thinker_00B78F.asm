
!CGADSUB                        2131

---------------------------------------------

h_thinker_00B78F [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B78F {
    COP [C1]
    SEP #$20
    LDA #$02
    STA $CGADSUB
    REP #$20
    RTL 
}