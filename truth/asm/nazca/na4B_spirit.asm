
!joypad_mask_std                065A

---------------------------------------------

h_na4B_spirit [
  h_actor < #32, #00, #30 >   ;00
]

---------------------------------------------

e_na4B_spirit {
    COP [D2] ( #06, #01 )
    COP [D2] ( #07, #01 )
    LDA #$2000
    TRB $10
    LDA #$0200
    TSB $12
    COP [CA] ( #03 )

  code_05F307:
    COP [80] ( #32 )
    COP [89]
    COP [21] ( #02, &code_05F313 )
    BRA code_05F307
}

code_05F313 {
    COP [BC] ( #70, #00 )
    COP [CB]
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #13 )
    COP [BF] ( &widestring_05F349 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [CC] ( #02 )
    COP [87] ( #32, #02, #11, #12 )
    COP [8A]
    COP [87] ( #32, #02, #01, #02 )
    COP [8A]
    COP [87] ( #32, #0D, #03, #04 )
    COP [8A]
    COP [E0]
}

widestring_05F349 `[DEF]Ku ku ku...[END]`