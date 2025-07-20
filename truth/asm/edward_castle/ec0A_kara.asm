?INCLUDE 'func_00C806'

!joypad_mask_std                065A

---------------------------------------------

h_ec0A_kara [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_kara {
    COP [D0] ( #22, #01, &code_04CC5A )
    COP [B6] ( #30 )
    COP [D0] ( #21, #01, &code_04CC07 )
    COP [D0] ( #19, #01, &code_04CBFE )
    COP [D0] ( #1A, #01, &code_04CBAA )
    COP [D2] ( #01, #01 )
    COP [CC] ( #1A )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CC6E )
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [80] ( #15 )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CC84 )
    COP [CC] ( #02 )
}

code_04CBAA {
    COP [80] ( #15 )
    COP [89]
    COP [25] ( #0B, #0C )
    COP [0B]
    COP [C1]
    COP [21] ( #02, &code_04CBBD )
    RTL 
}

code_04CBBD {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04CC96 )
    COP [DA] ( #1D )
    COP [CA] ( #02 )
    COP [86] ( #15, #04, #04 )
    COP [8A]
    COP [86] ( #15, #04, #03 )
    COP [8A]
    COP [84] ( #15, #10 )
    COP [8A]
    COP [CB]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CCE4 )
    COP [CC] ( #03 )
    COP [D2] ( #03, #00 )
    COP [BF] ( &widestring_04CDC0 )
    COP [CC] ( #19 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04CBFE {
    COP [C0] ( &code_04CC61 )
    COP [0B]
    COP [C1]
    RTL 
}

code_04CC07 {
    COP [9C] ( @code_04CF5C, #$2000 )
    COP [25] ( #05, #0A )
    COP [B6] ( #20 )
    COP [0B]
    COP [C0] ( &code_04CC66 )
    COP [80] ( #12 )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [0F] ( #06, #36 )
    COP [0C]
    LDA #$1000
    TRB $10
    LDA #$0300
    TSB $10
    COP [9C] ( @func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0000
    STA $7F0010, X
    LDA #$0012
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [C0] ( #$0000 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_04CC5A {
    COP [E0]
    COP [BF] ( &widestring_04CDC0 )
    RTL 
}

code_04CC61 {
    COP [BF] ( &widestring_04CE45 )
    RTL 
}

code_04CC66 {
    COP [BF] ( &widestring_04CE4A )
    COP [CC] ( #01 )
    RTL 
}

widestring_04CC6E `[TPL:9][TPL:1][LU1:25]Who is it?[PAL:0][PAU:5A][CLD]`

widestring_04CC84 `[TPL:9][TPL:1][CLR][LU1:25]A guest?[PAL:0][END]`

widestring_04CC96 `[TPL:B][TPL:1][LU1:25][N]You...yesterday...[FIN][TPL:0]Will: I was told to[N][LU2:4E]the [LU1:7]Ring[N]to [LU1:27]Edward...[PAL:0][END]`

widestring_04CCE4 `[TPL:A][TPL:1][LU1:25][N]Terrible![N][LU1:1D]terrible![FIN]Again my [LU2:67]is[N][LU2:B2]to [LU1:E7]something[N]important [LU1:8E]someone![FIN][LU1:20]escaped [LU1:8E]the[N][LU2:53]before. Now they[N][LU1:FA]let me go out![FIN]Recently, [LU1:C8]very[N][LU1:C7]has [LU1:9D]in[N]the castle.[FIN]My [LU2:85]has hired[N]a famous hunter.[N][LU1:1D]ominous...[PAL:0][END]`

widestring_04CDC0 `[PAU:28][TPL:A][TPL:1][LU1:25] I [LU1:91]scared.[N]My [LU2:67]and mother[N][LU2:9E]to [LU1:98]changed.[FIN][LU1:3B][LU1:D1]me![N]Take me out of here![N]Please...[FIN][SFX:10][PAL:0][LU1:45]Princess...[FIN][::][TPL:1][LU1:25][N][LU1:3B][LU1:79]back, Will.[PAL:0][END]`

widestring_04CE45 `[TPL:A][JMP:&widestring_04CDC0+M]`

widestring_04CE4A `[TPL:B][TPL:1][LU1:25][N]Of course, you've come![N]Thank you.[FIN]Was the guard asleep[N]outside? His nickname is[N]"Old Snorehead.ˮ[N]Sleeping again.[FIN][TPL:0]Will: [LU1:68]little[N]pig has come....[FIN][TPL:1][LU1:25]His name is [N]Hamlet. Cute, isn't he?[FIN][TPL:1][LU1:25]He's [LU1:ED]smart.[N]He has [LU1:D0]kind of[N][LU1:C7]pig power...[FIN]Please, [LU1:E7]me out of[N]here![PAL:0][END]`

code_04CF5C {
    COP [D0] ( #22, #01, &code_04CFD9 )
    COP [0F] ( #1E, #2D )
    COP [0F] ( #1F, #2D )
    COP [0F] ( #20, #2D )
    COP [0F] ( #21, #2D )

  code_04CF72:
    COP [C1]
    COP [45] ( #1E, #2C, #22, #2D, &code_04CF7D )
    RTL 
}

code_04CF7D {
    COP [40] ( #$0400, &code_04CF88 )
    COP [C4] ( @code_04CF72 )
}

code_04CF88 {
    COP [D0] ( #01, #00, &code_04CF95 )
    COP [D6] ( #0A, &code_04CFA7 )
    BRA code_04CF9E
}

code_04CF95 {
    COP [BF] ( &widestring_04CFDB )
    COP [C4] ( @code_04CF72 )
}

code_04CF9E {
    COP [BF] ( &widestring_04D012 )
    COP [C4] ( @code_04CF72 )
}

code_04CFA7 {
    COP [CC] ( #22 )
    COP [CD] ( #$0119 )
    COP [BF] ( &widestring_04D069 )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0402
    STA $064A
    COP [65] ( #$0104, #$0334, #00, #02 )
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    COP [C1]
    RTL 
}

code_04CFD9 {
    COP [E0]
}

widestring_04CFDB `[TPL:A][TPL:0]Will: [N](If you [LU1:F1]to [LU1:E7]her[N]away, now's the time...)[END]`

widestring_04D012 `[TPL:A][TPL:1]Karen: Oh, wait![N]It [LU1:EF]be a [LU1:A6]trip,[N]we [LU1:CA][LU1:E7]food![FIN]Would you go to the[N]cellar [LU1:F0]me?[PAL:0][END]`

widestring_04D069 `[TPL:A][TPL:1][LU1:25][N]At last, we leave.[FIN][LU1:2B]go to [LU1:FE]house.[N]I'm worried [LU1:6B]your[N]grandparents.[FIN][DLG:3,6][SIZ:D,3][PAL:0]They hurry to Will's.[END]`