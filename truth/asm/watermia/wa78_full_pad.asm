
?INCLUDE 'wa78_men'

---------------------------------------------

h_wa78_full_pad [
  h_actor < #1F, #01, #10 >   ;00
]

---------------------------------------------

e_wa78_full_pad {
    COP [9C] ( @e_wa78_men, #$1000 )
    LDA #$0048
    STA $0014, Y
    LDA #$0004
    STA $000E, Y
    COP [BC] ( #08, #00 )

  code_079BA2:
    COP [CA] ( #B0 )
    COP [81] ( #1F, #01 )
    COP [89]
    LDY $06
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [CB]
    COP [CA] ( #80 )
    COP [82] ( #1F, #02 )
    COP [89]
    LDY $06
    LDA $0016, Y
    DEC 
    STA $0016, Y
    COP [CB]
    COP [CA] ( #B0 )
    COP [81] ( #1F, #02 )
    COP [89]
    LDY $06
    LDA $0014, Y
    DEC 
    STA $0014, Y
    COP [CB]
    COP [CA] ( #80 )
    COP [82] ( #1F, #01 )
    COP [89]
    LDY $06
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [CB]
    JMP $&code_079BA2
}