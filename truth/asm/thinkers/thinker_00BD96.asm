

---------------------------------------------

h_thinker_00BD96 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00BD96 {
    LDA #$0004
    STA $7F0008, X
    COP [CC] ( #FF )
    COP [5F] ( #$8800, #10 )
    LDA $06C0
    PHA 
    LDA $0722
    LSR 
    LSR 
    LSR 
    LSR 
    STA $06C0
    COP [60] ( #04, #02 )
    PLA 
    STA $06C0
    COP [61] ( $7E8800, #0D )
    COP [D0] ( #FF, #00, &e_thinker_00BD96 )
    RTL 
}