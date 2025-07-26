
?INCLUDE 'thinker_00B7F4'
?INCLUDE 'chunk_008000'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA
!CGADSUB                        2131

---------------------------------------------

h_sp5D_fountain [
  h_actor < #26, #02, #03 >   ;00
]

---------------------------------------------

e_sp5D_fountain {
    STZ $066D
    COP [D0] ( #70, #01, &code_0694A8 )
    COP [D0] ( #6F, #00, &code_0694A8 )
    COP [D6] ( #11, &code_069412 )
    JMP $&code_0694A8
}

code_069412 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0694AA )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #0E, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $16
    COP [A2] ( @code_069502, #$2000 )
    COP [08] ( #$2525 )
    COP [B6] ( #30 )
    COP [CA] ( #40 )
    COP [C2]
    COP [82] ( #26, #02 )
    COP [89]
    COP [CB]
    COP [DA] ( #3B )
    LDA #$0100
    STA $7F0018, X
    LDA #$0160
    STA $7F001A, X
    COP [22] ( #26, #01 )
    LDA #$2000
    TSB $10
    SEP #$20
    LDA #$03
    STA $CGADSUB
    REP #$20
    COP [3C] ( @e_thinker_00B7F4 )
    COP [CC] ( #0F )
    COP [DA] ( #3B )
    COP [3C] ( @e_thinker_00B7F4 )
    COP [3B] ( #26, @func_00B519 )
    COP [DB] ( #$02B1 )
    COP [CE] ( #0F )
    COP [CC] ( #70 )
    COP [10] ( #0D, #0F )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_0694A8 {
    COP [E0]
}

widestring_0694AA `[DEF][TPL:2][LU1:2A]What!! [LU1:1D]a [N][LU1:C7]fountain... [FIN]Could [LU1:D9]be a[N]connection between this[N]and the rock...?[PAL:0][END]`

code_069502 {
    LDA $0036
    AND #$0003
    BNE code_06951D
    LDY $04
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [9C] ( @code_06951E, #$0B02 )
}

code_06951D {
    RTL 
}

code_06951E {
    COP [23]
    AND #$0003
    DEC 
    CLC 
    ADC $14
    STA $14
    COP [88] ( @table_0EE000 )
    COP [80] ( #02 )
    COP [89]
    COP [E0]
}