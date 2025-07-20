?INCLUDE 'table_0EDA00'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_btE4_olman [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_btE4_olman {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_099068 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [A0] ( @code_0991F4, #$00D8, #$00F0, #$1000 )
    COP [07] ( #1D )
    COP [DA] ( #1D )
    COP [A0] ( @code_0992A0, #$0098, #$00E0, #$1000 )
    COP [07] ( #1D )
    COP [DA] ( #1D )
    COP [A0] ( @code_099347, #$00B8, #$0160, #$1000 )
    COP [07] ( #1D )
    COP [DA] ( #1D )
    COP [A0] ( @code_0993F8, #$0148, #$0130, #$1000 )
    COP [07] ( #1D )
    COP [DA] ( #1D )
    COP [A0] ( @code_0994A0, #$0158, #$00E0, #$1000 )
    COP [07] ( #1D )
    LDA #$0800
    TSB $10
    COP [C0] ( &code_099023 )

  code_099012:
    COP [C1]
    COP [89]
    COP [D0] ( #0F, #00, &code_099012 )
    COP [DA] ( #1D )
    COP [0C]
    COP [E0]
}

code_099023 {
    COP [D0] ( #01, #00, &code_099041 )
    COP [D0] ( #02, #00, &code_099041 )
    COP [D0] ( #03, #00, &code_099041 )
    COP [D0] ( #04, #00, &code_099041 )
    COP [D0] ( #05, #01, &code_099050 )
}

code_099041 {
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_099182 )
    LDA #$0800
    TSB $10
    RTL 
}

code_099050 {
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_0991A9 )
    COP [CC] ( #0F )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0800
    TSB $10
    RTL 
}

widestring_099068 `[TPL:F][TPL:4][DLY:0]Will's father: [N]The ancients worshipped [N]the [LU1:7B]as a spirit. [FIN]Those who bathed in [N]the [LU2:55][LU1:A8][LU1:F2][N]given a [LU1:C7]power. [FIN]The [LU1:7B]is [LU2:54]a [N]spirit. But [LU1:9F][N]an unwelcome spirit. [FIN]Evolving too fast[N]brings destruction...[FIN]As [LU1:A6]as people[N][LU1:98]evil hearts,[N][LU1:87][LU1:EF]be born.[FIN]Will, open [LU1:FE][LU2:60][N]and [LU1:A9]around. [END]`

widestring_099182 `[TPL:F][TPL:4]Will's father: I [LU1:BA][N]to [LU2:AC]to you.[PAL:0][END]`

widestring_0991A9 `[TPL:F][TPL:4][DLY:0]Will's father: At [LU2:79][N]the [LU1:DF]is near. [FIN]Everyone. [N]Give Will [LU1:FE]power![PAL:0][END]`

code_0991F4 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [88] ( @table_0EDA00 )
    COP [0B]
    COP [C0] ( &code_099232 )

  code_09920E:
    COP [80] ( #04 )
    COP [89]
    COP [D0] ( #0F, #00, &code_09920E )
    COP [0C]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #04, #01 )
    COP [E0]
}

code_099232 {
    COP [BF] ( &widestring_09923A )
    COP [CC] ( #01 )
    RTL 
}

widestring_09923A `[DEF][TPL:5]Seth: Ah, Will. [N][LU1:1D][LU1:70]a [LU1:A6]time. [FIN]Such a world. If I [N][LU1:7A][LU2:AC]of [LU1:D6]at [N]an academy I'd be [N]a [LU1:95]scholar.[PAL:0][END]`

code_0992A0 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [88] ( @table_0EDA00 )
    COP [0B]
    COP [C0] ( &code_0992E4 )

  code_0992BA:
    COP [80] ( #04 )
    COP [89]
    COP [D0] ( #0F, #00, &code_0992BA )
    COP [0C]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #04, #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_0992E4 {
    COP [BF] ( &widestring_0992EC )
    COP [CC] ( #02 )
    RTL 
}

widestring_0992EC `[DEF][LU1:37]father: [N]Neil... [N][LU1:62]are you doing!! [FIN]I [LU1:F1]him to [LU2:84]the[N][LU1:44]Company grow[N]bigger and bigger.[END]`

code_099347 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [88] ( @table_0EDA00 )
    COP [0B]
    COP [C0] ( &code_099385 )

  code_099361:
    COP [80] ( #04 )
    COP [89]
    COP [D0] ( #0F, #00, &code_099361 )
    COP [0C]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #04, #01 )
    COP [E0]
}

code_099385 {
    COP [BF] ( &widestring_09938D )
    COP [CC] ( #03 )
    RTL 
}

widestring_09938D `[DEF][LU1:37]mother: [LU1:12]if [N]I can see the real[N]world,[N]I [LU1:78]touch it... [FIN]No [LU1:B8]how difficult[N]it may get,[N]I [LU1:78]help you...[END]`

code_0993F8 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [88] ( @table_0EDA00 )
    COP [0B]
    COP [C0] ( &code_099436 )

  code_099412:
    COP [80] ( #04 )
    COP [89]
    COP [D0] ( #0F, #00, &code_099412 )
    COP [0C]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #04, #01 )
    COP [E0]
}

code_099436 {
    COP [BF] ( &widestring_09943E )
    COP [CC] ( #04 )
    RTL 
}

widestring_09943E `[DEF]Hamlet: [N][LU1:3A]oink!! [FIN][SFX:0][TPL:0]Will: [N]Of course. There's [N]no difference between [N]humans and animals...[PAL:0][END]`

code_0994A0 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [80] ( #1E )
    COP [89]
    COP [88] ( @table_0EDA00 )
    COP [0B]
    COP [C0] ( &code_0994DE )

  code_0994BA:
    COP [80] ( #04 )
    COP [89]
    COP [D0] ( #0F, #00, &code_0994BA )
    COP [0C]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #04, #01 )
    COP [E0]
}

code_0994DE {
    COP [BF] ( &widestring_0994E6 )
    COP [CC] ( #05 )
    RTL 
}

widestring_0994E6 `[DEF][LU2:40]my [LU1:72]gone, I [N]became forever young. [N][LU2:11]the [LU2:55]light, [N]I gained immortality. [FIN]But is [LU1:D9]meaning in [N]eternal life? I felt [N][LU1:B7]alive [LU1:F6]I had [N]a terminal disease. [END]`