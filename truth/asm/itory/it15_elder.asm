
---------------------------------------------

h_it15_elder [
  h_actor < #22, #00, #30 >   ;00
]

---------------------------------------------

e_it15_elder {
    LDA #$0200
    TSB $12
    COP [D0] ( #41, #01, &code_04E958 )
    COP [C1]
    COP [45] ( #04, #1C, #07, #1E, &code_04E942 )
    RTL 
}

code_04E942 {
    COP [BF] ( &widestring_04E9FF )
    COP [CC] ( #41 )
    COP [C1]
    COP [45] ( #08, #19, #0D, #1A, &code_04E954 )
    RTL 
}

code_04E954 {
    COP [BF] ( &widestring_04EA45 )
}

code_04E958 {
    COP [C0] ( &code_04E97A )
    COP [9E] ( @code_04E96A, #$0000, #$0004, #$0B00 )
    COP [C1]
    RTL 
}

code_04E96A {
    COP [0B]
    COP [84] ( #22, #14 )
    COP [8A]
    COP [C1]
    COP [80] ( #23 )
    COP [89]
    RTL 
}

code_04E97A {
    COP [D0] ( #44, #01, &code_04E9F1 )
    COP [D6] ( #04, &code_04E9DC )
    COP [D6] ( #03, &code_04E9E1 )
    COP [D0] ( #47, #01, &code_04E9D4 )
    COP [D0] ( #0E, #01, &code_04E9BC )
    COP [D0] ( #0F, #01, &code_04E9A0 )
    COP [BF] ( &widestring_04EA77 )
}

code_04E9A0 {
    COP [BF] ( &widestring_04EC46 )
    COP [BE] ( #02, #02, &code_list_04E9AA )
}

code_list_04E9AA [
  &code_04E9B0   ;00
  &code_04E9B8   ;01
  &code_04E9B0   ;02
]

code_04E9B0 {
    COP [BF] ( &widestring_04EC76 )
    COP [CC] ( #0F )
    RTL 
}

code_04E9B8 {
    COP [BF] ( &widestring_04ECAB )
}

code_04E9BC {
    COP [BF] ( &widestring_04ECCB )
    COP [BE] ( #02, #01, &code_list_04E9C6 )
}

code_list_04E9C6 [
  &code_04E9CC   ;00
  &code_04E9D4   ;01
  &code_04E9CC   ;02
]

code_04E9CC {
    COP [BF] ( &widestring_04ECEC )
    COP [CC] ( #0E )
    RTL 
}

code_04E9D4 {
    COP [BF] ( &widestring_04ED19 )
    COP [CC] ( #47 )
    RTL 
}

code_04E9DC {
    COP [BF] ( &widestring_04EF6F )
    RTL 
}

code_04E9E1 {
    COP [BF] ( &widestring_04EDF4 )

  code_04E9E5:
    COP [BE] ( #02, #01, &code_list_04E9EB )
}

code_list_04E9EB [
  &code_04E9F1   ;00
  &code_04E9F7   ;01
  &code_04E9F1   ;02
]

code_04E9F1 {
    COP [BF] ( &widestring_04EF1C )
    BRA code_04E9E5
}

code_04E9F7 {
    COP [BF] ( &widestring_04EF23 )
    COP [CC] ( #44 )
    RTL 
}

widestring_04E9FF `[DLG:3,11][SIZ:D,2]Will hears a quiet [N][LU1:EE][LU2:51]him... [FIN][TPL:D][TPL:4][LU1:46]Voice: [N][LU1:67]come, Will...[PAL:0][END]`

widestring_04EA45 `[TPL:E][TPL:4][LU1:13]I'm [LU2:74][N]In the flowers. [N][LU1:20]lived too long.[PAL:0][END]`

widestring_04EA77 `[DEF][TPL:4][LU1:13]I [LU1:78][LU1:AF][N][LU1:F8]the protection [N]of the Flower Spirit. [FIN]You [LU2:95][LU1:A9]like[N][LU1:FE]father.[FIN]It [LU1:CC][LU1:A5]only[N]yesterday [LU1:D7]he came[N]to [LU1:D6]village.[FIN][TPL:0]Will: [N]My father... [FIN][TPL:4][LU1:13][LU1:68]mother, Shira,[N]was the [LU2:89]daughter[N]of [LU1:FE]grandparents,[N]Bill and Lola.[FIN]She was [LU1:ED]beautiful.[FIN][LU1:68][LU2:67]fell in love[N][LU1:F0]her and took her[N][LU1:8E]the village.[FIN]All of the Itory tribe[N][LU1:98]a [LU1:C7]power, [N]but Shira's was [N]especially strong. [FIN]She [LU1:B3]a barrier to[N]hide the town, but[N][LU1:FE][LU2:67]came[N][LU1:DC]it easily.[FIN][LU1:9]to [LU1:DA]of it, he[N]was unusual, too...[FIN]`

widestring_04EC46 `[DEF][TPL:4]Were you summoned  [N]by [LU1:FE]father? [N][PAL:0] Yes[N] No`

widestring_04EC76 `[CLR][TPL:4][LU1:13]What? If you[N]weren't....That's a[N]bad sign....[PAL:0][END]`

widestring_04ECAB `[CLR][TPL:4][LU1:13]That fulfills[N][LU1:2D]prophesy.[FIN]`

widestring_04ECCB `[DEF][TPL:4]Do you plan to go?[N][PAL:0] Yes[N] No`

widestring_04ECEC `[DEF][CLR][TPL:4][LU1:13]A disobedient [N]son, unlike [LU1:FE]father.[PAL:0][END]`

widestring_04ED19 `[DEF][CLR][TPL:4][LU1:13][LU1:18]I [LU1:EF][N]entrust you [LU1:F0]the [N]Incan [LU1:48]handed down [N]to the [LU2:BD][FIN]The [LU1:D2]are the key [N]to the Incan riddle-- [N]untouched by [LU1:9A]hands [N]for hundreds of years. [FIN]One [LU1:C9]is enshrined [N]in the cave below. [N]Use all [LU1:FE]skill to [N][LU1:90]it.[PAL:0][END]`

widestring_04EDF4 `[DEF][TPL:4][LU1:13][N]Oooh, that's the [N]Incan Statue!![N]Good job! [FIN]I [LU1:F9]if you [LU1:F2][N]put on [LU1:D6]earth to [N]solve the Incan[N]riddle... [FIN][LU1:1F][LU2:AD]you a legend[N]handed down by our[N]people.[FIN][::]Put the [LU1:C9]on the[N][LU2:19]Cliff below the[N][LU2:9A][LU1:F4]the spirits'[N][LU2:4B]cannot reach. [FIN]The winds in the valley[N][LU1:EF]lead you to[N]the [LU1:19]Ship.[FIN]Understand?[N][PAL:0] Yes[N] No`

widestring_04EF1C `[DEF][CLR][TPL:4][JMP:&widestring_04EDF4+M]`

widestring_04EF23 `[CLR][TPL:4][LU1:13][N][LU1:1D][LU1:D4][LU1:D7]the [LU1:31][N]Tribe has one more. [FIN][LU2:14][LU1:2C]guide you [N]there. Be careful.[PAL:0][END]`

widestring_04EF6F `[DEF][CLR][JMP:&widestring_04EF23]`