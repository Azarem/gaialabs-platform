?INCLUDE 'chunk_03BAE1'


---------------------------------------------

func_00DCB4 {
    LDA #$3200
    STA $0E
    LDA $16
    CLC 
    ADC #$FFF0
    STA $16
    LDY $24
    LDA $0014, Y
    STA $20
    LDA $0016, Y
    STA $22
    COP [CA] ( #10 )
    LDY $24
    LDA $0014, Y
    SEC 
    SBC $20
    CLC 
    ADC $14
    STA $14
    LDA $0016, Y
    SEC 
    SBC $22
    CLC 
    ADC $16
    CLC 
    ADC #$FFFF
    STA $16
    LDA $0014, Y
    STA $20
    LDA $0016, Y
    STA $22
    LDA $28
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [E0]
}