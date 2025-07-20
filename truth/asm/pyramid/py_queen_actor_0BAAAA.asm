?BANK 0B
?INCLUDE 'binary_0BACB4'
?INCLUDE 'func_00F3C9'


---------------------------------------------

e_py_actor_0BAAAA {
    COP [DA] ( #07 )
    LDA #$2000
    TRB $10
    LDA #$00B9
    STA $12
    LDA $26
    STA $7F0002, X
    LDA $24
    STA $26
    COP [8D] ( #0E )

  code_0BAAC4:
    COP [DA] ( #03 )
    COP [07] ( #26 )
    LDY $26
    LDA $0010, Y
    BIT #$2000
    BEQ code_0BAAC4
    LDA $0026, Y
    AND #$0007
    PHX 
    TAX 
    INC 
    STA $0026, Y
    LDA $@binary_0BACB4, X
    PLX 
    AND #$00FF
    STA $7F0010, X
    LDA #$0002
    STA $7F0012, X
    LDA #$0000
    STA $7F0000, X

  code_0BAAFA:
    COP [8B]
    LDA $2A
    BEQ code_0BAAFA
    LDA $08
    STA $24
    STZ $08

  code_0BAB06:
    JSR $&sub_0BABAC
    COP [C2]
    LDA $7F0012, X
    CMP #$0080
    BCS code_0BAB25
    CLC 
    ADC #$0003
    ADC $0B02
    STA $7F0012, X
    DEC $24
    BPL code_0BAB06
    BRA code_0BAAFA
}

code_0BAB25 {
    LDA $7F0002, X
    BNE code_0BAB60

  code_0BAB2B:
    COP [8B]
    LDA $2A
    BEQ code_0BAB2B
    LDA $08
    STZ $08
    STA $24
    JSR $&sub_0BABAC
    COP [C2]

  code_0BAB3C:
    LDA $7F0010, X
    CLC 
    ADC #$0002
    CLC 
    ADC $0B02
    STA $7F0010, X
    LDA $0036
    LSR 
    BCC code_0BAB59
    LDA #$2000
    TSB $10
    BRA code_0BAB2B
}

code_0BAB59 {
    LDA #$2000
    TRB $10
    BRA code_0BAB2B
}

code_0BAB60 {
    LDA #$0200
    TRB $10
    COP [57] ( @code_0BAB98 )
    LDA #$0000
    STA $7F0026, X

  code_0BAB71:
    COP [8B]
    LDA $2A
    BEQ code_0BAB71
    LDA $08
    STZ $08
    STA $24

  code_0BAB7D:
    JSR $&sub_0BABAC
    COP [C2]
    LDA $7F0010, X
    CLC 
    ADC #$0002
    CLC 
    ADC $0B02
    STA $7F0010, X
    DEC $24
    BPL code_0BAB7D
    BRA code_0BAB71
}

code_0BAB98 {
    LDA #$0200
    TSB $10
    LDA #$0040
    TRB $10
    LDY $26
    LDA #$0000
    STA $0026, Y
    BRA code_0BAB3C
}

---------------------------------------------

sub_0BABAC {
    LDY $26
    JSL $@func_00F3C9
    RTS 
}