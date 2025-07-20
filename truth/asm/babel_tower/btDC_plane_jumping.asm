
!joypad_mask_std                065A
!player_actor                   09AA
!_TM                            212C

---------------------------------------------

h_btDC_plane_jumping [
  h_actor < #06, #00, #18 >   ;00
]

---------------------------------------------

e_btDC_plane_jumping {
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$15
    STA $_TM
    REP #$20
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDY #$1000
    TYA 
    CLC 
    ADC #$0030
    TAY 
    LDA #$FFFE
    STA $002C, Y
    LDA #$0001
    STA $002E, Y
    LDA $14
    CLC 
    ADC #$009C
    STA $14
    COP [85] ( #06, #22, #14 )
    COP [8A]
    COP [9C] ( @code_0981E5, #$3000 )
    COP [85] ( #06, #46, #14 )
    COP [8A]

  code_098196:
    COP [D0] ( #01, #01, &code_0981A3 )
    COP [80] ( #06 )
    COP [89]
    BRA code_098196
}

code_0981A3 {
    COP [87] ( #06, #1E, #02, #02 )
    COP [8A]
    COP [A0] ( @code_098505, #$0020, #$0000, #$1800 )
    COP [DA] ( #C7 )
    COP [9C] ( @code_0981EE, #$3000 )
    COP [DB] ( #$0117 )
    COP [A0] ( @code_098505, #$0020, #$0000, #$1800 )
    COP [DA] ( #4F )
    LDA #$0404
    STA $064A
    COP [26] ( #DE, #$0078, #$00C0, #00, #$1100 )
    COP [C1]
    RTL 
}

code_0981E5 {
    COP [BF] ( &widestring_0981F4 )
    COP [CC] ( #01 )
    COP [E0]
}

code_0981EE {
    COP [BF] ( &widestring_0984B1 )
    COP [E0]
}

widestring_0981F4 `[TPL:A][TPL:6][DLY:0][LU1:36][LU2:3E]be [LU1:D9][N]soon, Will.[FIN]Say hello to [N][LU1:FE][LU2:67]for me. [FIN][TPL:0]Will: Thanks. [N]I [LU1:A4]you [LU1:EF][LU2:84][N]a [LU1:95]president. [FIN][TPL:3]Erik: Aaah. [N]I [LU2:6E]I [LU1:FA]see you [N]for a [LU1:A6]time. [FIN][LU1:61]you've finished[N][LU1:FE]business, hurry[N][LU1:73]to [LU1:47]Cape.[FIN][TPL:0]Will: Thank [LU2:C7]I'm [N]glad we all [LU1:B3]the [N]trip together. [FIN][TPL:3]Erik: [N]On [LU1:D6]trip, [LU1:89][N][LU1:8F]something. [FIN]Lance met [LU1:2C]and [N][LU1:8F]his [LU2:7A]father. [FIN][LU2:23]decided to [N][LU1:E7][LU1:BE]his [N]parents' company. [FIN][LU1:26][LU1:CB]to [LU2:95][N]live, and saw a [LU1:F5][N][LU1:BF]the castle. [FIN]I'm [LU1:93]to excuse [N]myself.[FIN]Finally, I can go [N]to the bathroom by [N]myself at night! [FIN][TPL:6][LU1:36][N]Ha ha ha. [LU1:24][LU1:A5]Erik. [FIN][LU1:26]hasn't [LU1:D4][N][LU1:6C]for a while. [FIN]I [LU1:FA]see Will for a [N][LU1:A6]time. [LU1:1F]say [N]goodbye to him. [FIN][TPL:1][LU1:25][N][DLY:4]Hmmm. Right...[FIN][TPL:6][DLY:1][LU1:36][N][LU2:41]reached the [N]Tower of Babel. [FIN]OK, Will. [N]Is [LU1:FE]parachute ready? [N][LU1:2B]go.[PAL:0][END]`

widestring_0984B1 `[TPL:A][TPL:0][DLY:2]I jumped out [LU1:BE]the[N]Tower of Babel.[FIN]I hadn't [LU1:70][LU1:D9][N]in a year and a half...[PAU:B4][PAL:0][CLD]`

code_098505 {
    COP [83] ( #05, #13, #11 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_098505
    COP [E0]
}