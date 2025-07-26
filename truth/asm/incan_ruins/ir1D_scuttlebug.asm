
---------------------------------------------

h_ir1D_scuttlebug [
  h_actor < #11, #00, #00 >   ;00
]

---------------------------------------------

e_ir1D_scuttlebug {
    COP [B7] ( #0A )
    COP [27] ( #10 )

  code_0A8EBF:
    COP [C2]

  code_0A8EC1:
    COP [2D]
    CMP #$0000
    BNE code_0A8ECB
    JMP $&code_0A8FB0
}

code_0A8ECB {
    CMP #$0002
    BNE code_0A8ED3
    JMP $&code_0A8F74
}

code_0A8ED3 {
    CMP #$0004
    BNE code_0A8EDB
    JMP $&code_0A8FEB
}

code_0A8EDB {
    CMP #$0006
    BNE code_0A8EE3
    JMP $&code_0A8F38
}

code_0A8EE3 {
    COP [23]
    AND #$0003
    DEC 
    BMI code_0A8F26
    BEQ code_0A8F14
    DEC 
    BEQ code_0A8EF2
    BRA code_0A8F03
}

code_0A8EF2 {
    COP [CA] ( #02 )
    COP [17] ( &code_0A8EBF )
    COP [81] ( #13, #12 )
    COP [89]
    COP [CB]
    BRA code_0A8EC1
}

code_0A8F03 {
    COP [CA] ( #02 )
    COP [18] ( &code_0A8EBF )
    COP [81] ( #93, #11 )
    COP [89]
    COP [CB]
    BRA code_0A8EC1
}

code_0A8F14 {
    COP [CA] ( #02 )
    COP [15] ( &code_0A8EBF )
    COP [82] ( #12, #12 )
    COP [89]
    COP [CB]
    JMP $&code_0A8EC1
}

code_0A8F26 {
    COP [CA] ( #02 )
    COP [16] ( &code_0A8EBF )
    COP [82] ( #11, #11 )
    COP [89]
    COP [CB]
    JMP $&code_0A8EC1
}

code_0A8F38 {
    COP [17] ( &code_0A8EE3 )
    COP [84] ( #16, #04 )
    COP [8A]

  code_0A8F42:
    COP [17] ( &code_0A8F53 )
    COP [21] ( #02, &code_0A8F5C )
    COP [81] ( #16, #04 )
    COP [89]
    BRA code_0A8F42
}

code_0A8F53 {
    COP [84] ( #10, #10 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8F5C {
    COP [14] ( #FE, #00, &code_0A8F53 )
    BRA code_0A8F64
}

code_0A8F64 {
    COP [83] ( #22, #04, #38 )
    COP [89]
    COP [84] ( #10, #20 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8F74 {
    COP [18] ( &code_0A8EE3 )
    COP [84] ( #96, #04 )
    COP [8A]

  code_0A8F7E:
    COP [18] ( &code_0A8F8F )
    COP [21] ( #02, &code_0A8F98 )
    COP [81] ( #96, #03 )
    COP [89]
    BRA code_0A8F7E
}

code_0A8F8F {
    COP [84] ( #90, #10 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8F98 {
    COP [14] ( #02, #00, &code_0A8F8F )
    BRA code_0A8FA0
}

code_0A8FA0 {
    COP [83] ( #A2, #03, #38 )
    COP [89]
    COP [84] ( #90, #20 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8FB0 {
    COP [15] ( &code_0A8EE3 )
    COP [84] ( #15, #04 )
    COP [8A]

  code_0A8FBA:
    COP [15] ( &code_0A8FCB )
    COP [21] ( #02, &code_0A8FD4 )
    COP [82] ( #15, #04 )
    COP [89]
    BRA code_0A8FBA
}

code_0A8FCB {
    COP [84] ( #0F, #10 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8FD4 {
    COP [14] ( #00, #FE, &code_0A8FCB )
    BRA code_0A8FDC
}

code_0A8FDC {
    COP [82] ( #21, #39 )
    COP [89]
    COP [84] ( #0F, #20 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A8FEB {
    COP [16] ( &code_0A8EE3 )
    COP [84] ( #14, #04 )
    COP [8A]

  code_0A8FF5:
    COP [16] ( &code_0A9006 )
    COP [21] ( #02, &code_0A900F )
    COP [82] ( #14, #03 )
    COP [89]
    BRA code_0A8FF5
}

code_0A9006 {
    COP [84] ( #0E, #10 )
    COP [8A]
    JMP $&code_0A8EBF
}

code_0A900F {
    COP [14] ( #00, #02, &code_0A9006 )
    BRA code_0A9017
}

code_0A9017 {
    COP [82] ( #20, #3A )
    COP [89]
    COP [84] ( #0E, #20 )
    COP [8A]
    JMP $&code_0A8EBF
}