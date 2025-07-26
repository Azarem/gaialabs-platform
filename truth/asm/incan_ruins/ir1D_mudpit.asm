
---------------------------------------------

h_ir1D_mudpit [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_ir1D_mudpit {
    COP [27] ( #10 )

  code_0A8B21:
    COP [C2]

  code_0A8B23:
    COP [2C] ( &code_0A8B29, &code_0A8B33 )
}

code_0A8B29 {
    COP [2A] ( #$0008, &code_0A8B56, &code_0A8B33, &code_0A8B71 )
}

code_0A8B33 {
    COP [2B] ( #$0008, &code_0A8B8C, &code_0A8B3D, &code_0A8BA8 )
}

code_0A8B3D {
    RTL 
}

---------------------------------------------

func_0A8B3E {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A8B4E )
}

code_list_0A8B4E [
  &code_0A8B56   ;00
  &code_0A8B71   ;01
  &code_0A8B8C   ;02
  &code_0A8BA8   ;03
]

code_0A8B56 {
    COP [21] ( #03, &code_0A8BC4 )
    COP [17] ( &func_0A8B3E )
    COP [81] ( #07, #12 )
    COP [89]
    COP [17] ( &func_0A8B3E )
    COP [81] ( #08, #12 )
    COP [89]
    BRA code_0A8B23
}

code_0A8B71 {
    COP [21] ( #03, &code_0A8BEF )
    COP [18] ( &func_0A8B3E )
    COP [81] ( #87, #11 )
    COP [89]
    COP [18] ( &func_0A8B3E )
    COP [81] ( #88, #11 )
    COP [89]
    BRA code_0A8B23
}

code_0A8B8C {
    COP [21] ( #03, &code_0A8C1A )
    COP [15] ( &func_0A8B3E )
    COP [82] ( #05, #12 )
    COP [89]
    COP [15] ( &func_0A8B3E )
    COP [82] ( #06, #12 )
    COP [89]
    JMP $&code_0A8B23
}

code_0A8BA8 {
    COP [21] ( #03, &code_0A8C45 )
    COP [16] ( &func_0A8B3E )
    COP [82] ( #03, #11 )
    COP [89]
    COP [16] ( &func_0A8B3E )
    COP [82] ( #04, #11 )
    COP [89]
    JMP $&code_0A8B23
}

code_0A8BC4 {
    LDA #$0008
    TSB $10
    COP [81] ( #07, #11 )
    COP [89]
    COP [81] ( #08, #11 )
    COP [89]
    COP [84] ( #02, #10 )
    COP [8A]
    COP [81] ( #25, #04 )
    COP [89]
    COP [84] ( #02, #10 )
    COP [8A]
    LDA #$0008
    TRB $10
    JMP $&code_0A8B21
}

code_0A8BEF {
    LDA #$0008
    TSB $10
    COP [81] ( #87, #12 )
    COP [89]
    COP [81] ( #88, #12 )
    COP [89]
    COP [84] ( #82, #10 )
    COP [8A]
    COP [81] ( #A5, #03 )
    COP [89]
    COP [84] ( #82, #10 )
    COP [8A]
    LDA #$0008
    TRB $10
    JMP $&code_0A8B21
}

code_0A8C1A {
    LDA #$0008
    TSB $10
    COP [82] ( #05, #11 )
    COP [89]
    COP [82] ( #06, #11 )
    COP [89]
    COP [84] ( #01, #10 )
    COP [8A]
    COP [82] ( #24, #04 )
    COP [89]
    COP [84] ( #01, #10 )
    COP [8A]
    LDA #$0008
    TRB $10
    JMP $&code_0A8B21
}

code_0A8C45 {
    LDA #$0008
    TSB $10
    COP [82] ( #03, #12 )
    COP [89]
    COP [82] ( #04, #12 )
    COP [89]
    COP [84] ( #00, #10 )
    COP [8A]
    COP [82] ( #23, #03 )
    COP [89]
    COP [84] ( #00, #10 )
    COP [8A]
    LDA #$0008
    TRB $10
    JMP $&code_0A8B21
}