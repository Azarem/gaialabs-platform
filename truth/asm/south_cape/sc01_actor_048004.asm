
---------------------------------------------

h_sc01_actor_048004 [
  h_actor < #23, #00, #18 >   ;00
]

---------------------------------------------

e_sc01_actor_048004 {
    LDA #$0200
    TSB $12
    COP [B2]
    COP [B6] ( #30 )

  code_048011:
    COP [C1]
    COP [23]
    STA $08
    PHA 
    AND #$001F
    CLC 
    ADC #$0010
    ASL 
    ASL 
    ASL 
    ASL 
    STA $16
    PLA 
    AND #$0001
    BNE code_04802E
    JMP $&code_048069
}

code_04802E {
    LDA #$0320
    STA $14
    COP [C2]
    COP [CA] ( #03 )
    COP [87] ( #23, #20, #04, #01 )
    COP [8A]
    COP [83] ( #24, #04, #11 )
    COP [89]
    COP [83] ( #24, #04, #13 )
    COP [89]
    COP [81] ( #24, #04 )
    COP [89]
    COP [87] ( #23, #18, #04, #13 )
    COP [8A]
    COP [87] ( #23, #18, #04, #11 )
    COP [8A]
    COP [CB]
    JMP $&code_048011
}

code_048069 {
    LDA #$FFE0
    STA $14
    COP [C2]
    COP [CA] ( #03 )
    COP [87] ( #23, #20, #03, #01 )
    COP [8A]
    COP [83] ( #24, #03, #11 )
    COP [89]
    COP [83] ( #24, #03, #13 )
    COP [89]
    COP [81] ( #24, #03 )
    COP [89]
    COP [87] ( #23, #18, #03, #13 )
    COP [8A]
    COP [87] ( #23, #18, #03, #11 )
    COP [8A]
    COP [CB]
    JMP $&code_048011
    COP [07] ( #18 )
    RTL 
}