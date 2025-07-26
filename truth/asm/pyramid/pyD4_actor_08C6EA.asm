
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'

!player_actor                   09AA

---------------------------------------------

h_pyD4_actor_08C6EA [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyD4_actor_08C6EA {
    LDA $0E
    CLC 
    ADC #$0080
    STA $24
    LDA #$2000
    STA $0E
    COP [88] ( @table_0EE000 )
    COP [8D] ( #1B )
    COP [BC] ( #08, #00 )
    LDA $24
    JSL $@func_00B4B7
    BCC code_08C711
    JMP $&code_08C76E
}

code_08C711 {
    COP [C1]
    PHX 
    LDX $player_actor
    LDA $7F0008, X
    AND #$00FF
    CMP #$0097
    BNE code_08C72B
    LDA $0028, X
    CMP #$0001
    BEQ code_08C72D
}

code_08C72B {
    PLX 
    RTL 
}

code_08C72D {
    PLX 
    LDA $0AD4
    CMP #$0001
    BEQ code_08C737
    RTL 
}

code_08C737 {
    COP [21] ( #0C, &code_08C73D )
    RTL 
}

code_08C73D {
    LDA $24
    JSL $@func_00B4BE
    COP [DA] ( #B3 )
    COP [23]
    STA $08
    COP [C2]
    LDA $16
    SEC 
    SBC #$0100
    STA $16
    LDA #$2000
    TRB $10
    COP [B2]
    COP [86] ( #1B, #02, #0F )
    COP [8A]
    COP [08] ( #$1515 )
    COP [B4]
    COP [82] ( #1B, #35 )
    COP [89]
}

code_08C76E {
    LDA #$3000
    TRB $10
    LDA #$0300
    TSB $10
    COP [B3]
    COP [11]
    COP [C1]
    RTL 
}