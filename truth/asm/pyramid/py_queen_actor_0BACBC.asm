?BANK 0B
?INCLUDE 'py_queen_actor_0BAD6B'


---------------------------------------------

e_py_queen_actor_0BACBC {
    COP [A2] ( @code_0BACD8, #$2000 )
    STZ $24

  code_0BACC5:
    COP [37] ( #5F )
    COP [39]
    LDA $24
    BEQ code_0BACC5
    LDY $06
    LDA #$&func_0BACFE
    STA $0000, Y
    COP [E0]
}

code_0BACD8 {
    LDA #$0000
    STA $7F100C, X
    STA $7F100E, X
    COP [DA] ( #0F )
    LDA $26
    INC 
    CMP #$0020
    BCC code_0BACF8
    COP [9C] ( @e_py_queen_actor_0BAD6B, #$0202 )
    LDA #$0000
}

code_0BACF8 {
    STA $26
    JSR $&sub_0BAD13
    RTL 
}

---------------------------------------------

func_0BACFE {
    LDA #$0000
    STA $7F100C, X
    STA $7F100E, X
    COP [CA] ( #78 )
    JSR $&sub_0BAD13
    COP [CB]
    COP [E0]
}

---------------------------------------------

sub_0BAD13 {
    LDA $06EE
    BIT #$0200
    BNE code_0BAD49
    LDA #$0000
    STA $7F100C, X
    STA $7F100E, X

  code_0BAD26:
    COP [23]
    PHA 
    AND #$0003
    SEC 
    SBC #$0001
    CLC 
    ADC $06BE
    STA $06BE
    PLA 
    LSR 
    LSR 
    AND #$0003
    SEC 
    SBC #$0001
    CLC 
    ADC $06C2
    STA $06C2
    RTS 
}

code_0BAD49 {
    LDA $7F100C, X
    BNE code_0BAD5F
    LDA $06BE
    STA $7F100C, X
    LDA $06C2
    STA $7F100E, X
    BRA code_0BAD26
}

code_0BAD5F {
    STA $06BE
    LDA $7F100E, X
    STA $06C2
    BRA code_0BAD26
}