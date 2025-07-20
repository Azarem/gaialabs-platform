
!jewels_collected               0AB0
!inventory_slots                0AB4

---------------------------------------------

h_jeweler_gem [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_jeweler_gem {
    COP [D0] ( #E8, #01, &code_08D092 )
    LDA $0E
    ASL 
    ASL 
    ASL 
    CLC 
    ADC #$0002
    STA $28
    STZ $002A
    COP [C1]
    COP [8B]
    LDA #$3000
    STA $0E
    COP [0B]
    COP [C0] ( &code_08CEC9 )
    COP [C1]
    RTL 
}

code_08CEC9 {
    COP [BF] ( &widestring_08D094 )
    LDA $jewels_collected
    BEQ code_08CED6
    COP [BF] ( &widestring_08D0C8 )
}

code_08CED6 {
    COP [D0] ( #E9, #01, &code_08CEE7 )
    LDA $jewels_collected
    CMP #$0003
    BCC code_08CEE7
    JMP $&code_08D017
}

code_08CEE7 {
    COP [D0] ( #EA, #01, &code_08CEF8 )
    LDA $jewels_collected
    CMP #$0005
    BCC code_08CEF8
    JMP $&code_08D02A
}

code_08CEF8 {
    COP [D0] ( #EB, #01, &code_08CF09 )
    LDA $jewels_collected
    CMP #$0008
    BCC code_08CF09
    JMP $&code_08D037
}

code_08CF09 {
    COP [D0] ( #EC, #01, &code_08CF1A )
    LDA $jewels_collected
    CMP #$0012
    BCC code_08CF1A
    JMP $&code_08D04A
}

code_08CF1A {
    COP [D0] ( #ED, #01, &code_08CF2B )
    LDA $jewels_collected
    CMP #$0020
    BCC code_08CF2B
    JMP $&code_08D057
}

code_08CF2B {
    COP [D0] ( #EE, #01, &code_08CF3C )
    LDA $jewels_collected
    CMP #$0030
    BCC code_08CF3C
    JMP $&code_08D067
}

code_08CF3C {
    LDA $jewels_collected
    CMP #$0050
    BCC code_08CF47
    JMP $&code_08D077
}

code_08CF47 {
    COP [BF] ( &widestring_08D0F1+M )

  code_08CF4B:
    COP [BE] ( #03, #01, &code_list_08CF51 )
}

code_list_08CF51 [
  &code_08CF59   ;00
  &code_08CF59   ;01
  &code_08CF5E   ;02
  &code_08CFA6   ;03
]

code_08CF59 {
    COP [BF] ( &widestring_08D139 )
    RTL 
}

code_08CF5E {
    COP [D6] ( #01, &code_08CF68 )
    COP [BF] ( &widestring_08D1E0 )
    RTL 
}

code_08CF68 {
    SED 
    STZ $0000
    LDA #$0001
    SEP #$20
    LDY #$0000

  code_08CF74:
    CMP $inventory_slots, Y
    BNE code_08CF84
    PHA 
    LDA $0000
    CLC 
    ADC #$01
    STA $0000
    PLA 
}

code_08CF84 {
    INY 
    CPY #$0010
    BNE code_08CF74
    REP #$20
    LDA $0000
    CLC 
    ADC $jewels_collected
    STA $jewels_collected
    CLD 

  code_08CF97:
    COP [D5] ( #01 )
    COP [D6] ( #01, &code_08CF97 )
    COP [BF] ( &widestring_08D20F )
    JMP $&code_08CED6
}

code_08CFA6 {
    COP [BF] ( &widestring_08D267 )
    COP [BF] ( &widestring_08D617 )
    COP [D0] ( #E9, #00, &code_08CFB8 )
    COP [BF] ( &widestring_08D611 )
}

code_08CFB8 {
    COP [BF] ( &widestring_08D621 )
    COP [D0] ( #EA, #00, &code_08CFC6 )
    COP [BF] ( &widestring_08D611 )
}

code_08CFC6 {
    COP [BF] ( &widestring_08D636 )
    COP [D0] ( #EB, #00, &code_08CFD4 )
    COP [BF] ( &widestring_08D611 )
}

code_08CFD4 {
    COP [BF] ( &widestring_08D64A )
    COP [D0] ( #EC, #00, &code_08CFE2 )
    COP [BF] ( &widestring_08D611 )
}

code_08CFE2 {
    COP [BF] ( &widestring_08D65E )
    COP [D0] ( #ED, #00, &code_08CFF0 )
    COP [BF] ( &widestring_08D611 )
}

code_08CFF0 {
    COP [BF] ( &widestring_08D672 )
    COP [D0] ( #EE, #00, &code_08CFFE )
    COP [BF] ( &widestring_08D611 )
}

code_08CFFE {
    COP [BF] ( &widestring_08D67D )
    COP [BF] ( &widestring_08D68A )
    COP [BF] ( &widestring_08D0F1 )
    JMP $&code_08CF4B
}

---------------------------------------------

func_08D00D {
    COP [BF] ( &widestring_08D292 )
    RTL 

  code_08D012:
    COP [BF] ( &widestring_08D2AA )
    RTL 
}

code_08D017 {
    COP [BF] ( &widestring_08D2D0 )
    COP [D4] ( #06, &code_08D012 )
    COP [BF] ( &widestring_08D31A )
    COP [CC] ( #E9 )
    JMP $&code_08CEE7
}

code_08D02A {
    INC $0ADC
    COP [CC] ( #EA )
    COP [BF] ( &widestring_08D332 )
    JMP $&code_08CEF8
}

code_08D037 {
    INC $0ACA
    LDA #$0001
    STA $0B22
    COP [CC] ( #EB )
    COP [BF] ( &widestring_08D395 )
    JMP $&code_08CF09
}

code_08D04A {
    INC $0ADE
    COP [CC] ( #EC )
    COP [BF] ( &widestring_08D3F9 )
    JMP $&code_08CF1A
}

code_08D057 {
    LDA #$0001
    STA $0B16
    COP [CC] ( #ED )
    COP [BF] ( &widestring_08D459 )
    JMP $&code_08CF2B
}

code_08D067 {
    LDA #$0002
    STA $0B1C
    COP [CC] ( #EE )
    COP [BF] ( &widestring_08D4E3 )
    JMP $&code_08CF3C
}

code_08D077 {
    COP [BF] ( &widestring_08D5AE )
    LDA #$0202
    STA $0648
    LDA #$0404
    STA $064A
    COP [26] ( #E9, #$0330, #$03D0, #80, #$4400 )
    RTL 
}

code_08D092 {
    COP [E0]
}

widestring_08D094 `[DEF]I am the Jeweler Gem. [N]I control the Seven[N]Seas. [FIN]`

widestring_08D0C8 `I'm holding [BCD:2,AB0] of the[N]Red [LU1:22]for you.[FIN]`

widestring_08D0F1 `[DEF][PAL:0][::][CLR][LU1:64][LU1:FE]business?[N] [LU1:24][LU1:FC]to see you[N] Give you Red Jewels[N] See [LU1:FE]inventory`

widestring_08D139 `[CLR]Is [LU1:D7]right.[N]How do you do.[FIN][LU1:39]you hold up the [N]Red Jewels, you'll [N][LU1:98]to [LU1:79][LU2:97][N]to my place. [FIN]I am a famous master of [N]disguises. If you saw [N]me in [LU1:6E]town, [N]you [LU1:FB][LU1:A4]me. [END]`

widestring_08D1E0 `[CLR]But you [LU1:82][LU1:98]any[N]Jewels. Let me give[N]you some.[END]`

widestring_08D20F `[CLR]Mmm...This is a rare [N]jewel. Let me hold [N]it for [LU2:C7][FIN]There are now[N][BCD:2,AB0][LU1:22]in the room.[FIN]`

widestring_08D267 `[CLR]I [LU1:EF][LU1:97]you goods[N]for [LU1:FE][LU1:22]as[N][LU2:C3]on the list.[END]`

widestring_08D292 `[CLD][DEF][CLR][LU1:63]see ya.[N]Somewhere.[END]`

widestring_08D2AA `[CLR][LU1:68][LU1:A0]seems[N]to be full....[N][LU1:9][LU1:73]again!![END]`

widestring_08D2D0 `[CLR][LU1:67]collected [LU1:B7][N][LU2:B5]three Jewels![FIN]According to the list,[N]you get the herb![FIN]`

widestring_08D31A `You received the herb![FIN]`

widestring_08D332 `[CLR][LU1:67]collected [LU1:BE][N]five [LU1:23]According to[N]the list, [LU1:FE]Defense [N][LU2:25][LU1:EF]be raised. [FIN][LU1:68]Defense [LU2:25]is[N][LU1:C5]by one.[FIN]`

widestring_08D395 `[CLR][LU1:67]collected over, [N]eight [LU1:23]According to[N]the list, [LU1:FE]Life [N][LU2:25][LU1:EF]be raised. [FIN][LU1:68]Strength is[N][LU1:C5]by one.[FIN]`

widestring_08D3F9 `[CLR][LU1:67]collected [LU1:BE][N]12 [LU1:23]According to [N]the list, [LU1:FE]Strength [N][LU1:EF]be raised. [FIN][LU1:68]Attack [LU2:25]is[N][LU1:C5]by one.[FIN]`

widestring_08D459 `[CLR][LU1:67]collected [LU1:BE][N]20 [LU1:23]According to [N]the list, [LU1:FE][LU1:3C][N][LU2:25][LU1:EF]be raised. [FIN][LU1:1D]a mysterious power[N]given by the spirit.[FIN][LU1:68][LU1:3C]Dash Power[N]is increased.[FIN]`

widestring_08D4E3 `[CLR][LU1:67]collected [LU1:BE][N]30 [LU1:23]According to [N]the list, [LU1:FE][LU1:C][N][LU2:25][LU1:EF]be raised. [FIN][LU1:1D]a mysterious power[N]given by the spirit.[FIN]The [LU1:C]Friar's power[N]is increased.[FIN]Try pushing the[N]Attack [LU2:2]once more[N][LU1:F6]the [LU1:C]Friar[N]is flying.[FIN]`

widestring_08D5AE `[CLR]50... Suddenly[N]you've gathered[N]50 Red Jewels...[FIN]The [LU1:DF]has [LU1:79]to[N][LU2:AD]you [LU1:D0]of[N]my secrets.[FIN]Follow me!![END]`

widestring_08D611 [
  `[PAL:4]`   ;00
  `[PAL:0]`   ;01
]

widestring_08D617 `[DLG:3,B][SIZ:8,7][CLR][SFX:0]`

widestring_08D621 `[CLR]Herb           3[N][PAL:0]`

widestring_08D636 `Defense Force  5[N][PAL:0]`

widestring_08D64A `Life Force     8[N][PAL:0]`

widestring_08D65E `Strength      12[N][PAL:0]`

widestring_08D672 `[LU1:3C][LU2:25] 20[N][PAL:0]`

widestring_08D67D `[LU1:C][LU2:25]   30[N][PAL:0]`

widestring_08D68A `My secrets    50[END]`