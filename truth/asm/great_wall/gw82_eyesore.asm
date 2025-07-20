

---------------------------------------------

h_gw82_eyesore [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_gw82_eyesore {
    COP [27] ( #07 )
    LDA #$0001
    TSB $12
    COP [80] ( #03 )
    COP [89]
    LDA #$0001
    TRB $12
    LDA $10
    BIT #$4000
    BNE e_gw82_eyesore
    COP [21] ( #04, &code_0B8E29 )

  code_0B8DDF:
    COP [2A] ( #$0000, &code_0B8DEA, &code_0B8DEA, &code_0B8DF2 )
    RTL 
}

code_0B8DEA {
    COP [8D] ( #02 )
    LDA #$FFE0
    BRA code_0B8DFD
}

code_0B8DF2 {
    COP [8D] ( #82 )
    LDA #$0002
    TSB $12
    LDA #$0020
}

code_0B8DFD {
    CLC 
    ADC $14
    STA $7F0018, X
    COP [23]
    AND #$003F
    SEC 
    SBC #$001F
    CLC 
    ADC $16
    STA $7F001A, X
    LDA #$0008
    TSB $10
    COP [22] ( #FF, #01 )
    LDA #$0008
    TRB $10
    LDA #$0002
    TRB $12
    BRA e_gw82_eyesore
}

code_0B8E29 {
    LDA #$0001
    TSB $12
    COP [84] ( #0F, #02 )
    COP [8A]
    COP [CA] ( #03 )
    COP [80] ( #0F )
    COP [89]
    COP [23]
    COP [9E] ( @code_0B8E67, #$0000, #$FFF6, #$0302 )
    COP [9E] ( @code_0B8E6C, #$0000, #$FFF6, #$0302 )
    COP [07] ( #1E )
    COP [CB]
    COP [84] ( #00, #02 )
    COP [8A]
    LDA #$0001
    TRB $12
    JMP $&code_0B8DDF
}

code_0B8E67 {
    LDA #$4000
    TSB $12
}

code_0B8E6C {
    COP [63] ( #02, #0A, #00 )
    PEA $&func_0B8E91-1
    LDA $0410
    AND #$0003
    BNE code_0B8E80
    COP [AA] ( #00 )
    RTS 
}

code_0B8E80 {
    DEC 
    BNE code_0B8E86
    COP [AA] ( #13 )
}

code_0B8E86 {
    DEC 
    BNE code_0B8E8D
    COP [AA] ( #11 )
    RTS 
}

code_0B8E8D {
    COP [AA] ( #13 )
    RTS 
}

---------------------------------------------

func_0B8E91 {
    COP [23]
    AND #$001F
    STA $24
    LDA $12
    BIT #$4000
    BEQ code_0B8EA7
    LDA $24
    EOR #$FFFF
    INC 
    STA $24
}

code_0B8EA7 {
    LDA $24
    CLC 
    ADC $16
    STA $7F001A, X
    COP [8D] ( #04 )

  code_0B8EB3:
    COP [8B]
    LDA $08
    STZ $08
    INC 
    STA $24
    COP [C1]
    LDA $2A
    BNE code_0B8EC8
    COP [B1]
    STZ $2E
    BRA code_0B8EB3
}

code_0B8EC8 {
    COP [C1]
    COP [64]
    CMP #$0000
    BMI code_0B8ED6
    DEC $24
    BMI code_0B8EB3
    RTL 
}

code_0B8ED6 {
    LDA #$0102
    TRB $10
    STZ $2C
    STZ $2E
    COP [5D] ( &code_0B8EF0 )
    COP [83] ( #04, #47, #45 )
    COP [89]
    COP [84] ( #04, #02 )
    COP [8A]
}

code_0B8EF0 {
    COP [E0]
}