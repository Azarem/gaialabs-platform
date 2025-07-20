?INCLUDE 'table_0EE000'


---------------------------------------------

h_actor_0BD2AB [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_actor_0BD2AB {
    LDA #$0078
    STA $24

  code_0BD2B3:
    LDA $24
    CMP #$0004
    BEQ code_0BD2BC
    DEC $24
}

code_0BD2BC {
    LDA $24
    STA $08
    COP [C2]
    COP [9C] ( @code_0BD2CB, #$1802 )
    BRA code_0BD2B3
}

code_0BD2CB {
    COP [88] ( @table_0EE000 )
    COP [8D] ( #02 )
    COP [B6] ( #30 )
    LDA #$FFE0
    STA $16
    COP [23]
    PHA 
    ASL 
    CLC 
    ADC #$00C4
    STA $14
    PLA 
    AND #$0003
    ASL 
    CLC 
    ADC #$0004
    STA $7F0018, X
    DEC 
    STA $7F001A, X

  code_0BD2F7:
    COP [B1]
    COP [C1]
    COP [89]
    LDA $16
    CMP #$0200
    BCC code_0BD2F7
    COP [E0]
}