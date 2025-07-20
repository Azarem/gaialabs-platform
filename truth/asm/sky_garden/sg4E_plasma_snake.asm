

---------------------------------------------

h_sg51_plasma_snake1 [
  h_actor < #3B, #00, #02 >   ;00
]

---------------------------------------------

e_sg51_plasma_snake1 {
    COP [9C] ( @code_0ACDCE, #$0200 )
    COP [9C] ( @code_0ACDCE, #$0200 )
    COP [27] ( #08 )
    LDA #$0000
    STA $7F000A, X
    BRA code_0ACD0C
}

---------------------------------------------

h_sg4E_plasma_snake2 [
  h_actor < #3B, #00, #02 >   ;00
]

---------------------------------------------

e_sg4E_plasma_snake2 {
    COP [9C] ( @code_0ACDCE, #$0200 )
    COP [9C] ( @code_0ACDCE, #$0200 )
    COP [27] ( #08 )
    LDA #$0001
    STA $7F000A, X
}

code_0ACD0C {
    LDY $06
    LDA #$0000
    STA $0024, Y
    LDA $0006, Y
    TAY 
    LDA #$0000
    STA $0024, Y

  code_0ACD1E:
    COP [14] ( #00, #01, &code_0ACD4A )
    COP [14] ( #FF, #00, &code_0ACDA2 )
    COP [14] ( #FF, #01, &code_0ACD76 )
    LDA $7F000A, X
    BNE code_0ACD40
    COP [87] ( #3B, #08, #12, #11 )
    COP [8A]
    BRA code_0ACD1E
}

code_0ACD40 {
    COP [87] ( #3B, #04, #02, #01 )
    COP [8A]
    BRA code_0ACD1E
}

code_0ACD4A {
    COP [14] ( #FF, #00, &code_0ACD76 )
    COP [14] ( #00, #FF, &code_0ACD1E )
    COP [14] ( #FF, #FF, &code_0ACDA2 )
    LDA $7F000A, X
    BNE code_0ACD6C
    COP [87] ( #3B, #08, #12, #12 )
    COP [8A]
    BRA code_0ACD4A
}

code_0ACD6C {
    COP [87] ( #3B, #04, #02, #02 )
    COP [8A]
    BRA code_0ACD4A
}

code_0ACD76 {
    COP [14] ( #00, #FF, &code_0ACDA2 )
    COP [14] ( #01, #00, &code_0ACD4A )
    COP [14] ( #01, #FF, &code_0ACD1E )
    LDA $7F000A, X
    BNE code_0ACD98
    COP [87] ( #3B, #08, #11, #12 )
    COP [8A]
    BRA code_0ACD76
}

code_0ACD98 {
    COP [87] ( #3B, #04, #01, #02 )
    COP [8A]
    BRA code_0ACD76
}

code_0ACDA2 {
    COP [14] ( #01, #00, &code_0ACD1E )
    COP [14] ( #00, #01, &code_0ACD76 )
    COP [14] ( #01, #01, &code_0ACD4A )
    LDA $7F000A, X
    BNE code_0ACDC4
    COP [87] ( #3B, #08, #11, #11 )
    COP [8A]
    BRA code_0ACDA2
}

code_0ACDC4 {
    COP [87] ( #3B, #04, #01, #01 )
    COP [8A]
    BRA code_0ACDA2
}

code_0ACDCE {
    COP [8D] ( #3B )
    LDA #$0000
    STA $7F0018, X
    STA $7F0018, X
    STA $2C
    STA $2E
    STA $2A
    COP [C1]
    LDA $24
    BEQ code_0ACDE9
    RTL 
}

code_0ACDE9 {
    LDY $04
    LDA $0028, Y
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA $7F0018, X
    PHA 
    LDA $7F001A, X
    PHA 
    LDA $7F0016, X
    PHA 
    TXA 
    TYX 
    TAY 
    PLA 
    STA $7F0016, X
    PLA 
    STA $7F100E, X
    PLA 
    STA $7F100C, X
    COP [B1]
    COP [C1]
    COP [8A]
    LDA $7F100C, X
    STA $7F0018, X
    LDA $7F100E, X
    STA $7F001A, X
    LDA $7F0010, X
    STA $28
    BRA code_0ACDE9
}