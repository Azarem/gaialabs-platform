?BANK 05
?INCLUDE 'table_14C0C8'
?INCLUDE 'stats_01ABF0'
?INCLUDE 'entry_points_00C418'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_dc2F_actor_0596FA [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_dc2F_actor_0596FA {
    COP [54] ( @misc_fx_1CD180 )
    COP [88] ( @table_14C0C8 )
    COP [55] ( #00, #$2010 )
    COP [56]
    RTL 
}

---------------------------------------------

h_dc2F_adrift [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_dc2F_adrift {
    COP [D9] ( #$0AA6, &code_list_059718 )
}

code_list_059718 [
  &code_059726   ;00
  &code_059775   ;01
  &code_059941   ;02
  &code_059ABA   ;03
  &code_059B3B   ;04
  &code_059BB7   ;05
  &code_059C7A   ;06
]

code_059726 {
    COP [0B]
    COP [C0] ( &code_059749 )
    COP [D2] ( #03, #01 )
    COP [DA] ( #3B )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #2F, #$0070, #$0090, #00, #$1100 )
    COP [C1]
    RTL 
}

code_059749 {
    COP [D0] ( #01, #01, &code_05976D )
    COP [BF] ( &widestring_059D42 )
    COP [BE] ( #02, #01, &code_list_059759 )
}

code_list_059759 [
  &code_059765   ;00
  &code_05975F   ;01
  &code_059765   ;02
]

code_05975F {
    COP [BF] ( &widestring_059D91 )
    BRA code_059769
}

code_059765 {
    COP [BF] ( &widestring_059DCD )
}

code_059769 {
    COP [CC] ( #01 )
    RTL 
}

code_05976D {
    COP [BF] ( &widestring_059E6F )
    COP [CC] ( #02 )
    RTL 
}

code_059775 {
    LDA #$0008
    STA $0ACE
    LDA #$0200
    TSB $12
    COP [25] ( #09, #0A )
    COP [80] ( #13 )
    COP [89]
    COP [9C] ( @code_0597EB, #$2800 )
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059CEB )
    COP [0B]
    COP [C0] ( &code_05993C )
    COP [D2] ( #01, #01 )
    LDA #$0000
    STA $7F0010, X

  code_0597A8:
    COP [80] ( #14 )
    COP [89]
    COP [BF] ( &widestring_059F2E )
    COP [80] ( #13 )
    COP [89]
    COP [CE] ( #01 )
    COP [C1]
    COP [D0] ( #01, #01, &code_0597A8 )
    LDA $7F0010, X
    CMP #$0708
    BEQ code_0597D0
    INC 
    STA $7F0010, X
    RTL 
}

code_0597D0 {
    COP [BF] ( &widestring_059F5A )
    COP [CC] ( #4D )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #2F, #$0070, #$0090, #00, #$1100 )
    RTL 
}

code_0597EB {
    COP [23]
    AND #$0007
    ASL 
    ASL 
    ASL 
    ASL 
    ASL 
    STA $08
    COP [C2]
    COP [9C] ( @code_059805, #$0900 )
    COP [C4] ( @code_0597EB )
}

code_059805 {
    LDA #$1039
    TSB $12
    COP [B6] ( #20 )
    LDA #$&stats_01ABF0+4
    STA $7F0020, X
    LDA #$00FF
    STA $7F0026, X
    LDA #$0100
    STA $14
    COP [23]
    AND #$000F
    CLC 
    ADC #$0080
    STA $16
    COP [CA] ( #06 )
    COP [9C] ( @code_059935, #$1800 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    COP [87] ( #42, #08, #04, #04 )
    COP [8A]
    COP [87] ( #42, #04, #04, #02 )
    COP [8A]
    COP [85] ( #42, #06, #04 )
    COP [8A]
    COP [87] ( #43, #04, #04, #01 )
    COP [8A]
    COP [87] ( #43, #08, #04, #03 )
    COP [8A]
    LDA $7F0026, X
    CMP #$00FF
    BNE code_059893

  code_05986E:
    COP [9C] ( @code_059935, #$1800 )
    LDA $0012, Y
    ORA #$1000
    STA $0012, Y
    LDA #$2000
    TSB $10
    COP [BC] ( #E0, #00 )
    COP [DA] ( #27 )
    LDA #$2000
    TRB $10
    COP [CB]
    COP [E0]
}

code_059893 {
    LDA #$00FF
    STA $7F0026, X
    COP [CC] ( #01 )
    LDA $0AA6
    CMP #$0001
    BEQ code_05986E
    COP [B6] ( #30 )
    COP [B2]
    COP [87] ( #42, #04, #11, #04 )
    COP [8A]
    COP [87] ( #43, #04, #11, #02 )
    COP [8A]
    COP [85] ( #42, #07, #11 )
    COP [8A]
    COP [87] ( #43, #04, #11, #01 )
    COP [8A]
    COP [87] ( #42, #04, #11, #03 )
    COP [8A]
    COP [87] ( #43, #04, #11, #05 )
    COP [8A]
    COP [87] ( #42, #05, #11, #07 )
    COP [8A]
    COP [B4]
    COP [13] ( &code_05986E )
    LDA #$1000
    TSB $10
    COP [C0] ( &code_05992A )
    COP [CA] ( #08 )
    COP [86] ( #42, #03, #06 )
    COP [8A]
    COP [86] ( #43, #03, #02 )
    COP [8A]
    COP [86] ( #42, #03, #01 )
    COP [8A]
    COP [86] ( #43, #03, #05 )
    COP [8A]
    COP [84] ( #44, #08 )
    COP [8A]
    COP [CB]
    COP [CA] ( #14 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
    COP [E0]
}

code_05992A {
    COP [07] ( #22 )
    LDA #$0001
    STA $0B22
    COP [E0]
}

code_059935 {
    COP [80] ( #47 )
    COP [89]
    COP [E0]
}

code_05993C {
    COP [BF] ( &widestring_059EE3 )
    RTL 
}

code_059941 {
    LDA #$0004
    STA $0ACE
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059CF9 )
    COP [C0] ( &code_05999A )
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [85] ( #18, #02, #02 )
    COP [8A]
    COP [84] ( #14, #1E )
    COP [8A]
    COP [81] ( #18, #12 )
    COP [89]
    COP [80] ( #14 )
    COP [89]
    COP [DA] ( #EF )
    COP [A0] ( @code_0599DC, #$FFF8, #$00B0, #$1800 )
    COP [D2] ( #03, #01 )
    LDA #$0200
    TSB $12
    COP [85] ( #19, #02, #01 )
    COP [8A]
    COP [80] ( #15 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_05999A {
    COP [D0] ( #03, #01, &code_0599C1 )
    COP [D0] ( #02, #01, &code_0599B9 )
    COP [D0] ( #01, #01, &code_0599B4 )
    COP [BF] ( &widestring_05A03C )
    COP [CC] ( #01 )
    RTL 
}

code_0599B4 {
    COP [BF] ( &widestring_05A074 )
    RTL 
}

code_0599B9 {
    COP [BF] ( &widestring_05A091 )
    COP [CC] ( #03 )
    RTL 
}

code_0599C1 {
    COP [BF] ( &widestring_05A232 )
    COP [CE] ( #4D )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #2F, #$0070, #$0090, #00, #$1100 )
    RTL 
}

code_0599DC {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_0599F4 )
    COP [85] ( #46, #0C, #13 )
    COP [8A]
    COP [C1]
    COP [80] ( #46 )
    COP [89]
    RTL 
}

code_0599F4 {
    COP [BF] ( &widestring_0599FC )
    COP [CC] ( #02 )
    RTL 
}

widestring_0599FC `[TPL:A][PAL:0]There was a letter[N]in the jar...[N]The contents read ... [FIN][TPL:5]We are on a ship on our [N]way to be sold as [LU2:69][N][LU1:AD]in an unknown land.[FIN]If anyone reads this, [N][LU2:8E][LU1:D1]us... [N]                   Sam [PAL:0][END]`

code_059ABA {
    LDA #$0200
    TSB $12
    COP [9C] ( @code_0597EB, #$2800 )
    LDA #$0001
    STA $0ACE
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D07 )
    COP [BF] ( &widestring_05A291 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_059B26 )
    COP [0B]
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [85] ( #18, #03, #12 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [0B]
    COP [CE] ( #01 )
    COP [D2] ( #01, #01 )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_05A405 )
    COP [CD] ( #$0120 )
    COP [CC] ( #52 )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #2F, #$0070, #$0090, #00, #$1100 )
    RTL 
}

code_059B26 {
    LDA $0ACE
    CMP $0ACA
    BEQ code_059B33
    COP [BF] ( &widestring_05A319 )
    RTL 
}

code_059B33 {
    COP [BF] ( &widestring_05A332 )
    COP [CC] ( #02 )
    RTL 
}

code_059B3B {
    LDA #$4001
    TSB $09EC
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [3C] ( @code_059BAF )
    TXA 
    TYX 
    TAY 
    LDA $7F000E, X
    ORA #$0800
    STA $7F000E, X
    TXA 
    TYX 
    TAY 
    COP [25] ( #06, #0A )
    COP [80] ( #13 )
    COP [89]
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D15 )
    COP [BF] ( &widestring_05A467 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_05A5AB )
    LDA #$0800
    TSB $10
    COP [8D] ( #17 )
    COP [AA] ( #13 )
    COP [CF] ( #$0120 )
    LDA #$0000
    STA $0682
    COP [CE] ( #52 )
    INC $0AA6
    LDA #$0408
    STA $064A
    COP [26] ( #2F, #$0070, #$00A0, #03, #$1100 )
    COP [C1]
    COP [89]
    COP [80] ( #13 )
    COP [89]
    COP [C1]
    RTL 
}

code_059BAF {
    COP [C1]
    COP [37] ( #73 )
    COP [39]
    RTL 
}

code_059BB7 {
    COP [25] ( #08, #0B )
    COP [80] ( #12 )
    COP [89]
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D24 )
    COP [C0] ( &code_059C2E )
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [A0] ( @code_059C44, #$0118, #$0088, #$1800 )
    COP [CA] ( #02 )
    COP [DA] ( #59 )
    COP [A0] ( @code_059C5D, #$FFE8, #$00D8, #$1800 )
    COP [CB]
    COP [DA] ( #3B )
    COP [04] ( #06 )
    COP [BF] ( &widestring_05A6EA )
    COP [D2] ( #02, #01 )
    COP [C3] ( @code_059C04, #$04B0 )
}

code_059C04 {
    COP [05] ( #15 )
    COP [BF] ( &widestring_05A770 )
    COP [CC] ( #03 )
    COP [C0] ( #$0000 )
    COP [DA] ( #EF )
    COP [CC] ( #4D )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #2F, #$0070, #$00A0, #03, #$1100 )
    COP [C1]
    RTL 
}

code_059C2E {
    COP [D0] ( #01, #01, &code_059C3C )
    COP [BF] ( &widestring_05A5E3 )
    COP [CC] ( #01 )
    RTL 
}

code_059C3C {
    COP [BF] ( &widestring_05A723 )
    COP [CC] ( #02 )
    RTL 
}

code_059C44 {
    LDA #$1000
    TSB $12
    COP [B6] ( #20 )
    COP [85] ( #45, #10, #02 )
    COP [8A]
    COP [BC] ( #00, #50 )
    COP [D0] ( #03, #01, &code_059C78 )
}

code_059C5D {
    LDA #$1000
    TSB $12
    COP [B6] ( #20 )
    COP [85] ( #C5, #10, #01 )
    COP [8A]
    COP [BC] ( #00, #B0 )
    COP [D0] ( #03, #01, &code_059C78 )
    BRA code_059C44
}

code_059C78 {
    COP [E0]
}

code_059C7A {
    LDA #$0008
    TSB $player_flags
    COP [25] ( #09, #0A )
    COP [80] ( #13 )
    COP [89]
    COP [DA] ( #01 )
    COP [BF] ( &widestring_059D33 )
    COP [C0] ( &code_059CE3 )
    COP [0B]
    COP [D2] ( #01, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [80] ( #12 )
    COP [89]
    COP [DA] ( #3B )
    LDY $player_actor
    LDA #$*func_00C45E
    STA $0002, Y
    LDA #$&func_00C45E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    COP [04] ( #06 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_05A9F9 )
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #31, #$00A0, #$0060, #03, #$1100 )
    COP [C1]
    RTL 
}

code_059CE3 {
    COP [BF] ( &widestring_05A853 )
    COP [CC] ( #01 )
    RTL 
}

widestring_059CEB `[DLG:8,7][SIZ:8,1][LU1:F]Day 2[END]`

widestring_059CF9 `[DLG:8,7][SIZ:8,1][LU1:F]Day 4[END]`

widestring_059D07 `[DLG:8,7][SIZ:8,1][LU1:F]Day 7[END]`

widestring_059D15 `[DLG:8,7][SIZ:8,1][LU1:F]Day 12[END]`

widestring_059D24 `[DLG:8,7][SIZ:8,1][LU1:F]Day 18[END]`

widestring_059D33 `[DLG:8,7][SIZ:8,1][LU1:F]Day 21[END]`

widestring_059D42 `[TPL:A][TPL:1][LU1:25][N][LU1:67][LU1:A3][LU1:79]to??? [N][LU1:20][LU2:7A]everyone... [FIN]Are you OK?[N][PAL:0] [LU1:6A]I'm OK.[N] I'm [LU1:D3]unsteady.`

widestring_059D91 `[CLR][TPL:1][LU1:25]Hmmm. [N]You recover quickly. [N]Like a lizard's tail. [FIN][JMP:&widestring_059DCD+M]`

widestring_059DCD `[CLR][TPL:1][LU1:25]Of course, you [N][LU1:F2]unconscious for [N][LU1:B7][LU2:B5]half a day. [FIN][::][TPL:B][TPL:1][LU1:20]read [LU1:6B]being[N]adrift, but I never[N][LU1:D8]it would[N]happen to me...[FIN]Disasters sometimes[N]happen suddenly.[PAL:0][END]`

widestring_059E6F `[TPL:A][TPL:1][LU1:25][N][LU1:D]be upset. [FIN][LU1:D][LU1:DA][LU1:6B]the [N]future. [LU1:2B][LU1:A3]enjoy [N]drifting. [FIN]I'm starved. [LU1:1F]have[N]the meat I brought[N][LU1:8E]the castle.[PAL:0][END]`

widestring_059EE3 `[TPL:B][TPL:1][LU1:25]Beautiful.... [N][LU1:12]after seeing it [N]all day, I [LU1:D3][LU1:BB][N]get tired of it.[PAL:0][END]`

widestring_059F2E `[TPL:A][TPL:1][LU1:25][LU1:62]are you [N]doing!! The poor fish!!![PAL:0][END]`

widestring_059F5A `[TPL:A][TPL:0][DLY:0]Will: Time passed [N]slowly, [LU1:F0][LU1:B9][N]to break the monotony. [FIN][LU1:26][LU1:A3]stared at [N]the [LU2:62]all day. [N]Will couldn't stand it. [FIN]He walked [LU1:6D]on [N]the raft and talked to [N][LU1:26][LU1:B6]times. [FIN]A minute [LU2:A0][LU1:A5][N]forever. But he [LU1:7A][N][LU1:9B]the march of time.[PAL:0][END]`

widestring_05A03C `[TPL:A][TPL:1][LU1:25][N]I [LU1:98]a premonition... [N]Help is coming... [FIN]What?[PAL:0][END]`

widestring_05A074 `[TPL:A][TPL:1][LU1:25][LU1:4B][N]is drifting here![PAL:0][END]`

widestring_05A091 `[TPL:A][TPL:1][LU1:25][N]My premonition! [FIN]You [LU1:D4]you [LU1:FC]to[N]be saved... but [LU1:9F]me[N]who needs to be saved.[FIN]Oh! I am so[N]starved.[FIN][TPL:0]Will: You [LU1:CA][LU1:98][N]caught [LU1:D7]fish. [N]If you had........ [FIN][TPL:1][LU1:25]I [LU1:78]hurt [N][LU1:CE]a [LU2:92]fish! [FIN][TPL:0]Will: [N]Are you saying [LU1:9F][N][LU2:50]to starve?! [FIN][TPL:1][LU1:25][N]Raw [LU2:62]gives me the [N]creeps! I [LU1:78]eat it! [FIN]Besides, the [LU2:62]is[N]fighting to stay alive![FIN]Fish [LU1:91]pain! Have[N]you [LU2:5D][LU1:D8]of[N]how the [LU2:62]feels?![FIN]If you [LU1:F1]to eat it,[N]go ahead!! I'm not[N][LU1:93]to eat it!!![PAL:0][END]`

widestring_05A232 `[TPL:A][TPL:1][LU1:25][N]................ [FIN][TPL:0][DLY:0]Will: [LU1:26][LU1:83][N]say [LU1:6C]all day.[FIN]A typical princess...[N][LU2:33][LU1:CE]a bother...[PAL:0][END]`

widestring_05A291 `[PAU:1E][TPL:A][TPL:0]Will: Drifting. [N][LU2:F]week. [N]A school of fish.... [FIN]He reached the end [N]of his rope.[FIN]If he didn't[N]eat more, he thought[N]he [LU1:F3]starve...[END]`

widestring_05A319 `[TPL:A][TPL:1][LU1:25][N]...............[PAL:0][END]`

widestring_05A332 `[TPL:A][TPL:1][DLY:0][LU1:25][N]............... [FIN]Will... [N][LU2:35]I talked to you [N][LU1:D7]way yesterday.... [FIN][LU1:1F]try to eat the fish.[N]I [LU1:78]do anything[N]if I starve.[FIN][LU1:38]in peace [LU1:DF]can[N]you refuse food you[N][LU1:82]like...[FIN][TPL:0]Will: [N][LU1:2B]catch a fish. [N]A [LU1:94]one.[PAL:0][END]`

widestring_05A405 `[TPL:A][TPL:0][DLY:0]Will: [N]Happily [LU1:26]ate [LU1:D0][N]fish. [FIN]Will [LU1:8F][LU1:D7]he was [N]starting to develop [N]feelings for Kara...[PAL:0][END]`

widestring_05A467 `[DLG:3,13][SIZ:D,3][TPL:1][LU1:25]The stars [N]are beautiful... [FIN]If I [LU1:F2]taller[N]I [LU1:7A]reach them.[FIN]Surely [LU1:2C]and Lance are[N][LU1:AB]at the [LU1:CD][N]star-studded sky... [FIN]If I [LU1:7A][LU2:AC]to the[N]stars I [LU1:7A][LU1:90]out [N][LU1:F4][LU1:89]is...[FIN][TPL:1][LU1:25]There [LU1:CC]to be [N]one extra star near the [N][LU1:7E]of Cygnus[FIN][LU1:6A][LU1:D7]red star.[FIN][LU2:34]we [LU2:84]a wish[N]upon [LU1:D7]star? I [LU1:98]a[N]feeling it'll [LU1:79]true.[FIN]Will, you close [LU1:FE][N]eyes, too. [END]`

widestring_05A5AB `[TPL:A][TPL:0][DLY:0]Will: I [LU2:71]for  [N][LU1:8B]safety, and [N]for my father...[PAL:0][END]`

widestring_05A5E3 `[TPL:B][TPL:1][LU1:25][N][LU2:41][LU1:70]adrift for [N][LU2:47]three weeks now. [FIN]Hasn't [LU1:FE]hair gotten[N]a [LU1:A7]long?[N][LU1:24]a [LU1:A7](Laughs).[FIN][TPL:0]Will: [LU1:26][LU1:84][N]act [LU1:A5]a spoiled [N]princess now. [FIN]If you told [LU1:CF]she[N]was one of the island[N]girls, no one would[N]doubt it.[FIN][TPL:1][LU1:25][N][LU1:1D]terrible!! [FIN][LU1:62]is that...?[N]There in the water...?[PAL:0][END]`

widestring_05A6EA `[TPL:A][TPL:1][LU1:25][N][LU1:30]a shark...? [FIN]We [LU1:7A]be eaten.... [N][LU1:62][LU1:CA]we do?...[PAL:0][END]`

widestring_05A723 `[TPL:A][TPL:1][LU1:25][LU1:5D]circling [N]our raft, but [LU2:B0][N]not attacking... [FIN][TPL:0]Will: [N][LU1:2B][LU1:DA][LU1:6B]this... [END]`

widestring_05A770 `[TPL:B][TPL:1][LU1:25][N][LU1:20]got it! [N][LU1:5D]not hungry!! [FIN]My grandpa told me that[N][LU2:89]humans attack[N][LU1:B1][LU1:E0]when[N][LU2:B0]not hungry.[FIN][TPL:0]Will: Then [LU1:F7]we're [N]doing is not usual [N][LU1:9A]behavior. [FIN]We [LU1:83]eat [LU2:62][N][LU2:BC]we [LU1:F2]starving.[FIN][TPL:1][LU1:25]That's [LU2:99][N][LU1:5D]going. [N]Good-bye, sharks...[PAL:0][END]`

widestring_05A853 `[TPL:B][TPL:1][LU1:25][LU1:61]I was in the [N][LU2:53]I loved watching [N]the sun set... [FIN]The sunset was so [N][LU1:76][LU1:8E]the [N]corridor of the[N]castle...[FIN]But now [LU1:20]come[N]to hate it.[FIN]After the sun has set, [N]the darkness comes... [FIN]I [LU1:D8]I'd [LU1:BB]see[N]the sunrise again....[FIN]But [LU2:A4][LU1:FF][LU1:F0][N]me, I see a [LU1:76][N]sunrise every morning. [FIN][LU2:40]you by my side,[N]I can even enjoy[N][LU2:AA][LU1:A5]these.[FIN][TPL:0]Will: [LU1:20][LU1:FC]to say [N]the [LU1:CD][LU1:E0]to you, [N]but somehow the words [N][LU1:A3][LU1:FB][LU1:79]out. [FIN]I [LU1:A3]nodded,[N]saying nothing...[PAL:0][END]`

widestring_05A9F9 `[TPL:A][TPL:0]Will: Suddenly Will[N]fell over,[N]unconscious... [FIN][TPL:1][DLY:0][LU1:25][N]Will! Will!! [N][LU1:64]wrong!! [FIN]Wake up!! Don't[N][LU1:AC]me [LU2:73]alone![PAL:0][END]`