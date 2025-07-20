
!joypad_mask_std                065A
!CGADSUB                        2131

---------------------------------------------

h_sE9_mansion_intro [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sE9_mansion_intro {
    COP [D0] ( #29, #01, &code_08FC92 )
    SEP #$20
    LDA #$21
    STA $CGADSUB
    REP #$20
    COP [CC] ( #29 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08FCBE )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_08FC92 {
    COP [C1]
    COP [44] ( #32, #3E, #34, #3F, &code_08FCA6 )
    SEP #$20
    LDA #$21
    STA $CGADSUB
    REP #$20
    RTL 
}

code_08FCA6 {
    LDA #$0202
    STA $0648
    LDA #$0404
    STA $064A
    COP [26] ( #E3, #$0280, #$01A0, #80, #$2310 )
    COP [E0]
}

widestring_08FCBE `[TPL:A][TPL:0][LU1:61]I awoke, I was [N]standing in the entrance[N]to a [LU1:C7]mansion.[PAL:0][END]`