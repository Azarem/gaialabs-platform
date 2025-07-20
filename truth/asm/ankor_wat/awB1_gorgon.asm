?INCLUDE 'func_00CFEF'
?INCLUDE 'table_0EE000'


---------------------------------------------

h_awB1_gorgon1 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_gorgon1 {
    COP [27] ( #0F )
    COP [C1]
    COP [21] ( #04, &code_0BB939 )
    RTL 
}

---------------------------------------------

h_awB1_gorgon2 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_awB1_gorgon2 {
    COP [21] ( #05, &code_0BB82E )
    RTL 
}

code_0BB82E {
    COP [9C] ( @code_0BBA62, #$0300 )
    COP [9C] ( @code_0BBA69, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBA80, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBA97, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBAAE, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBAC5, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBADC, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBAF3, #$0300 )
    COP [DA] ( #0F )
    COP [9C] ( @code_0BBB0A, #$0300 )
    LDA #$FFFF
    STA $26
    COP [C1]
    LDA $26
    BPL code_0BB88E
    RTL 
}

code_0BB88E {
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    LDA #$2000
    TRB $10
    BRA code_0BB8AA
}

---------------------------------------------

func_0BB8A7 {
    COP [27] ( #08 )
}

code_0BB8AA {
    LDA $10
    BIT #$4000
    BNE func_0BB8A7
    COP [21] ( #04, &code_0BB994 )
    COP [2C] ( &code_0BB8BC, &code_0BB8F2 )
}

code_0BB8BC {
    COP [2A] ( #$0000, &code_0BB8C6, &code_0BB8C6, &code_0BB8DC )
}

code_0BB8C6 {
    COP [17] ( &code_0BB97C )
    COP [81] ( #05, #12 )
    COP [89]
    COP [17] ( &code_0BB97C )
    COP [81] ( #2A, #12 )
    COP [89]
    BRA code_0BB8AA
}

code_0BB8DC {
    COP [18] ( &code_0BB97C )
    COP [81] ( #85, #11 )
    COP [89]
    COP [18] ( &code_0BB97C )
    COP [81] ( #AA, #11 )
    COP [89]
    BRA code_0BB8AA
}

code_0BB8F2 {
    COP [2B] ( #$0000, &code_0BB8FC, &code_0BB8FC, &code_0BB912 )
}

code_0BB8FC {
    COP [15] ( &code_0BB97C )
    COP [82] ( #04, #12 )
    COP [89]
    COP [15] ( &code_0BB97C )
    COP [82] ( #29, #12 )
    COP [89]
    BRA code_0BB8AA
}

code_0BB912 {
    COP [16] ( &code_0BB928 )
    COP [82] ( #03, #11 )
    COP [89]
    COP [16] ( &code_0BB928 )
    COP [82] ( #28, #11 )
    COP [89]
    BRA code_0BB8AA
}

code_0BB928 {
    COP [2B] ( #$0010, &code_0BB97C, &code_0BB97C, &code_0BB932 )
}

code_0BB932 {
    COP [1C] ( #08, &code_0BB939 )
    BRA code_0BB97C
}

code_0BB939 {
    LDA #$0011
    TSB $12
    COP [80] ( #2C )
    COP [89]

  code_0BB943:
    COP [82] ( #2D, #07 )
    COP [89]
    COP [1A] ( #00, &code_0BB950 )
    BRA code_0BB943
}

code_0BB950 {
    LDA #$0011
    TRB $12
    COP [07] ( #15 )
    COP [A2] ( @code_0BB9BE, #$2000 )
    LDA #$0010
    TSB $10
    COP [A5] ( @code_0BB9DF, #00, #00, #$2000 )
    COP [80] ( #2E )
    COP [89]
    LDA #$0010
    TRB $10
    COP [A9]
    COP [B7] ( #00 )
}

code_0BB97C {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BB98C )
}

code_list_0BB98C [
  &code_0BB8C6   ;00
  &code_0BB8DC   ;01
  &code_0BB912   ;02
  &code_0BB8FC   ;03
]

code_0BB994 {
    COP [C2]
    LDA #$0010
    TSB $10
    COP [A2] ( @code_0BB9BE, #$2000 )
    COP [80] ( #07 )
    COP [89]
    COP [84] ( #08, #04 )
    COP [8A]
    COP [80] ( #21 )
    COP [89]
    COP [A9]
    LDA #$0010
    TRB $10
    COP [B7] ( #00 )
    BRA code_0BB97C
}

code_0BB9BE {
    LDY $24
    LDA $000E, Y
    AND #$F1FF
    STA $000E, Y
    COP [DA] ( #01 )
    LDY $24
    LDA $000E, Y
    AND #$F1FF
    ORA #$0200
    STA $000E, Y
    COP [DA] ( #01 )
    BRA code_0BB9BE
}

code_0BB9DF {
    COP [CA] ( #0F )
    COP [9C] ( @code_0BB9FC, #$2300 )
    COP [A5] ( @func_00CFEF, #00, #00, #$2000 )
    CLC 
    ADC #$0020
    STA $08
    COP [CB]
    COP [E0]
}

code_0BB9FC {
    COP [23]
    CLC 
    ADC $068A
    STA $14
    STA $7F0018, X
    COP [23]
    CLC 
    ADC $068E
    STA $16
    STA $7F001A, X
    COP [13] ( &code_0BBA54 )
    COP [9C] ( @code_0BBA56, #$0300 )
    COP [DA] ( #3B )
    LDA #$2000
    TRB $10
    LDA $068E
    SEC 
    SBC #$0020
    STA $16
    COP [52] ( #18, #04, #FF )
    COP [53]
    COP [07] ( #14 )
    COP [86] ( #18, #0B, #45 )
    COP [8A]
    COP [A9]
    LDA #$0100
    TRB $10
    COP [80] ( #19 )
    COP [89]
    COP [80] ( #30 )
    COP [89]
    COP [C2]
}

code_0BBA54 {
    COP [E0]
}

code_0BBA56 {
    COP [88] ( @table_0EE000 )

  code_0BBA5B:
    COP [80] ( #31 )
    COP [89]
    BRA code_0BBA5B
}

code_0BBA62 {
    COP [80] ( #12 )
    COP [89]
    BRA code_0BBA62
}

code_0BBA69 {
    JSR $&sub_0BBB46
    COP [52] ( #09, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #09, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBA80 {
    JSR $&sub_0BBB46
    COP [52] ( #0A, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0A, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBA97 {
    JSR $&sub_0BBB46
    COP [52] ( #0B, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0B, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBAAE {
    JSR $&sub_0BBB46
    COP [52] ( #0C, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0C, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBAC5 {
    JSR $&sub_0BBB46
    COP [52] ( #0D, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0D, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBADC {
    JSR $&sub_0BBB46
    COP [52] ( #0E, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0E, #10, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBAF3 {
    JSR $&sub_0BBB46
    COP [52] ( #0F, #06, #FF )
    COP [53]
    COP [07] ( #15 )
    COP [86] ( #0F, #11, #4A )
    COP [8A]
    COP [C1]
    RTL 
}

code_0BBB0A {
    JSR $&sub_0BBB46
    LDA $24
    STA $26
    LDA $7F001A, X
    CLC 
    ADC #$0010
    STA $7F001A, X
    COP [52] ( #10, #08, #FF )
    COP [53]
    LDA $14
    STA $7F0018, X
    LDA $16
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [52] ( #10, #04, #FF )
    COP [53]
    LDY $26
    LDA #$0000
    STA $0026, Y
    COP [C1]
    RTL 
}

---------------------------------------------

sub_0BBB46 {
    LDA $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    LDA $068E
    SEC 
    SBC #$0010
    STA $16
    RTS 
}