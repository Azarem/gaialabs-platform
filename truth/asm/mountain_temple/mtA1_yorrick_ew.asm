
---------------------------------------------

h_mtA1_yorrick_3 [
  h_actor < #04, #00, #00 >   ;00
]

---------------------------------------------

e_mtA1_yorrick_3 {
    COP [B7] ( #02 )
    LDA #$0011
    TSB $12

  code_0B9E96:
    COP [27] ( #09 )

  code_0B9E99:
    LDA $10
    BIT #$4000
    BNE code_0B9E96
    COP [2A] ( #$0000, &code_0B9EAA, &code_0B9EAA, &code_0B9F74 )
}

code_0B9EAA {
    COP [80] ( #04 )
    COP [89]
    COP [44] ( #F8, #FF, #00, #01, &code_0B9EC5 )

  code_0B9EB7:
    COP [80] ( #04 )
    COP [89]
    COP [86] ( #04, #02, #01 )
    COP [8A]
    BRA code_0B9ED4
}

code_0B9EC5 {
    COP [C8] ( &code_0B9F0C )
    COP [84] ( #04, #02 )
    COP [8A]
    BRA code_0B9EB7
}

---------------------------------------------

func_0B9ED1 {
    COP [27] ( #0A )
}

code_0B9ED4 {
    LDA $10
    BIT #$4000
    BNE func_0B9ED1
    COP [2A] ( #$0000, &code_0B9EE5, &code_0B9EE5, &code_0B9FAF )
}

code_0B9EE5 {
    COP [80] ( #04 )
    COP [89]
    COP [44] ( #F8, #FF, #00, #01, &code_0B9F00 )

  code_0B9EF2:
    COP [80] ( #04 )
    COP [89]
    COP [86] ( #04, #02, #02 )
    COP [8A]
    BRA code_0B9E99
}

code_0B9F00 {
    COP [C8] ( &code_0B9F0C )
    COP [84] ( #04, #02 )
    COP [8A]
    BRA code_0B9EF2
}

code_0B9F0C {
    COP [84] ( #1C, #06 )
    COP [8A]
    COP [9E] ( @code_0B9F2F, #$FFFA, #$FFF8, #$0202 )
    COP [9E] ( @code_0B9F2F, #$FFFA, #$FFF6, #$0202 )
    COP [80] ( #04 )
    COP [89]
    COP [C5]
}

code_0B9F2F {
    COP [07] ( #1D )
    COP [B7] ( #02 )
    COP [5B] ( #$0010 )
    COP [81] ( #20, #04 )
    COP [89]
    LDA #$0002
    TRB $10

  code_0B9F44:
    COP [81] ( #20, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0B9F44
    COP [E0]
}

---------------------------------------------

h_mtA1_yorrick_4 [
  h_actor < #04, #00, #00 >   ;00
]

---------------------------------------------

e_mtA1_yorrick_4 {
    COP [BB]
    COP [B7] ( #02 )
    LDA #$0011
    TSB $12

  code_0B9F60:
    COP [27] ( #09 )

  code_0B9F63:
    LDA $10
    BIT #$4000
    BNE code_0B9F60
    COP [2A] ( #$0000, &code_0B9EAA, &code_0B9F74, &code_0B9F74 )
}

code_0B9F74 {
    COP [80] ( #84 )
    COP [89]
    COP [44] ( #00, #FF, #08, #01, &code_0B9F8F )

  code_0B9F81:
    COP [80] ( #84 )
    COP [89]
    COP [86] ( #84, #02, #01 )
    COP [8A]
    BRA code_0B9F9E
}

code_0B9F8F {
    COP [C8] ( &code_0B9FD6 )
    COP [84] ( #84, #02 )
    COP [8A]
    BRA code_0B9F81
}

---------------------------------------------

func_0B9F9B {
    COP [27] ( #0A )
}

code_0B9F9E {
    LDA $10
    BIT #$4000
    BNE func_0B9F9B
    COP [2A] ( #$0000, &code_0B9EE5, &code_0B9FAF, &code_0B9FAF )
}

code_0B9FAF {
    COP [80] ( #84 )
    COP [89]
    COP [44] ( #00, #FF, #08, #01, &code_0B9FCA )

  code_0B9FBC:
    COP [80] ( #84 )
    COP [89]
    COP [86] ( #84, #02, #02 )
    COP [8A]
    BRA code_0B9F63
}

code_0B9FCA {
    COP [C8] ( &code_0B9FD6 )
    COP [84] ( #84, #02 )
    COP [8A]
    BRA code_0B9FBC
}

code_0B9FD6 {
    COP [84] ( #9C, #06 )
    COP [8A]
    COP [9E] ( @code_0B9FF9, #$0006, #$FFF8, #$0202 )
    COP [9E] ( @code_0B9FF9, #$0006, #$FFF6, #$0202 )
    COP [80] ( #84 )
    COP [89]
    COP [C5]
}

code_0B9FF9 {
    COP [07] ( #1D )
    COP [B7] ( #02 )
    COP [5B] ( #$0010 )
    COP [81] ( #20, #03 )
    COP [89]
    LDA #$0002
    TRB $10

  code_0BA00E:
    COP [81] ( #20, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BA00E
    COP [E0]
}