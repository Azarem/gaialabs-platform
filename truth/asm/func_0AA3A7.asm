

---------------------------------------------

func_0AA3A7 {
    LDA #$0000
    STA $7F1002, X
    STA $7F1000, X

  code_0AA3B2:
    LDA $14
    SEC 
    SBC #$0008
    BIT #$0008
    BEQ code_0AA3C6
    AND #$FFF0
    CLC 
    ADC #$0018
    BRA code_0AA3CD
}

code_0AA3C6 {
    AND #$FFF0
    CLC 
    ADC #$0008
}

code_0AA3CD {
    STA $7F0018, X
    LDA $16
    BIT #$0008
    BEQ code_0AA3E1
    AND #$FFF0
    CLC 
    ADC #$0010
    BRA code_0AA3E4
}

code_0AA3E1 {
    AND #$FFF0
}

code_0AA3E4 {
    STA $7F001A, X
    COP [C1]
    COP [22] ( #FF, #01 )
    LDA $14
    SEC 
    SBC #$0008
    ORA $16
    BIT #$000F
    BNE code_0AA3B2
    COP [4A]
}