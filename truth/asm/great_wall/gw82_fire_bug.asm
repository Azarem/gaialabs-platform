
?INCLUDE 'func_0AA43F'

---------------------------------------------

h_gw82_fire_bug [
  h_actor < #18, #00, #00 >   ;00
]

---------------------------------------------

e_gw82_fire_bug {
    COP [5B] ( #$0020 )
    COP [57] ( @code_0B8DB9 )
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $26

  code_0B8C86:
    COP [68] ( &code_0B8C94 )
    COP [27] ( #05 )

  code_0B8C8D:
    LDA $10
    BIT #$4000
    BNE code_0B8C86
}

code_0B8C94 {
    COP [80] ( #18 )
    COP [89]
    COP [2A] ( #$0040, &code_0B8CA3, &code_0B8CD4, &code_0B8CBB )
}

code_0B8CA3 {
    LDA $7F100C, X
    SEC 
    SBC #$00C1
    CMP $14
    BPL code_0B8CBB
    LDA #$FFC0
    JSR $&sub_0B8D65
    COP [22] ( #19, #02 )
    BRA code_0B8C8D
}

code_0B8CBB {
    LDA $7F100C, X
    CLC 
    ADC #$00C1
    CMP $14
    BMI code_0B8CA3
    LDA #$0040
    JSR $&sub_0B8D65
    COP [22] ( #99, #02 )
    JMP $&code_0B8C8D
}

code_0B8CD4 {
    LDA #$2000
    TSB $12
    COP [2A] ( #$0000, &code_0B8CE3, &code_0B8CE3, &code_0B8CF4 )
}

code_0B8CE3 {
    LDA $7F100C, X
    SEC 
    SBC #$00B0
    CMP $14
    BPL code_0B8CF4
    COP [8D] ( #19 )
    BRA code_0B8D08
}

code_0B8CF4 {
    LDA $7F100C, X
    CLC 
    ADC #$00A1
    CMP $14
    BMI code_0B8CE3
    COP [8D] ( #99 )
    LDA #$4000
    TSB $12
}

code_0B8D08 {
    COP [63] ( #02, #0A, #00 )

  code_0B8D0D:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    COP [64]
    COP [AA] ( #02 )
    LDA $16
    CMP $26
    BCC code_0B8D28
    DEC $24
    BMI code_0B8D0D
    RTL 
}

code_0B8D28 {
    LDA #$6000
    TRB $12
    STZ $2C
    LDA #$0000
    STA $7F002E, X
    LDA $26
    CMP $16
    BEQ code_0B8D4E
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    COP [22] ( #19, #02 )
    LDA $26
    STA $16
}

code_0B8D4E {
    LDA $10
    BIT #$4000
    BEQ code_0B8D58
    JMP $&code_0B8C8D
}

code_0B8D58 {
    COP [9C] ( @func_0B8D73, #$0201 )
    COP [07] ( #21 )
    JMP $&code_0B8C8D
}

---------------------------------------------

sub_0B8D65 {
    CLC 
    ADC $14
    STA $7F0018, X
    LDA $16
    STA $7F001A, X
    RTS 
}

---------------------------------------------

func_0B8D73 {
    COP [CA] ( #04 )
    COP [82] ( #04, #01 )
    COP [89]
    COP [16] ( &code_0B8D82 )
    BRA code_0B8D8A
}

code_0B8D82 {
    COP [CB]
    COP [E0]

  code_0B8D86:
    COP [16] ( &code_0B8D91 )
}

code_0B8D8A {
    COP [9C] ( @code_0B8D99, #$0200 )
}

code_0B8D91 {
    COP [84] ( #04, #04 )
    COP [8A]

  code_0B8D97:
    COP [E0]
}

code_0B8D99 {
    LDA $10
    BIT #$4000
    BNE code_0B8D97
    COP [07] ( #21 )
    LDA $16
    CLC 
    ADC #$0008
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    COP [22] ( #04, #01 )
    BRA code_0B8D86
}

code_0B8DB9 {
    COP [C7] ( @func_0AA43F )
}