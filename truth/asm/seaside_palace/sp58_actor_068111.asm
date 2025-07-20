
!joypad_mask_std                065A
!player_actor                   09AA
!_TM                            212C

---------------------------------------------

h_sp58_actor_068111 [
  h_actor < #00, #02, #18 >   ;00
]

---------------------------------------------

e_sp58_actor_068111 {
    LDA #$1000
    TSB $12
    SEP #$20
    LDA #$15
    STA $_TM
    REP #$20
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA #$EFF0
    TSB $joypad_mask_std
    LDA $0AA6
    BNE code_068183
    COP [9C] ( @code_068185, #$2000 )

  code_068140:
    COP [82] ( #00, #11 )
    COP [89]
    COP [D0] ( #01, #00, &code_068140 )
    COP [D2] ( #02, #01 )
    COP [CE] ( #02 )
    LDA #$FFF0
    STA $16
    COP [86] ( #00, #34, #11 )
    COP [8A]
    COP [08] ( #$2C2C )
    COP [85] ( #02, #A0, #02 )
    COP [8A]
    LDA #$0002
    STA $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #58, #$0000, #$0000, #80, #$1100 )
    COP [C1]
    RTL 
}

code_068183 {
    COP [E0]
}

code_068185 {
    COP [DA] ( #03 )
    COP [04] ( #06 )
    COP [09] ( #0A )
    COP [E0]
}