
!joypad_mask_std                065A
!APUIO1                         2141

---------------------------------------------

h_ir1D_wind_melody [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_ir1D_wind_melody {
    COP [D0] ( #32, #01, &code_09C5CD )
    COP [C1]
    COP [28] ( #$0050, #$0170, &code_09C58D )
    RTL 
}

code_09C58D {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [04] ( #1B )
    COP [DA] ( #77 )
    COP [07] ( #16 )
    COP [BF] ( &widestring_09C5D5 )
    COP [04] ( #1A )
    COP [DA] ( #77 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_09C5BB
    RTL 
}

code_09C5BB {
    COP [D4] ( #08, &code_09C5CF )
    COP [BF] ( &widestring_09C614 )
    COP [CC] ( #32 )

  code_09C5C7:
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_09C5CD {
    COP [E0]
}

code_09C5CF {
    COP [BF] ( &widestring_09C637 )
    BRA code_09C5C7
}

widestring_09C5D5 `[TPL:10]The [LU2:C5]in the valley[N]plays a melody.[N]The [LU1:C9][LU1:CC]to[N]be singing...[END]`

widestring_09C614 `[DLG:3,11][SIZ:D,3][LU1:67]learned the[N][LU1:34]of the Wind![END]`

widestring_09C637 `[DLG:3,11][SIZ:D,3]You can [LU1:9B]the [LU1:34][N]of the Wind. But [LU1:FE][N][LU1:A0]is full. [END]`