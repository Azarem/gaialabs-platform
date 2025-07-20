?INCLUDE 'chunk_008000'
?INCLUDE 'func_00CFAE'


---------------------------------------------

h_st68_kara [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_st68_kara {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06AF3E )
}

code_list_06AF3E [
  &code_06AF44   ;00
  &code_06AF81   ;01
  &code_06AF83   ;02
]

code_06AF44 {
    COP [D2] ( #01, #01 )
    COP [86] ( #1E, #02, #11 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06B064 )
    COP [D2] ( #03, #01 )
    COP [84] ( #1A, #06 )
    COP [8A]
    COP [80] ( #1D )
    COP [89]
    COP [BF] ( &widestring_06B0BC )
    COP [CC] ( #04 )
    COP [0C]
    COP [86] ( #1F, #02, #12 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [C1]
    RTL 
}

code_06AF81 {
    COP [E0]
}

code_06AF83 {
    COP [25] ( #15, #1B )
    COP [80] ( #1D )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [DA] ( #3B )
    COP [07] ( #1E )
    COP [DA] ( #59 )
    COP [07] ( #1E )
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [DA] ( #3B )
    COP [84] ( #1B, #10 )
    COP [8A]
    COP [84] ( #1D, #10 )
    COP [8A]
    COP [84] ( #1A, #10 )
    COP [8A]
    COP [84] ( #1D, #1E )
    COP [8A]
    COP [BF] ( &widestring_06B10B )
    COP [C8] ( &code_06B00C )
    COP [DA] ( #3B )
    COP [04] ( #06 )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_06B13C )
    COP [DA] ( #59 )
    COP [C8] ( &code_06B03C )
    COP [05] ( #1B )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_06B195 )
    COP [DA] ( #3B )
    COP [C8] ( &code_06B03C )
    COP [BF] ( &widestring_06B250 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06B3EC )
    JSL $@func_00B4CC
    LDA #$0404
    STA $064A
    COP [26] ( #69, #$02A0, #$00C0, #00, #$1300 )
    COP [C1]
    RTL 
}

code_06B00C {
    COP [DA] ( #27 )
    COP [07] ( #15 )
    COP [9C] ( @func_00CFAE, #$2800 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #3B )
    COP [CA] ( #02 )
    COP [07] ( #15 )
    COP [9C] ( @func_00CFAE, #$2800 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #17 )
    COP [CB]
    COP [C5]
}

code_06B03C {
    COP [CA] ( #02 )
    COP [07] ( #1E )
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [DA] ( #09 )
    COP [07] ( #1E )
    COP [DA] ( #09 )
    COP [07] ( #1E )
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [CB]
    COP [C5]
}

code_06B064 {
    COP [BF] ( &widestring_06B069 )
    RTL 
}

widestring_06B069 `[TPL:A][TPL:1][LU1:25][N]I [LU1:F1]a steak! [N]And a salad! [FIN]My skin has gone dry [N][LU1:8E]eating [N]weird food...[PAL:0][END]`

widestring_06B0BC `[TPL:A][TPL:1][LU1:25]Oh, no! [N]Will [LU1:8F][LU1:B7][N]mushrooms... [FIN][TPL:2][LU1:2A][LU1:1D]better[N][LU2:B5]starving.[N][LU1:63]let's eat.[PAL:0][END]`

widestring_06B10B `[TPL:A][TPL:1][LU1:25]Wait. [N]I [LU1:9B]it again!! [N][LU1:62]is [LU1:D7]sound...? [PAL:0][END]`

widestring_06B13C `[TPL:A][TPL:3]Erik: [N][LU1:30][LU1:9F]Riverson...? [FIN][TPL:1][DLY:0][LU1:25][N]Oh, no! [LU2:41][N]got to run!! [FIN][TPL:2]Lilly:[N]Run?[N]Run where?![PAL:0][END]`

widestring_06B195 `[TPL:A][TPL:6][LU1:36][N]Quiet, everyone! [N]This vibrating sound... [FIN][LU1:1D]Morse Code...[FIN][LU1:1D]a signal ships use[N]to [LU2:AC]to each other.[FIN]The length of the[N]sound indicates letters.[FIN][LU1:2B]see if I can[N]decode it...Wait...[PAL:0][END]`

widestring_06B250 `[TPL:A][TPL:5][DLY:5]This is Seth... [FIN][TPL:4][DLY:0]Lance: [N]Seth?!! [FIN][TPL:2][DLY:0]Lilly:[N]Shh. Quiet![N][PAU:3C][DLY:0][LU2:23]continues. [FIN][TPL:5][DLY:5]I was swallowed by[N]Riverson...[FIN][LU1:61]I [LU1:80]to, the form[N]of my [LU1:72]had changed[N]to Riverson's.[FIN]This Riverson is a[N]creature who lives in[N]the ocean.[FIN]I [LU1:82]know[N]if [LU1:9F][LU1:9A]or not.[FIN]He [LU1:D4][LU1:D7]evolution[N]is [LU1:77]affected[N]by the [LU1:A8]of a comet.[FIN]I [LU1:FC]to continue[N]the journey [LU1:F0]you,[N]but not in [LU1:D6]body.[FIN]You [LU1:B2]figure [N]out [LU1:D6]riddle of the [N][LU1:7B]and the ruins...[PAL:0][END]`

widestring_06B3EC `[TPL:A][TPL:6][LU1:36]I [LU1:82][N][LU1:9B][LU1:6C]now... [FIN][TPL:1][LU1:25][N]Seth.... [N]I'm scared..... [FIN][TPL:4]Lance: This guy [N][LU1:B2][LU1:98]studied [N]Morse code. [FIN]Seth, [LU2:B7]did a [N][LU1:94]thing. [FIN][TPL:3]Erik: [N]But Seth [LU1:83][LU1:98][N]a [LU1:9A]form!! [FIN][TPL:6][LU1:36][N]No, Erik. [LU1:D][N]jump to conclusions. [FIN][LU1:38]humans think[N][LU1:D7][LU1:9A][LU2:A3]is[N]the [LU2:4D]one.[FIN][LU1:63][N]cheer up. [LU1:2B]go![PAL:0][END]`