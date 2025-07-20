?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'


---------------------------------------------

h_mtA0_skulker1 [
  h_actor < #03, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_skulker1 {
    LDA #$2000
    TSB $12
    BRA e_mtA0_skulker_ns
}

---------------------------------------------

h_mtA0_skulker_ns [
  h_actor < #02, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_skulker_ns {
    LDA #$0010
    TSB $12
    COP [27] ( #08 )
    LDA #$0000
    STA $7F0010, X
    LDA #$0040
    STA $7F0012, X
    LDA #$0150
    STA $7F100E, X
    LDA $14
    STA $7F100C, X

  code_0B9BD2:
    LDA $16
    STA $26

  code_0B9BD6:
    COP [AB] ( #01 )

  code_0B9BD9:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9BD6
    LDA $08
    INC 
    STA $24
    STZ $08
    JSR $&sub2_0B9CE8
    CLC 
    ADC $7F100C, X
    STA $14
    LDA $7F0010, X
    SEC 
    SBC #$0002
    AND #$00FF
    STA $7F0010, X
    LDA $26
    SEC 
    SBC $16
    BPL code_0B9C0C
    EOR #$FFFF
    INC 
}

code_0B9C0C {
    CMP $7F100E, X
    BEQ code_0B9C19
    DEC $24
    BMI code_0B9C17
    RTL 
}

code_0B9C17 {
    BRA code_0B9BD9
}

code_0B9C19 {
    STZ $2E
    LDA $12
    BIT #$2000
    BNE code_0B9C33
    COP [80] ( #04 )
    COP [89]
    COP [80] ( #03 )
    COP [89]
    LDA #$2000
    TSB $12
    BRA code_0B9BD2
}

code_0B9C33 {
    COP [80] ( #84 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    LDA #$2000
    TRB $12
    BRA code_0B9BD2
}

---------------------------------------------

h_mtA0_skulker2 [
  h_actor < #04, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_skulker2 {
    LDA #$4000
    TSB $12
    BRA code_0B9C53
}

---------------------------------------------

h_mtA0_skulker_ew [
  h_actor < #04, #00, #00 >   ;00
]

---------------------------------------------

e_mtA0_skulker_ew {
    COP [BB]
}

code_0B9C53 {
    LDA #$0010
    TSB $12
    COP [27] ( #08 )
    LDA #$0000
    STA $7F0010, X
    LDA #$0040
    STA $7F0012, X
    LDA #$0150
    STA $7F100E, X
    LDA $16
    STA $7F100C, X

  code_0B9C76:
    LDA $14
    STA $26

  code_0B9C7A:
    COP [AA] ( #01 )

  code_0B9C7D:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_0B9C7A
    LDA $08
    INC 
    STA $24
    STZ $08
    JSR $&sub2_0B9CE8
    CLC 
    ADC $7F100C, X
    STA $16
    LDA $7F0010, X
    SEC 
    SBC #$0002
    AND #$00FF
    STA $7F0010, X
    LDA $26
    SEC 
    SBC $14
    BPL code_0B9CB0
    EOR #$FFFF
    INC 
}

code_0B9CB0 {
    CMP $7F100E, X
    BEQ code_0B9CBD
    DEC $24
    BMI code_0B9CBB
    RTL 
}

code_0B9CBB {
    BRA code_0B9C7D
}

code_0B9CBD {
    STZ $2C
    LDA $12
    BIT #$4000
    BNE code_0B9CD7
    COP [80] ( #03 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    LDA #$4000
    TSB $12
    BRA code_0B9C76
}

code_0B9CD7 {
    COP [80] ( #02 )
    COP [89]
    COP [80] ( #84 )
    COP [89]
    LDA #$4000
    TRB $12
    BRA code_0B9C76
}

---------------------------------------------

sub2_0B9CE8 {
    LDA $7F0010, X
    TAY 
    SEP #$20
    CLC 
    LDA $&binary_01C455, Y
    BPL code2_0B9CF9
    EOR #$FF
    INC 
    SEC 
}

code2_0B9CF9 {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code2_0B9D0E
    EOR #$FFFF
    INC 
}

code2_0B9D0E {
    RTS 
}