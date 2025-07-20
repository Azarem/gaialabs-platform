
!map_bounds_x                   0692
!map_bounds_y                   0696

---------------------------------------------

h_ec0C_bat [
  h_actor < #1F, #00, #00 >   ;00
]

---------------------------------------------

e_ec0C_bat {
    COP [27] ( #0C )
    COP [B6] ( #30 )

  code_0A875E:
    COP [27] ( #01 )
    COP [C2]

  code_0A8763:
    COP [23]
    AND #$0003
    DEC 
    BMI code_0A8772
    BEQ code_0A8786
    DEC 
    BEQ code_0A879A
    BRA code_0A87AE
}

code_0A8772 {
    COP [16] ( &code_0A875E )
    LDA $16
    CMP $map_bounds_y
    BCS code_0A875E
    COP [83] ( #1F, #00, #11 )
    COP [89]
    BRA code_0A8763
}

code_0A8786 {
    COP [15] ( &code_0A875E )
    LDA $16
    CMP #$0010
    BCC code_0A875E
    COP [83] ( #20, #00, #12 )
    COP [89]
    BRA code_0A8763
}

code_0A879A {
    COP [17] ( &code_0A875E )
    LDA $14
    CMP #$0010
    BCC code_0A875E
    COP [83] ( #21, #12, #00 )
    COP [89]
    BRA code_0A8763
}

code_0A87AE {
    COP [18] ( &code_0A875E )
    LDA $14
    CMP $map_bounds_x
    BCS code_0A875E
    COP [83] ( #A1, #11, #00 )
    COP [89]
    JMP $&code_0A8763
}