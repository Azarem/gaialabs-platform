?INCLUDE 'thinker_00B7CC'
?INCLUDE 'thinker_00B7D6'
?INCLUDE 'table_0EDA00'

!joypad_mask_std                065A
!CGWSEL                         2130
!CGADSUB                        2131

---------------------------------------------

h_mu66_rama_spirits [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_mu66_rama_spirits {
    COP [D1] ( #$0139, #01, &code_069F1D )
    COP [BC] ( #08, #02 )
    COP [C0] ( &code_069F1F )
    COP [D2] ( #01, #01 )
    COP [A3] ( @code_06A01E, #$00B8, #$0080, #$1000 )
    LDA #$0000
    STA $0024, Y
    COP [A3] ( @code_06A01E, #$0148, #$00A0, #$1000 )
    LDA #$0001
    STA $0024, Y
    COP [A3] ( @code_06A01E, #$0188, #$00E0, #$1000 )
    LDA #$0002
    STA $0024, Y
    COP [A3] ( @code_06A01E, #$0138, #$0120, #$1000 )
    LDA #$0003
    STA $0024, Y
    COP [A3] ( @code_06A01E, #$00D8, #$0100, #$1000 )
    LDA #$0004
    STA $0024, Y
    COP [A3] ( @code_06A01E, #$0078, #$0140, #$1000 )
    LDA #$0005
    STA $0024, Y
    COP [D2] ( #0F, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$80
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    REP #$20
    COP [3C] ( @e_thinker_00B7CC )
    COP [DA] ( #7F )
    COP [32] ( #39 )
    COP [33]
    COP [CD] ( #$0139 )
    COP [3C] ( @e_thinker_00B7D6 )
    COP [DA] ( #7F )
    LDA #$0002
    STA $0AAC
    LDA #$0066
    STA $0B12
    LDA #$000F
    STA $0B08
    STA $0B0A
    LDA #$0007
    STA $0B0C
    STA $0B0E
    LDA #$2200
    STA $0B10
    LDA #$0104
    STA $064A
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
}

code_069F1D {
    COP [E0]
}

code_069F1F {
    LDA $0A00
    AND #$00FF
    CMP #$00FE
    BEQ code_069F3D
    COP [D0] ( #01, #01, &code_069F38 )
    COP [BF] ( &widestring_069F45 )
    COP [CC] ( #01 )
    RTL 
}

code_069F38 {
    COP [BF] ( &widestring_069FBE )
    RTL 
}

code_069F3D {
    COP [BF] ( &widestring_069FE3 )
    COP [CC] ( #0F )
    RTL 
}

widestring_069F45 `[DEF]I am Rama, [LU1:27]of Mu.[N]My [LU1:72]passed on[N][LU1:A6]ago, but my[N]spirit lives on.[FIN]If you [LU1:A9]closely, [N]You can [LU2:8F]see [N]wandering spirits. [END]`

widestring_069FBE `[DEF]Hear the words of[N]spirits awakened.[END]`

widestring_069FE3 `[DEF]The [LU1:EB]tunnel[N]dug by man is inside.[FIN][LU1:3B][LU1:E7][LU1:D6][N]Mystic Statue. [END]`

code_06A01E {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [CA] ( #1E )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [CB]
    COP [CA] ( #0F )
    LDA #$2000
    TSB $10
    COP [C2]
    COP [C2]
    LDA #$2000
    TRB $10
    COP [C2]
    COP [CB]
    COP [C0] ( &code_06A05F )
    COP [C1]
    COP [80] ( #04 )
    COP [89]
    RTL 
}

code_06A05F {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06A06A )
}

code_list_06A06A [
  &code_06A076   ;00
  &code_06A07E   ;01
  &code_06A086   ;02
  &code_06A08E   ;03
  &code_06A096   ;04
  &code_06A09E   ;05
]

code_06A076 {
    COP [BF] ( &widestring_06A0A6 )
    COP [CC] ( #02 )
    RTL 
}

code_06A07E {
    COP [BF] ( &widestring_06A0EC )
    COP [CC] ( #03 )
    RTL 
}

code_06A086 {
    COP [BF] ( &widestring_06A154 )
    COP [CC] ( #04 )
    RTL 
}

code_06A08E {
    COP [BF] ( &widestring_06A19E )
    COP [CC] ( #05 )
    RTL 
}

code_06A096 {
    COP [BF] ( &widestring_06A1C9 )
    COP [CC] ( #06 )
    RTL 
}

code_06A09E {
    COP [BF] ( &widestring_06A26D )
    COP [CC] ( #07 )
    RTL 
}

widestring_06A0A6 `[DEF][LU1:39]a single ray of [N][LU1:A8][LU1:80][LU1:8E]the sky. [N][LU1:3D][LU1:D8]it was [N]the [LU1:A8]of the spirits.[END]`

widestring_06A0EC `[DEF]One year after [LU1:D7]our[N]bodies began to change.[FIN]One got [LU1:ED]thin,[N]one [LU2:B3]to stone,[N]one's [LU1:72]melted[N][LU1:A5]water...[END]`

widestring_06A154 `[DEF]Family and friends [N][LU2:B3]to monsters [N][LU1:74]our eyes. We [N]fought [LU1:73]the tears...[END]`

widestring_06A19E `[DEF][LU2:20]saw no point in [N][LU1:B1]if [LU1:D6][LU1:E3][N]continued...[END]`

widestring_06A1C9 `[DEF]Some couldn't [LU1:E7]it, [N]and [LU1:D8]we [LU1:CA][N]flee [LU1:8E][LU2:74][FIN]But Mu is an island. We[N][LU1:83][LU1:A4]if we'd find[N][LU1:6E][LU2:90]to live...[FIN]There [LU1:F2]no materials[N]for a boat. It would[N]sink if [LU1:B3]of stone...[END]`

widestring_06A26D `[DEF]They [LU1:CB]building an[N]undersea tunnel. They[N]dug on, not knowing how[N][LU1:A6]it [LU1:F3]take...[END]`