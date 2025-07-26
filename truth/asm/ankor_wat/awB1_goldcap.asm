?BANK 0B

?INCLUDE 'func_0AFD69'
?INCLUDE 'func_00F432'
?INCLUDE 'aw_actor_0BBEE9'

---------------------------------------------

h_awB1_goldcap [
  h_actor < #16, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_goldcap {
    LDA #$0010
    TSB $12
    COP [A2] ( @func_0AFD69, #$2000 )
    TYA 
    STA $26
    BRA code_0BBDA5
}

---------------------------------------------

func_0BBDA1 {
    COP [22] ( #FF, #02 )
}

code_0BBDA5 {
    LDA $14
    STA $7F100C, X
    STA $7F0018, X
    LDA $16
    STA $7F100E, X
    STA $7F001A, X
    LDA #$2060
    STA $7F0010, X
    COP [80] ( #16 )
    COP [89]

  code_0BBDC5:
    COP [27] ( #08 )

  code_0BBDC8:
    LDA $10
    BIT #$4000
    BNE code_0BBDC5
    LDA #$0000
    STA $7F0012, X
    COP [CA] ( #FF )
    SEP #$20
    LDA $7F0010, X
    CLC 
    ADC $0B02
    CLC 
    ADC #$02
    STA $7F0010, X
    LDA $7F0011, X
    CLC 
    ADC $0B02
    CLC 
    ADC #$01
    STA $7F0011, X
    LDA $7F0012, X
    BMI code_0BBE06
    CLC 
    ADC #$03
    STA $7F0012, X
}

code_0BBE06 {
    LDA $7F0013, X
    BMI code_0BBE13
    CLC 
    ADC #$02
    STA $7F0013, X
}

code_0BBE13 {
    REP #$20
    LDA $7F100C, X
    STA $14
    LDA $7F100E, X
    STA $16
    JSL $@func_00F432
    LDA $7F100C, X
    CMP $7F0018, X
    BEQ code_0BBE43
    BPL code_0BBE3B
    CLC 
    ADC #$0001
    STA $7F100C, X
    BRA code_0BBE43
}

code_0BBE3B {
    SEC 
    SBC #$0001
    STA $7F100C, X
}

code_0BBE43 {
    LDA $7F100E, X
    CMP $7F001A, X
    BEQ code_0BBE61
    BPL code_0BBE59
    CLC 
    ADC #$0001
    STA $7F100E, X
    BRA code_0BBE61
}

code_0BBE59 {
    SEC 
    SBC #$0001
    STA $7F100E, X
}

code_0BBE61 {
    COP [CB]
    LDA $10
    BIT #$4000
    BEQ code_0BBE6D
    JMP $&func_0BBDA1
}

code_0BBE6D {
    LDA #$2200
    TSB $10
    COP [A5] ( @e_aw_actor_0BBEE9, #00, #00, #$0200 )
    TYA 
    STA $7F100C, X
    LDA $26
    STA $0026, Y
    COP [A5] ( @code_0BBEF7, #00, #00, #$0200 )
    TYA 
    STA $7F100E, X
    LDA $26
    STA $0026, Y
    COP [DB] ( #$0167 )
    LDA $7F100C, X
    TAY 
    LDA #$&func_0BBF8C
    STA $0000, Y
    LDA $7F100E, X
    TAY 
    LDA #$&func_0BBF8C
    STA $0000, Y
    LDA #$0003
    STA $24
    COP [C1]
    LDA $24
    BEQ code_0BBEBE
    RTL 
}

code_0BBEBE {
    LDA $7F100C, X
    PHD 
    TCD 
    TAX 
    COP [A7]
    LDA $01, S
    TAX 
    LDA $7F100E, X
    TCD 
    TAX 
    COP [A7]
    PLA 
    TCD 
    TAX 
    LDA #$2200
    TRB $10
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    JMP $&code_0BBDC8
}

---------------------------------------------

func_0BBF8C {
    COP [A9]
    LDA $7F100C, X
    TAY 
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [52] ( #FF, #02, #FF )
    COP [53]
    LDA $7F100C, X
    TAY 
    LDA $0024, Y
    LSR 
    STA $0024, Y

  code_0BBFB4:
    COP [80] ( #17 )
    COP [89]
    BRA code_0BBFB4
}