?INCLUDE 'func_00CF8E'

!joypad_mask_std                065A

---------------------------------------------

h_ir25_ceiling_tile [
  h_actor < #18, #00, #23 >   ;00
]

---------------------------------------------

e_ir25_ceiling_tile {
    COP [BC] ( #08, #00 )
    COP [D0] ( #2F, #01, &code_09C38D )
    COP [D2] ( #2F, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CF8E, #$2000 )
    COP [DA] ( #B3 )
    COP [23]
    STA $08
    COP [C2]
    LDA $16
    SEC 
    SBC #$0100
    STA $16
    LDA #$2000
    TRB $10
    COP [B2]
    COP [86] ( #18, #02, #0F )
    COP [8A]
    COP [08] ( #$1515 )
    COP [B4]
    COP [82] ( #18, #35 )
    COP [89]
    BRA code_09C38D
}

code_09C38D {
    LDA #$2000
    TRB $10
    COP [B3]
    COP [11]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}