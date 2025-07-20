?INCLUDE 'player_character'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_awB3_actor_0898DA [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_awB3_actor_0898DA {
    COP [D1] ( #$016E, #01, &code_089928 )
    COP [C1]
    COP [45] ( #6A, #0C, #6F, #0D, &code_0898EF )
    RTL 
}

code_0898EF {
    COP [CA] ( #14 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CB]
    COP [08] ( #$0F0F )
    COP [32] ( #6E )
    COP [33]
    COP [CD] ( #$016E )
    LDY $player_actor
    SEP #$20
    LDA #$^func_02C61E
    STA $0002, Y
    REP #$20
    LDA #$&func_02C61E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0800
    TSB $player_flags
}

code_089928 {
    COP [E0]
}