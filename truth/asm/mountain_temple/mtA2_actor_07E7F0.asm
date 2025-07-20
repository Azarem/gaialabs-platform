
!joypad_mask_std                065A

---------------------------------------------

h_mtA2_actor_07E7F0 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mtA2_actor_07E7F0 {
    COP [D1] ( #$0159, #01, &f_mtA2_actor_07E7F0_destroy )
    COP [D2] ( #01, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [D5] ( #1A )
    COP [07] ( #0F )
    COP [32] ( #54 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #55 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #56 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #57 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #58 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #59 )
    COP [33]
    COP [CD] ( #$0159 )
    LDA #$EFF0
    TRB $joypad_mask_std
}

---------------------------------------------

f_mtA2_actor_07E7F0_destroy {
    COP [E0]
}