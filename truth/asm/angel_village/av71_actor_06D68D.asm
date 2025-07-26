
---------------------------------------------

h_av71_actor_06D68D [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av71_actor_06D68D {
    COP [9C] ( @code_06D6A0, #$2800 )
    COP [C1]
    LDA #$FFF7
    STA $0408
    RTL 
}

code_06D6A0 {
    LDA $0036
    AND #$000F
    BEQ code_06D6A9
    RTL 
}

code_06D6A9 {
    COP [23]
    AND #$0001
    BEQ code_06D6B8
    COP [9C] ( @code_06D6C0, #$0B02 )
    RTL 
}

code_06D6B8 {
    COP [9C] ( @code_06D6EF, #$0B02 )
    RTL 
}

code_06D6C0 {
    COP [8D] ( #1C )

  code_06D6C3:
    LDA $06BE
    CLC 
    ADC #$0110
    STA $14
    COP [23]
    STA $16
    AND #$0003
    CLC 
    ADC #$0005
    ASL 
    STA $7F0018, X
    LDA #$0000
    STA $7F001A, X

  code_06D6E3:
    COP [B1]
    COP [C1]
    COP [89]
    LDA $14
    BPL code_06D6E3
    COP [E0]
}

code_06D6EF {
    COP [8D] ( #1D )
    BRA code_06D6C3
}