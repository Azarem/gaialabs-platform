
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA
!COLDATA                        2132

---------------------------------------------

h_na4B_buried_tile [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_na4B_buried_tile {
    COP [9C] ( @code_05E7D0, #$2000 )
    COP [D2] ( #09, #01 )
    COP [C0] ( &code_05E6AD )
    COP [D2] ( #0F, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    LDA #$00E0
    STA $7F0010, X
    COP [CA] ( #08 )
    LDA $7F0010, X
    SEP #$20
    STA $COLDATA
    REP #$20
    INC 
    STA $7F0010, X
    COP [DA] ( #1F )
    COP [CB]
    COP [BF] ( &widestring_05E753 )
    COP [CC] ( #0C )
    COP [DA] ( #3B )
    COP [9C] ( @code_05E7A6, #$0300 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_05E774 )
    LDA #$0404
    STA $064A
    COP [26] ( #4C, #$0168, #$0040, #83, #$2200 )
    COP [C1]
    RTL 
}

code_05E6AD {
    COP [D0] ( #0B, #00, &code_05E6BB )
    COP [BF] ( &widestring_05E6C0 )
    COP [CC] ( #0F )
    RTL 
}

code_05E6BB {
    COP [BF] ( &widestring_05E721 )
    RTL 
}

widestring_05E6C0 `[DEF][TPL:0][DLY:0]There's a tile buried[N]in the sand...[FIN][LU1:61]Will's Flute [N]touched it, [LU1:D9][N]was a rumbling sound![PAL:0][END]`

widestring_05E721 `[DEF][TPL:6][LU1:36]Will! [LU1:D][N][LU1:A9]yet! You [LU1:82][N][LU1:A4]what's in there!![PAL:0][END]`

widestring_05E753 `[DEF][TPL:3][DLY:0]Erik: [N][LU2:15][LU1:4B][LU1:9C][N]is [LU1:81]down!![PAL:0][END]`

widestring_05E774 `[TPL:E][TPL:1][DLY:0][LU1:25][N]Will! Will! [N]Wi-i-i-i-i-i-l-l-l-l! [PAL:0][PAU:28][CLD]`

code_05E7A6 {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [88] ( @table_0EE000 )
    COP [80] ( #1C )
    COP [89]
    COP [08] ( #$0C0C )
    COP [CC] ( #0D )
    COP [C1]
    RTL 
}

code_05E7D0 {
    COP [C1]
    LDY $player_actor
    LDA $0014, Y
    CMP #$0008
    BEQ code_05E7F0
    CMP #$03F8
    BEQ code_05E7F7
    LDA $0016, Y
    CMP #$0020
    BEQ code_05E7FE
    CMP #$0400
    BEQ code_05E805
    RTL 
}

code_05E7F0 {
    COP [40] ( #$0200, &code_05E80C )
    RTL 
}

code_05E7F7 {
    COP [40] ( #$0100, &code_05E80C )
    RTL 
}

code_05E7FE {
    COP [40] ( #$0800, &code_05E80C )
    RTL 
}

code_05E805 {
    COP [40] ( #$0400, &code_05E80C )
    RTL 
}

code_05E80C {
    COP [BF] ( &widestring_05E811 )
    RTL 
}

widestring_05E811 `[DEF][TPL:0]Will: [N]Nazca is huge, so [N][LU1:82]go too far....[PAL:0][END]`