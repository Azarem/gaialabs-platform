
!COLDATA                        2132

---------------------------------------------

h_thinker_00B631 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B631 {
    COP [D0] ( #22, #01, &func_00B65B )
    COP [D0] ( #21, #00, &func_00B65B )

  code_00B63F:
    COP [37] ( #05 )
    COP [39]
    SEP #$20
    LDA #$24
    STA $COLDATA
    LDA #$42
    STA $COLDATA
    REP #$20
    COP [CC] ( #FF )
    COP [D2] ( #FF, #00 )
    BRA code_00B63F
}

---------------------------------------------

func_00B65B {
    COP [3D]
    RTL 
}