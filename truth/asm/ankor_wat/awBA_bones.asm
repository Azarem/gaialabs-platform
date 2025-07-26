
---------------------------------------------

h_awBA_bones [
  h_actor < #2C, #01, #10 >   ;00
]

---------------------------------------------

e_awBA_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08A26F )
    COP [C1]
    RTL 
}

code_08A26F {
    COP [BF] ( &widestring_08A289 )
    COP [BE] ( #02, #02, &code_list_08A279 )
}

code_list_08A279 [
  &code_08A284   ;00
  &code_08A27F   ;01
  &code_08A284   ;02
]

code_08A27F {
    COP [BF] ( &widestring_08A2EC )
    RTL 
}

code_08A284 {
    COP [BF] ( &widestring_08A4A9 )
    RTL 
}

widestring_08A289 `[DEF][TPL:0]The bones of a [LU2:7A][N][LU1:8A]fascinated by [N]something...? [FIN]There's [LU1:D0]kind of [N]journal... [N] Read [N] Quit[PAL:0]`

widestring_08A2EC `[CLR]       Ankor Wat[N]    Research Record[N][N]        Friezer[FIN]There is a [LU1:E5][LU1:F4][N]a spirit is [LU1:D4]to live. [FIN]In the [LU2:1B]Hall, second[N]floor, a bright room[N]blocks the way.[FIN]You [LU1:B2]go [LU1:DC]it [N]to reach the top [N]floor. The bright [LU1:A8][N]masks the corridor. [FIN]If you [LU1:F1]to [LU2:87]the [N]spirit, you [LU1:B2]wear the [N][LU1:5][LU1:7]Glasses. [FIN]I saw [LU1:C8]shining [N]on the [LU1:96]near [N]the [LU2:1B]Hall, [N]but I had to run. [FIN]Probably the glasses[N][LU1:8E]the legend...[FIN]I regret [LU1:81]here...[N]I [LU2:71]my child can[N]carry on my dream... [END]`

widestring_08A4A9 `[CLD]`