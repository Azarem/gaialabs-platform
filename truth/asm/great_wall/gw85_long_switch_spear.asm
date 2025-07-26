
---------------------------------------------

h_gw85_long_switch_spear [
  h_actor < #1C, #00, #02 >   ;00
]

---------------------------------------------

e_gw85_long_switch_spear {
    COP [80] ( #1F )
    COP [89]
    COP [0B]
    COP [0D] ( #00, #03 )
    COP [D2] ( #03, #01 )
    COP [CE] ( #03 )
    COP [0C]
    COP [0E] ( #00, #03 )
    LDA #$0100
    TSB $10
    COP [80] ( #20 )
    COP [89]
    LDA #$0100
    TRB $10
    COP [DA] ( #77 )
    BRA e_gw85_long_switch_spear
}