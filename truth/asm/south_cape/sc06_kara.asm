?INCLUDE 'func_00C6E4'

!joypad_mask_std                065A

---------------------------------------------

h_sc06_kara [
  h_actor < #12, #00, #30 >   ;00
]

---------------------------------------------

e_sc06_kara {
    COP [D0] ( #1B, #01, &code_049EA0 )
    COP [D0] ( #3D, #01, &code_049EA2 )
    COP [D0] ( #16, #00, &code_049EA0 )
    COP [D2] ( #01, #01 )
    LDA #$2000
    TRB $10
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [81] ( #19, #11 )
    COP [89]
    COP [80] ( #15 )
    COP [89]
    COP [BF] ( &widestring_049EB4 )
    LDA #$0002
    JSL $@func_00C6E4
    COP [81] ( #19, #11 )
    COP [89]
    COP [82] ( #17, #12 )
    COP [89]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [84] ( #12, #3C )
    COP [8A]
    LDA #$0001
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_049F09 )
    COP [CC] ( #02 )
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    LDA #$0003
    JSL $@func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_049F71 )
    COP [84] ( #14, #10 )
    COP [8A]
    COP [BF] ( &widestring_049FBC )
    COP [84] ( #13, #18 )
    COP [8A]
    COP [84] ( #14, #18 )
    COP [8A]
    COP [84] ( #12, #18 )
    COP [8A]
    COP [84] ( #14, #1E )
    COP [8A]
    COP [0B]
    COP [BF] ( &widestring_04A04C )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #3D )

  code_049E5A:
    COP [C0] ( &code_049EAF )
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [25] ( #0D, #19 )
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #07, #01 )
    COP [84] ( #15, #1E )
    COP [8A]
    COP [BF] ( &widestring_04A0D7 )
    COP [CC] ( #08 )
    COP [DA] ( #1F )
    COP [85] ( #15, #E0, #12 )
    COP [8A]
    COP [86] ( #13, #A0, #11 )
    COP [8A]
    COP [CC] ( #09 )
    COP [BF] ( &widestring_04A15A )
    COP [86] ( #16, #04, #11 )
    COP [8A]
    COP [CC] ( #1B )
}

code_049EA0 {
    COP [E0]
}

code_049EA2 {
    COP [25] ( #0A, #19 )
    COP [0B]
    LDA #$2000
    TRB $10
    BRA code_049E5A
}

code_049EAF {
    COP [BF] ( &widestring_04A0D2 )
    RTL 
}

widestring_049EB4 `[TPL:A][TPL:1][LU1:25][N]Hamlet! You shouldn't[N]snort at strangers![FIN]Is [LU1:D6][LU1:FE]house?[FIN][TPL:0]Will: [N]Yeah...so?[PAL:0][END]`

widestring_049F09 `[TPL:9][TPL:1][LU1:25]Frankly, you look[N]a [LU1:A7]shabby....[FIN][TPL:0]Will: [N][LU1:63]excuse me...!![FIN][TPL:1][LU1:25][LU1:68]father?[N]Mother? Not here, huh?[PAL:0][END]`

widestring_049F71 `[DLG:3,13][SIZ:D,2][TPL:1][LU1:25]Is [LU1:D6]a picture[N]of [LU1:FE]parents?[FIN][TPL:0]Will: My [LU1:92]an[N]explorer, he.....[PAL:0][END]`

widestring_049FBC `[TPL:A][TPL:1][LU1:25]I know. Olman,[N]the [LU2:5F]They say[N]he was lost.[FIN][TPL:0]Will: He'll come[N][LU1:73][LU1:D0]day.[FIN][TPL:1][LU1:25][N]Are you sad?[N]...No?[FIN]I'd be sad, if it were[N]me.[N]I'm sorry...[PAL:0][END]`

widestring_04A04C `[TPL:A][TPL:1][LU1:25][N]Anyway, is [LU1:D9]a[N]piano here?[FIN][TPL:0]Will: No, [LU1:D9]isn't![N]But [LU1:17]Lola is a[N][LU1:95]singer.[FIN][::][TPL:1][LU1:25][LU1:5D]singing[N]upstairs now. They[N][LU1:98][LU1:CE]loud voices!![PAL:0][END]`

widestring_04A0D2 `[TPL:A][JMP:&widestring_04A04C+M]`

widestring_04A0D7 `[TPL:A][TPL:1]Kara:[N][LU1:62]do I [LU2:57]if you[N][LU2:81][LU1:FE]head?[FIN][PAL:0][LU1:45]Princess![FIN]Do you [LU1:DA]I have[N][LU1:B9][LU2:50]to do[N][LU2:B5]chase you down?[FIN]I [LU1:B2][LU1:E7]you home.[N][LU1:1D]the King's orders![END]`

widestring_04A15A `[TPL:B][TPL:1][LU1:25]I'm sorry I lied[N]to [LU2:C7]I'm King[N]Edward's daughter, Kara.[FIN]Will. [N]I [LU1:91]as though we've[N]met before, as if we[N][LU1:F2][LU1:94]friends.[PAL:0][END]`