?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'


---------------------------------------------

func_00F432 {
    LDA $7F0010, X
    AND #$00FF
    TAY 
    SEP #$20
    CLC 
    LDA $&binary_01C455, Y
    BPL code_00F446
    EOR #$FF
    INC 
    SEC 
}

code_00F446 {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_00F45B
    EOR #$FFFF
    INC 
}

code_00F45B {
    CLC 
    ADC $14
    STA $14
    LDA #$0000
    SEP #$20
    CLC 
    LDA $7F0011, X
    TAY 
    LDA $&binary_01C495, Y
    BPL code_00F474
    EOR #$FF
    INC 
    SEC 
}

code_00F474 {
    XBA 
    LDA $7F0013, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_00F489
    EOR #$FFFF
    INC 
}

code_00F489 {
    CLC 
    ADC $16
    STA $16
    RTL 
}