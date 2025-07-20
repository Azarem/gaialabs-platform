?INCLUDE 'system_strings'

!joypad_mask_std                065A
!_TM                            212C
!STAT78                         213F
!MEMSEL                         420D

---------------------------------------------

h_sFB_actor_0BC8BA [
  h_actor < #00, #00, #18 >   ;00
]

---------------------------------------------

e_sFB_actor_0BC8BA {
    LDA #$4000
    TSB $09EC
    LDA #$0000
    STA $7F0A00
    SEP #$20
    LDA #$01
    STA $MEMSEL
    LDA #$10
    STA $_TM
    REP #$20
    LDA #$FFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA $STAT78
    BIT #$10
    BEQ code_0BC8EA
    JMP $&func_0BC896
}

code_0BC8EA {
    REP #$20
    COP [BC] ( #08, #00 )
    COP [D0] ( #10, #01, &code_0BC90F )
    COP [BC] ( #00, #F0 )
    COP [84] ( #01, #02 )
    COP [8A]
    COP [CC] ( #10 )
    COP [26] ( #FB, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

code_0BC90F {
    COP [84] ( #00, #02 )
    COP [8A]
    COP [CE] ( #10 )
    COP [26] ( #FC, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

---------------------------------------------

func_0BC896 {
    REP #$20
    COP [50] ( @palette_1E1D35, #00, #00, #08 )
    LDA #$0000
    STA $7F0A00
    COP [BD] ( @asciistring_01D9D8 )
    SEP #$20
    LDA #$04
    STA $_TM
    REP #$20
    COP [C1]
    RTL 
}

---------------------------------------------

code_0BC8B8_noref {
    REP #$20
}