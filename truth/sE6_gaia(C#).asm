?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'chunk_008000'
?INCLUDE 'actor_02B20E'
?INCLUDE 'player_character'

!scene_next                     0642
!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE
!APUIO1                         2141

---------------------------------------------

h_sE6_gaia [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_sE6_gaia {
    COP [9C] ( @code_08F687, #$2800 )
    COP [A0] ( @e_actor_09A090, #$0080, #$0040, #$1800 )
    COP [A0] ( @code_09A096, #$0080, #$0058, #$1800 )
    LDA $0AAC
    CMP #$0004
    BCC code_08D7D3
    LDA #$0000
}


code_08D7D3 {
    STA $0AB2
    STZ $0AAC
    STA $0000
    COP [D9] ( #$0000, &code_list_08D7E2 )
}


code_list_08D7E2 [
  &code_08D856   ;00
  &code_08D87C   ;01
  &code_08D9CC   ;02
  &code_08DA7D   ;03
]

---------------------------------------------

func_08D7EA {
    LDA #$FFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [08] ( #$0C0C )
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EE000 )
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    LDA $0B12
    STA $scene_next
    LDA $0B08
    ASL 
    ASL 
    ASL 
    ASL 
    STA $064C
    LDA $0B0C
    INC 
    INC 
    ASL 
    ASL 
    ASL 
    ASL 
    STA $064E
    LDA #$0003
    STA $0650
    LDA $0B10
    STA $0652
    STZ $0AAC
    LDA #$0101
    STA $064A
    LDA #$0002
    STA $0648
    COP [C1]
    RTL 
}


code_08D856 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D862 )
    BRA code_08D863
}


code_08D862 {
    RTL 
}


code_08D863 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D876 )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08D876 {
    COP [C8] ( &code_08DAF0 )
    BRA code_08D856
}


code_08D87C {
    LDA $0AD4
    STA $0000
    COP [D9] ( #$0000, &code_list_08D888 )
}


code_list_08D888 [
  &code_08D88E   ;00
  &code_08D8FA   ;01
  &code_08D966   ;02
]

code_08D88E {
    COP [32] ( #88 )
    COP [33]
    COP [32] ( #8A )
    COP [33]
    COP [D0] ( #B4, #00, &code_08D8A8 )
    COP [32] ( #8E )
    COP [33]
    COP [32] ( #8F )
    COP [33]
}


code_08D8A8 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D8C4 )
    COP [45] ( #03, #0A, #05, #0B, &code_08D8C4 )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D8C4 )
    BRA code_08D8C5
}


code_08D8C4 {
    RTL 
}


code_08D8C5 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D8E8 )
    COP [45] ( #03, #0A, #05, #0B, &code_08D8EE )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D8F4 )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08D8E8 {
    COP [C8] ( &code_08DAF0 )
    BRA code_08D8A8
}


code_08D8EE {
    COP [C8] ( &code_08F088 )
    BRA code_08D8A8
}


code_08D8F4 {
    COP [C8] ( &func_08F3EA )
    BRA code_08D8A8
}


code_08D8FA {
    COP [32] ( #87 )
    COP [33]
    COP [32] ( #8A )
    COP [33]
    COP [D0] ( #B4, #00, &code_08D914 )
    COP [32] ( #8E )
    COP [33]
    COP [32] ( #8F )
    COP [33]
}


code_08D914 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D930 )
    COP [45] ( #03, #0A, #05, #0B, &code_08D930 )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D930 )
    BRA code_08D931
}


code_08D930 {
    RTL 
}


code_08D931 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D954 )
    COP [45] ( #03, #0A, #05, #0B, &code_08D95A )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D960 )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08D954 {
    COP [C8] ( &code_08DAF0 )
    BRA code_08D914
}


code_08D95A {
    COP [C8] ( &func_08F2DF )
    BRA code_08D914
}


code_08D960 {
    COP [C8] ( &func_08F3EA )
    BRA code_08D914
}


code_08D966 {
    COP [32] ( #87 )
    COP [33]
    COP [32] ( #8A )
    COP [33]
    COP [32] ( #8D )
    COP [33]
    COP [32] ( #8F )
    COP [33]

  code_08D97A:
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D996 )
    COP [45] ( #03, #0A, #05, #0B, &code_08D996 )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D996 )
    BRA code_08D997
}


code_08D996 {
    RTL 
}


code_08D997 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08D9BA )
    COP [45] ( #03, #0A, #05, #0B, &code_08D9C0 )
    COP [45] ( #0B, #0A, #0D, #0B, &code_08D9C6 )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08D9BA {
    COP [C8] ( &code_08DAF0 )
    BRA code_08D97A
}


code_08D9C0 {
    COP [C8] ( &func_08F2DF )
    BRA code_08D97A
}


code_08D9C6 {
    COP [C8] ( &code_08F088 )
    BRA code_08D97A
}


code_08D9CC {
    COP [32] ( #8A )
    COP [33]
    PHX 
    LDX #$0000

  code_08D9D5:
    LDA $@binary_08EB5A, X
    BEQ code_08DA44
    AND #$00FF
    CMP $0B12
    BEQ code_08D9E7
    INX 
    INX 
    BRA code_08D9D5
}


code_08D9E7 {
    LDA $@binary_08EB5A+1, X
    AND #$00FF
    PLX 
    AND #$000F
    BEQ code_08DA1C
    COP [32] ( #86 )
    COP [33]
    LDA #$0000
    STA $7F0010, X
    COP [A5] ( @func_08E9D4, #00, #00, #$3800 )
    LDA #$0040
    STA $0014, Y
    LDA #$006D
    STA $0016, Y
    LDA $06
    STA $0026, Y
    BRA code_08DA45
}


code_08DA1C {
    COP [32] ( #8B )
    COP [33]
    LDA #$0001
    STA $7F0010, X
    COP [A5] ( @func_08E9D4, #00, #00, #$3800 )
    LDA #$0040
    STA $0014, Y
    LDA #$0054
    STA $0016, Y
    LDA $06
    STA $0026, Y
    BRA code_08DA45
}


code_08DA44 {
    PLX 
}


code_08DA45 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08DA51 )
    BRA code_08DA52
}


code_08DA51 {
    RTL 
}


code_08DA52 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08DA65 )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08DA65 {
    COP [C8] ( &code_08DAF0 )
    BRA code_08DA45
    LDA $7F0010, X
    BNE code_08DA77
    COP [C8] ( &func_08F2DF )
    BRA code_08DA45
}


code_08DA77 {
    COP [C8] ( &code_08F088 )
    BRA code_08DA45
}


code_08DA7D {
    LDA #$0001
    STA $0AAC
    JMP $&code_08D87C
    COP [32] ( #8B )
    COP [33]
    COP [32] ( #8F )
    COP [33]
    COP [32] ( #89 )
    COP [33]
    COP [32] ( #8A )
    COP [33]
    COP [A5] ( @func_08EF32, #00, #00, #$3800 )
    LDA #$00C0
    STA $0014, Y
    LDA #$0078
    STA $0016, Y
    LDA $06
    STA $0026, Y

  code_08DAB4:
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08DAC8 )
    COP [45] ( #03, #0A, #05, #0B, &code_08DAC8 )
    BRA code_08DAC9
}


code_08DAC8 {
    RTL 
}


code_08DAC9 {
    COP [C1]
    COP [45] ( #07, #08, #09, #09, &code_08DAE4 )
    COP [45] ( #03, #0A, #05, #0B, &code_08DAEA )
    COP [45] ( #05, #0D, #0B, #0F, &func_08D7EA )
    RTL 
}


code_08DAE4 {
    COP [C8] ( &code_08DAF0 )
    BRA code_08DAB4
}


code_08DAEA {
    COP [C8] ( &func_08F3EA )
    BRA code_08DAB4
}


code_08DAF0 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    LDA #$FFF0
    TRB $joypad_mask_std
    LDY $06
    LDA #$FFFF
    STA $0024, Y
    COP [D0] ( #DC, #01, &code_08DB14 )
    COP [CC] ( #DC )
    COP [BF] ( &widestring_08DD0B )
}


code_08DB14 {
    LDA $0ACE
    CMP $0ACA
    BEQ code_08DB37
    COP [BF] ( &widestring_08DE4D )
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA #$0028
    STA $0B22
    COP [C1]
    LDA $0ACE
    CMP $0ACA
    BEQ code_08DB37
    RTL 
}


code_08DB37 {
    PHX 
    LDX #$0000

  code_08DB3B:
    LDA $@binary_08DE72, X
    AND #$00FF
    BEQ code_08DB9A
    CMP $0B12
    BEQ code_08DB4C
    INX 
    BRA code_08DB3B
}


code_08DB4C {
    STX $0000
    PLX 
    COP [D9] ( #$0000, &code_list_08DB56 )
}


code_list_08DB56 [
  &code_08DC25   ;00
  &code_08DC28   ;01
  &code_08DC2F   ;02
  &code_08DC36   ;03
  &code_08DC3D   ;04
  &code_08DC40   ;05
  &code_08DC43   ;06
  &code_08DC46   ;07
  &code_08DC49   ;08
  &code_08DC4C   ;09
  &code_08DC53   ;0A
  &code_08DC56   ;0B
  &code_08DC59   ;0C
  &code_08DC5C   ;0D
  &code_08DC5F   ;0E
  &code_08DC62   ;0F
  &code_08DC69   ;10
  &code_08DC70   ;11
  &code_08DC73   ;12
  &code_08DC76   ;13
  &code_08DC79   ;14
  &code_08DC80   ;15
  &code_08DC83   ;16
  &code_08DC86   ;17
  &code_08DC89   ;18
  &code_08DC90   ;19
  &code_08DC93   ;1A
  &code_08DC96   ;1B
  &code_08DC9D   ;1C
  &code_08DCA4   ;1D
  &code_08DCA7   ;1E
  &code_08DCFA   ;1F
  &code_08DCFD   ;20
  &code_08DD04   ;21
]

code_08DB9A {
    PLX 

  code_08DB9B:
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_08DDCB )
    COP [BE] ( #02, #02, &code_list_08DBAB )
}


code_list_08DBAB [
  &code_08DBDA   ;00
  &code_08DBB1   ;01
  &code_08DBDA   ;02
]

code_08DBB1 {
    LDA $0D8C
    JSL $@func_03D916
    COP [07] ( #29 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_08DDFE )
    COP [BE] ( #02, #01, &code_list_08DBD4 )
}


code_list_08DBD4 [
  &code_08DBE8   ;00
  &code_08DBDA   ;01
  &code_08DBE8   ;02
]

code_08DBDA {
    COP [BF] ( &widestring_08DE43 )
    LDY $06
    LDA #$0000
    STA $0024, Y
    COP [C5]
}


code_08DBE8 {
    COP [BF] ( &widestring_08DE32 )
    LDY $06
    LDA #$0000
    STA $0024, Y
    LDA #$FFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [88] ( @table_0EE000 )
    LDA #$2000
    TRB $10
    COP [80] ( #1C )
    COP [89]
    COP [05] ( #0E )
    COP [C1]
    RTL 
}


code_08DC25 {
    JMP $&code_08DB9B
}


code_08DC28 {
    COP [BF] ( &widestring_08DED3 )
    JMP $&code_08DB9B
}


code_08DC2F {
    COP [BF] ( &widestring_08DF80 )
    JMP $&code_08DB9B
}


code_08DC36 {
    COP [BF] ( &widestring_08DFEE )
    JMP $&code_08DB9B
}


code_08DC3D {
    JMP $&code_08DB9B
}


code_08DC40 {
    JMP $&code_08DB9B
}


code_08DC43 {
    JMP $&code_08DB9B
}


code_08DC46 {
    JMP $&code_08DB9B
}


code_08DC49 {
    JMP $&code_08DB9B
}


code_08DC4C {
    COP [BF] ( &widestring_08E1EE )
    JMP $&code_08DB9B
}


code_08DC53 {
    JMP $&code_08DB9B
}


code_08DC56 {
    JMP $&code_08DB9B
}


code_08DC59 {
    JMP $&code_08DB9B
}


code_08DC5C {
    JMP $&code_08DB9B
}


code_08DC5F {
    JMP $&code_08DB9B
}


code_08DC62 {
    COP [BF] ( &widestring_08E2F8 )
    JMP $&code_08DB9B
}


code_08DC69 {
    COP [BF] ( &widestring_08E3A7 )
    JMP $&code_08DB9B
}


code_08DC70 {
    JMP $&code_08DB9B
}


code_08DC73 {
    JMP $&code_08DB9B
}


code_08DC76 {
    JMP $&code_08DB9B
}


code_08DC79 {
    COP [BF] ( &widestring_08E428 )
    JMP $&code_08DB9B
}


code_08DC80 {
    JMP $&code_08DB9B
}


code_08DC83 {
    JMP $&code_08DB9B
}


code_08DC86 {
    JMP $&code_08DB9B
}


code_08DC89 {
    COP [BF] ( &widestring_08E4A4 )
    JMP $&code_08DB9B
}


code_08DC90 {
    JMP $&code_08DB9B
}


code_08DC93 {
    JMP $&code_08DB9B
}


code_08DC96 {
    COP [BF] ( &widestring_08E540 )
    JMP $&code_08DB9B
}


code_08DC9D {
    COP [BF] ( &widestring_08E58B )
    JMP $&code_08DB9B
}


code_08DCA4 {
    JMP $&code_08DB9B
}


code_08DCA7 {
    LDA $0AAC
    BNE code_08DCAF
    JMP $&code_08DB9B
}


code_08DCAF {
    COP [D6] ( #24, &code_08DCEC )
    COP [D4] ( #24, &code_08DCF3 )
    COP [BF] ( &widestring_08E66C )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [04] ( #18 )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_08E7E7 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_08DCDF
    RTL 
}


code_08DCDF {
    COP [04] ( #16 )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_08E722 )
    JMP $&code_08DB9B
}


code_08DCEC {
    COP [BF] ( &widestring_08E722 )
    JMP $&code_08DB9B
}


code_08DCF3 {
    COP [BF] ( &widestring_08E800 )
    JMP $&code_08DB9B
}


code_08DCFA {
    JMP $&code_08DB9B
}


code_08DCFD {
    COP [BF] ( &widestring_08E853 )
    JMP $&code_08DB9B
}


code_08DD04 {
    COP [BF] ( &widestring_08E98A )
    JMP $&code_08DB9B
}


---------------------------------------------

widestring_08DD0B `[DEF]I am [LU2:12]the source of[N]all [LU2:7D]I [LU1:EF]help[N]you on [LU1:FE]journey.[FIN][LU1:38]one [LU1:F0]the Dark[N][LU2:25]can see this[N]space. You are the[N]chosen one.[FIN]In the [LU2:5C]space you[N]can record a travel[N]journal. Stop there[N][LU1:74]you depart.[FIN]`

widestring_08DDCB `[DEF][CLR]Record what's happened[N]so far?[N] Record[N] [LU1:D]record`

widestring_08DDFE `[CLR]Finished recording...[FIN]Continue [LU1:FE]journey?[N] Yes[N] No`

widestring_08DE32 `[CLR]Then [LU2:9C]a while.[END]`

widestring_08DE43 `[CLR]Then go.[END]`

widestring_08DE4D `[DEF][CLR]It [LU1:AA][LU1:A5]you're[N]hurt. Close [LU1:FE]eyes.[FIN]`

---------------------------------------------

binary_08DE72 #010B151E2628343D40424C5154565A60626C7C858699A1A3A7ACB6B8BBC3CCE0E3120000

---------------------------------------------

widestring_08DE96 [
  `[DEF][CLR]I am [LU2:12]the source of[N]all [LU2:7D][LU1:1F][LU1:97]you[N][LU1:D0]advice.[FIN]`   ;00
  `[DEF][CLR]Hint Test[FIN]`   ;01
]

widestring_08DED3 `[PRT:@widestring_08DE96][LU1:61]you defeat all the [N][LU1:8C]in an area, you [N][LU1:EF]get a jewel [LU1:D7][N]increases [LU1:FE]abilities.[FIN]Push the Start Button[N]to see the locations of[N][LU1:FE]enemies.[FIN]Find the [LU1:87][N]and defeat them. [FIN]`

widestring_08DF80 `[PRT:@widestring_08DE96]Will's [LU1:C2]- the [N][LU1:3C]Dash. It can [N][LU1:88]obstacles. [FIN]Always be alert. If you[N][LU1:90]a suspicious place,[N]try to [LU1:88]it.[FIN]`

widestring_08DFEE [
  `[PRT:@widestring_08DE96]Then you [LU1:EF]fight[N]a [LU1:9C]enemy.[FIN][LU1:61]he suffers damage, [N]rays of [LU1:A8][LU1:EF]shoot [N][LU1:8E]his head. [FIN]If you suffer damage[N]hide [LU2:51]him.[FIN]`   ;00
  `[PRT:@widestring_08DE96]The [LU2:58]to the Gold[N]Ship is in a [LU2:90]paved[N][LU1:F0]gold tiles.[FIN]Listen to the [LU1:B4][N]of the Incan spirit. [FIN]`   ;01
  `[PRT:@widestring_08DE96]To defeat an enemy you[N][LU1:78]touch, [LU1:DA]about[N][LU1:F7][LU1:9D]under[N][LU1:11]Castle.[FIN][RET]`   ;02
  `[PRT:@widestring_08DE96]The wall [LU1:F4]the wind[N]blows...it's easy to[N]break [LU1:DC]where[N]the stones are cracked.[FIN]If you [LU1:78][LU1:90]it, [N]listen for the [LU2:89][LU2:90][N][LU1:F4]the sound is[N]different. [FIN]`   ;03
  `[PRT:@widestring_08DE96]The keys are on a grate[N]in the [LU2:65]of the[N]mine. Find the laborer[N]who has them.[FIN]`   ;04
]

widestring_08E1EE [
  `[PRT:@widestring_08DE96][LU1:15][LU1:C2]- The[N][LU1:C]Friar can defeat[N][LU1:8C]in places a[N]sword [LU1:78]reach.[FIN][LU1:61]you've defeated[N]all the enemies[N]the [LU2:9B][LU1:EF]open up.[FIN][RET]`   ;00
  `[PRT:@widestring_08DE96]Take away the obstacle[N]in front, and the back[N]appears. Remove the[N]blocking pillar.[FIN]`   ;01
  `[PRT:@widestring_08DE96]The switch on the [LU2:65][N]cannot be activated [N]by [LU1:FE]weight. [FIN][RET]`   ;02
  ``   ;03
]

widestring_08E2F8 `[PRT:@widestring_08DE96][LU1:61]you [LU1:CB][LU1:D6][N]journey,  Mu began [N]to rise [LU1:8E]the sea. [FIN]Sea [LU2:C0][LU1:D3]covers [N]land in [LU1:B6]places [N]on the continent. [FIN][LU1:61]the [LU2:C0]is gone [N]you [LU1:EF]discover [N]the location of [N]Rama, [LU1:27]of Mu. [FIN]`

widestring_08E3A7 [
  `[PRT:@widestring_08DE96]Will's [LU1:C2]is the [N][LU1:3C]Slider. Pass [N][LU1:DC]narrow corridors [N]using [LU1:D6]power. [FIN]Be careful not to[N]overlook the cracks[N]in the cliff.[FIN][RET]`   ;00
  `[RET]`   ;01
]

widestring_08E428 [
  `[PRT:@widestring_08DE96]Will's [LU1:C2]is the [N][LU2:31]Dash. Use [LU1:D6]to [N]climb hills and jump. [FIN]There are [LU1:B6]hills at[N]the [LU1:16]Wall of China.[N]Try everything.[FIN][RET]`   ;00
  `[RET]`   ;01
]

widestring_08E4A4 [
  `[PRT:@widestring_08DE96][LU1:15][LU1:C2]is [N]the Aura Barrier. It [N]puts a layer of Aura [N][LU1:6D]his body. [FIN]Enemies at the mountain [N][LU1:E5]are strong.If [N]you use [LU1:D6]power, [LU1:FE][N]battles [LU1:EF]be easier. [FIN][RET]`   ;00
  ``   ;01
]

widestring_08E540 `[PRT:@widestring_08DE96][LU1:15][LU2:25]is the [N]Earthquaker.[FIN][LU1:61]he uses it,[N]his enemy [LU1:78]move[N]for a [LU1:A6]time.[FIN]`

widestring_08E58B [
  `[DEF][CLR]This is the [LU1:E5]at[N]Ankor Wat.[FIN]It [LU1:D5]quietly in [N]the jungle and hides [N]its form [LU1:F6][LU1:C1][N][LU1:79]near... [FIN]On [LU1:D6]top [LU2:65]you[N][LU1:EF][LU1:E9]why you[N][LU1:B3]the journey.[FIN][RET]`   ;00
  `[PRT:@widestring_08DE96]The [LU1:3F]is divided [N][LU1:A1]six blocks. [FIN]Use the [LU1:C][LU2:25][N]previously obtained, in[N]each area. [FIN]`   ;01
]

widestring_08E66C `[DEF][CLR]I am [LU2:12]the source of[N][LU2:7D]The [LU1:C][LU2:25]has[N][LU1:71]strong in the[N][LU1:E5]at Ankor Wat.[FIN]If you stand [LU1:74]the [N][LU1:C6]statue, you [N]can [LU2:52][LU1:A1]Shadow, [N]the ultimate warrior.  [FIN]Then I [LU1:DA]I will[N]grant you one item.[FIN]`

widestring_08E722 `[DEF][CLR]The Aura is [LU1:4C][N]mind. [LU1:61]he holds it [N]up, his [LU1:72]becomes [N][LU1:A5]water. [FIN][LU1:38]a small part of the[N][LU1:3F]is above ground.[N]Most of it is below[N]the surface.[FIN]You [LU1:CA][LU2:52]into[N]the Shadow and advance[N][LU1:A1]the underground.[FIN]`

widestring_08E7E7 `[DEF][CLR][DLY:9]You [LU1:98]the Aura![PAU:78][DLY:1][FIN]`

widestring_08E800 `[DEF][CLR]I am [LU2:12]the source of[N][LU2:7D]I [LU1:DA][LU1:1F]give[N]you one item.[FIN]Cut down on your[N][LU1:A0]and [LU1:79]back.[FIN][RET]`

widestring_08E853 `[DEF][CLR]The [LU1:7B]draws near.[N]The [LU1:DF]for [LU1:FE]last[N]battle approaches.[FIN]This is the [LU2:79][LU1:DF]I[N][LU1:EF][LU2:AC]to you like[N][LU1:D6]in [LU1:D6]place.[FIN][LU2:40][LU1:FE]rejuvenated [N]power, defeat the comet,[N][LU1:C]Gaia and [LU1:71][N]the [LU1:C]Knight. [FIN][LU1:4C]greatest power,[N]the [LU2:10][LU1:EF]arise[N][LU1:F6][LU1:FF]one [LU1:F0][N]the Light Knight.[FIN][LU1:38]you can restore the [N][LU1:14]to its [LU1:C0][N][LU2:56]I'm putting [N]all my faith in you... [FIN]`

widestring_08E98A `[PRT:@widestring_08DE96][LU1:68][LU2:A3]is only[N]temporary. Try standing[N]in front of the statue[N][LU1:BC]to you.[FIN]`

---------------------------------------------

func_08E9D4 {
    PHX 
    LDX #$0000
    LDY #$0000

  code_08E9DB:
    LDA $@binary_08EB5A, X
    BEQ code_08E9EE
    AND #$00FF
    CMP $0B12
    BEQ code_08E9F1
    INX 
    INX 
    INY 
    BRA code_08E9DB
}


code_08E9EE {
    PLX 
    COP [E0]
}


code_08E9F1 {
    LDA $@binary_08EB5A+1, X
    AND #$00FF
    STA $24
    AND $0AA2
    BNE code_08E9EE
    TYA 
    STA $0AAC
    PLX 
    COP [8D] ( #0A )
    LDA #$2000
    TRB $10
    COP [C1]
    COP [C1]
    COP [8B]
    COP [45] ( #03, #0A, #05, #0B, &code_08EA1B )
    RTL 
}


code_08EA1B {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    JSR $&sub_08EB2F
    CMP #$0000
    BEQ code_08EA78
    LDA $0AD4
    BEQ code_08EA58
    CMP #$0002
    BEQ code_08EA38
    BRA code_08EA9B
}


code_08EA38 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F2A3
    STA $0002, Y
    REP #$20
    LDA #$&func_08F2A3
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    BRA code_08EA9B
}


code_08EA58 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F26E
    STA $0002, Y
    REP #$20
    LDA #$&func_08F26E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    BRA code_08EA9B
}


code_08EA78 {
    LDA $0AD4
    BEQ code_08EA9B
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F37D
    STA $0002, Y
    REP #$20
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
}


code_08EA9B {
    COP [C1]
    COP [C1]
    COP [8B]
    LDA $player_flags
    BIT #$0800
    BEQ code_08EAAA
    RTL 
}


code_08EAAA {
    COP [CA] ( #08 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [C1]
    COP [8B]
    COP [CB]
    LDA $24
    ORA $0AA2
    STA $0AA2
    COP [86] ( #0A, #03, #14 )
    COP [8A]
    COP [84] ( #0A, #03 )
    COP [8A]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #0A, #01 )
    LDA #$2000
    TSB $10
    LDA #$0800
    TRB $10
    COP [04] ( #18 )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_08EB68 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_08EB0D
    RTL 
}


code_08EB0D {
    LDY $26
    LDA #$FFFF
    STA $0024, Y
    COP [BF] ( &widestring_08EB85 )
    LDY $26
    LDA #$0000
    STA $0024, Y
    COP [04] ( #16 )
    COP [DA] ( #3B )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [E0]
}


---------------------------------------------

sub_08EB2F {
    PHX 
    LDX #$0000

  code_08EB33:
    LDA $@binary_08EB5A, X
    BEQ code_08EB57
    AND #$00FF
    CMP $0B12
    BEQ code_08EB45
    INX 
    INX 
    BRA code_08EB33
}


code_08EB45 {
    LDA $@binary_08EB5A+1, X
    AND #$00FF
    PLX 
    AND #$00F0
    BNE code_08EB53
    RTS 
}


code_08EB53 {
    LDA #$0001
    RTS 
}


code_08EB57 {
    PLX 
    SEC 
    RTS 
}


---------------------------------------------

binary_08EB5A #1501620286044210A720B8400000

---------------------------------------------

widestring_08EB68 `[DEF][DLY:9][ADR:&table_08EB8F,AAC][N]can now be used![PAU:78][FIN]`

widestring_08EB85 `[DEF][CLR][DLY:2][ADR:&table_08EBD3,AAC][END]`

---------------------------------------------

table_08EB8F [
  &widestring_08EB9B   ;00
  &widestring_08EBA2   ;01
  &widestring_08EBAB   ;02
  &widestring_08EBB2   ;03
  &widestring_08EBBA   ;04
  &widestring_08EBC7   ;05
]

widestring_08EB9B `[LU1:3C]Dash`

widestring_08EBA2 `[LU1:3C]Slider`

widestring_08EBAB `[LU2:31]Dash`

widestring_08EBB2 `[LU1:C]Friar`

widestring_08EBBA `Aura Barrier`

widestring_08EBC7 `Earthquaker`

---------------------------------------------

table_08EBD3 [
  &widestring_08EBDF   ;00
  &widestring_08EC66   ;01
  &widestring_08ECEA   ;02
  &widestring_08ED6D   ;03
  &widestring_08EDF2   ;04
  &widestring_08EE8B   ;05
]

widestring_08EBDF `[LU1:38]young Will can use [N]the [LU1:3C]Dash. [FIN]You can smash walls[N]and obstacles by hurling[N]yourself against them.[FIN]Use the Attack [LU2:2][N]to [LU1:D1]energy. `

widestring_08EC66 `[LU1:38]young Will can use [N]the [LU1:3C]Slider. [FIN]You can now use the[N]Sliding Attack to pass[N][LU1:DC]small[N]passageways.[FIN]Push the Attack [LU2:2][N][LU1:F6]running. `

widestring_08ECEA `[LU1:38]young Will can use [N]the [LU2:31]Dash. [FIN][LU2:31][LU1:FE][LU1:72]to[N]send [LU1:8C]flying,[N]and use the recoil[N]to climb hills.[FIN]Use the Attack and LR [N][LU2:3]for power. `

widestring_08ED6D `The [LU1:C]Friar is a dark[N][LU1:C2][LU1:D7][LU2:89]the Dark[N]Knight, Freedan,[N]can use.[FIN]Use the Aura [LU2:25]to [N]scorch a [LU1:85]enemy. [N]Use the Attack [LU2:2][N]to [LU1:D1]energy. `

widestring_08EDF2 `The Aura Barrier is a [N][LU1:C][LU2:25][LU1:D7]can [LU2:89][N]be [LU2:BB]by the [LU1:C] [N]Knight, Freedan. [FIN]Use the [LU1:C2]of[N]the Aura to put a[N]barrier [LU1:6D]you.[FIN]Use the Attack and LR [N][LU2:3]for power. `

widestring_08EE8B `The Earthquaker is a[N][LU1:C][LU2:25][LU1:D7]can only[N]be [LU2:BB]by Freedan,[N]the [LU1:C]Knight.[FIN]This causes earthquakes.[N]The enemy [LU1:FA]be able[N]to [LU1:B5]for a [LU1:A6]time.[FIN]Push the Attack [LU2:2][N][LU1:F6]jumping down. `

---------------------------------------------

func_08EF32 {
    COP [D6] ( #24, &code_08EFC7 )
    COP [8D] ( #0A )
    LDA #$2000
    TRB $10

  code_08EF3F:
    COP [C1]
    COP [C1]
    COP [8B]
    COP [45] ( #0B, #0A, #0D, #0B, &code_08EF4E )
    RTL 
}


code_08EF4E {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    COP [D4] ( #24, &code_08EFC9 )
    COP [86] ( #0A, #03, #14 )
    COP [8A]
    COP [84] ( #0A, #03 )
    COP [8A]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $7F001A, X
    COP [22] ( #0A, #01 )
    LDA #$2000
    TSB $10
    LDA #$0800
    TRB $10
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08EFEF )
    COP [DA] ( #03 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_08EFAD
    RTL 
}


code_08EFAD {
    LDY $26
    LDA #$FFFF
    STA $0024, Y
    COP [BF] ( &widestring_08F003 )
    LDY $26
    LDA #$0000
    STA $0024, Y
    LDA #$FFF0
    TRB $joypad_mask_std
}


code_08EFC7 {
    COP [E0]
}


code_08EFC9 {
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_08F060 )
    LDA #$0800
    TSB $10
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [C1]
    COP [C1]
    COP [8B]
    COP [45] ( #0B, #0A, #0D, #0B, &code_08EFEE )
    JMP $&code_08EF3F
}


code_08EFEE {
    RTL 
}


widestring_08EFEF `[DEF][DLY:9]You [LU1:98]the Aura![FIN]`

widestring_08F003 `[DEF][CLR][DLY:2][LU1:38]Shadow can use[N]the Aura.[FIN][LU1:61]you hold [LU1:D6]up [N][LU1:4C][LU1:72][LU1:EF][LU2:B9][N]to [LU2:C0]and he can flow [N]underground. [END]`

widestring_08F060 `[DEF][LU1:68][LU1:A0]is full. [N]Store [LU1:E0][LU2:A9][N]and return [LU2:74][END]`

code_08F088 {
    LDA $0AD4
    CMP #$0001
    BEQ code_08F0CA
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [D0] ( #F7, #01, &code_08F0CC )
    COP [CC] ( #F7 )
    COP [BF] ( &widestring_08F157 )
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F235
    STA $0002, Y
    REP #$20
    LDA #$&func_08F235
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
}


code_08F0CA {
    COP [C5]
}


code_08F0CC {
    COP [BF] ( &widestring_08F12B )
    COP [BE] ( #02, #02, &code_list_08F0D6 )
}


code_list_08F0D6 [
  &code_08F125   ;00
  &code_08F0DC   ;01
  &code_08F125   ;02
]

code_08F0DC {
    COP [BF] ( &widestring_08F155 )
    LDA $0AD4
    BNE code_08F105
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F26E
    STA $0002, Y
    REP #$20
    LDA #$&func_08F26E
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F105 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F2A3
    STA $0002, Y
    REP #$20
    LDA #$&func_08F2A3
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F125 {
    COP [BF] ( &widestring_08F155 )
    COP [C5]
}


widestring_08F12B `[TPL:B][LU1:B][LU1:A1]the [LU1:C][N]Knight, Freedan? [N] Yes [N] No `

widestring_08F155 `[CLD]`

widestring_08F157 `[TPL:B][CLR][TPL:0]Will hears a [LU1:EE][N]in his head. [FIN][TPL:4]Will. [N][LU1:20][LU1:70][LU1:FD]a [LU1:A6][N][LU1:DF]for you to come. [FIN]I am Freedan.[N]I am eternal.[FIN]Let me help you on [N][LU1:FE]journey. As [LU1:DF][N]goes by, you'll [LU1:79]to [N][LU1:E9]my nature.... [FIN][PAL:0]Will gradually loses [N]consciousness... [N][END]`

---------------------------------------------

func_08F235 {
    COP [8E] ( #05 )
    COP [80] ( #00 )
    COP [89]
    COP [08] ( #$2525 )
    COP [84] ( #02, #02 )
    COP [8A]
    COP [84] ( #03, #02 )
    COP [8A]
    COP [3B] ( #0C, @func_00B519 )
    COP [84] ( #08, #02 )
    COP [8A]
    COP [84] ( #09, #02 )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    LDA #$0001
    STA $0AD4
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F26E {
    COP [8E] ( #05 )
    COP [80] ( #01 )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #02 )
    COP [89]
    COP [80] ( #03 )
    COP [89]
    COP [3B] ( #0C, @func_00B519 )
    COP [80] ( #08 )
    COP [89]
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0B )
    COP [89]
    LDA #$0001
    STA $0AD4
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F2A3 {
    COP [8E] ( #05 )
    COP [80] ( #0D )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #10 )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [80] ( #0E )
    COP [89]
    LDA #$0001
    STA $0AD4
    COP [C2]
    COP [3B] ( #0C, @func_00B519 )
    COP [80] ( #08 )
    COP [89]
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #0B )
    COP [89]
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F2DF {
    LDA $0AD4
    BNE code_08F2E6
    COP [C5]
}


code_08F2E6 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_08F357 )
    COP [BE] ( #02, #01, &code_list_08F2FF )
}


code_list_08F2FF [
  &code_08F351   ;00
  &code_08F305   ;01
  &code_08F351   ;02
]

code_08F305 {
    COP [BF] ( &widestring_08F37B )
    LDA $0AD4
    CMP #$0001
    BNE code_08F331
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F37D
    STA $0002, Y
    REP #$20
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F331 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F3B1
    STA $0002, Y
    REP #$20
    LDA #$&func_08F3B1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F351 {
    COP [BF] ( &widestring_08F37B )
    COP [C5]
}


widestring_08F357 `[TPL:B]Return to young Will? [N] Yes [N] No `

widestring_08F37B `[CLD]`

---------------------------------------------

func_08F37D {
    COP [8E] ( #05 )
    COP [80] ( #06 )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #08 )
    COP [89]
    STZ $0AD4
    COP [C2]
    COP [3B] ( #0B, @func_00B519 )
    COP [80] ( #03 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F3B1 {
    COP [8E] ( #05 )
    COP [80] ( #0D )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #10 )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [80] ( #0E )
    COP [89]
    STZ $0AD4
    COP [C2]
    COP [3B] ( #0B, @func_00B519 )
    COP [80] ( #03 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [80] ( #05 )
    COP [89]
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F3EA {
    COP [D0] ( #B4, #00, &code_08F41B )
    LDA $0AD4
    CMP #$0002
    BEQ code_08F41B
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #05 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [D0] ( #DD, #01, &code_08F41D )
    COP [CC] ( #DD )
    COP [BF] ( &widestring_08F4B1 )
    LDA $0AD4
    BEQ code_08F436
    BRA code_08F456
}


code_08F41B {
    COP [C5]
}


code_08F41D {
    COP [BF] ( &widestring_08F47C )
    COP [BE] ( #02, #02, &code_list_08F427 )
}


code_list_08F427 [
  &code_08F476   ;00
  &code_08F42D   ;01
  &code_08F476   ;02
]

code_08F42D {
    COP [BF] ( &widestring_08F4AF )
    LDA $0AD4
    BNE code_08F456
}


code_08F436 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F5F9
    STA $0002, Y
    REP #$20
    LDA #$&func_08F5F9
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F456 {
    LDY $player_actor
    SEP #$20
    LDA #$^func_08F63C
    STA $0002, Y
    REP #$20
    LDA #$&func_08F63C
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C5]
}


code_08F476 {
    COP [BF] ( &widestring_08F4AF )
    COP [C5]
}


widestring_08F47C `[TPL:B][LU1:B]to the ultimate[N][LU1:C]warrior, Shadow? [N] Yes [N] No `

widestring_08F4AF `[CLD]`

widestring_08F4B1 `[TPL:B]A [LU1:EE]echoes inside[N]his head.[FIN][TPL:4][LU1:20][LU1:70][LU1:FD]for[N]you to come.[FIN]I am [LU1:B3][LU1:8E]the light[N]of a comet. The ultimate[N]warrior, Shadow.[FIN]My [LU1:72]has no shape.[N]This [LU1:72]appears only[N][LU1:F6]the human[N]consciousness evolves.[FIN]The [LU1:7B][LU1:D7]now [N]approaches [LU1:14]is [N][LU2:48]a consciousness [N][LU1:F8]form. [FIN]My [LU1:72]is the only[N][LU1:E3][LU1:D7]can confront[N]the [LU1:7B]and[N][LU2:4E]it to an end.[FIN][LU1:63]close [LU1:FE]eyes...[PAL:0][END]`

---------------------------------------------

func_08F5F9 {
    COP [8E] ( #05 )
    COP [80] ( #00 )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #02 )
    COP [89]
    COP [80] ( #03 )
    COP [89]
    COP [3B] ( #6C, @func_00B519 )
    COP [80] ( #0E )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [A5] ( @e_actor_02B20E, #00, #00, #$2800 )
    LDA #$0002
    STA $0AD4
    COP [80] ( #10 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

func_08F63C {
    COP [8E] ( #05 )
    COP [80] ( #07 )
    COP [89]
    COP [08] ( #$2525 )
    COP [80] ( #09 )
    COP [89]
    COP [80] ( #08 )
    COP [89]
    COP [3B] ( #6C, @func_00B519 )
    COP [80] ( #0E )
    COP [89]
    COP [80] ( #0F )
    COP [89]
    COP [A5] ( @e_actor_02B20E, #00, #00, #$2800 )
    LDA #$0002
    STA $0AD4
    COP [80] ( #10 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    JSR $&sub_08F6D3
    RTL 
}


---------------------------------------------

h_actor_08F67F [
  h_actor < #02, #00, #28 >   ;00
]

---------------------------------------------

e_actor_08F67F {
    LDA #$1000
    TSB $12
}


code_08F687 {
    COP [C2]
    COP [23]
    AND #$000F
    ASL 
    ASL 
    ASL 
    STA $08
    COP [9C] ( @code_08F69C, #$1B02 )
    BRA code_08F687
}


code_08F69C {
    LDA #$1000
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [8D] ( #02 )
    LDA #$0000
    STA $16
    COP [23]
    ASL 
    STA $14
    AND #$0003
    ASL 
    CLC 
    ADC #$0004
    STA $7F0018, X
    DEC 
    STA $7F001A, X

  code_08F6C4:
    COP [B1]
    COP [C1]
    COP [89]
    LDA $16
    CMP #$00FF
    BCC code_08F6C4
    COP [E0]
}


---------------------------------------------

sub_08F6D3 {
    PHX 
    LDX $player_actor
    LDA #$*code_02C3C8
    STA $0002, X
    LDA #$&code_02C3C8
    STA $0000, X
    LDA #$0000
    STA $002C, X
    STA $002E, X
    STA $0008, X
    LDA $0010, X
    AND #$FDFF
    ORA #$0008
    STA $0010, X
    LDA #$0F00
    TRB $joypad_mask_std
    LDA #$0800
    TRB $player_flags
    PLX 
    RTS 
}


---------------------------------------------

e_actor_09A090 {
    COP [80] ( #00 )
    COP [89]
    RTL 
}


code_09A096 {
    COP [8D] ( #01 )
    LDA #$0000
    STA $24

  code_09A09E:
    COP [C1]
    LDA $24
    BNE code_09A0A5
    RTL 
}


code_09A0A5 {
    LDA $06F8
    BNE code_09A0AB
    RTL 
}


code_09A0AB {
    COP [23]
    AND #$0003
    DEC 
    BEQ code_09A0C1
    DEC 
    BEQ code_09A0CC
    COP [80] ( #01 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A09E
}


code_09A0C1 {
    COP [80] ( #02 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A09E
}


code_09A0CC {
    COP [80] ( #03 )
    COP [89]
    COP [C1]
    COP [8B]
    BRA code_09A09E
}


