
!joypad_mask_std                065A

---------------------------------------------

h_mtA5_actor_07E896 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mtA5_actor_07E896 {
    COP [D1] ( #$0167, #01, &f_mtA5_actor_07E896_destroy )
    COP [D2] ( #02, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [D5] ( #1A )
    COP [07] ( #0F )
    COP [32] ( #60 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #61 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #61 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #62 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #63 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #64 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #65 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #66 )
    COP [33]
    COP [07] ( #0F )
    COP [32] ( #67 )
    COP [33]
    COP [CD] ( #$0167 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [E0]
}

---------------------------------------------

f_mtA5_actor_07E896_destroy {
    COP [E0]
}