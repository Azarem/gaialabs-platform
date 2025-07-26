
?INCLUDE 'bt_actor_099B1C'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA
!player_speed_ns                09B4

---------------------------------------------

h_btDF_crystal_ring [
  h_actor < #02, #00, #30 >   ;00
]

---------------------------------------------

e_btDF_crystal_ring {
    LDA #$0200
    TSB $12
    COP [A0] ( @e_bt_actor_099B1C, #$076E, #$017C, #$0B00 )
    COP [A0] ( @e_bt_actor_099B1C, #$076E, #$018C, #$0B00 )

  code_099990:
    COP [C1]
    COP [45] ( #75, #17, #77, #19, &code_09999B )

  code_09999A:
    RTL 
}

code_09999B {
    COP [D7] ( #27, &code_09999A )
    COP [08] ( #$1D1D )
    LDA #$0006
    STA $player_speed_ns
    COP [D6] ( #27, &code_09999A )
    COP [D0] ( #01, #01, &code_0999BF )
    COP [CC] ( #01 )
    COP [9C] ( @code_0999CC, #$3802 )
}

code_0999BF {
    COP [C1]
    COP [45] ( #75, #17, #77, #19, &code_0999CB )
    BRA code_099990
}

code_0999CB {
    RTL 
}

code_0999CC {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #0F )
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    COP [8D] ( #02 )
    COP [63] ( #02, #06, #00 )
    COP [AA] ( #12 )

  code_0999F7:
    COP [8B]
    LDA $2A
    BEQ code_0999F7
    LDA $08
    STZ $08
    STA $24

  code_099A03:
    COP [64]
    CMP #$0000
    BMI code_099A12
    COP [C2]
    DEC $24
    BPL code_099A03
    BRA code_0999F7
}

code_099A12 {
    COP [83] ( #02, #12, #45 )
    COP [89]
    LDA #$0002
    TRB $10
    LDA #$0001
    TSB $10
    COP [84] ( #02, #05 )
    COP [8A]
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_099A70 )
    LDA #$0800
    TSB $10
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_099A49 )
    COP [C1]
    COP [80] ( #02 )
    COP [89]
    RTL 
}

code_099A49 {
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_099A91 )
    LDA #$0800
    TSB $10
    COP [D4] ( #27, &code_099A6B )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_099AE4 )
    COP [E0]
    RTL 
}

code_099A6B {
    COP [BF] ( &widestring_099AFE )
    RTL 
}

widestring_099A70 `[TPL:A][TPL:0][LU1:4B][LU2:A0]to[N]fall [LU1:8E]the Flute...[PAL:0][END]`

widestring_099A91 `[TPL:A][TPL:0][LU1:1D][LU1:27]Edward's[N][LU1:7]Ring!![FIN]I [LU1:D8]it was a[N]decoration, but it had[N][LU1:70]hidden there...[PAL:0][FIN]`

widestring_099AE4 `[TPL:A][SFX:0][DLY:9]You [LU1:98]the[N][LU1:7]Ring![PAU:78][END]`

widestring_099AFE `[CLR][TPL:0]But [LU1:FE]inventory[N]is full![PAL:0][END]`