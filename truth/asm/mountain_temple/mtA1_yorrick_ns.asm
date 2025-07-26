
---------------------------------------------

h_mtA1_yorrick_1 [
  h_actor < #02, #00, #00 >   ;00
]

---------------------------------------------

e_mtA1_yorrick_1 {
    COP [B7] ( #02 )
    LDA #$0011
    TSB $12

  code_0B9D1A:
    COP [27] ( #09 )

  code_0B9D1D:
    LDA $10
    BIT #$4000
    BNE code_0B9D1A
    COP [2B] ( #$0000, &code_0B9DEC, &code_0B9D2E, &code_0B9D2E )
}

code_0B9D2E {
    COP [44] ( #FF, #00, #01, #08, &code_0B9D44 )

  code_0B9D36:
    COP [80] ( #02 )
    COP [89]
    COP [85] ( #02, #02, #01 )
    COP [8A]
    BRA code_0B9D53
}

code_0B9D44 {
    COP [C8] ( &code_0B9D86 )
    COP [84] ( #02, #02 )
    COP [8A]
    BRA code_0B9D36
}

---------------------------------------------

func_0B9D50 {
    COP [27] ( #0A )
}

code_0B9D53 {
    LDA $10
    BIT #$4000
    BNE func_0B9D50
    COP [2B] ( #$0000, &code_0B9E22, &code_0B9D64, &code_0B9D64 )
}

code_0B9D64 {
    COP [44] ( #FF, #00, #01, #08, &code_0B9D7A )

  code_0B9D6C:
    COP [80] ( #02 )
    COP [89]
    COP [85] ( #02, #02, #02 )
    COP [8A]
    BRA code_0B9D1D
}

code_0B9D7A {
    COP [C8] ( &code_0B9D86 )
    COP [84] ( #02, #02 )
    COP [8A]
    BRA code_0B9D6C
}

code_0B9D86 {
    COP [84] ( #1A, #06 )
    COP [8A]
    COP [9E] ( @code_0B9DA9, #$FFFD, #$FFF8, #$0202 )
    COP [9E] ( @code_0B9DA9, #$0004, #$FFF8, #$0202 )
    COP [80] ( #02 )
    COP [89]
    COP [C5]
}

code_0B9DA9 {
    COP [07] ( #1D )
    COP [B7] ( #02 )
    COP [5B] ( #$0010 )
    COP [82] ( #20, #03 )
    COP [89]
    LDA #$0002
    TRB $10

  code_0B9DBE:
    COP [82] ( #20, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0B9DBE
    COP [E0]
}

---------------------------------------------

h_mtA1_yorrick_2 [
  h_actor < #03, #00, #00 >   ;00
]

---------------------------------------------

e_mtA1_yorrick_2 {
    COP [B7] ( #02 )
    LDA #$0011
    TSB $12

  code_0B9DD8:
    COP [27] ( #09 )

  code_0B9DDB:
    LDA $10
    BIT #$4000
    BNE code_0B9DD8
    COP [2B] ( #$0000, &code_0B9DEC, &code_0B9DEC, &code_0B9D2E )
}

code_0B9DEC {
    COP [44] ( #FF, #F8, #01, #00, &code_0B9E02 )

  code_0B9DF4:
    COP [80] ( #03 )
    COP [89]
    COP [85] ( #03, #02, #01 )
    COP [8A]
    BRA code_0B9E11
}

code_0B9E02 {
    COP [C8] ( &code_0B9E44 )
    COP [84] ( #03, #02 )
    COP [8A]
    BRA code_0B9DF4
}

---------------------------------------------

func_0B9E0E {
    COP [27] ( #0A )
}

code_0B9E11 {
    LDA $10
    BIT #$4000
    BNE func_0B9E0E
    COP [2B] ( #$0000, &code_0B9E22, &code_0B9E22, &code_0B9D64 )
}

code_0B9E22 {
    COP [44] ( #FF, #F8, #01, #00, &code_0B9E38 )

  code_0B9E2A:
    COP [80] ( #03 )
    COP [89]
    COP [85] ( #03, #02, #02 )
    COP [8A]
    BRA code_0B9DDB
}

code_0B9E38 {
    COP [C8] ( &code_0B9E44 )
    COP [84] ( #03, #02 )
    COP [8A]
    BRA code_0B9E2A
}

code_0B9E44 {
    COP [84] ( #1B, #06 )
    COP [8A]
    COP [9E] ( @code_0B9E67, #$FFFD, #$FFF8, #$0200 )
    COP [9E] ( @code_0B9E67, #$0004, #$FFF8, #$0200 )
    COP [80] ( #03 )
    COP [89]
    COP [C5]
}

code_0B9E67 {
    COP [07] ( #1D )
    COP [B7] ( #02 )
    COP [5B] ( #$0010 )
    COP [82] ( #20, #04 )
    COP [89]
    LDA #$0002
    TRB $10

  code_0B9E7C:
    COP [82] ( #20, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0B9E7C
    COP [E0]
}