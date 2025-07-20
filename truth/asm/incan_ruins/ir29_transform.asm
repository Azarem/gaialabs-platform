?INCLUDE 'sE6_gaia'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_ir29_transform [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_ir29_transform {
    COP [D1] ( #$011F, #01, &code_09CFEB )
    COP [C1]
    LDA $0AEC
    BEQ code_09CF98
    RTL 
}

code_09CF98 {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [32] ( #1F )
    COP [33]
    COP [CD] ( #$011F )
    COP [05] ( #1B )
    COP [DA] ( #77 )
    LDA $0AD4
    BEQ code_09CFE5
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #59 )
    COP [BF] ( &widestring_09CFED )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_09CFE5
    RTL 
}

code_09CFE5 {
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_09CFEB {
    COP [E0]
}

widestring_09CFED `[TPL:A]After the demon [N]disappears, Will returns[N]to his [LU1:C0]shape...[END]`