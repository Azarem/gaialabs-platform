
!joypad_mask_std                065A

---------------------------------------------

h_ec0C_force_hint [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ec0C_force_hint {
    LDA $0ACA
    CMP #$0008
    BNE code_04DCBB
    COP [C1]
    LDA $0ACA
    CMP #$0008
    BNE code_04DCA8
    RTL 
}

code_04DCA8 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #27 )
    COP [BF] ( &widestring_04DCBD )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04DCBB {
    COP [E0]
}

widestring_04DCBD `[DEF][TPL:0][DLY:0]Will:[N][LU1:61]you defeat all of[N]the [LU1:8C][LU1:6D]you,[N]a Jewel [LU1:EF]appear.[PAL:0][END]`