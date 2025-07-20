
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_mu67_neil [
  h_actor < #13, #00, #30 >   ;00
]

---------------------------------------------

e_mu67_neil {
    COP [D2] ( #03, #01 )
    COP [C1]
    COP [45] ( #01, #19, #0F, #1B, &code_06A757 )
    RTL 
}

code_06A757 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [CC] ( #04 )
    COP [51] ( @gfx_na49_actors, $7E7000 )
    COP [4F] ( $7E7000, #$5000, #$0800 )
    COP [4F] ( $7E7800, #$5400, #$0800 )
    COP [4F] ( $7E8000, #$5800, #$0800 )
    COP [4F] ( $7E8800, #$5C00, #$0800 )
    COP [50] ( @pal_na49_actors, #00, #A0, #50 )
    COP [51] ( @spm_na49_actors, $7E4000 )
    COP [CC] ( #88 )
    COP [04] ( #01 )
    LDA #$2000
    TRB $10
    COP [86] ( #17, #02, #02 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [DA] ( #45 )
    COP [BF] ( &widestring_06A7C7 )
    COP [9C] ( @e_mu67_lily, #$1002 )
    COP [C1]
    RTL 
}

widestring_06A7C7 `[TPL:A][TPL:6][LU1:36][N]Will! Are you OK?! [FIN][TPL:4]Lance: Will! [N]I [LU1:82]see Lilly. [N]Has [LU1:C8]happened? [FIN][TPL:2]Lilly:[N]I'm here.[PAL:0][END]`

---------------------------------------------

e_mu67_lily {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $16
    COP [86] ( #33, #04, #14 )
    COP [8A]
    COP [84] ( #33, #04 )
    COP [8A]
    LDA #$00A8
    STA $7F0018, X
    LDA #$01B0
    STA $7F001A, X
    COP [22] ( #33, #01 )
    COP [84] ( #33, #08 )
    COP [8A]
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06AA4C )
    COP [CC] ( #05 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06AA89 )
    COP [CC] ( #06 )
    COP [C1]
    RTL 
}

widestring_06AA4C `[TPL:A][TPL:2][LU1:2A][LU2:35]I worried [N][LU2:C7]Will was protecting [N]me, so I was OK.[PAL:0][END]`

widestring_06AA89 `[TPL:A][TPL:6][LU1:36][LU1:63]Will [N][LU1:CC]to [LU1:98][LU2:95][N]grown up.[PAL:0][END]`