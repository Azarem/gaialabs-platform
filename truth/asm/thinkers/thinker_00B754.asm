

---------------------------------------------

h_thinker_00B754 [
  h_thinker < #00, #08 >   ;00
]

---------------------------------------------

e_thinker_00B754 {
    COP [D0] ( #96, #01, &code_00B763 )

  code_00B75C:
    COP [37] ( #42 )
    COP [39]
    BRA code_00B75C
}

code_00B763 {
    COP [3C] ( @code_00B76F )

  code_00B768:
    COP [37] ( #48 )
    COP [39]
    BRA code_00B768
}

code_00B76F {
    LDA $7F000E, X
    ORA #$0800
    STA $7F000E, X

  code_00B77A:
    COP [37] ( #72 )
    COP [39]
    BRA code_00B77A
}