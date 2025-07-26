
---------------------------------------------

h_ir1B_slugger [
  h_actor < #11, #00, #00 >   ;00
]

---------------------------------------------

e_ir1B_slugger {
    COP [27] ( #10 )

  code_0A8DBD:
    COP [C2]

  code_0A8DBF:
    COP [2D]
    CMP #$0000
    BNE code_0A8DC9
    JMP $&code_0A8E78
}

code_0A8DC9 {
    CMP #$0002
    BNE code_0A8DD1
    JMP $&code_0A8E59
}

code_0A8DD1 {
    CMP #$0004
    BNE code_0A8DD9
    JMP $&code_0A8E97
}

code_0A8DD9 {
    CMP #$0006
    BNE code_0A8DE1
    JMP $&code_0A8E3A
}

code_0A8DE1 {
    COP [23]
    AND #$0003
    DEC 
    BMI code_0A8E27
    BEQ code_0A8E14
    DEC 
    BEQ code_0A8DF0
    BRA code_0A8E02
}

code_0A8DF0 {
    COP [CA] ( #02 )
    COP [17] ( &code_0A8DBD )
    COP [85] ( #13, #02, #14 )
    COP [8A]
    COP [CB]
    BRA code_0A8DBF
}

code_0A8E02 {
    COP [CA] ( #02 )
    COP [18] ( &code_0A8DBD )
    COP [85] ( #93, #02, #13 )
    COP [8A]
    COP [CB]
    BRA code_0A8DBF
}

code_0A8E14 {
    COP [CA] ( #02 )
    COP [15] ( &code_0A8DBD )
    COP [86] ( #12, #02, #14 )
    COP [8A]
    COP [CB]
    JMP $&code_0A8DBF
}

code_0A8E27 {
    COP [CA] ( #02 )
    COP [16] ( &code_0A8DBD )
    COP [86] ( #11, #02, #13 )
    COP [8A]
    COP [CB]
    JMP $&code_0A8DBF
}

code_0A8E3A {
    COP [17] ( &code_0A8DE1 )
    COP [84] ( #16, #04 )
    COP [8A]

  code_0A8E44:
    COP [17] ( &code_0A8E50 )
    COP [81] ( #16, #04 )
    COP [89]
    BRA code_0A8E44
}

code_0A8E50 {
    COP [84] ( #10, #10 )
    COP [8A]
    JMP $&code_0A8DBD
}

code_0A8E59 {
    COP [18] ( &code_0A8DE1 )
    COP [84] ( #96, #04 )
    COP [8A]

  code_0A8E63:
    COP [18] ( &code_0A8E6F )
    COP [81] ( #96, #03 )
    COP [89]
    BRA code_0A8E63
}

code_0A8E6F {
    COP [84] ( #90, #10 )
    COP [8A]
    JMP $&code_0A8DBD
}

code_0A8E78 {
    COP [15] ( &code_0A8DE1 )
    COP [84] ( #15, #04 )
    COP [8A]

  code_0A8E82:
    COP [15] ( &code_0A8E8E )
    COP [82] ( #15, #04 )
    COP [89]
    BRA code_0A8E82
}

code_0A8E8E {
    COP [84] ( #0F, #10 )
    COP [8A]
    JMP $&code_0A8DBD
}

code_0A8E97 {
    COP [16] ( &code_0A8DE1 )
    COP [84] ( #14, #04 )
    COP [8A]

  code_0A8EA1:
    COP [16] ( &code_0A8EAD )
    COP [82] ( #14, #03 )
    COP [89]
    BRA code_0A8EA1
}

code_0A8EAD {
    COP [84] ( #0E, #10 )
    COP [8A]
    JMP $&code_0A8DBD
}