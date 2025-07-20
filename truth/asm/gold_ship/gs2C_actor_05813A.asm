?INCLUDE 'table_0EE000'

!player_x_pos                   09A2

---------------------------------------------

h_gs2C_actor_05813A [
  h_actor < #02, #00, #2B >   ;00
]

---------------------------------------------

e_gs2C_actor_05813A {
    COP [DA] ( #0F )
    COP [9C] ( @code_058149, #$0B00 )
    BRA e_gs2C_actor_05813A
}

code_058149 {
    COP [88] ( @table_0EE000 )
    COP [B6] ( #30 )
    COP [23]
    SEC 
    SBC #$0080
    CLC 
    ADC $player_x_pos
    STA $14
    COP [23]
    AND #$007F
    CLC 
    ADC #$0218
    STA $16
    COP [80] ( #02 )
    COP [89]
    COP [E0]
}