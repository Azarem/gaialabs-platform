

---------------------------------------------

h_awB0_zip_fly [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_awB0_zip_fly {
    COP [B6] ( #30 )
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    STZ $24

  code_0BAF63:
    COP [68] ( &code_0BAF71 )
    COP [27] ( #0F )

  code_0BAF6A:
    LDA $10
    BIT #$4000
    BNE code_0BAF63
}

code_0BAF71 {
    COP [C6] ( &code_0BAF6A )
    LDA $24
    INC 
    STA $24
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0BAF88 )
}

code_list_0BAF88 [
  &code_0BAF98   ;00
  &code_0BAFBF   ;01
  &code_0BB00D   ;02
  &code_0BAFE6   ;03
  &code_0BB034   ;04
  &code_0BB06B   ;05
  &code_0BB0A1   ;06
  &code_0BB0DA   ;07
]

code_0BAF98 {
    LDA $7F100C, X
    SEC 
    SBC #$0040
    CMP $14
    BCS code_0BAFBF
    COP [85] ( #02, #04, #08 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BAFBD
    STZ $24
    COP [84] ( #07, #0A )
    COP [8A]
    JMP $&code_0BB113
}

code_0BAFBD {
    COP [C5]
}

code_0BAFBF {
    LDA $7F100C, X
    CLC 
    ADC #$0040
    CMP $14
    BCC code_0BAF98
    COP [85] ( #82, #04, #07 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BAFE4
    STZ $24
    COP [84] ( #07, #0A )
    COP [8A]
    JMP $&code_0BB113
}

code_0BAFE4 {
    COP [C5]
}

code_0BAFE6 {
    LDA $7F100E, X
    SEC 
    SBC #$0040
    CMP $16
    BCS code_0BB00D
    COP [86] ( #01, #04, #08 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BAFE4
    STZ $24
    COP [84] ( #06, #0A )
    COP [8A]
    JMP $&code_0BB113
    COP [C5]
}

code_0BB00D {
    LDA $7F100E, X
    CLC 
    ADC #$0040
    CMP $16
    BCC code_0BAFE6
    COP [86] ( #00, #04, #07 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BB032
    STZ $24
    COP [84] ( #05, #0A )
    COP [8A]
    JMP $&code_0BB113
}

code_0BB032 {
    COP [C5]
}

code_0BB034 {
    LDA $7F100E, X
    CLC 
    ADC #$0040
    CMP $16
    BCC code_0BB00D
    LDA $7F100C, X
    SEC 
    SBC #$0040
    CMP $14
    BCC code_0BB04F
    JMP $&code_0BAFBF
}

code_0BB04F {
    COP [87] ( #03, #04, #06, #05 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BB069
    STZ $24
    COP [84] ( #08, #0A )
    COP [8A]
    JMP $&code_0BB113
}

code_0BB069 {
    COP [C5]
}

code_0BB06B {
    LDA $7F100E, X
    SEC 
    SBC #$0040
    CMP $16
    BCS code_0BB00D
    LDA $7F100C, X
    SEC 
    SBC #$0040
    CMP $14
    BCC code_0BB086
    JMP $&code_0BAFBF
}

code_0BB086 {
    COP [87] ( #04, #04, #06, #06 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BB09F
    STZ $24
    COP [84] ( #09, #0A )
    COP [8A]
    BRA code_0BB113
}

code_0BB09F {
    COP [C5]
}

code_0BB0A1 {
    LDA $7F100C, X
    CLC 
    ADC #$0040
    CMP $14
    BCS code_0BB0B0
    JMP $&code_0BAF98
}

code_0BB0B0 {
    LDA $7F100E, X
    CLC 
    ADC #$0040
    CMP $16
    BCS code_0BB0BF
    JMP $&code_0BAFE6
}

code_0BB0BF {
    COP [87] ( #83, #04, #05, #05 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BB0D8
    STZ $24
    COP [84] ( #88, #0A )
    COP [8A]
    BRA code_0BB113
}

code_0BB0D8 {
    COP [C5]
}

code_0BB0DA {
    LDA $7F100C, X
    CLC 
    ADC #$0040
    CMP $14
    BCS code_0BB0E9
    JMP $&code_0BAF98
}

code_0BB0E9 {
    LDA $7F100E, X
    SEC 
    SBC #$0040
    CMP $16
    BCC code_0BB0F8
    JMP $&code_0BB00D
}

code_0BB0F8 {
    COP [87] ( #84, #04, #05, #06 )
    COP [8A]
    LDA $24
    AND #$000F
    BNE code_0BB111
    STZ $24
    COP [84] ( #89, #0A )
    COP [8A]
    BRA code_0BB113
}

code_0BB111 {
    COP [C5]
}

code_0BB113 {
    COP [21] ( #04, &code_0BB11A )
    COP [C5]
}

code_0BB11A {
    COP [2D]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0BB128 )
}

code_list_0BB128 [
  &code_0BB138   ;00
  &code_0BB147   ;01
  &code_0BB157   ;02
  &code_0BB166   ;03
  &code_0BB176   ;04
  &code_0BB185   ;05
  &code_0BB195   ;06
  &code_0BB1A4   ;07
]

code_0BB138 {
    COP [84] ( #01, #08 )
    COP [8A]
    COP [86] ( #01, #06, #08 )
    COP [8A]
    COP [C5]
}

code_0BB147 {
    COP [84] ( #84, #08 )
    COP [8A]
    COP [87] ( #84, #06, #05, #06 )
    COP [8A]
    COP [C5]
}

code_0BB157 {
    COP [84] ( #82, #08 )
    COP [8A]
    COP [85] ( #82, #06, #07 )
    COP [8A]
    COP [C5]
}

code_0BB166 {
    COP [84] ( #83, #08 )
    COP [8A]
    COP [87] ( #83, #06, #05, #05 )
    COP [8A]
    COP [C5]
}

code_0BB176 {
    COP [84] ( #00, #08 )
    COP [8A]
    COP [86] ( #00, #06, #07 )
    COP [8A]
    COP [C5]
}

code_0BB185 {
    COP [84] ( #03, #08 )
    COP [8A]
    COP [87] ( #03, #06, #06, #05 )
    COP [8A]
    COP [C5]
}

code_0BB195 {
    COP [84] ( #02, #08 )
    COP [8A]
    COP [85] ( #02, #06, #08 )
    COP [8A]
    COP [C5]
}

code_0BB1A4 {
    COP [84] ( #04, #08 )
    COP [8A]
    COP [87] ( #04, #06, #06, #06 )
    COP [8A]
    COP [C5]
}