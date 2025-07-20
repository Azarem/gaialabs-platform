?INCLUDE 'table_0EDA00'

!joypad_mask_std                065A

---------------------------------------------

h_fr32_locked_door [
  h_actor < #01, #00, #18 >   ;00
]

---------------------------------------------

e_fr32_locked_door {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [B6] ( #20 )
    COP [21] ( #01, &code_05CFDF )

  code_05CFD1:
    COP [80] ( #01 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_05CFF8 )
    COP [C1]
    RTL 
}

code_05CFDF {
    COP [80] ( #00 )
    COP [89]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [06] ( #0E )
    LDA #$CFF0
    TRB $joypad_mask_std
    BRA code_05CFD1
}

code_05CFF8 {
    COP [BF] ( &widestring_05CFFD )
    RTL 
}

widestring_05CFFD `[DEF]Will: [N][LU1:1D]locked [LU1:8E][N]the inside... [END]`