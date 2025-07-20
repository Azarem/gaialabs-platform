

---------------------------------------------

h_actor_00C1AA [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_actor_00C1AA {
    COP [D2] ( #0E, #01 )
    LDA #$0088
    SEC 
    SBC $068A
    STA $00F6
    LDA #$0180
    SEC 
    SBC $068E
    STA $00FA
    LDA #$00A0
    STA $00FE
    COP [C1]
    LDA $00FE
    SEC 
    SBC #$0002
    STA $00FE
    CMP #$0040
    BCC code_00C1DD
    RTL 
}

code_00C1DD {
    COP [E0]
}