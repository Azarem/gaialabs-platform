
?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A

---------------------------------------------

h_sc06_lily [
  h_actor < #36, #00, #30 >   ;00
]

---------------------------------------------

e_sc06_lily {
    COP [D0] ( #26, #01, &code_04AB93 )
    COP [D0] ( #25, #01, &code_04AB95 )
    COP [D0] ( #21, #00, &code_04ABDA )
    COP [D2] ( #01, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$2000
    TRB $10
    COP [86] ( #36, #02, #01 )
    COP [8A]
    COP [85] ( #36, #03, #01 )
    COP [8A]
    COP [84] ( #36, #08 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #3C )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    LDA #$0002
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_04AC0C )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [84] ( #22, #28 )
    COP [8A]
    COP [BF] ( &widestring_04AC45 )
    COP [84] ( #25, #28 )
    COP [8A]
    COP [BF] ( &widestring_04AC77 )
    COP [0B]
    COP [C0] ( &code_04ABDC )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [D2] ( #04, #01 )
    COP [C0] ( &code_04ABE4 )
    COP [C1]
    RTL 
}

code_04AB93 {
    COP [E0]
}

code_04AB95 {
    COP [25] ( #08, #1B )
    LDA #$2000
    TRB $10
    COP [C0] ( &code_04ABE9 )
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [82] ( #27, #12 )
    COP [89]
    COP [81] ( #29, #11 )
    COP [89]
    COP [D2] ( #02, #01 )
    COP [81] ( #29, #13 )
    COP [89]
    COP [BF] ( &widestring_04AEC1 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [BF] ( &widestring_04AEF7 )
    COP [CE] ( #03 )
    COP [C1]
    RTL 
}

code_04ABDA {
    COP [E0]
}

code_04ABDC {
    COP [BF] ( &widestring_04AD69 )
    COP [CC] ( #04 )
    RTL 
}

code_04ABE4 {
    COP [BF] ( &widestring_04ADCA )
    RTL 
}

code_04ABE9 {
    COP [BF] ( &widestring_04ADFE )
    COP [BE] ( #02, #02, &code_list_04ABF3 )
}

code_list_04ABF3 [
  &code_04ABF9   ;00
  &code_04ABFE   ;01
  &code_04ABF9   ;02
]

code_04ABF9 {
    COP [BF] ( &widestring_04AE24 )
    RTL 
}

code_04ABFE {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04AE61 )
    COP [CC] ( #04 )
    RTL 
}

widestring_04AC0C `[TPL:E][TPL:2]Lilly:[N][LU1:D]worry, you two.[FIN][TPL:0]Will: [N][LU1:69]the one who...[PAL:0][END]`

widestring_04AC45 `[TPL:E][TPL:2][LU1:2A][N]Itory village.[FIN][TPL:1][LU1:25][LU1:20][LU1:BB]heard[N]of [LU1:D6]village![END]`

widestring_04AC77 `[TPL:E][TPL:2][LU1:2A]Naturally. My[N][LU1:EC]has a barrier[N][LU1:6D]it.[FIN]Ordinary [LU1:C1][LU1:A5]you[N][LU1:78]see it. [FIN][LU1:2A][N][LU1:2B]go, Will! [FIN][TPL:0]Will: OK![FIN][TPL:1][LU1:25][N]I'm going, too![FIN][TPL:2][LU1:2A][LU1:1D]far too[N]dangerous[N]for a princess.[FIN][TPL:1][LU1:25]You [LU1:78]stop[N]royalty! I do whatever[N]I want!![FIN][TPL:2]Lilly:[N]Typical of a princess...[PAL:0][END]`

widestring_04AD69 `[TPL:E][TPL:2][LU1:2A]Before we go to[N]my village, [LU1:CA]we[N][LU2:87]the townspeople?[FIN]We might not be back[N][LU2:73]for a [LU1:A6]time.[PAL:0][END]`

widestring_04ADCA `[TPL:E][TPL:2][LU1:2A]Is [LU1:D7]OK?[N]We [LU1:CA]see how[N][LU1:E0]are in the village.[PAL:0][END]`

widestring_04ADFE `[TPL:B][TPL:2][LU1:2A]Are you[N]ready to go?[N][PAL:0] Yes[N] No`

widestring_04AE24 `[CLR][TPL:2][LU1:2A]All right.[N]If you decide to[N]go, [LU1:79][LU1:73]here[N][LU1:F6][LU1:FF]through.[PAL:0][END]`

widestring_04AE61 `[CLR][TPL:1][LU1:25]I think[N][LU1:C8]wonderful[N]is [LU1:93]to happen.[FIN][TPL:2]Lilly:[N]No. [LU2:11][LU2:73]on there[N][LU1:EF]be [LU1:B6]hardships....[N]Hmmmmm.[END]`

widestring_04AEC1 `[TPL:A][TPL:2][LU1:2A]That's [LU1:F7]I[N]expected. [LU2:14]you ever[N][LU1:70][LU1:BF]the castle?[END]`

widestring_04AEF7 `[TPL:A][TPL:2][LU1:2A]Are you totally[N]ignorant of the world!? [FIN][LU1:2A][N]Will is my friend.[N]Understand?[END]`