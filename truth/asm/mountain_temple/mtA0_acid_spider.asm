?INCLUDE 'func_0AA41C'


---------------------------------------------

h_mtA0_acid_spider1 [
  h_actor < #06, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_acid_spider1 {
    COP [58] ( &e_mtA0_acid_spider5 )

  code_0BA024:
    COP [80] ( #06 )
    COP [89]
    COP [DA] ( #4F )
    COP [44] ( #FF, #FA, #01, #00, &code_0BA035 )
    RTL 
}

code_0BA035 {
    COP [14] ( #00, #FC, &code_0BA024 )
    COP [80] ( #0F )
    COP [89]
    COP [9C] ( @code_0BA54C, #$0201 )
    BRA code_0BA024
}

---------------------------------------------

h_mtA0_acid_spider2 [
  h_actor < #05, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_acid_spider2 {
    COP [58] ( &e_mtA0_acid_spider5 )

  code_0BA050:
    COP [80] ( #05 )
    COP [89]
    COP [DA] ( #4F )
    COP [44] ( #FF, #00, #01, #05, &code_0BA061 )
    RTL 
}

code_0BA061 {
    COP [14] ( #00, #04, &code_0BA050 )
    COP [80] ( #0E )
    COP [89]
    COP [9C] ( @code_0BA55A, #$0201 )
    BRA code_0BA050
}

---------------------------------------------

h_mtA0_acid_spider3 [
  h_actor < #07, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_acid_spider3 {
    COP [58] ( &e_mtA0_acid_spider5 )

  code_0BA07C:
    COP [80] ( #07 )
    COP [89]
    COP [DA] ( #4F )
    COP [44] ( #FC, #FF, #00, #01, &code_0BA08D )
    RTL 
}

code_0BA08D {
    COP [14] ( #FC, #00, &code_0BA07C )
    COP [80] ( #10 )
    COP [89]
    COP [9C] ( @code_0BA502, #$0201 )
    BRA code_0BA07C
}

---------------------------------------------

h_mtA0_acid_spider4 [
  h_actor < #07, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_acid_spider4 {
    COP [BB]
    COP [58] ( &e_mtA0_acid_spider5 )

  code_0BA0AA:
    COP [80] ( #87 )
    COP [89]
    COP [DA] ( #4F )
    COP [44] ( #00, #FF, #04, #01, &code_0BA0BB )
    RTL 
}

code_0BA0BB {
    COP [14] ( #04, #00, &code_0BA0AA )
    COP [80] ( #90 )
    COP [89]
    COP [9C] ( @code_0BA527, #$0201 )
    BRA code_0BA0AA
}

---------------------------------------------

h_mtA0_acid_spider5 [
  h_actor < #05, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_acid_spider5 {
    COP [27] ( #0B )
    COP [2C] ( &code_0BA0DB, &code_0BA2EB )
}

code_0BA0DB {
    COP [2A] ( #$0000, &code_0BA0E5, &code_0BA0E5, &code_0BA1CE )
}

code_0BA0E5 {
    COP [17] ( &code_0BA12B )
    COP [81] ( #0A, #12 )
    COP [89]
    COP [44] ( #FB, #FE, #00, #01, &code_0BA0F9 )
    BRA e_mtA0_acid_spider5
}

code_0BA0F9 {
    COP [23]
    AND #$0001
    BEQ code_0BA103
    JMP $&code_0BA5BA
}

code_0BA103 {
    COP [80] ( #10 )
    COP [89]
    COP [9C] ( @code_0BA502, #$0201 )
    COP [2C] ( &code_0BA115, &code_0BA2EB )
}

code_0BA115 {
    COP [2A] ( #$0000, &code_0BA11F, &code_0BA11F, &code_0BA0DB )
}

code_0BA11F {
    COP [18] ( &e_mtA0_acid_spider5 )
    COP [81] ( #0A, #11 )
    COP [89]
    BRA e_mtA0_acid_spider5
}

code_0BA12B {
    JSR $&sub_0BA5A6
    COP [C2]
    LDA #$0011
    TSB $12
    COP [14] ( #FE, #00, &code_0BA140 )
    LDA #$FFE0
    BRA code_0BA17E
}

code_0BA140 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #FD, #00, &code_0BA150 )
    LDA #$FFD0
    BRA code_0BA17E
}

code_0BA150 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #FC, #00, &code_0BA160 )
    LDA #$FFC0
    BRA code_0BA17E
}

code_0BA160 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #FB, #00, &code_0BA170 )
    LDA #$FFB0
    BRA code_0BA17E
}

code_0BA170 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #FA, #00, &code_0BA5BA )
    LDA #$FFA0
}

code_0BA17E {
    STA $24
    COP [80] ( #8D )
    COP [89]
    COP [A2] ( @code_0BA2CA, #$0301 )
    LDA $24
    STA $0026, Y
    LDA #$0004

  code_0BA194:
    PHA 
    COP [A2] ( @code_0BA2BE, #$0301 )
    PLA 
    DEC 
    BPL code_0BA194
    LDA $14
    CLC 
    ADC $24
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [C1]
    LDA $24
    BEQ code_0BA1B6
    RTL 
}

code_0BA1B6 {
    COP [22] ( #87, #02 )
    LDA #$0010
    TRB $12
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    JMP $&e_mtA0_acid_spider5
}

code_0BA1CE {
    COP [18] ( &code_0BA216 )
    COP [81] ( #8A, #11 )
    COP [89]
    COP [44] ( #00, #FE, #05, #01, &code_0BA1E3 )
    JMP $&e_mtA0_acid_spider5
}

code_0BA1E3 {
    COP [23]
    AND #$0001
    BEQ code_0BA1ED
    JMP $&code_0BA5BA
}

code_0BA1ED {
    COP [80] ( #90 )
    COP [89]
    COP [9C] ( @code_0BA527, #$0201 )
    COP [2C] ( &code_0BA1FF, &code_0BA2EB )
}

code_0BA1FF {
    COP [2A] ( #$0000, &code_0BA0DB, &code_0BA0DB, &code_0BA209 )
}

code_0BA209 {
    COP [17] ( &e_mtA0_acid_spider5 )
    COP [81] ( #8A, #12 )
    COP [89]
    JMP $&e_mtA0_acid_spider5
}

code_0BA216 {
    JSR $&sub_0BA5A6
    COP [C2]
    LDA #$0011
    TSB $12
    COP [14] ( #02, #00, &code_0BA22B )
    LDA #$0020
    BRA code_0BA269
}

code_0BA22B {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #03, #00, &code_0BA23B )
    LDA #$0030
    BRA code_0BA269
}

code_0BA23B {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #04, #00, &code_0BA24B )
    LDA #$0040
    BRA code_0BA269
}

code_0BA24B {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #05, #00, &code_0BA25B )
    LDA #$0050
    BRA code_0BA269
}

code_0BA25B {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #06, #00, &code_0BA5BA )
    LDA #$0060
}

code_0BA269 {
    STA $24
    COP [80] ( #0D )
    COP [89]
    COP [A2] ( @code_0BA2CA, #$0301 )
    LDA $24
    STA $0026, Y
    LDA #$0004

  code_0BA27F:
    PHA 
    COP [A2] ( @code_0BA2BE, #$0301 )
    PLA 
    DEC 
    BPL code_0BA27F
    LDA #$0010
    TSB $12
    LDA $14
    CLC 
    ADC $24
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [C1]
    LDA $24
    BEQ code_0BA2A6
    RTL 
}

code_0BA2A6 {
    COP [22] ( #07, #02 )
    LDA #$0010
    TRB $12
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    JMP $&e_mtA0_acid_spider5
}

code_0BA2BE {
    COP [8D] ( #19 )
    COP [8B]
    COP [C1]
    JSL $@func_0AA41C
    RTL 
}

code_0BA2CA {
    LDA $26
    CLC 
    ADC $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    COP [22] ( #19, #02 )
    LDA $7F001C, X
    TAY 
    LDA #$0000
    STA $0024, Y
    COP [C1]
    RTL 
}

code_0BA2EB {
    COP [2B] ( #$0000, &code_0BA2F5, &code_0BA2F5, &code_0BA3E5 )
}

code_0BA2F5 {
    COP [15] ( &code_0BA33D )
    COP [82] ( #09, #12 )
    COP [89]
    COP [44] ( #FF, #FA, #01, #FF, &code_0BA30A )
    JMP $&e_mtA0_acid_spider5
}

code_0BA30A {
    COP [23]
    AND #$0001
    BEQ code_0BA314
    JMP $&code_0BA5BA
}

code_0BA314 {
    COP [80] ( #0F )
    COP [89]
    COP [9C] ( @code_0BA54C, #$0201 )
    COP [2C] ( &code_0BA0DB, &code_0BA326 )
}

code_0BA326 {
    COP [2B] ( #$0000, &code_0BA330, &code_0BA330, &code_0BA2EB )
}

code_0BA330 {
    COP [16] ( &e_mtA0_acid_spider5 )
    COP [82] ( #09, #11 )
    COP [89]
    JMP $&e_mtA0_acid_spider5
}

code_0BA33D {
    JSR $&sub_0BA5A6
    COP [C2]
    LDA #$0011
    TSB $12
    COP [14] ( #00, #FE, &code_0BA352 )
    LDA #$FFE0
    BRA code_0BA390
}

code_0BA352 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #FD, &code_0BA362 )
    LDA #$FFD0
    BRA code_0BA390
}

code_0BA362 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #FC, &code_0BA372 )
    LDA #$FFC0
    BRA code_0BA390
}

code_0BA372 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #FB, &code_0BA382 )
    LDA #$FFB0
    BRA code_0BA390
}

code_0BA382 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #FA, &code_0BA5BA )
    LDA #$FFB0
}

code_0BA390 {
    STA $24
    COP [80] ( #0B )
    COP [89]
    COP [A2] ( @code_0BA4E1, #$0301 )
    LDA $24
    STA $0026, Y
    LDA #$0004

  code_0BA3A6:
    PHA 
    COP [A2] ( @code_0BA4D5, #$0301 )
    PLA 
    DEC 
    BPL code_0BA3A6
    LDA #$0010
    TSB $12
    LDA $14
    STA $7F0018, X
    LDA $24
    CLC 
    ADC $16
    STA $7F001A, X
    COP [C1]
    LDA $24
    BEQ code_0BA3CD
    RTL 
}

code_0BA3CD {
    COP [22] ( #05, #02 )
    LDA #$0010
    TRB $12
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    JMP $&e_mtA0_acid_spider5
}

code_0BA3E5 {
    COP [16] ( &code_0BA42D )
    COP [82] ( #08, #11 )
    COP [89]
    COP [44] ( #FF, #00, #01, #05, &code_0BA3FA )
    JMP $&e_mtA0_acid_spider5
}

code_0BA3FA {
    COP [23]
    AND #$0001
    BEQ code_0BA404
    JMP $&code_0BA5BA
}

code_0BA404 {
    COP [80] ( #0E )
    COP [89]
    COP [9C] ( @code_0BA55A, #$0201 )
    COP [2C] ( &code_0BA0DB, &code_0BA416 )
}

code_0BA416 {
    COP [2B] ( #$0000, &code_0BA2EB, &code_0BA2EB, &code_0BA420 )
}

code_0BA420 {
    COP [15] ( &e_mtA0_acid_spider5 )
    COP [82] ( #08, #12 )
    COP [89]
    JMP $&e_mtA0_acid_spider5
}

code_0BA42D {
    JSR $&sub_0BA5A6
    COP [C2]
    LDA #$0011
    TSB $12
    COP [14] ( #00, #02, &code_0BA442 )
    LDA #$0020
    BRA code_0BA480
}

code_0BA442 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #03, &code_0BA452 )
    LDA #$0030
    BRA code_0BA480
}

code_0BA452 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #04, &code_0BA462 )
    LDA #$0040
    BRA code_0BA480
}

code_0BA462 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #05, &code_0BA472 )
    LDA #$0050
    BRA code_0BA480
}

code_0BA472 {
    JSR $&sub_0BA5A6
    COP [C2]
    COP [14] ( #00, #06, &code_0BA5BA )
    LDA #$0060
}

code_0BA480 {
    STA $24
    COP [80] ( #0C )
    COP [89]
    COP [A2] ( @code_0BA4E1, #$0301 )
    LDA $24
    STA $0026, Y
    LDA #$0004

  code_0BA496:
    PHA 
    COP [A2] ( @code_0BA4D5, #$0301 )
    PLA 
    DEC 
    BPL code_0BA496
    LDA #$0010
    TSB $12
    LDA $14
    STA $7F0018, X
    LDA $24
    CLC 
    ADC $16
    STA $7F001A, X
    COP [C1]
    LDA $24
    BEQ code_0BA4BD
    RTL 
}

code_0BA4BD {
    COP [22] ( #06, #02 )
    LDA #$0010
    TRB $12
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    COP [A9]
    JMP $&e_mtA0_acid_spider5
}

code_0BA4D5 {
    COP [8D] ( #18 )
    COP [8B]
    COP [C1]
    JSL $@func_0AA41C
    RTL 
}

code_0BA4E1 {
    LDA $14
    STA $7F0018, X
    LDA $26
    CLC 
    ADC $16
    STA $7F001A, X
    COP [22] ( #18, #02 )
    LDA $7F001C, X
    TAY 
    LDA #$0000
    STA $0024, Y
    COP [C1]
    RTL 
}

code_0BA502 {
    COP [07] ( #1E )
    COP [BC] ( #00, #F8 )
    LDA $14
    SEC 
    SBC #$0040
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0008
    STA $7F001A, X
    COP [5B] ( #$0010 )
    COP [22] ( #15, #03 )
    BRA code_0BA578
}

code_0BA527 {
    COP [07] ( #1E )
    COP [BC] ( #00, #F8 )
    LDA $14
    CLC 
    ADC #$0040
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0008
    STA $7F001A, X
    COP [5B] ( #$0010 )
    COP [22] ( #95, #03 )
    BRA code_0BA578
}

code_0BA54C {
    COP [07] ( #1E )
    COP [8D] ( #14 )
    LDA $16
    CLC 
    ADC #$FFC0
    BRA code_0BA566
}

code_0BA55A {
    COP [07] ( #1E )
    COP [8D] ( #13 )
    LDA $16
    CLC 
    ADC #$0040
}

code_0BA566 {
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    COP [5B] ( #$0010 )
    COP [22] ( #FF, #03 )
}

code_0BA578 {
    COP [5C] ( #$FFEF )
    COP [13] ( &code_0BA593 )
    COP [80] ( #11 )
    COP [89]
    COP [84] ( #12, #06 )
    COP [8A]
    COP [84] ( #16, #0A )
    COP [8A]
    COP [E0]
}

code_0BA593 {
    COP [CA] ( #10 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
    COP [E0]
}

---------------------------------------------

sub_0BA5A6 {
    PHD 
    LDA #$0000
    TCD 
    LDA [$80], Y
    AND #$000F
    PLD 
    CMP #$000F
    BCS code_0BA5B7
    RTS 
}

code_0BA5B7 {
    PLA 
    COP [C2]
}

code_0BA5BA {
    LDA #$0010
    TRB $12
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0BA5CD )
}

code_list_0BA5CD [
  &code_0BA0E5   ;00
  &code_0BA1CE   ;01
  &code_0BA3E5   ;02
  &code_0BA2F5   ;03
]