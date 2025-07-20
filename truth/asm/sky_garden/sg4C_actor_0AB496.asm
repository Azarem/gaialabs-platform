

---------------------------------------------

h_sg4C_actor_0AB496 [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_sg4C_actor_0AB496 {
    LDA $00B4
    BEQ code_0AB4AE
    COP [CA] ( #3C )
    LDA $0660
    BNE code_0AB4AE
    COP [CB]
    LDA #$FFFF
    STA $09AC
}

code_0AB4AE {
    COP [E0]
}