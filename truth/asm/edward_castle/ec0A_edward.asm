
!joypad_mask_std                065A

---------------------------------------------

h_ec0A_edward [
  h_actor < #2A, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_edward {
    LDA #$0200
    TSB $12
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04C3EC )
    COP [D2] ( #05, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #0A )
    COP [BF] ( &widestring_04C556 )
    COP [C1]
    RTL 
}

code_04C3EC {
    COP [BF] ( &widestring_04C40E )
    COP [BE] ( #02, #02, &code_list_04C3F6 )
}

code_list_04C3F6 [
  &code_04C3FC   ;00
  &code_04C402   ;01
  &code_04C3FC   ;02
]

code_04C3FC {
    COP [BF] ( &widestring_04C4D5 )
    BRA code_04C406
}

code_04C402 {
    COP [BF] ( &widestring_04C460 )
}

code_04C406 {
    COP [BF] ( &widestring_04C4FB )
    COP [CC] ( #05 )
    RTL 
}

widestring_04C40E `[TPL:F][TPL:4][LU1:27]Edward: [N][LU1:69]Will? [N]You [LU1:A9]so...shabby.[FIN][LU1:63]did you bring[N]the [LU1:7]Ring?[N][PAL:0] Yes[N] No`

widestring_04C460 `[CLR][TPL:4][LU1:18]An honest lad.[N]Give me the Ring.[FIN][TPL:0]Will: [N].............[FIN][TPL:4][LU1:27]Edward:[N]Hmm?[N][PAU:3C]Are you lying [N]to me, young whelp?![FIN]`

widestring_04C4D5 `[CLR][TPL:4]How dare you say such[N]a [LU1:E3]to me!![FIN]`

widestring_04C4FB `[CLR][TPL:4]Guards!! Throw this[N]impudent weasel in[N]prison!![FIN]Then go to Will's house[N]and [LU1:90]the Ring![END]`

widestring_04C556 `[PAU:1E][TPL:8][PAL:0][LU1:45]Yes,sir![PAU:28][CLD]`