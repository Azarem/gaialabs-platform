
!CGADSUB                        2131

---------------------------------------------

h_thinker_00B71E [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B71E {
    COP [CC] ( #FF )
    SEP #$20
    LDA #$03
    STA $CGADSUB
    REP #$20

  code_00B72C:
    COP [D0] ( #0F, #01, &code_00B74E )
    COP [D0] ( #70, #00, &code_00B73F )
    COP [37] ( #1A )
    COP [39]
    BRA code_00B746
}

code_00B73F {
    COP [37] ( #25 )
    COP [39]
    BRA code_00B746
}

code_00B746 {
    COP [D0] ( #FF, #01, &code_00B72C )
    BRA e_thinker_00B71E
}

code_00B74E {
    COP [D2] ( #0F, #00 )
    BRA code_00B72C
}