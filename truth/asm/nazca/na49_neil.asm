
?INCLUDE 'player_character'

!joypad_mask_std                065A
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_na49_neil [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_na49_neil {
    COP [9C] ( @code_05DCED, #$2000 )
    COP [0B]
    COP [C0] ( &code_05D96F )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA #$0098
    STA $0014, Y
    LDA #$0100
    STA $0016, Y
    COP [DA] ( #1D )
    COP [CA] ( #02 )
    COP [08] ( #$0505 )
    COP [DA] ( #13 )
    COP [CB]
    COP [BF] ( &widestring_05D984 )
    COP [08] ( #$0E0E )
    COP [DA] ( #1D )
    LDY $player_actor
    LDA #$*func_05D942
    STA $0002, Y
    LDA #$&func_05D942
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA $0010, Y
    AND #$FFF7
    STA $0010, Y
    LDA #$0800
    TSB $player_flags
    COP [DA] ( #3B )
    COP [CC] ( #01 )
    COP [D2] ( #01, #00 )
    COP [84] ( #15, #14 )
    COP [8A]
    COP [84] ( #12, #3C )
    COP [8A]
    COP [BF] ( &widestring_05D9C1 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [BF] ( &widestring_05DA04 )
    COP [CC] ( #03 )
    COP [D2] ( #03, #00 )
    COP [BF] ( &widestring_05DAC7 )
    LDA #$0000
    STA $0AA6
    COP [CC] ( #05 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

---------------------------------------------

func_05D942 {
    COP [CA] ( #03 )
    COP [91] ( #09, #02 )
    COP [89]
    COP [CB]
    LDY $player_actor
    LDA #$*code_02C3C8
    STA $0002, Y
    LDA #$&code_02C3C8
    STA $0000, Y
    LDA #$0000
    STA $002C, Y
    STA $002E, Y
    LDA $0010, Y
    ORA #$0008
    STA $0010, Y
    RTL 
}

code_05D96F {
    LDA $0AA6
    CMP #$000F
    BEQ code_05D97C
    COP [BF] ( &widestring_05DB1C )
    RTL 
}

code_05D97C {
    COP [BF] ( &widestring_05DB9C )
    COP [CC] ( #06 )
    RTL 
}

widestring_05D984 `[PAU:1E][TPL:A][TPL:6][LU1:36][N][LU1:1D]open, [LU1:79]in. [FIN][TPL:0]Will: [N]Neil. [LU1:1D]me. [N]Will [LU1:8E][LU1:47]Cape.[END]`

widestring_05D9C1 `[TPL:A][TPL:6][LU1:36][N]Oh! Will! [N][LU1:67]gotten strong! [FIN]Are all of [LU1:E4]people[N][LU1:FE]friends?[END]`

widestring_05DA04 `[TPL:B][TPL:6][LU1:36][LU1:1C]hey. [N]Both of you [LU2:AC][N][LU2:92] harshly. [FIN][LU1:61][LU1:FF]wrapped up [N]in [LU2:78]something, [N]you [LU1:82][LU2:57][N][LU1:6B][LU1:FE]appearance. [FIN]I [LU1:82][LU1:DA]the smell [N]is [LU1:D7]bad. Not enough [N]to hate me for it. [FIN][LU1:20][LU2:89][LU1:70]wearing[N][LU1:E4]socks for a month.[END]`

widestring_05DAC7 `[TPL:A][TPL:6][LU1:36][N][LU1:20][LU1:99]enough [N][LU1:6B]my socks. [FIN]Make yourself at home. [N][LU1:69]Will's friends. [N]Welcome. [END]`

widestring_05DB1C `[TPL:A][TPL:6][LU1:36][LU1:1D][LU1:70][LU1:6B][N]two [LU2:C6][LU2:A4]we [N][LU2:79]met, hasn't it? [FIN][LU1:20]invented lots of[N][LU1:E0][LU2:A4]then.[FIN]The four inventions in[N][LU1:D6]room are my[N][LU2:4D]work. [LU2:14]a look.[END]`

widestring_05DB9C `[TPL:B][TPL:6][LU2:3B]me why you came[N]to see me.[FIN][TPL:0]Will tells [LU2:23][LU1:6B][N]hearing his father's[N]voice, and visiting [FIN]the world's [LU2:98]in [N]his search to [N][LU1:90]the Mystic Statues. [FIN][TPL:6][LU1:36][N]Heh heh. [N]Interesting. [FIN]I, [LU2:B7][LU1:98]some[N]interest in ruins.[FIN]The [LU2:98]Will talked [N][LU1:6B]are [LU2:9F][LU1:BE][N]the world, but [LU2:AB][LU1:98][N][LU1:C8]in common. [FIN]Drawing a line among[N]the [LU2:98]makes a shape[N][LU1:D7][LU1:AA][LU1:A5]the[N][LU1:7E]of Cygnus.[END]`

code_05DCED {
    COP [C1]
    LDA $player_y_pos
    CMP #$00D0
    BEQ code_05DCF8
    RTL 
}

code_05DCF8 {
    COP [40] ( #$0400, &code_05DCFF )
    RTL 
}

code_05DCFF {
    COP [BF] ( &widestring_05DD04 )
    RTL 
}

widestring_05DD04 `[TPL:A][TPL:6][LU1:36]Will, [LU1:F4]are you [N][LU1:93]in [LU1:CE]a hurry? [N]Stay a while.[PAL:0][END]`