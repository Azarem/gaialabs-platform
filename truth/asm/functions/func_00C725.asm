?INCLUDE 'chunk_03BAE1'


---------------------------------------------

func_00C725 {
    COP [23]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_00C733 )
}

code_list_00C733 [
  &code_00C74D   ;00
  &code_00C743   ;01
  &code_00C757   ;02
  &code_00C761   ;03
  &code_00C798   ;04
  &code_00C77B   ;05
  &code_00C7B5   ;06
  &code_00C7D2   ;07
]

code_00C743 {
    LDA $7F0026, X
    CLC 
    ADC #$0000
    BRA code_00C76B
}

code_00C74D {
    LDA $7F0026, X
    CLC 
    ADC #$0001
    BRA code_00C76B
}

code_00C757 {
    LDA $7F0026, X
    CLC 
    ADC #$0002
    BRA code_00C76B
}

code_00C761 {
    LDA $7F0026, X
    CLC 
    ADC #$0003
    BRA code_00C76B
}

code_00C76B {
    STA $28
    STZ $2A
    JSL $@func_03CA55
    LDA #$0078
    STA $08
    COP [0B]
    RTL 
}

code_00C77B {
    LDA $7F0012, X
    CLC 
    ADC #$0030
    CMP $16
    BCC code_00C743
    COP [16] ( &code_00C743 )
    COP [AB] ( #11 )
    LDA $7F0026, X
    CLC 
    ADC #$0004
    BRA code_00C7EF
}

code_00C798 {
    LDA $7F0012, X
    SEC 
    SBC #$0030
    CMP $16
    BCS code_00C74D
    COP [15] ( &code_00C74D )
    COP [AB] ( #12 )
    LDA $7F0026, X
    CLC 
    ADC #$0005
    BRA code_00C7EF
}

code_00C7B5 {
    LDA $7F0010, X
    SEC 
    SBC #$0030
    CMP $14
    BCS code_00C757
    COP [17] ( &code_00C757 )
    COP [AA] ( #12 )
    LDA $7F0026, X
    CLC 
    ADC #$0006
    BRA code_00C7EF
}

code_00C7D2 {
    LDA $7F0010, X
    CLC 
    ADC #$0030
    CMP $14
    BCC code_00C761
    COP [18] ( &code_00C761 )
    COP [AA] ( #11 )
    LDA $7F0026, X
    CLC 
    ADC #$0007
    BRA code_00C7EF
}

code_00C7EF {
    STA $28
    STZ $2A
    JSL $@func_03CA55
    COP [0C]
    RTL 
}