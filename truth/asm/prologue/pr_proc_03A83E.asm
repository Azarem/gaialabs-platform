
---------------------------------------------

e_pr_proc_03A83E {
    LDA #$0000
    STA $7F2104, X
    JSR $&sub_03A90B
    COP [C1]
    LDA $0D58
    BEQ code_03A85B
    LDA $0D5A
    BNE code_03A85B
    JSR $&sub_03A8A6
    JSR $&sub_03A886
    RTL 
}

code_03A85B {
    COP [CA] ( #02 )
    JSR $&sub_03A8A6
    JSR $&sub_03A886
    COP [CB]
    COP [CA] ( #28 )
    LDA $7F2104, X
    CLC 
    ADC #$0002
    STA $7F2104, X
    JSR $&sub_03A8A6
    JSR $&sub_03A886
    COP [CB]
    COP [C1]
    JSR $&sub_03A8A6
    JSR $&sub_03A886
    RTL 
}

---------------------------------------------

sub_03A886 {
    LDA $0036
    LSR 
    BCS code_03A899
    COP [02] ( $7E8800, #05 )
    COP [02] ( $7E8A00, #32 )
    RTS 
}

code_03A899 {
    COP [02] ( $7E8900, #05 )
    COP [02] ( $7E8B00, #32 )
    RTS 
}

---------------------------------------------

sub_03A8A6 {
    PHB 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    LDA $0036
    LSR 
    BCS code_03A8BA
    LDY #$0000
    BRA code_03A8BD
}

code_03A8BA {
    LDY #$0100
}

code_03A8BD {
    LDA $@binary_03A932
    STA $8800, Y
    LDA $@binary_03A939
    STA $8A00, Y
    SEP #$20
    LDA $@binary_03A932+2
    CLC 
    ADC $7F2104, X
    STA $8802, Y
    LDA $@binary_03A932+3
    STA $8803, Y
    LDA $@binary_03A939+2
    CLC 
    ADC $7F2104, X
    STA $8A02, Y
    LDA $@binary_03A939+3
    STA $8A03, Y
    REP #$20
    LDA $@binary_03A932+4
    STA $8804, Y
    LDA $@binary_03A939+4
    STA $8A04, Y
    LDA #$0000
    STA $8806, Y
    PLB 
    RTS 
}

---------------------------------------------

sub_03A90B {
    PHB 
    SEP #$20
    LDA #$7E
    PHA 
    PLB 
    REP #$20
    LDY #$0000
    LDA #$01FF

  code_03A91A:
    STA $8A00, Y
    STA $8B00, Y
    INY 
    INY 
    CPY #$0098
    BCC code_03A91A
    LDA #$0000
    STA $8A00, Y
    STA $8B00, Y
    PLB 
    RTS 
}

---------------------------------------------

binary_03A932 #7F071807010900

---------------------------------------------

binary_03A939 #7F00180001FF00