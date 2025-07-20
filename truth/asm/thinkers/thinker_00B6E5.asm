
!COLDATA                        2132

---------------------------------------------

h_thinker_00B6E5 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B6E5 {
    SEP #$20
    LDA #$2B
    STA $COLDATA
    LDA #$44
    STA $COLDATA
    LDA #$82
    STA $COLDATA
    REP #$20
    COP [3D]
    RTL 
}