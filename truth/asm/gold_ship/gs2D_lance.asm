
?INCLUDE 'func_00CFAE'

!joypad_mask_std                065A

---------------------------------------------

h_gs2D_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_gs2D_lance {
    COP [0B]
    COP [C0] ( &code_059028 )
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [25] ( #0F, #0D )
    COP [80] ( #05 )
    COP [89]
    COP [C1]
    COP [21] ( #03, &code_058FE0 )
    RTL 
}

code_058FE0 {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_05913D )
    COP [DA] ( #3B )
    COP [08] ( #$1515 )
    COP [9C] ( @func_00CFAE, #$2000 )
    LDA #$FFFF
    STA $0024, Y
    COP [DA] ( #B3 )
    COP [BF] ( &widestring_059157 )
    COP [CC] ( #51 )
    COP [C0] ( #$0000 )
    COP [85] ( #08, #04, #02 )
    COP [8A]
    COP [82] ( #07, #02 )
    COP [89]
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [85] ( #08, #04, #02 )
    COP [8A]
    COP [E0]
}

code_059028 {
    COP [BF] ( &widestring_05902D )
    RTL 
}

widestring_05902D `[TPL:A][TPL:4]Lance: You [LU1:F2]acting[N]strange, so we [N][LU2:63][LU2:C7][FIN]Then we reached[N]a [LU1:C7]town...[FIN][TPL:2][LU1:2A]Wait. [LU1:D]call [N]it strange. I [N]was born there. [FIN][TPL:4]Lance: [N][LU1:1D]invisible. [FIN]I'd call [LU1:D7]pretty[N]strange. [FIN]Will. You [LU1:78][N]go on a journey [N][LU1:F8]telling us. [FIN]Since we're friends, we [N][LU1:98]to share [LU1:94][LU2:AA][N]and bad.[PAL:0][END]`

widestring_05913D `[TPL:A][TPL:4]Lance: [N]Are you OK?[PAL:0][END]`

widestring_059157 `[TPL:8][TPL:5]Wa-a-a-a--a-ah!!!![FIN][TPL:9][TPL:4]Lance: That's Seth! [LU1:1D][N][LU1:81][LU1:8E]the deck![PAL:0][END]`