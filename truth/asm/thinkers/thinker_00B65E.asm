
!COLDATA                        2132

---------------------------------------------

h_thinker_00B65E [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B65E {
    SEP #$20
    LDA #$66
    STA $COLDATA
    LDA #$82
    STA $COLDATA
    REP #$20
    COP [3D]
    RTL 
}