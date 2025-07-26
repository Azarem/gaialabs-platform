
?INCLUDE 'thinker_00B7E0'
?INCLUDE 'thinker_00B7EA'
?INCLUDE 'table_0EE000'
?INCLUDE 'f_inventory_full'
?INCLUDE 'actor_00E155'

!joypad_mask_std                065A

---------------------------------------------

h_ec0B_cell [
  h_actor < #23, #00, #38 >   ;00
]

---------------------------------------------

e_ec0B_cell {
    COP [D0] ( #24, #01, &code_04D30E )
    COP [A5] ( @code_04DB00, #00, #00, #$2000 )
    COP [0F] ( #0E, #11 )
    COP [0F] ( #0F, #11 )
    LDA #$0800
    TRB $10
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04D42F )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #02, #01 )
    COP [D2] ( #03, #01 )
    COP [D2] ( #04, #01 )
    LDA #$1000
    TRB $10
    COP [C3] ( @code_04D251, #$04B0 )
    LDA #$1000
    TSB $10
}

code_04D251 {
    COP [BF] ( &widestring_04D60A )
    COP [A0] ( @code_04D346, #$0108, #$FFD0, #$1002 )
    COP [D2] ( #01, #01 )
    LDA #$1000
    TRB $10
    COP [C3] ( @code_04D275, #$0258 )
    LDA #$1000
    TSB $10
}

code_04D275 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04D679 )
    COP [DA] ( #1D )
    COP [3C] ( @e_thinker_00B7E0 )
    COP [DA] ( #BF )
    COP [BF] ( &widestring_04D732 )
    COP [3C] ( @e_thinker_00B7EA )
    COP [DA] ( #BF )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04D78A )
    COP [BE] ( #02, #02, &code_list_04D2A6 )
}

code_list_04D2A6 [
  &code_04D2AC   ;00
  &code_04D2AC   ;01
  &code_04D2AC   ;02
]

code_04D2AC {
    COP [BF] ( &widestring_04D87D )
    COP [A0] ( @code_04D408, #$00B8, #$FF70, #$0020 )
    COP [C1]
    LDA $0AD6
    BNE code_04D2C3
    RTL 
}

code_04D2C3 {
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04D8D2 )
    LDA #$1000
    TRB $10
    COP [C3] ( @code_04D2D6, #$012C )
}

code_04D2D6 {
    LDA #$1000
    TSB $10
    LDA #$2000
    TRB $10
    COP [BF] ( &widestring_04D4A5 )
    COP [86] ( #27, #06, #02 )
    COP [8A]
    COP [85] ( #29, #02, #01 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [9E] ( @code_04D310, #$0000, #$FFF0, #$1000 )
    COP [D2] ( #23, #01 )
    COP [86] ( #26, #0E, #01 )
    COP [8A]
}

code_04D30E {
    COP [E0]
}

code_04D310 {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [C0] ( &code_04D329 )
    COP [80] ( #00 )
    COP [89]
    COP [D2] ( #23, #01 )
    COP [E0]
}

code_04D329 {
    COP [BF] ( &widestring_04D4B1 )
    COP [D4] ( #02, &code_04D342 )
    COP [CC] ( #23 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_04D5F4 )
    RTL 
}

code_04D342 {
    JML $@f_inventory_full
}

code_04D346 {
    LDA #$0800
    TRB $10
    COP [C0] ( #$0000 )
    LDA #$0200
    TSB $12
    COP [86] ( #2A, #03, #07 )
    COP [8A]
    COP [07] ( #1D )
    COP [82] ( #2A, #35 )
    COP [89]
    COP [B4]
    COP [0B]
    COP [C0] ( &code_04D36F )
    COP [C1]
    RTL 
}

code_04D36F {
    COP [BF] ( &widestring_04D37A )
    COP [CC] ( #01 )
    COP [0C]
    COP [E0]
}

widestring_04D37A `[DLG:3,11][SIZ:D,3]Will tastes [LU1:D0]of[N]the bread.[FIN]The bread is hard.[N][LU1:1D]the worst thing[N]he's [LU2:5D]tasted.[FIN]For [LU1:D0]reason, he[N][LU2:95]misses Grandma[N][LU1:2D]creative cuisine...[END]`

code_04D408 {
    COP [88] ( @table_0EE000 )
    LDA #$0085
    STA $7F000A, X
    COP [82] ( #06, #07 )
    COP [89]
    COP [A2] ( @e_actor_00E155, #$2300 )
    COP [82] ( #06, #35 )
    COP [89]
    COP [C1]
    COP [80] ( #06 )
    COP [89]
    RTL 
}

widestring_04D42F `[DLG:3,11][SIZ:D,3][TPL:0]Will: [N]I [LU1:F9]why I have[N]to suffer so...[FIN]I [LU1:F9][LU1:F7]will[N][LU1:71]of me now.[FIN]Anyway, I [LU1:98]to[N][LU1:DA]of a way[N]to get out of here.[PAL:0][END]`

widestring_04D4A5 `[TPL:C][LU1:3A]oink[PAU:28][CLD]`

widestring_04D4B1 `[DLG:3,11][SIZ:D,4][TPL:0]Will: [N]I [LU1:F9]if [LU1:D6][N]is Kara's pig...[FIN][LU1:62]luck! There's a[N][LU2:7F]and a key tied[N]to its tail...[FIN][TPL:F][PAL:0]The [LU2:7F]read...[FIN][TPL:1] [LU2:35]to hear[N] [LU1:D7][LU1:FF]in prison.[FIN] [LU1:1D][LU1:DE][LU1:F7]my[N] [LU1:92]done, but hear[N] [LU1:F7]I [LU1:98]to say.[FIN] I too am a prisoner[N] --in a [LU2:91]of silk[N] and gold. [FIN] But tonight I [N] [LU1:EF][LU1:AC]the castle[N] forever. [FIN] You [LU2:48][LU1:EF][N] be free. [N]                  Kara[PAL:0][FIN]`

widestring_04D5F4 `[CLR][SFX:0][DLY:9]You [LU1:98]the key![PAU:FF][END]`

widestring_04D60A `[DLG:3,12][SIZ:D,3]A soldier's whisper[N]comes [LU1:8E]a hole[N]in the ceiling.[FIN][DLG:3,12][SIZ:D,3][LU1:1D]today's ration of[N]bread.[N][LU1:12]moss drinks water.[END]`

widestring_04D679 `[DLG:3,11][SIZ:D,4][TPL:0]Time passes slowly, but[N]the [LU1:A6]day is ending.[FIN]It pains me to [LU1:DA]of[N]the prisoners' feelings,[N]not knowing [LU1:F7]they[N][LU1:CA]do....[FIN]While I was [LU2:B2]to[N][LU1:DA]of a way out,[N]I drifted off to sleep.[PAL:0][END]`

widestring_04D732 `[PAU:78][DLG:3,11][SIZ:D,3][DLY:0]A familiar voice[N]speaks [LU1:8E]the flute.[FIN][TPL:E][TPL:4][LU2:E][N]Will....[FIN]Flute:[N]This is [LU1:FE]father.[END]`

widestring_04D78A `[PAU:3C][TPL:E][TPL:0][DLY:0]Will: [N]Father...? [FIN][TPL:4][LU2:E]You were[N]a cute child, but now[N]you've grown up.[FIN]Isn't [LU1:17]Lola's[N]pie delicious?[FIN][TPL:0]Will: [N]Uh, sure, Dad![N][LU1:65]are you?![FIN][TPL:4]Flute:[N]I [LU1:78][LU2:AD]you now...[FIN][TPL:F][TPL:4]I [LU1:98][LU1:C8]to ask[N]of [LU2:C7]Listen...[N][PAL:0] [LU1:6A]if [LU1:9F][LU1:FE]wish![N] No! You deserted me!`

widestring_04D87D `[CLD][TPL:F][TPL:4][CLR][DLY:0]Flute:[N]I [LU1:F1]you to[N][LU1:D1]me....[FIN]I, [LU2:B7]was once[N]held in [LU1:D6]cell.[N]Look at the[N][LU2:82]wall.[END]`

widestring_04D8D2 `[DEF][TPL:0]Will: [N]...This? [FIN][TPL:4][LU2:E][LU2:14]you[N][LU1:99]anything[N][LU1:8E][LU1:1A]Bill?[FIN][TPL:0]Will: [N]Grandpa?[N]He was an architect...[FIN][TPL:4]Flute:[N][LU1:68][LU1:1A]knows the [N]secret of [LU1:D7]stone.[FIN][TPL:0]Will: [N]Secret...?[FIN][TPL:4][LU2:E]Starting now,[N]you [LU1:EF]encounter[N]a [LU1:DE]thing.[FIN][TPL:0]Will: [N]Do I [LU1:98]to...?[FIN][TPL:4][LU2:E]Pick up the[N][LU2:9D][LU1:FE]enemy left.[FIN]The [LU1:C2]of the[N][LU1:7]is contained[N]there.[FIN]That [LU1:C2][LU1:EF]prove[N]to be [LU1:FE]ally....[FIN]You [LU1:B2][LU2:84]a[N]pilgrimage to the ruins[N]of the [LU1:F5]to [LU1:90][N]the Mystic Statues.[FIN]The closer you get to [N]the Crystal, [N]the stronger the evil[N][LU1:C2][LU1:EF]be...[FIN]Will... No time...[N]Quickly... First[N]to the Incan ruins...[FIN][PAL:0][SFX:10]The flute's [LU1:EE]fades[N]and disappears.[END]`

code_04DB00 {
    COP [4F] ( @bmp_000000+A00, #$4700, #$0200 )
    COP [C2]
    COP [D0] ( #00, #00, &code_04DB00 )
    RTL 
}