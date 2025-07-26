
?INCLUDE 'py_actor_08B6F4'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_btE1_actor_099586 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_btE1_actor_099586 {
    COP [28] ( #$0180, #$07A0, &code_099625 )
    COP [C1]
    COP [45] ( #07, #7B, #0A, #7D, &code_09959C )
    RTL 
}

code_09959C {
    COP [3C] ( @code_099618 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DB] ( #$00EF )
    COP [CC] ( #00 )
    COP [DB] ( #$0167 )
    COP [CC] ( #01 )
    COP [9C] ( @e_py_actor_08B6F4, #$1002 )
    COP [C2]
    LDY $player_actor
    LDA $000E, Y
    EOR #$2000
    STA $000E, Y
    LDA $0014, Y
    CLC 
    ADC #$0190
    STA $0014, Y
    COP [C1]
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC #$0004
    STA $0016, Y
    CMP #$00B0
    BCC code_0995E9
    RTL 
}

code_0995E9 {
    LDY $player_actor
    LDA $0014, Y
    SEC 
    SBC #$0190
    STA $0014, Y
    COP [9C] ( @e_py_actor_08B6F4, #$1002 )
    COP [DA] ( #0F )
    LDY $player_actor
    LDA $000E, Y
    EOR #$2000
    STA $000E, Y
    COP [DA] ( #07 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_099618 {
    COP [37] ( #6D )
    COP [39]
    COP [C1]
    COP [37] ( #6F )
    COP [39]
    RTL 
}

code_099625 {
    COP [3C] ( @code_09962C )
    COP [E0]
}

code_09962C {
    COP [C1]
    COP [37] ( #6E )
    COP [39]
    RTL 
}