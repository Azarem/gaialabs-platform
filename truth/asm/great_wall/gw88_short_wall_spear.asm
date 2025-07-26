
---------------------------------------------

h_gw88_short_wall_spear [
  h_actor < #1C, #00, #02 >   ;00
]

---------------------------------------------

e_gw88_short_wall_spear {
    LDA $0E
    STA $08
    LDA #$2000
    STA $0E
    COP [C2]

  code_0B8C06:
    COP [DA] ( #3B )
    LDA $10
    BIT #$4000
    BNE code_0B8C13
    COP [07] ( #1E )
}

code_0B8C13 {
    COP [80] ( #1D )
    COP [89]
    COP [0B]
    COP [DA] ( #3B )
    COP [0C]
    LDA #$0100
    TSB $10
    COP [80] ( #1E )
    COP [89]
    LDA #$0100
    TRB $10
    BRA code_0B8C06
}