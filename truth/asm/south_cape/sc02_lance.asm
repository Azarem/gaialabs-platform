
?INCLUDE 'sc02_card'

!joypad_mask_std                065A

---------------------------------------------

h_sc02_lance [
  h_actor < #32, #00, #10 >   ;00
]

---------------------------------------------

e_sc02_lance {
    COP [D0] ( #4C, #01, &code_04B168 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [D0] ( #20, #01, &code_04B15C )
    COP [D0] ( #16, #01, &code_04B152 )
    COP [C0] ( &code_04B18E )
    LDA #$0800
    TSB $10

  code_04B087:
    COP [80] ( #32 )
    COP [89]
    COP [D0] ( #03, #00, &code_04B087 )
    LDA #$0800
    TRB $10
    LDA #$0200
    TRB $12
    COP [80] ( #02 )
    COP [89]
    COP [D2] ( #03, #00 )
    COP [C0] ( &code_04B196 )
    COP [80] ( #05 )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [C0] ( &code_04B19B )
    COP [D2] ( #06, #01 )
    COP [C8] ( &code_04B16A )
    COP [C0] ( &code_04B1BB )
    COP [D2] ( #07, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #08, #12 )
    COP [89]
    COP [86] ( #06, #03, #11 )
    COP [8A]
    COP [CA] ( #04 )
    COP [81] ( #09, #11 )
    COP [89]
    COP [84] ( #03, #1E )
    COP [8A]
    COP [9E] ( @code_04AFBF, #$0000, #$FFF0, #$1001 )
    COP [06] ( #2C )
    COP [CB]
    COP [85] ( #08, #04, #12 )
    COP [8A]
    COP [86] ( #07, #03, #12 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_04B2F0 )
    COP [C0] ( &code_04B1C3 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #08, #01 )
    COP [C0] ( #$0000 )
    COP [BF] ( &widestring_04B328 )
    COP [C8] ( &code_04B16A )
    COP [D2] ( #0A, #01 )
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_04B344 )
    COP [84] ( #05, #1E )
    COP [8A]
    COP [BF] ( &widestring_04B386 )
    COP [CC] ( #0B )
    COP [CE] ( #04 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04B152 {
    LDA #$0800
    TSB $10
    LDA #$0200
    TSB $12
}

code_04B15C {
    COP [C0] ( &code_04B1A0 )
    COP [C1]
    COP [80] ( #32 )
    COP [89]
    RTL 
}

code_04B168 {
    COP [E0]
}

code_04B16A {
    COP [86] ( #05, #04, #04 )
    COP [8A]
    COP [86] ( #05, #04, #03 )
    COP [8A]
    COP [84] ( #05, #10 )
    COP [8A]
    COP [86] ( #05, #04, #04 )
    COP [8A]
    COP [86] ( #05, #04, #03 )
    COP [8A]
    COP [C5]
}

code_04B18E {
    COP [CC] ( #01 )
    COP [BF] ( &widestring_04B1CB )
    RTL 
}

code_04B196 {
    COP [BF] ( &widestring_04B210 )
    RTL 
}

code_04B19B {
    COP [BF] ( &widestring_04B23F )
    RTL 
}

code_04B1A0 {
    COP [D0] ( #25, #01, &code_04B1B6 )
    COP [D0] ( #1C, #01, &code_04B1B1 )
    COP [BF] ( &widestring_04B3AD )
    RTL 
}

code_04B1B1 {
    COP [BF] ( &widestring_04B3DF )
    RTL 
}

code_04B1B6 {
    COP [BF] ( &widestring_04B40D )
    RTL 
}

code_04B1BB {
    COP [BF] ( &widestring_04B27E )
    COP [CC] ( #07 )
    RTL 
}

code_04B1C3 {
    COP [BF] ( &widestring_04B2F0 )
    COP [CC] ( #07 )
    RTL 
}

widestring_04B1CB `[TPL:A][TPL:4]Lance: [N][LU1:62]is it, Will?[N][LU1:1D]late.[FIN]I'm [LU1:C4]cards[N][LU1:F0]Seth.[N][LU2:42]a minute.[PAL:0][END]`

widestring_04B210 `[TPL:A][TPL:4]Lance: [N]Will, get [LU1:BE][LU2:73]and[N]sit [LU1:BC]to Erik.[PAL:0][END]`

widestring_04B23F `[TPL:A][TPL:4]Lance: Draw it to you[N]by spinning the Flute[N][LU1:6D][LU1:A5]a baton.[PAL:0][END]`

widestring_04B27E `[TPL:B][TPL:4]Lance: [N]Next. Pick a[N]card, any card.[FIN][LU1:1F]put four cards face[N]down. Pick the one[N]you [LU1:DA]is the[N]Ace of Diamonds.[PAL:0][END]`

widestring_04B2F0 `[TPL:A][TPL:4]Lance: Pick the one[N]you [LU1:DA]is the[N]Ace of Diamonds.[PAL:0][END]`

widestring_04B328 `[TPL:A][TPL:4]Lance: [N]Ahhh! Right!![PAL:0][END]`

widestring_04B344 `[TPL:A][TPL:4]Lance: [LU1:62]Seth says[N]is too complicated for[N]me to understand.[PAL:0][END]`

widestring_04B386 `[TPL:A][TPL:4]Lance: [N]Seth. [LU1:2B]play[N]one [LU1:B7]game.[PAL:0][END]`

widestring_04B3AD `[TPL:A][TPL:4]Lance: One more[N]game [LU1:F0]Seth[N]and I'm [LU1:93]home.[PAL:0][END]`

widestring_04B3DF `[TPL:A][TPL:4]Lance: [LU1:1D]a day off[N][LU1:8E]school.[N][LU1:2B][LU1:98][LU1:D0]fun.[PAL:0][END]`

widestring_04B40D `[TPL:A][TPL:4]Lance: [LU1:62]happened,[N]Will?[N]You [LU1:A9]so gloomy.[FIN][LU1:4B]you can't[N][LU2:AD]us about?[PAL:0][END]`