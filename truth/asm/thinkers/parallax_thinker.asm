?INCLUDE 'chunk_03BAE1'
?INCLUDE 'parallax_table'
?INCLUDE 'binary_01D8BE'
?INCLUDE 'chunk_028000'


---------------------------------------------

h_parallax_thinker [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_parallax_thinker {
    JSR $&sub_00B8C3
    LDA #$0000
    STA $7F000A, X
    COP [C1]
    LDA $7F000A, X
    STA $0012
    INC 
    STA $7F000A, X
    JSR $&sub_00B8D4
    SEP #$20
    LDA $0002
    XBA 
    LDA $0060
    LDY $005E
    JSL $@func_03E173
    LDA #$01
    STA $0060
    REP #$20
    STZ $005E
    RTL 
}

---------------------------------------------

sub_00B8C3 {
    LDY #$0000
    LDA #$0000

  code_00B8C9:
    STA $0720, Y
    INY 
    INY 
    CPY #$0030
    BNE code_00B8C9
    RTS 
}

---------------------------------------------

sub_00B8D4 {
    PHX 
    LDA #$0000
    TCD 
    LDA $06E4
    STA $1A
    LDA #$00E0
    STA $10
    LDA $7F0002, X
    ASL 
    TAX 
    LDA $&parallax_table, X
    TAX 
    LDA $0003, X
    BIT #$0040
    BEQ code_00B8FD
    LDA $1A
    ASL 
    ASL 
    ASL 
    ASL 
    STA $1A
}

code_00B8FD {
    LDA $0690
    STA $1C
    LDA $068A
    STA $18
    LDA $0003, X
    BIT #$0080
    BEQ code_00B919
    LDA $068E
    STA $1C
    LDA $068C
    STA $18
}

code_00B919 {
    LDA $0012
    LSR 
    BCS code_00B92F
    LDA $0002, X
    STA $64
    STA $60
    LDA $0000, X
    STA $62
    STA $5E
    BRA code_00B941
}

code_00B92F {
    LDA $0002, X
    STA $64
    STA $60
    LDA $0000, X
    CLC 
    ADC #$0200
    STA $62
    STA $5E
}

code_00B941 {
    LDA $0003, X
    AND #$003F
    STA $02
    JSR $&sub_00BABA
    LDA $0004, X
    AND #$00FF
    STA $00
    TXA 
    CLC 
    ADC #$0005
    TAX 
    LDA $00
    CMP #$0004
    BEQ code_00B98E
    CMP #$0009
    BEQ code_00B9B3

  code_00B966:
    LDA $0000, X
    BEQ code_00B981
    CLC 
    ADC $1C
    STA $1C
    BMI code_00B97E
    PHA 
    JSR $&sub_00BB63
    TXA 
    CLC 
    ADC $00
    TAX 
    PLA 
    BRA code_00B966
}

code_00B97E {
    JSR $&sub_00BACD
}

code_00B981 {
    LDA #$0000
    STA [$62]
    STZ $62
    STZ $64
    PLA 
    TCD 
    TAX 
    RTS 
}

code_00B98E {
    LDA $0000, X
    BEQ code_00B9A6
    CLC 
    ADC $1C
    STA $1C
    BMI code_00B9A3
    TAY 
    TXA 
    CLC 
    ADC $00
    TAX 
    TYA 
    BRA code_00B98E
}

code_00B9A3 {
    JSR $&sub_00BB1F
}

code_00B9A6 {
    LDA #$0000
    STA [$62]
    STZ $62
    STZ $64
    PLA 
    TCD 
    TAX 
    RTS 
}

code_00B9B3 {
    DEC $00
    STZ $08

  code_00B9B7:
    LDA $0000, X
    BMI code_00BA00
    SEC 
    SBC $068A
    BMI code_00B9C9
    CMP #$00FF
    BCS code_00B9F9
    BRA code_00B9D6
}

code_00B9C9 {
    CLC 
    ADC $0002, X
    BMI code_00B9F9
    CMP #$00FF
    BCS code_00B9F9
    BRA code_00B9D6
}

code_00B9D6 {
    LDA $0004, X
    SEC 
    SBC $068E
    BMI code_00B9E9
    CMP #$00FF
    BCS code_00B9F9
    JSR $&sub_00BA1B
    BRA code_00B9F9
}

code_00B9E9 {
    CLC 
    ADC $0006, X
    BEQ code_00B9F9
    BMI code_00B9F9
    CMP #$00FF
    BCS code_00B9F9
    JSR $&sub_00BA1B
}

code_00B9F9 {
    TXA 
    CLC 
    ADC $00
    TAX 
    BRA code_00B9B7
}

code_00BA00 {
    LDY #$0001
    LDA #$0001
    STA [$62]
    LDA #$0000
    STA [$62], Y
    LDY #$0003
    STA [$62], Y
    LDY #$0004
    STA [$62], Y
    PLA 
    TCD 
    TAX 
    RTS 
}

---------------------------------------------

sub_00BA1B {
    LDA $0004, X
    SEC 
    SBC $068E
    BCS code_00BA2E
    CLC 
    ADC $0006, X
    STA $26
    STZ $24
    BRA code_00BA35
}

code_00BA2E {
    STA $24
    LDA $0006, X
    STA $26
}

code_00BA35 {
    LDA $0000, X
    SEC 
    SBC $068A
    BCS code_00BA4A
    CLC 
    ADC $0002, X
    AND #$00FF
    XBA 
    STA $20
    BRA code_00BA5A
}

code_00BA4A {
    STA $20
    CLC 
    ADC $0002, X
    CMP #$0100
    BCC code_00BA58
    LDA #$FFFF
}

code_00BA58 {
    STA $21
}

code_00BA5A {
    LDY $20
    JSR $&sub_00BA60
    RTS 
}

---------------------------------------------

sub_00BA60 {
    LDA $24
    SEC 
    SBC $08
    BEQ code_00BA91
    STA $0E
    CLC 
    ADC $08
    STA $08
    LDA $0E

  code_00BA70:
    STZ $0E
    CMP #$0080
    BMI code_00BA80
    SEC 
    SBC #$007F
    STA $0E
    LDA #$007F
}

code_00BA80 {
    STA [$62]
    INC $62
    LDA #$0000
    STA [$62]
    INC $62
    INC $62
    LDA $0E
    BNE code_00BA70
}

code_00BA91 {
    LDA $26
    CLC 
    ADC $08
    STA $08
    LDA $26

  code_00BA9A:
    STZ $26
    CMP #$0080
    BMI code_00BAAA
    SEC 
    SBC #$007F
    STA $26
    LDA #$007F
}

code_00BAAA {
    STA [$62]
    INC $62
    TYA 
    STA [$62]
    INC $62
    INC $62
    LDA $26
    BNE code_00BA9A
    RTS 
}

---------------------------------------------

sub_00BABA {
    LDA $02
    TAY 
    LDA $&binary_01D8BE, Y
    AND #$0007
    TAY 
    LDA $&binary_01D8FE, Y
    AND #$00FF
    STA $04
    RTS 
}

---------------------------------------------

sub_00BACD {
    EOR #$FFFF
    INC 
    PHA 
    JSR $&sub_00BB63
    LDA $10
    SEC 
    SBC $01, S
    STA $10
    PLA 

  code_00BADD:
    STZ $0E
    CMP #$0080
    BMI code_00BAED
    SEC 
    SBC #$007F
    STA $0E
    LDA #$007F
}

code_00BAED {
    STA [$62]
    LDY #$0001
    LDA $06
    LSR 
    LSR 
    LSR 
    LSR 
    BIT #$0800
    BEQ code_00BB00
    ORA #$F000
}

code_00BB00 {
    STA [$62], Y
    LDA $62
    CLC 
    ADC $04
    STA $62
    LDA $0E
    BNE code_00BADD
    LDA $10
    BPL code_00BB12
    RTS 
}

code_00BB12 {
    TXA 
    CLC 
    ADC $00
    TAX 
    LDA $0000, X
    BNE code_00BB1D
    RTS 
}

code_00BB1D {
    BRA sub_00BACD
}

---------------------------------------------

sub_00BB1F {
    EOR #$FFFF
    INC 
    PHA 
    LDA $10
    SEC 
    SBC $01, S
    STA $10
    PLA 

  code_00BB2C:
    STZ $0E
    CMP #$0080
    BMI code_00BB3C
    SEC 
    SBC #$007F
    STA $0E
    LDA #$007F
}

code_00BB3C {
    STA [$62]
    LDA $0002, X
    LDY #$0001
    STA [$62], Y
    LDA $62
    CLC 
    ADC $04
    STA $62
    LDA $0E
    BNE code_00BB2C
    LDA $10
    BPL code_00BB56
    RTS 
}

code_00BB56 {
    TXA 
    CLC 
    ADC $00
    TAX 
    LDA $0000, X
    BNE code_00BB61
    RTS 
}

code_00BB61 {
    BRA sub_00BB1F
}

---------------------------------------------

sub_00BB63 {
    LDA $0004, X
    BEQ code_00BB7B
    LDY $18
    JSL $@func_028000
    CLC 
    ADC $0006, X
    LDY $0002, X
    STA $0000, Y
    STA $06
    RTS 
}

code_00BB7B {
    LDY $0002, X
    LDA $0006, X
    CLC 
    ADC $0000, Y
    CLC 
    ADC $1A
    STA $0000, Y
    STA $06
    RTS 
}