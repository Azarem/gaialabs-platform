?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_028000'

!joypad_mask_std                065A
!player_actor                   09AA
!APUIO1                         2141

---------------------------------------------

h_sp5C_stone_coffin [
  h_actor < #00, #02, #30 >   ;00
]

---------------------------------------------

e_sp5C_stone_coffin {
    COP [D1] ( #$013B, #01, &code_069291 )
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_0692CF )

  code_0691BE:
    COP [D2] ( #02, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $16
    COP [85] ( #33, #04, #14 )
    COP [8A]
    COP [84] ( #33, #04 )
    COP [8A]
    LDA #$02C0
    STA $7F0018, X
    LDA #$009C
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    COP [DA] ( #3B )
    COP [32] ( #3B )
    COP [33]
    COP [CD] ( #$013B )
    COP [DA] ( #3B )
    LDA #$02C0
    STA $14
    LDA #$00A0
    STA $16
    LDA #$2000
    TRB $10
    JSL $@func_02A10A
    BCS code_069297
    COP [D4] ( #11, &code_069293 )
    COP [BF] ( &widestring_069377 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_06939E )
    COP [DA] ( #03 )
    COP [C1]
    LDA #$CFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_06925B
    RTL 
}

code_06925B {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [84] ( #33, #04 )
    COP [8A]
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_069291 {
    COP [E0]
}

code_069293 {
    COP [BF] ( &widestring_0693B7 )
}

code_069297 {
    COP [CF] ( #$013B )
    COP [CE] ( #02 )
    COP [84] ( #33, #04 )
    COP [8A]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #33, #01 )
    LDA #$2000
    TSB $10
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [25] ( #2B, #0A )
    JMP $&code_0691BE
}

code_0692CF {
    COP [D0] ( #6F, #01, &code_0692DA )
    COP [BF] ( &widestring_0692E2 )
    RTL 
}

code_0692DA {
    COP [BF] ( &widestring_06930A )
    COP [CC] ( #02 )
    RTL 
}

widestring_0692E2 `[DEF][TPL:0]Will: The coffins are [N]lined up...[PAL:0][END]`

widestring_06930A `[DEF][TPL:2][LU1:2C]speaks from[N]his pocket.[FIN][TPL:2]Lilly:[N]Isn't [LU1:D9]a hole in[N]the coffin?[FIN]I [LU1:7A]get in [LU1:DC][N]the hole. I [LU2:50][N][LU1:98]a look.[PAL:0][END]`

widestring_069377 `[DEF][TPL:2]Lilly:[N]I [LU1:8F]a [LU1:C7]stone[N][LU1:A2][LU1:D6]coffin.[PAL:0][FIN]`

widestring_06939E `[CLR][SFX:0][DLY:9][LU1:67][LU1:8F]the [N][LU1:40]Stone![PAU:78][END]`

widestring_0693B7 `[DEF][TPL:2]Lilly:[N]I [LU1:8F]a [LU1:C7]stone[N][LU1:A2][LU1:D6]coffin.[FIN]But [LU1:FE]inventory[N]is full...[PAL:0][END]`