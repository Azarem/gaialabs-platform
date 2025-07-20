?BANK 05


---------------------------------------------

h_dm3F_actor_05D066 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_dm3F_actor_05D066 {
    COP [D1] ( #$0121, #01, &code_05D08B )
    COP [C1]
    LDA $0A01
    AND #$00FF
    CMP #$0004
    BEQ code_05D07E
    RTL 
}

code_05D07E {
    COP [CD] ( #$0121 )
    COP [32] ( #21 )
    COP [33]
    COP [08] ( #$0E0E )
}

code_05D08B {
    COP [A7]
    RTL 
}