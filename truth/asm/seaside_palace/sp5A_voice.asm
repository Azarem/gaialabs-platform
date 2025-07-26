
---------------------------------------------

h_sp5A_voice [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sp5A_voice {
    COP [C1]
    COP [D0] ( #70, #01, &code_069568 )
    COP [45] ( #37, #28, #38, #29, &code_069569 )
    COP [45] ( #0E, #38, #0F, #39, &code_069577 )
    COP [45] ( #2B, #59, #2C, #5A, &code_069585 )
    COP [45] ( #36, #07, #3B, #0B, &code_069593 )
    COP [45] ( #08, #18, #0B, #1A, &code_0695A1 )
}

code_069568 {
    RTL 
}

code_069569 {
    COP [D0] ( #71, #01, &code_069568 )
    COP [CC] ( #71 )
    COP [BF] ( &widestring_0695AF )
    RTL 
}

code_069577 {
    COP [D0] ( #72, #01, &code_069568 )
    COP [CC] ( #72 )
    COP [BF] ( &widestring_069612 )
    RTL 
}

code_069585 {
    COP [D0] ( #73, #01, &code_069568 )
    COP [CC] ( #73 )
    COP [BF] ( &widestring_069672 )
    RTL 
}

code_069593 {
    COP [D0] ( #83, #01, &code_069568 )
    COP [CC] ( #83 )
    COP [BF] ( &widestring_0696A5 )
    RTL 
}

code_0695A1 {
    COP [D0] ( #84, #01, &code_069568 )
    COP [CC] ( #84 )
    COP [BF] ( &widestring_0696D5 )
    RTL 
}

widestring_0695AF `[TPL:A][TPL:0][PRT:@widestring_069705][PAL:0][LU1:46]Voice: [N]This is the Palace of [N]Vampires... [FIN]The [LU2:64]in [N][LU1:D6][LU2:93]produces [N][LU1:87]continuously... [END]`

widestring_069612 `[TPL:A][TPL:0][PRT:@widestring_069705][PAL:0][LU1:46]Voice: In the [N]basement of the [LU2:53][N]is a [LU1:C7]fountain. [FIN]The [LU2:9D]is there...[N]Hurry! Hurry![END]`

widestring_069672 `[TPL:A][TPL:0][PRT:@widestring_069705][PAL:0][LU1:46]Voice: The[N][LU1:40]Stone...[N]in the castle...[END]`

widestring_0696A5 `[TPL:A][TPL:0]Will: What? A sign of [N][LU1:B0][LU1:8E]the [N][LU1:C6]room...[PAL:0][END]`

widestring_0696D5 `[TPL:A][TPL:0]Will: What? A sign of [N][LU1:B0][LU1:8E]the [N][LU2:82]room...[PAL:0][END]`

---------------------------------------------

widestring_069705 `Will: What? I can  [N][LU1:9B]a soft [LU1:EE][N][LU1:8E]somewhere... [FIN]`