
?INCLUDE 'sE6_gaia'
?INCLUDE 'chunk_008000'
?INCLUDE 'table_0EE000'
?INCLUDE 'table_0EDA00'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_sE5_epilogue [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_sE5_epilogue {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$4001
    TSB $09EC
    COP [3B] ( #0B, @func_00B519 )
    LDA #$1062
    STA $7F0A00
    COP [D0] ( #DB, #01, &code_0BD374 )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_0BD558 )
    COP [A0] ( @func_0BD4DE, #$0088, #$0080, #$1800 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_0BD5A0 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_0BD70E )
    COP [CC] ( #02 )
    COP [A0] ( @code_0BD539, #$00A0, #$FFF0, #$1800 )
    COP [D2] ( #02, #00 )
    COP [BF] ( &widestring_0BD740 )
    COP [CC] ( #DB )
    LDA #$0202
    STA $064A
    COP [26] ( #90, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

code_0BD374 {
    COP [A0] ( @code_0BD4F7, #$0078, #$0080, #$1800 )
    COP [A0] ( @code_0BD4F7, #$0098, #$0080, #$1800 )
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_0BD9FA )
    COP [CC] ( #03 )
    COP [05] ( #13 )
    COP [D2] ( #03, #00 )
    COP [DA] ( #EF )
    COP [DA] ( #77 )
    COP [80] ( #1D )
    COP [89]
    LDY $player_actor
    SEP #$20
    LDA #$^func_0BD494
    STA $0002, Y
    REP #$20
    LDA #$&func_0BD494
    STA $0000, Y
    LDA #$0800
    TSB $player_flags
    COP [DA] ( #4F )
    COP [BF] ( &widestring_0BDC95 )
    COP [CC] ( #04 )
    COP [D2] ( #04, #00 )
    COP [BF] ( &widestring_0BDD34 )
    COP [DA] ( #77 )
    COP [BF] ( &widestring_0BDDE5 )
    COP [81] ( #21, #13 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [DA] ( #EF )
    COP [BF] ( &widestring_0BDE02 )
    COP [CC] ( #05 )
    COP [80] ( #1B )
    COP [89]
    COP [DA] ( #77 )
    LDY $player_actor
    LDA #$*func_08F5F9
    STA $0002, Y
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [DA] ( #77 )
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    STA $7F001A, X
    COP [22] ( #1F, #01 )
    LDA #$2000
    TSB $10
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0BD437
    RTL 
}

code_0BD437 {
    LDY $player_actor
    LDA #$*func_0BD4B7
    STA $0002, Y
    LDA #$&func_0BD4B7
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0BD45D
    RTL 
}

code_0BD45D {
    COP [DA] ( #77 )
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    COP [25] ( #08, #01 )
    COP [86] ( #02, #04, #11 )
    COP [8A]
    COP [80] ( #2A )
    COP [89]
    LDA #$2000
    TSB $10
    COP [DA] ( #B3 )
    LDA #$0808
    STA $064A
    COP [26] ( #89, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

---------------------------------------------

func_0BD494 {
    COP [8F] ( #02 )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [90] ( #0A, #12 )
    COP [89]
    COP [8F] ( #02 )
    COP [89]
    COP [CE] ( #04 )
    COP [D2] ( #05, #01 )
    COP [8F] ( #01 )
    COP [89]
    COP [C1]
    RTL 
}

---------------------------------------------

func_0BD4B7 {
    LDA #$0008
    TRB $10
    COP [8F] ( #1C )
    COP [89]
    COP [B9]

  code_0BD4C3:
    COP [91] ( #1B, #08 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BD4C3
    LDA #$0800
    TRB $player_flags
    LDA #$2000
    TSB $10
    COP [C1]
    RTL 
}

---------------------------------------------

func_0BD4DE {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [CA] ( #1E )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
}

code_0BD4F7 {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [C1]
    COP [C1]
    COP [89]
    COP [D0] ( #03, #01, &code_0BD51F )
    COP [D0] ( #02, #01, &code_0BD512 )
    RTL 
}

code_0BD512 {
    COP [81] ( #04, #02 )
    COP [89]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_0BD51F {
    COP [86] ( #04, #04, #14 )
    COP [8A]
    COP [86] ( #04, #04, #12 )
    COP [8A]
    COP [86] ( #04, #08, #02 )
    COP [8A]
    COP [CE] ( #03 )
    COP [E0]
}

code_0BD539 {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [86] ( #04, #06, #01 )
    COP [8A]
    COP [CE] ( #02 )
    COP [C1]
    COP [C1]
    COP [89]
    COP [D0] ( #03, #01, &code_0BD51F )
    RTL 
}

---------------------------------------------

widestring_0BD558 `[DLG:3,4][SIZ:D,3][SFX:0][TPL:13][SFX:0][DLY:6][LU1:25][N][LU1:64][LU1:9D]to [N]the comet...? [PAU:78][CLR]That glowing[N]green planet?[PAU:B4][CLD]`

widestring_0BD5A0 `[DLG:3,4][SIZ:D,3][TPL:15][SFX:0][DLY:6]Will's father: [N]The [LU2:55][LU1:C2][N]has disappeared. [PAU:78][CLR]The evil star has flown[N]off to the [LU1:BD]side[N]of the universe...[PAU:B4][CLR][TPL:15][SFX:0][DLY:6]Will. [N][PAU:28]Do you [LU1:A4]what[N]planet [LU1:D7]is, glowing[N][LU1:D9]in the darkness?[PAU:B4][CLR][TPL:12][SFX:0]Will: [N]Our Earth...?[PAU:78][CLR][TPL:15][SFX:0]Will's father: [N]That's [LU2:99]Our Earth.[N][PAU:78][CLR]Doesn't it [LU1:A9][LU1:A5]a[N]desert oasis?[PAU:B4][CLR][TPL:13][SFX:0][LU1:25][N][LU1:1D][LU1:BB][LU2:A0][N]so beautiful.[PAU:B4][CLR]But it [LU1:AA]lonely[N]shining in the dark...[PAU:B4][CLD]`

widestring_0BD70E `[DLG:3,4][SIZ:D,2][SFX:0][DLY:6][TPL:14][SFX:0][LU1:46]Voice: Yes.[N]The [LU1:F5]is awakened.[PAU:B4][CLD]`

widestring_0BD740 `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][CLR][TPL:12][SFX:0]Will: [N]Mother?![PAU:B4][CLR][TPL:14][SFX:0]Will's mother:[N]The Earth.[N][PAU:3C]A [LU2:85][LU1:F0]millions [N]of children.[PAU:B4][CLR]I'm [LU2:A6]you [LU1:DA][N][LU1:6B]us sometimes, [N]and [LU1:26]often [N]thinks [LU1:6B]her parents.[PAU:B4][CLR]The [LU1:14]is the same[N]way. She [LU2:6D]lonely if[N]her [LU1:7D]forget[N][LU1:6B]her.[PAU:B4][CLR][TPL:15][SFX:0]Will's father: How is it,[N]you two? [N][PAU:3C][LU2:1A]at the world[N]you [LU1:AF]in from[N]the outside?[PAU:B4][CLR][TPL:13][SFX:0][LU1:25][N][LU1:1D]as if we'd [N][LU1:71]spirits...[PAU:B4][CLR][TPL:12][SFX:0]Will: I [LU1:F1]to show [N]all of our group...[PAU:78][CLR]No, I [LU1:F1]to show[N][LU1:89]in the world...[PAU:B4][CLR][TPL:15][SFX:0]Will's father: Someday [N][LU1:C1][LU1:EF]build ships [N]to travel the universe.[PAU:B4][CLR]Then [LU2:AB][LU1:EF]see[N][LU1:D6]green [LU1:14]with[N][LU1:E1]own eyes.[PAU:B4][CLR]See how lonely the[N][LU1:14]looks, [LU1:A3]like[N]the two of you.[PAU:B4][CLR]Will's father: Look [N]carefully at [LU1:FE][N]map of the world.[PAU:B4][CLR][TPL:12][SFX:0]Will:[N]Ah! The map has started[N]to change![PAU:B4][CLD]`

widestring_0BD9FA `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][CLR][TPL:12][SFX:0]Will: [N]Why do you two [N][LU1:A4]the future?[PAU:B4][CLR][TPL:15][SFX:0]Will's father: [N][LU1:61]I [LU2:7A]my body, I [N][LU1:CB]seeing everything.[PAU:B4][CLR]The past. The future. [N]Humanity's progress.[PAU:B4][CLR][LU1:30][LU1:C1]would[N]call [LU1:D6]kind of body[N]a spirit.[PAU:B4][CLR][TPL:14][SFX:0]Will's mother:[N]Now you and [LU1:26]can [N][LU1:71]ordinary [N][LU1:7D]again.[PAU:B4][CLR][LU1:D]be afraid.[PAU:B4][CLR][TPL:13][SFX:0][LU1:25][LU1:61]we [N]return to Earth, [LU1:EF][N]we be separated?[PAU:B4][CLR][TPL:15][SFX:0]Will's father: Yes... [N][PAU:28]The [LU1:F5]is changing. [N]Humanity and history, [N][LU1:98][LU1:CB]down a [N]new path.[PAU:B4][CLR]You two [LU1:D8][N][LU1:B9]of it [LU1:F6]you [N]met each [LU1:BD]in [N][LU1:47]Cape. [PAU:B4][CLR]But [LU1:F6]the Earth[N]needed the Light and[N][LU1:C]Knights, you[N]met again unexpectedly.[PAU:B4][CLR][LU1:2B][LU1:A9]at the world[N][LU1:74]the [LU1:C2]of the[N][LU1:7B]is extinguished.[PAU:B4][CLR][TPL:14][SFX:0]Will's mother: [N]We [LU2:71]you two [N][LU1:98]a bright future...[PAU:B4][CLD]`

widestring_0BDC95 `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][TPL:13][SFX:0][LU1:25]Will... [N][PAU:28][LU1:9]here....[N][PAU:50][LU2:37]me [LU1:FE]face...[PAU:B4][CLR]I [LU1:F1]to burn you[N][LU1:A1]my memory.[PAU:B4][CLR][LU1:68][LU2:60][PAU:1E][LU1:68]nose [N][PAU:1E][LU1:68]mouth [PAU:28][LU1:68]hair [N][PAU:1E][LU1:68][LU1:EE][N][PAU:28]The warmth of[N][LU1:FE]hand....[PAU:B4][CLD]`

widestring_0BDD34 `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][TPL:12][SFX:0]Will: [LU1:D]worry. [N][PAU:3C]I [LU1:EF]search you out.[PAU:B4][CLR]No [LU1:B8]how long[N]it takes.[N][PAU:3C]Hundreds of years...[N][PAU:1E]Thousands of years...[N][PAU:1E]I [LU1:EF][LU1:79]to you.[PAU:B4][CLR]So [LU1:E7]care...[N][PAU:5A]Close [LU1:FE]eyes...[PAU:78][CLD]`

widestring_0BDDE5 `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][TPL:13][SFX:0][LU1:25][N]Will....[PAU:78][CLD]`

widestring_0BDE02 `[DLG:3,4][SIZ:D,3][SFX:0][DLY:6][TPL:12][SFX:0]Will: [N][LU1:2B]go. [N]To Earth....[PAU:B4][CLR][TPL:13][SFX:0][LU1:25][N]Mmmm....[PAU:B4][CLD]`