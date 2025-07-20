

---------------------------------------------

h_ec0F_spear1 [
  h_actor < #38, #02, #23 >   ;00
]

---------------------------------------------

e_ec0F_spear1 {
    COP [C1]
    COP [21] ( #03, &code_0A87D9 )
    RTL 
}

---------------------------------------------

h_ec0F_spear2 [
  h_actor < #38, #02, #23 >   ;00
]

---------------------------------------------

e_ec0F_spear2 {
    COP [C1]
    COP [21] ( #01, &code_0A87D9 )
    RTL 
}

code_0A87D9 {
    COP [23]
    AND #$003F
    STA $08
    COP [C2]
    COP [A2] ( @code_0A882D, #$0301 )
    LDA $16
    SEC 
    SBC #$0100
    STA $16
    LDA #$2000
    TRB $10
    COP [07] ( #13 )
    COP [82] ( #39, #0F )
    COP [89]
    LDA #$0100
    TRB $10
    COP [07] ( #1E )
    COP [B4]
    COP [80] ( #3A )
    COP [89]
    COP [0B]
    LDA #$0100
    TSB $10
    COP [DA] ( #EF )
    COP [CA] ( #20 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
    COP [0C]
    COP [E0]
}

code_0A882D {
    COP [80] ( #3B )
    COP [89]
    COP [C1]
    RTL 
}