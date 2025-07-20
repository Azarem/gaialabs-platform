
!joypad_mask_std                065A

---------------------------------------------

h_na4B_neil [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_na4B_neil {
    COP [0B]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_05E8F7 )
    COP [CC] ( #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C0] ( &code_05E8BE )
    COP [D2] ( #02, #01 )
    COP [C0] ( &code_05E8C3 )
    COP [D2] ( #08, #01 )
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #0A, #01 )
    COP [80] ( #12 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C8] ( &code_05E8CB )
    COP [C0] ( &code_05E8F2 )
    COP [0C]
    COP [86] ( #16, #0B, #01 )
    COP [8A]
    COP [85] ( #19, #04, #01 )
    COP [8A]
    COP [82] ( #16, #01 )
    COP [89]
    COP [81] ( #19, #01 )
    COP [89]
    COP [86] ( #16, #06, #01 )
    COP [8A]
    COP [81] ( #19, #11 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    COP [0B]
    COP [CC] ( #0B )
    COP [C1]
    RTL 
}

code_05E8BE {
    COP [BF] ( &widestring_05E9F0 )
    RTL 
}

code_05E8C3 {
    COP [BF] ( &widestring_05EA25 )
    COP [CC] ( #03 )
    RTL 
}

code_05E8CB {
    COP [BF] ( &widestring_05EB2E+M )

  code_05E8CF:
    COP [BF] ( &widestring_05EB94 )
    COP [BE] ( #04, #00, &code_list_05E8D9 )
}

code_list_05E8D9 [
  &code_05E8E3   ;00
  &code_05E8E3   ;01
  &code_05E8E3   ;02
  &code_05E8E9   ;03
  &code_05E8E3   ;04
]

code_05E8E3 {
    COP [BF] ( &widestring_05EBE5 )
    BRA code_05E8CF
}

code_05E8E9 {
    COP [BF] ( &widestring_05EC0E )
    COP [CC] ( #09 )
    COP [C5]
}

code_05E8F2 {
    COP [BF] ( &widestring_05EC5B )
    RTL 
}

widestring_05E8F7 `[DEF][TPL:6][LU1:36][N]It was a [LU1:A6]way, but [N]you did a [LU1:94]job. [FIN]This is the [LU2:88]famous [N]of the [LU1:96]paintings-- [N]the Condor. [LU2:14]you [N][LU2:5D][LU1:99]of it? [FIN]No one knows why[N][LU1:6F][LU1:C1]drew[N]pictures [LU1:A5]this.[FIN]Whenever I [LU1:79]here[N]I'm overwhelmed by[N]the grand scale.[FIN]You [LU1:CA]go see[N]it for yourself.[PAL:0][END]`

widestring_05E9F0 `[DEF][TPL:6][LU1:36][N]Ha ha ha. [LU1:D]be in [N][LU1:CE]a hurry. [LU2:42]for [N][LU1:89]else.[PAL:0][END]`

widestring_05EA25 `[DEF][TPL:6][LU1:36][N][LU2:3E][LU2:AC][LU1:6B]it [LU1:F6][N][LU1:89]comes back. [FIN]The Mystic [LU1:48]that[N]Will spoke of is[N][LU2:A9]on this[N]plain? [FIN][CLD][PAU:28][DEF][TPL:3]Erik: [N]I [LU1:D8]I'd [LU2:A7]the [N]paintings before,[FIN]but [LU1:84][LU1:D6]Condor[N][LU1:A9][LU1:A5]Cygnus?[FIN][CLD][PAU:14][DEF][TPL:6][LU1:36][N]Of course! I [N]hadn't noticed!! [FIN][LU1:61]we [LU1:A9]at it, we[N]see Cygnus, but ancient[N][LU1:C1][LU2:8F][LU1:A3][N]saw a condor... [END]`

---------------------------------------------

widestring_05EB2E `[DEF][TPL:6][LU1:36][N][LU2:3E][LU2:AC][LU1:6B]it [LU1:F6][N][LU1:89]comes back. [FIN][::][DEF][TPL:6][DLY:0][LU1:36]Of course! [N]Cygnus has nine stars,[N]and [LU1:D9]are nine[N]stones... [FIN]`

widestring_05EB94 `[CLR][TPL:0][LU1:65]is the red star[N][LU1:D7]appeared recently?[FIN] [LU1:A]Head[N] [LU1:A][LU2:2C]Foot[N] [LU1:A]Left Foot[N] [LU1:A]Tail`

widestring_05EBE5 `[CLR][TPL:0]Will: I [LU1:F3][LU1:DA]it [N][LU1:F3]be at the bottom. [FIN]`

widestring_05EC0E `[CLR][TPL:0]Will: Of course! At the[N]joint of its [LU1:AE]foot! [FIN][TPL:6][LU1:36][N][LU1:2B]check the [N][LU1:AE]foot![PAL:0][END]`

widestring_05EC5B `[DEF][TPL:6][LU1:36]Not bad! [N][LU1:1D]as exciting [N]as [LU2:78]something![PAL:0][END]`