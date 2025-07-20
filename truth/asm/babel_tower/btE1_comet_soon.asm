?INCLUDE 'player_character'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_btE1_comet_soon [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_btE1_comet_soon {
    COP [28] ( #$0180, #$07A0, &code_099641 )
    COP [E0]
}

code_099641 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [51] ( @bmp_0F658E, $7E7000 )
    COP [4F] ( $7E7000, #$5000, #$0800 )
    COP [4F] ( $7E7800, #$5400, #$0800 )
    COP [4F] ( $7E8000, #$5800, #$0800 )
    COP [4F] ( $7E8800, #$5C00, #$0800 )
    COP [50] ( @palette_1F00C0, #10, #B0, #40 )
    COP [51] ( @sprite_120BCD, $7E4000 )
    LDA #$DFF0
    TRB $joypad_mask_std
    STZ $0676
    STZ $0685
    COP [CC] ( #0F )
    LDA #$0200
    TSB $12
    COP [8D] ( #00 )
    LDA #$0158
    STA $7F0018, X
    LDA #$07A0
    STA $7F001A, X
    COP [22] ( #01, #01 )
    COP [0B]
    COP [C0] ( &code_099746 )
    COP [D2] ( #02, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0008
    STA $7F001A, X
    COP [22] ( #01, #01 )
    COP [DA] ( #3B )
    COP [9A] ( @code_09979D, #$2000 )
    LDY $player_actor
    LDA #$*func_0997B7
    STA $0002, Y
    LDA #$&func_0997B7
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags

  code_0996FA:
    COP [82] ( #01, #08 )
    COP [89]
    LDA $16
    CMP #$00E0
    BCS code_0996FA
    LDA $14
    STA $7F0018, X
    LDA #$0080
    STA $7F001A, X
    COP [22] ( #01, #02 )
    COP [DA] ( #3B )
    LDA #$0178
    STA $7F0018, X
    LDA #$00A0
    STA $7F001A, X
    COP [22] ( #01, #01 )
    COP [DA] ( #31 )
    COP [CC] ( #04 )
    COP [A8]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [87] ( #01, #0A, #02, #04 )
    COP [8A]
    COP [C1]
    RTL 
}

code_099746 {
    COP [BF] ( &widestring_09974E )
    COP [CC] ( #02 )
    RTL 
}

widestring_09974E `[DEF]The [LU1:7B][LU1:EF]soon be[N]entering [LU2:B]orbit.[N]We [LU1:B2]go to the top of[N]the Tower of Babel...[END]`

code_09979D {
    COP [C1]
    PHX 
    LDX $24
    LDY $player_actor
    LDA $0014, X
    STA $0014, Y
    LDA $0016, X
    CLC 
    ADC #$000A
    STA $0016, Y
    PLX 
    RTL 
}

---------------------------------------------

func_0997B7 {
    COP [B6] ( #30 )
    COP [8F] ( #19 )
    COP [89]
    COP [D0] ( #04, #00, &func_0997B7 )
    COP [B6] ( #20 )
    JML $@code_02C3C8
}