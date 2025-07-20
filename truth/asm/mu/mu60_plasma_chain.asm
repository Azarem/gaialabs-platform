?INCLUDE 'stats_01ABF0'

!player_actor                   09AA

---------------------------------------------

h_mu60_plasma_chain [
  h_actor < #2C, #00, #20 >   ;00
]

---------------------------------------------

e_mu60_plasma_chain {
    COP [13] ( &code_0AE970 )
    LDA #$&stats_01ABF0
    STA $7F0020, X
    COP [9C] ( @code_0AE972, #$0200 )
    COP [9C] ( @code_0AEA0D, #$0200 )
    COP [9C] ( @code_0AEA0D, #$0200 )
    COP [9C] ( @code_0AEA0D, #$0200 )
    COP [C1]
    RTL 
}

code_0AE970 {
    COP [E0]
}

code_0AE972 {
    LDA $14
    STA $7F0010, X
    LDA $16
    STA $7F0012, X
    COP [8D] ( #2C )

  code_0AE981:
    COP [27] ( #08 )
    COP [C1]
    COP [21] ( #05, &code_0AE9D5 )
    COP [23]
    AND #$007F
    SEC 
    SBC #$0040
    CLC 
    ADC $7F0010, X
    STA $7F0018, X
    COP [23]
    AND #$007F
    SEC 
    SBC #$0040
    CLC 
    ADC $7F0012, X
    STA $7F001A, X
    COP [22] ( #2C, #02 )
    COP [84] ( #2C, #04 )
    COP [8A]
    LDA $7F0010, X
    STA $7F0018, X
    LDA $7F0012, X
    STA $7F001A, X
    COP [22] ( #2C, #01 )
    COP [84] ( #2C, #04 )
    COP [8A]
    BRA code_0AE981
}

code_0AE9D5 {
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #2C, #02 )
    COP [84] ( #2C, #04 )
    COP [8A]
    LDA $7F0010, X
    STA $7F0018, X
    LDA $7F0012, X
    STA $7F001A, X
    COP [22] ( #2C, #01 )
    COP [84] ( #2C, #04 )
    COP [8A]
    JMP $&code_0AE981
}

code_0AEA0D {
    COP [8D] ( #2C )
    LDA #$0100
    TSB $12

  code_0AEA15:
    PHX 
    LDY $04
    LDX $06
    LDA $0014, Y
    CLC 
    ADC $0014, X
    LSR 
    STA $14
    LDA $0016, Y
    CLC 
    ADC $0016, X
    LSR 
    STA $16
    LDA $0018, X
    STA $18
    LDA $001A, X
    STA $1A
    LDA $001C, X
    STA $1C
    LDA $001E, X
    STA $1E
    LDX $06
    LDA $7F000C, X
    PLX 
    STA $7F000C, X
    COP [C2]
    BRA code_0AEA15
}