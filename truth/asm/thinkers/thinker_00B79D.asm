
!COLDATA                        2132

---------------------------------------------

h_thinker_00B79D [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00B79D {
    COP [C1]
    LDA $06C2
    CLC 
    ADC #$0080
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$00F8
    LSR 
    LSR 
    LSR 
    CLC 
    ADC #$00E0
    SEP #$20
    STA $COLDATA
    REP #$20
    RTL 
}