?INCLUDE 'func_00C718'
?INCLUDE 'func_00C725'

!joypad_mask_std                065A

---------------------------------------------

h_wa78_glass_game [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_glass_game {
    COP [D0] ( #96, #01, &code_078FEB )
    COP [C0] ( &code_079237 )
    LDA #$0002
    STA $7F0026, X
    JSL $@func_00C718

  code_078FDF:
    JSL $@func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_078FDF
}

code_078FEB {
    COP [A0] ( @code_07958C, #$0478, #$0070, #$1000 )
    COP [A0] ( @code_0795E4, #$04A8, #$0070, #$1000 )
    COP [A0] ( @code_079637, #$04C8, #$00C0, #$1000 )
    COP [A0] ( @code_07980E, #$0458, #$0090, #$1000 )
    COP [A0] ( @code_079845, #$0458, #$00B0, #$1000 )
    COP [A0] ( @code_0798AB, #$0478, #$0090, #$1000 )
    COP [A0] ( @func_0799D6, #$0488, #$0080, #$1000 )
    COP [A0] ( @code_079A13, #$0498, #$0090, #$1000 )
    COP [A0] ( @code_079A50, #$04A8, #$0080, #$1000 )
    COP [A0] ( @code_079A8D, #$04B8, #$0090, #$1000 )
    COP [C0] ( &code_07923C )
    COP [25] ( #48, #0B )
    COP [80] ( #2B )
    COP [89]
    COP [0B]
    LDA #$0000
    STA $0AA6
    LDA $0AA6
    BIT #$0004
    BNE code_0790D0
    COP [D2] ( #02, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [04] ( #06 )
    COP [DA] ( #1D )
    COP [09] ( #08 )
    COP [81] ( #31, #11 )
    COP [89]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [BF] ( &widestring_0793B6 )
    COP [07] ( #2E )
    COP [DA] ( #27 )
    LDA $0AA6
    ORA #$0004
    STA $0AA6
    COP [82] ( #2E, #11 )
    COP [89]
    COP [81] ( #30, #12 )
    COP [89]
    COP [80] ( #2B )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_079244 )
    COP [CC] ( #0F )
    COP [D2] ( #03, #01 )
}

code_0790D0 {
    LDA $0AA6
    BIT #$0010
    BNE code_079125
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #30, #12 )
    COP [89]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [BF] ( &widestring_0793B6 )
    COP [07] ( #2E )
    COP [DA] ( #27 )
    LDA $0AA6
    ORA #$0010
    STA $0AA6
    COP [82] ( #2E, #11 )
    COP [89]
    COP [81] ( #31, #11 )
    COP [89]
    COP [80] ( #2B )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_079252 )
    COP [CC] ( #0F )
    COP [D2] ( #04, #01 )
}

code_079125 {
    LDA $0AA6
    BIT #$0002
    BNE code_07917E
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [85] ( #31, #02, #11 )
    COP [8A]
    COP [86] ( #2F, #02, #12 )
    COP [8A]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [BF] ( &widestring_0793B6 )
    COP [07] ( #2E )
    COP [DA] ( #27 )
    LDA $0AA6
    ORA #$0002
    STA $0AA6
    COP [86] ( #2E, #02, #11 )
    COP [8A]
    COP [85] ( #30, #02, #12 )
    COP [8A]
    COP [80] ( #2B )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_079260 )
    COP [CC] ( #0F )
    COP [D2] ( #05, #01 )
}

code_07917E {
    LDA $0AA6
    BIT #$0008
    BNE code_0791C9
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [86] ( #2F, #02, #12 )
    COP [8A]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [BF] ( &widestring_0793B6 )
    COP [07] ( #2E )
    COP [DA] ( #27 )
    LDA $0AA6
    ORA #$0008
    STA $0AA6
    COP [86] ( #2E, #02, #11 )
    COP [8A]
    COP [80] ( #2B )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_07926E )
    COP [CC] ( #0F )
    COP [D2] ( #06, #01 )
}

code_0791C9 {
    LDA $0AA6
    BIT #$0001
    BNE code_07922F
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [85] ( #31, #03, #11 )
    COP [8A]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [84] ( #2B, #1E )
    COP [8A]
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_07944D )
    LDA $0AA6
    ORA #$0001
    STA $0AA6
    COP [CC] ( #08 )
    COP [DA] ( #7F )
    COP [BF] ( &widestring_079520 )
    COP [07] ( #2E )
    COP [DA] ( #77 )
    LDA #$0408
    STA $064A
    LDA #$0203
    STA $0648
    COP [26] ( #7D, #$0070, #$0080, #00, #$1100 )
    COP [CE] ( #96 )
    COP [CC] ( #97 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07922F {
    COP [C1]
    RTL 

  code_079232:
    COP [BF] ( &widestring_079422 )
    RTL 
}

code_079237 {
    COP [BF] ( &widestring_07927C )
    RTL 
}

code_07923C {
    COP [BF] ( &widestring_0792F7 )
    COP [CC] ( #02 )
    RTL 
}

code_079244 {
    COP [D0] ( #0F, #01, &code_079232 )
    COP [BF] ( &widestring_079401 )
    COP [CC] ( #03 )
    RTL 
}

code_079252 {
    COP [D0] ( #0F, #01, &code_079232 )
    COP [BF] ( &widestring_079401 )
    COP [CC] ( #04 )
    RTL 
}

code_079260 {
    COP [D0] ( #0F, #01, &code_079232 )
    COP [BF] ( &widestring_079401 )
    COP [CC] ( #05 )
    RTL 
}

code_07926E {
    COP [D0] ( #0F, #01, &code_079232 )
    COP [BF] ( &widestring_079401 )
    COP [CC] ( #06 )
    RTL 
}

widestring_07927C `[DEF][SFX:10]On full moon nights they[N]play [LU2:2D]Glass,[N]the [LU2:88]dangerous game[N]you can play.[FIN]But [LU1:FF][LU1:D3]young.[N]I [LU1:FB][LU1:DA]you'd[N]throw away [LU1:FE]life.[END]`

widestring_0792F7 `[DEF][SFX:10][TPL:4]Opponent: [N]Shoot! I forgot my [N]lucky Kruk's foot. [FIN]The rules are simple. [N]One of the five glasses [N]contains poison. [FIN]Drink each one in turn.[N]The one [LU1:AE]alive[N]is the winner.[FIN][LU2:3E]start [LU1:F0]me![END]`

widestring_0793B6 `[DEF][SFX:10][TPL:4]Opponent: [N]BAAANZAII!! [FIN][SFX:0]The Opponent drank the[N]glass in one gulp...[END]`

widestring_079401 `[DEF][SFX:10][TPL:4]Opponent:[N]Lucky![N]My [LU2:B9]next.[END]`

widestring_079422 `[DEF][SFX:10][TPL:4]Opponent:[N][LU1:68]turn! [LU1:D]run[N]away scared!![END]`

widestring_07944D `[DEF][SFX:10][TPL:4]Opponent:[N]One glass left...[WAI][CLD][PAU:3C][DEF][TPL:6][DLY:2]Spectator:[N]That's enough...[N]This young man won...[FIN][DLY:0]Spectator:[N]Right![N][LU1:42]now![FIN][TPL:4][DLY:3]Opponent: No...[N][PAU:1E]I'm the champion. I [N][LU1:EF]not be disgraced. [FIN][SFX:0][DLY:2][TPL:6]He picks up the glass.[END]`

widestring_079520 `[DEF][SFX:10][TPL:6]Spectator: Stop![N][LU1:67]already lost![N]Stop it!![FIN][SFX:0][DLY:4]Ignoring the spectator,[N]he downs the drink[N]in a shot.[PAL:0][END]`

code_07958C {
    COP [80] ( #02 )
    COP [89]
    COP [C0] ( &code_0795B4 )
    COP [0B]
    COP [D2] ( #08, #01 )
    COP [0C]
    COP [85] ( #09, #02, #01 )
    COP [8A]
    COP [82] ( #06, #11 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_0795B4 {
    COP [BF] ( &widestring_0795B9 )
    RTL 
}

widestring_0795B9 `[DEF][LU1:69][LU1:D3]young, why[N][LU1:F3]you risk your[N][LU1:B0][LU1:D6]way...[END]`

code_0795E4 {
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_07960B )
    COP [0B]
    COP [D2] ( #08, #01 )
    COP [0C]
    COP [81] ( #11, #01 )
    COP [89]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_07960B {
    COP [BF] ( &widestring_079610 )
    RTL 
}

widestring_079610 `[DEF]There's no game as[N]exciting as [LU1:D6]one.[END]`

code_079637 {
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [0D] ( #01, #00 )
    COP [C0] ( &code_079677 )
    COP [D2] ( #01, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [0E] ( #01, #00 )
    COP [C0] ( &code_0796A4 )
    COP [81] ( #09, #11 )
    COP [89]
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [80] ( #04 )
    COP [89]
    COP [0B]
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_079677 {
    COP [BF] ( &widestring_0796A9 )
    COP [BE] ( #02, #02, &code_list_079681 )
}

code_list_079681 [
  &code_079687   ;00
  &code_07968C   ;01
  &code_079687   ;02
]

code_079687 {
    COP [BF] ( &widestring_0796DE )
    RTL 
}

code_07968C {
    COP [BF] ( &widestring_079704 )
    COP [BE] ( #02, #02, &code_list_079696 )
}

code_list_079696 [
  &code_079687   ;00
  &code_07969C   ;01
  &code_079687   ;02
]

code_07969C {
    COP [BF] ( &widestring_07977A )
    COP [CC] ( #01 )
    RTL 
}

code_0796A4 {
    COP [BF] ( &widestring_0797E6 )
    RTL 
}

widestring_0796A9 `[DEF]The [LU2:2D]Glass Club. [N]Do you wish to join? [N] Yes [N] No `

widestring_0796DE `[CLR]Then go home, and[N][LU2:6A][LU1:F7]you've[N][LU2:A7]here.[END]`

widestring_079704 `[CLR]Do you [LU1:F1]to risk[N][LU1:FE]young life[N][LU1:C4][LU2:2D]Glass?![FIN]This isn't [LU1:A3]a game. [N]You [LU1:7A][LU2:81][N][LU1:FE]life.[FIN][LU1:1F]ask again. Are[N]you sure?[N] Yes[N] No`

widestring_07977A `[CLR]All [LU2:99]The Opponent[N]is [LU1:BE]there.[FIN]He's a seasoned[N]veteran. [LU1:20]never[N][LU2:A7]a man so lucky.[FIN]Well.[N]Ask him the rules.[END]`

widestring_0797E6 `[DEF]Tonight, [LU1:D0]young man [N][LU1:EF][LU2:81]his life... [END]`

code_07980E {
    COP [80] ( #05 )
    COP [89]
    COP [C0] ( &code_079830 )
    COP [0B]
    COP [D2] ( #08, #01 )
    COP [0C]
    COP [85] ( #09, #02, #01 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_079830 {
    COP [BF] ( &widestring_079835 )
    RTL 
}

widestring_079835 `[DEF]You [LU1:98]courage.[END]`

code_079845 {
    COP [80] ( #0D )
    COP [89]
    COP [C0] ( &code_079867 )
    COP [0B]
    COP [D2] ( #08, #01 )
    COP [0C]
    COP [85] ( #11, #02, #01 )
    COP [8A]
    COP [80] ( #0D )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_079867 {
    COP [BF] ( &widestring_07986C )
    RTL 
}

widestring_07986C `[DEF][LU1:68]opponent has won[N]a lot of money. I wonder[N][LU1:F7]he does [LU1:F0]it...[END]`

code_0798AB {
    LDA #$0200
    TSB $12
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_0798CA )
    COP [C1]
    LDA $0AA6
    BIT #$0010
    BNE code_0798C6
    RTL 
}

code_0798C6 {
    COP [0C]
    COP [E0]
}

code_0798CA {
    COP [D0] ( #0F, #00, &code_0798E7 )
    COP [CE] ( #0F )
    LDA $0AA6
    ORA #$0010
    STA $0AA6
    COP [BF] ( &widestring_0798E8 )
    COP [07] ( #2E )
    COP [0C]
    COP [E0]
}

code_0798E7 {
    RTL 
}

widestring_0798E8 `[DEF][CLR][TPL:0]Will: [N]Will closed his [LU2:60]and [N]drank it in one gulp![PAL:0][END]`

---------------------------------------------

widestring_079922 `[DEF][TPL:0]Will: What? [N]The glass [LU1:AA][N][LU1:ED]suspicious! [FIN]Do I [LU1:98]the courage to[N]put [LU1:D6]in my body?[FIN][PAL:0]Drink the glass?[N] Yes[N] No`

---------------------------------------------

widestring_079992 `[DEF][CLR][TPL:0]Will: [N]I'm quitting...[PAL:0][END]`

---------------------------------------------

widestring_0799AF `[DEF][TPL:0]Will: My body[N]is getting numb....[PAL:0][END]`

---------------------------------------------

func_0799D6 {
    LDA #$0200
    TSB $12
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_0799F5 )
    COP [C1]
    LDA $0AA6
    BIT #$0008
    BNE code_0799F1
    RTL 
}

code_0799F1 {
    COP [0C]
    COP [E0]
}

code_0799F5 {
    COP [D0] ( #0F, #00, &code_079A12 )
    COP [CE] ( #0F )
    LDA $0AA6
    ORA #$0008
    STA $0AA6
    COP [BF] ( &widestring_0798E8 )
    COP [07] ( #2E )
    COP [0C]
    COP [E0]
}

code_079A12 {
    RTL 
}

code_079A13 {
    LDA #$0200
    TSB $12
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_079A32 )
    COP [C1]
    LDA $0AA6
    BIT #$0004
    BNE code_079A2E
    RTL 
}

code_079A2E {
    COP [0C]
    COP [E0]
}

code_079A32 {
    COP [D0] ( #0F, #00, &code_079A4F )
    COP [CE] ( #0F )
    LDA $0AA6
    ORA #$0004
    STA $0AA6
    COP [BF] ( &widestring_0798E8 )
    COP [07] ( #2E )
    COP [0C]
    COP [E0]
}

code_079A4F {
    RTL 
}

code_079A50 {
    LDA #$0200
    TSB $12
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_079A6F )
    COP [C1]
    LDA $0AA6
    BIT #$0002
    BNE code_079A6B
    RTL 
}

code_079A6B {
    COP [0C]
    COP [E0]
}

code_079A6F {
    COP [D0] ( #0F, #00, &code_079A8C )
    COP [CE] ( #0F )
    LDA $0AA6
    ORA #$0002
    STA $0AA6
    COP [BF] ( &widestring_0798E8 )
    COP [07] ( #2E )
    COP [0C]
    COP [E0]
}

code_079A8C {
    RTL 
}

code_079A8D {
    LDA #$0200
    TSB $12
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [C0] ( &code_079AAC )
    COP [C1]
    LDA $0AA6
    BIT #$0001
    BNE code_079AA8
    RTL 
}

code_079AA8 {
    COP [0C]
    COP [E0]
}

code_079AAC {
    COP [D0] ( #0F, #00, &code_079AD2 )
    COP [BF] ( &widestring_079922 )
    COP [BE] ( #02, #01, &code_list_079ABC )
}

code_list_079ABC [
  &code_079ACD   ;00
  &code_079AC2   ;01
  &code_079ACD   ;02
]

code_079AC2 {
    COP [BF] ( &widestring_0798E8 )
    COP [07] ( #2E )
    STZ $0ACE
    RTL 
}

code_079ACD {
    COP [BF] ( &widestring_079992 )
    RTL 
}

code_079AD2 {
    RTL 
}