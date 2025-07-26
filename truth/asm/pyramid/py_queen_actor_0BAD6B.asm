?BANK 0B

---------------------------------------------

e_py_queen_actor_0BAD6B {
    COP [8D] ( #0D )
    LDA #$0002
    TSB $12
    COP [23]
    PHA 
    AND #$001F
    STA $16
    PLA 
    ASL 
    STA $14

  code_0BAD7F:
    COP [AA] ( #01 )
    COP [23]
    LSR 
    BCC code_0BAD8E
    LDA $12
    EOR #$4000
    STA $12
}

code_0BAD8E {
    COP [63] ( #02, #07, #05 )
    COP [C1]
    COP [64]
    CMP #$0000
    BMI code_0BAD9D
    RTL 
}

code_0BAD9D {
    COP [B8]
    LDA $10
    BIT #$4000
    BNE code_0BADB3
    COP [07] ( #15 )
    LDA #$0001
    CLC 
    ADC $06C2
    STA $06C2
}

code_0BADB3 {
    LDA $16
    BMI code_0BAD7F
    CMP #$0200
    BCC code_0BAD7F
    COP [E0]
}