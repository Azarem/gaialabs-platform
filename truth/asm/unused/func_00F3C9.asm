
?INCLUDE 'binary_01C384'
?INCLUDE 'chunk_028000'

---------------------------------------------

func_00F3C9 {
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16

  code_00F3D3:
    LDA $7F0010, X
    AND #$00FF
    TAY 
    SEP #$20
    CLC 
    LDA $&binary_01C455, Y
    BPL code_00F3E7
    EOR #$FF
    INC 
    SEC 
}

code_00F3E7 {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_00F3FC
    EOR #$FFFF
    INC 
}

code_00F3FC {
    CLC 
    ADC $14
    STA $14
    SEP #$20
    CLC 
    LDA $&binary_01C495, Y
    BPL code_00F40D
    EOR #$FF
    INC 
    SEC 
}

code_00F40D {
    XBA 
    LDA $7F0012, X
    JSL $@func_0281D1
    REP #$20
    XBA 
    AND #$00FF
    BCC code_00F422
    EOR #$FFFF
    INC 
}

code_00F422 {
    CLC 
    ADC $16
    STA $16
    RTL 
}