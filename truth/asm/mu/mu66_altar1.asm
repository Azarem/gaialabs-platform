
!joypad_mask_std                065A

---------------------------------------------

h_mu66_altar1 [
  h_actor < #2D, #00, #30 >   ;00
]

---------------------------------------------

e_mu66_altar1 {
    COP [BC] ( #00, #F8 )
    COP [D2] ( #80, #01 )
    LDA #$2000
    TRB $10
    COP [80] ( #2D )
    COP [89]
    COP [D2] ( #81, #01 )
    COP [45] ( #00, #00, #20, #20, &code_069C6A )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    LDA #$0404
    STA $064A
    LDA #$0303
    STA $0648
    COP [26] ( #66, #$00F8, #$01D8, #80, #$2200 )
}

code_069C6A {
    COP [C1]
    RTL 
}