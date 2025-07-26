
?INCLUDE 'stats_01ABF0'

---------------------------------------------

h_ec0E_spiney [
  h_actor < #3C, #10, #00 >   ;00
]

---------------------------------------------

e_ec0E_spiney {
    LDA #$&stats_01ABF0+20
    STA $7F0020, X
    LDA $0E
    PHA 
    AND #$3FFF
    STA $0E
    PLA 
    AND #$C000
    CMP #$4000
    BEQ code_0A8B09
    CMP #$8000
    BEQ code_0A8AF7
    CMP #$C000
    BEQ code_0A8AE5

  code_0A8AD3:
    COP [17] ( &code_0A8AD9 )
    BRA code_0A8AEF
}

code_0A8AD9 {
    COP [15] ( &code_0A8B0F )

  code_0A8ADD:
    COP [82] ( #3E, #02 )
    COP [89]
    BRA code_0A8AD3
}

code_0A8AE5 {
    COP [16] ( &code_0A8AEB )
    BRA code_0A8B01
}

code_0A8AEB {
    COP [17] ( &code_0A8AD9 )
}

code_0A8AEF {
    COP [81] ( #3E, #02 )
    COP [89]
    BRA code_0A8AE5
}

code_0A8AF7 {
    COP [18] ( &code_0A8AFD )
    BRA code_0A8B13
}

code_0A8AFD {
    COP [16] ( &code_0A8AEB )
}

code_0A8B01 {
    COP [82] ( #3E, #01 )
    COP [89]
    BRA code_0A8AF7
}

code_0A8B09 {
    COP [15] ( &code_0A8B0F )
    BRA code_0A8ADD
}

code_0A8B0F {
    COP [18] ( &code_0A8AFD )
}

code_0A8B13 {
    COP [81] ( #3E, #01 )
    COP [89]
    BRA code_0A8B09
}