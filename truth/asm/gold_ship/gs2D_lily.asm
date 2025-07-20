?INCLUDE 'entry_points_00C418'
?INCLUDE 'player_character'
?INCLUDE 'func_00CFAE'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_gs2D_lily [
  h_actor < #23, #00, #18 >   ;00
]

---------------------------------------------

e_gs2D_lily {
    COP [0B]
    COP [C0] ( &code_058DB1 )
    COP [D0] ( #50, #01, &code_058CFF )
    COP [CC] ( #50 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA #$*func_00C45E
    STA $0002, Y
    LDA #$&func_00C45E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0800
    TRB $10
    COP [DA] ( #1D )
    COP [BF] ( &widestring_058DBB )
    COP [DA] ( #3B )
    LDY $player_actor
    LDA #$*code_02C3C8
    STA $0002, Y
    LDA #$&code_02C3C8
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_058CFF {
    LDA #$0800
    TSB $10
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [25] ( #1D, #0D )
    COP [85] ( #29, #02, #01 )
    COP [8A]
    COP [82] ( #27, #02 )
    COP [89]
    COP [85] ( #29, #03, #01 )
    COP [8A]
    COP [82] ( #26, #01 )
    COP [89]
    COP [85] ( #29, #02, #01 )
    COP [8A]
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    LDA #$0800
    TRB $10
    COP [D2] ( #02, #01 )
    COP [BF] ( &widestring_058E4A )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #3B )
    COP [CA] ( #02 )
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #17 )
    COP [CB]
    COP [BF] ( &widestring_058F44 )
    COP [04] ( #06 )
    COP [09] ( #0A )
    COP [DA] ( #77 )
    LDA #$0001
    STA $06F6
    COP [C0] ( &code_058DB6 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    COP [23]
    AND #$00E0
    BNE code_058D9D
    RTL 
}

code_058D9D {
    STA $08
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    RTL 
}

code_058DB1 {
    COP [BF] ( &widestring_058DDA )
    RTL 
}

code_058DB6 {
    COP [BF] ( &widestring_058F53 )
    RTL 
}

widestring_058DBB `[TPL:A][TPL:2][LU1:2A][N]Will! [FIN]Will! Wake up![PAL:0][END]`

widestring_058DDA `[TPL:A][TPL:2][LU1:2A][LU1:69][LU1:73]so[N]late, the [LU2:A]must[N][LU1:98]read [LU1:FE]fortune.[FIN]He [LU1:D4][LU1:D7]you [LU1:F2][N]floating alone on the [N]sea. I was so surprised.[PAL:0][END]`

widestring_058E4A `[TPL:B][TPL:2][LU1:2A]That ring must[N]be one of the artifacts[N]put on [LU1:D6]ship.[FIN]This is the [LU2:88]valuable [N]of all the artifacts. [FIN][TPL:1][LU1:25][LU2:20][LU1:C1][N][LU1:98][LU2:7A][LU1:E1]lives [N][LU2:B2]to get rich [N]by finding [LU1:D6]ring. [FIN]I [LU1:F1]the ring. [N][LU1:1D]so pretty. I [N][LU2:95][LU1:B2][LU1:98]it. [FIN][TPL:2][LU1:2A][LU2:14]you[N]no shame!?!?[N]You [LU1:7A]be cursed!!![PAL:0][END]`

widestring_058F44 `[TPL:9][TPL:1][LU1:25][N]What?[PAL:0][END]`

widestring_058F53 `[TPL:B][TPL:2][LU1:2A][N][LU1:30]it belongs to[N]Riverson! [FIN]In [LU1:D6]part of the [N]ocean, [LU1:D9]are [LU2:62][N][LU1:D7]are as dangerous [N]as, well, sharks!![PAL:0][END]`