?INCLUDE 'sE6_gaia'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_ec13_lily [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

e_ec13_lily {
    COP [D0] ( #3A, #01, &code_09C037 )
    COP [DA] ( #01 )
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BC] ( #08, #00 )
    LDA $0AD4
    BEQ code_09BFD9
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_09C06C )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
}

code_09BFD9 {
    COP [C1]
    COP [21] ( #03, &code_09BFE1 )
    RTL 
}

code_09BFE1 {
    COP [CC] ( #3A )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_09C0A8 )
    COP [08] ( #$1616 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_09C226 )
    COP [DA] ( #3B )
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #36, #08 )
    COP [8A]
    COP [86] ( #36, #02, #14 )
    COP [8A]
    COP [86] ( #36, #02, #12 )
    COP [8A]
    COP [86] ( #36, #06, #02 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_09C037 {
    LDA $0AD4
    BEQ code_09C06A
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_09C06C )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
}

code_09C06A {
    COP [E0]
}

widestring_09C06C `[TPL:B][LU1:61]the [LU1:8C]are [N]destroyed,[N]Will can return to[N]his [LU1:C0]shape...[END]`

widestring_09C0A8 `[DEF][TPL:2]Girl: I saw you!![N]But I'm surprised![N]You can change[N][LU1:FE][LU2:A3][LU1:A5]me![FIN]I'm Lilly. An Itory [N][LU2:6C]protected by [N]the Flower Spirit. [FIN]How... How do you know[N]a [LU1:B4]you [LU1:7A]only[N][LU1:98][LU1:99][LU1:8E]us?[FIN][TPL:0]Will: I learned it [N][LU1:8E][LU1:17]Lola. [N]She hummed it whenever [N]she was upset. [FIN][TPL:2][LU1:2A]I [LU1:98]had [N][LU1:D0]of her pie. It [N]tastes rather unusual,[N][LU1:84]it? [FIN][TPL:0]Will: You [LU1:A4] [N]my grandmother?! [FIN][TPL:2][LU1:2A]Actually,[N]she asked me to[N]rescue you![PAL:0][END]`

widestring_09C226 `[DEF][TPL:2]Lilly:[N]The [LU2:A]is calling...[N]I [LU1:98]to go.[FIN][LU1:2A][N][LU2:3E][LU2:87]again! [N]Goodbye, Will![PAL:0][END]`