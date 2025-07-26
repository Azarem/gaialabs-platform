
?INCLUDE 'btE1_comet_soon'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btE2_brought_back [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_btE2_brought_back {
    LDA #$0200
    TSB $12
    COP [B6] ( #30 )
    COP [0B]
    COP [C0] ( &code_09985E )
    COP [D2] ( #01, #01 )
    LDA #$0001
    TSB $10
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    CLC 
    ADC #$0008
    STA $7F001A, X
    COP [22] ( #00, #01 )
    COP [9A] ( @code_099899, #$2000 )
    LDY $player_actor
    LDA #$*func_0997B7
    STA $0002, Y
    LDA #$&func_0997B7
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags

  code_099827:
    COP [82] ( #00, #08 )
    COP [89]
    LDA $16
    CMP #$0090
    BCS code_099827
    COP [DA] ( #3B )
    LDA #$0188
    STA $7F0018, X
    LDA #$0110
    STA $7F001A, X
    COP [22] ( #00, #01 )
    COP [A8]
    COP [CC] ( #04 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [86] ( #00, #0A, #04 )
    COP [8A]
    COP [C1]
    RTL 
}

code_09985E {
    COP [BF] ( &widestring_099866 )
    COP [CC] ( #01 )
    RTL 
}

widestring_099866 `[DEF]You [LU1:F2][LU1:75][LU1:73]to [N][LU1:D1]Earth. [LU1:1F][LU1:E7][N]you to the top floor.[END]`

code_099899 {
    COP [C1]
    PHX 
    LDX $24
    LDY $player_actor
    LDA $0014, X
    STA $0014, Y
    LDA $0016, X
    SEC 
    SBC #$0008
    STA $0016, Y
    PLX 
    RTL 
}