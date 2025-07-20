?INCLUDE 'chunk_028000'

!joypad_mask_std                065A
!INIDISP                        2100

---------------------------------------------

h_sFC_actor_0BC9AE [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_sFC_actor_0BC9AE {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DB] ( #$021B )
    BRA code_0BC9C6
}

---------------------------------------------

h_sFC_actor_0BC9BD [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_sFC_actor_0BC9BD {
    LDA #$FFF0
    TSB $joypad_mask_std
}

code_0BC9C6 {
    COP [C1]
    COP [40] ( #$1001, &code_0BC9CF )
    RTL 
}

code_0BC9CF {
    STZ $0DB6
    LDA #$0000
    STA $064A
    LDA #$0001
    STA $0648
    COP [26] ( #FA, #$0100, #$0370, #00, #$4400 )
    COP [C2]
    PHD 
    PHX 
    LDA #$0000
    TCD 
    JSL $@func_028043
    PLX 
    PLD 
    COP [C1]
    SEP #$20
    LDA #$00
    STA $INIDISP
    REP #$20
    RTL 
}