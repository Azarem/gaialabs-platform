
---------------------------------------------

h_ir1D_four_way [
  h_actor < #09, #00, #00 >   ;00
]

---------------------------------------------

e_ir1D_four_way {
    COP [BC] ( #08, #00 )
    LDA #$0011
    TSB $12
    COP [5B] ( #$0008 )
    COP [0B]

  code_0A8C82:
    COP [27] ( #10 )

  code_0A8C85:
    LDA $10
    BIT #$4000
    BNE code_0A8C82
    COP [84] ( #28, #08 )
    COP [8A]
    COP [2D]
    AND #$0001
    BEQ code_0A8CD2
    COP [80] ( #29 )
    COP [89]
    COP [07] ( #1E )
    COP [A5] ( @code_0A8D61, #F2, #F0, #$0200 )
    COP [A5] ( @code_0A8D74, #0F, #F0, #$0200 )
    COP [A5] ( @code_0A8D87, #F2, #04, #$0200 )
    COP [A5] ( @code_0A8D9A, #0F, #04, #$0200 )
    COP [80] ( #2A )
    COP [89]
    COP [84] ( #27, #02 )
    COP [8A]
    BRA code_0A8C85
}

code_0A8CD2 {
    COP [80] ( #0A )
    COP [89]
    COP [07] ( #1E )
    COP [A5] ( @code_0A8D0C, #00, #E0, #$0200 )
    COP [A5] ( @code_0A8D2B, #00, #00, #$0202 )
    COP [A5] ( @code_0A8D3D, #E8, #F5, #$0200 )
    COP [A5] ( @code_0A8D4F, #18, #F5, #$0200 )
    COP [80] ( #0B )
    COP [89]
    COP [84] ( #09, #02 )
    COP [8A]
    JMP $&code_0A8C85
}

code_0A8D0C {
    JSR $&sub_0A8DAD
    COP [B9]
    COP [82] ( #0D, #06 )
    COP [89]
    LDA #$0002
    TSB $10

  code_0A8D1C:
    COP [82] ( #0D, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D1C
    COP [E0]
}

code_0A8D2B {
    JSR $&sub_0A8DAD

  code_0A8D2E:
    COP [82] ( #0D, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D2E
    COP [E0]
}

code_0A8D3D {
    JSR $&sub_0A8DAD

  code_0A8D40:
    COP [81] ( #0C, #06 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D40
    COP [E0]
}

code_0A8D4F {
    JSR $&sub_0A8DAD

  code_0A8D52:
    COP [81] ( #8C, #05 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D52
    COP [E0]
}

code_0A8D61 {
    JSR $&sub_0A8DAD
    COP [83] ( #2C, #04, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D61
    COP [E0]
}

code_0A8D74 {
    JSR $&sub_0A8DAD
    COP [83] ( #AC, #03, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D74
    COP [E0]
}

code_0A8D87 {
    JSR $&sub_0A8DAD
    COP [83] ( #2B, #04, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D87
    COP [E0]
}

code_0A8D9A {
    JSR $&sub_0A8DAD
    COP [83] ( #AB, #03, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0A8D9A
    COP [E0]
}

---------------------------------------------

sub_0A8DAD {
    COP [5B] ( #$0010 )
    LDA #$0080
    TSB $12
    RTS 
}