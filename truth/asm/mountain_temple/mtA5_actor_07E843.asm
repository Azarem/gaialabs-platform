
!joypad_mask_std                065A

---------------------------------------------

h_mtA5_actor_07E843 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mtA5_actor_07E843 {
    COP [D1] ( #$015F, #01, &f_mtA5_actor_07E843_destroy )
    COP [D2] ( #01, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [D5] ( #1A )
    COP [07] ( #0F )
    COP [32] ( #5A )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #5B )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #5C )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #5D )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #5E )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #5F )
    COP [33]
    COP [CD] ( #$015F )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

f_mtA5_actor_07E843_destroy {
    COP [E0]
}