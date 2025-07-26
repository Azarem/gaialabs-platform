
?INCLUDE 'chunk_03BAE1'

---------------------------------------------

func_00DC79 {
    LDA #$3200
    STA $0E
    LDA $16
    CLC 
    ADC #$FFF8
    STA $16
    COP [CA] ( #04 )
    LDA $16
    CLC 
    ADC #$0002
    STA $16
    LDA $28
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [CA] ( #20 )
    LDA $16
    CLC 
    ADC #$FFFF
    STA $16
    LDA $28
    STA $0000
    JSL $@func_03BAF1
    COP [CB]
    COP [E0]
}