?INCLUDE 'thinker_00B7CC'
?INCLUDE 'thinker_00B7D6'

!joypad_mask_std                065A

---------------------------------------------

h_awBC_blinding_light [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_awBC_blinding_light {
    COP [D0] ( #B7, #01, &code_089A3B )
    COP [CC] ( #B7 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_089A65 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_089A3B {
    COP [D7] ( #1C, &code_089A5B )
    COP [DA] ( #13 )

  code_089A43:
    COP [3C] ( @e_thinker_00B7CC )
    COP [DA] ( #B3 )
    COP [C1]
    COP [D7] ( #1C, &code_089A53 )
    RTL 
}

code_089A53 {
    COP [3C] ( @e_thinker_00B7D6 )
    COP [DA] ( #B3 )
}

code_089A5B {
    COP [C1]
    COP [D7] ( #1C, &code_089A64 )
    BRA code_089A43
}

code_089A64 {
    RTL 
}

widestring_089A65 `[DEF][TPL:0]Setting one foot inside,[N]the floating crystal[N][LU1:CB]to glow![PAL:0][END]`