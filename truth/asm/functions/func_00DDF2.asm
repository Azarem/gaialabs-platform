
?INCLUDE 'table_0EE000'
?INCLUDE 'array_01D3CE'

---------------------------------------------

func_00DDF2 {
    COP [B7] ( #00 )
    LDA #$0342
    STA $10
    LDA #$6000
    TRB $12
    COP [88] ( @table_0EE000 )
    COP [82] ( #29, #02 )
    COP [89]
    COP [82] ( #29, #12 )
    COP [89]
    COP [82] ( #29, #14 )
    COP [89]
    COP [84] ( #29, #02 )
    COP [8A]
    COP [B6] ( #30 )
    LDA $7F0024, X
    ASL 
    ASL 
    ASL 
    TAY 
    LDA $&array_01D3CE+3, Y
    AND #$00FF
    STA $0000
    LSR 
    STA $7F0010, X
    LDA $&array_01D3CE+5, Y
    AND #$00FF
    ASL 
    CLC 
    ADC $0000
    ASL 
    ASL 
    ASL 
    STA $7F0018, X
    LDA $&array_01D3CE+4, Y
    AND #$00FF
    STA $0000
    LSR 
    STA $7F0012, X
    LDA $&array_01D3CE+6, Y
    AND #$00FF
    ASL 
    CLC 
    ADC $0000
    ASL 
    ASL 
    ASL 
    STA $7F001A, X
    COP [52] ( #29, #04, #FF )
    COP [53]
    COP [9C] ( @code_00DF0A, #$0302 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [DA] ( #01 )
    LDA #$2000
    TSB $10
    COP [CA] ( #0A )
    COP [9C] ( @func_00DEB8, #$0302 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA $7F0010, X
    AND #$00FF
    STA $0020, Y
    LDA $7F0012, X
    AND #$00FF
    STA $0022, Y
    COP [DA] ( #03 )
    COP [CB]
    COP [34]
    COP [33]
    COP [E0]
}

---------------------------------------------

func_00DEB8 {
    COP [23]
    LDY $20
    CPY #$0004
    BCS code_00DECC
    CPY #$0002
    BCS code_00DED2
    LSR 
    AND #$000F
    BRA code_00DED6
}

code_00DECC {
    LSR 
    AND #$003F
    BRA code_00DED6
}

code_00DED2 {
    LSR 
    AND #$001F
}

code_00DED6 {
    BCC code_00DEDC
    EOR #$FFFF
    INC 
}

code_00DEDC {
    CLC 
    ADC $14
    STA $14
    COP [23]
    LDY $22
    CPY #$0003
    BCS code_00DEF5
    CPY #$0002
    BEQ code_00DEFB
    LSR 
    AND #$000F
    BRA code_00DEFF
}

code_00DEF5 {
    LSR 
    AND #$003F
    BRA code_00DEFF
}

code_00DEFB {
    LSR 
    AND #$001F
}

code_00DEFF {
    BCC code_00DF05
    EOR #$FFFF
    INC 
}

code_00DF05 {
    CLC 
    ADC $16
    STA $16
}

code_00DF0A {
    COP [08] ( #$0606 )
    COP [80] ( #25 )
    COP [89]
    COP [E0]
}