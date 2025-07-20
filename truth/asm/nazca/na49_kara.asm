?BANK 05

!joypad_mask_std                065A

---------------------------------------------

h_na49_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_na49_kara {
    COP [0B]
    COP [C0] ( &code_05E081 )
    COP [D2] ( #01, #01 )
    COP [86] ( #1F, #05, #12 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [84] ( #1D, #0A )
    COP [8A]
    COP [84] ( #1A, #14 )
    COP [8A]
    COP [BF] ( &widestring_05E086 )
    COP [CE] ( #03 )
    COP [D2] ( #05, #01 )
    COP [B6] ( #30 )
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [D2] ( #06, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [85] ( #21, #02, #01 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_05E0C1 )
    COP [CC] ( #07 )
    COP [C1]
    RTL 
}

code_05E081 {
    COP [BF] ( &widestring_05E086 )
    RTL 
}

widestring_05E086 `[TPL:A][TPL:1][LU1:25][N]I [LU1:78]believe it! [FIN]I [LU1:82][LU1:F1]to breathe[N]the [LU1:CD]air as him![END]`

widestring_05E0C1 `[TPL:A][TPL:1][LU1:25][N]Cygnus?! [FIN][TPL:6][LU1:36]That's the [N]Tower of Babel, [LU1:F4][N]Will's [LU2:67]got lost. [FIN][LU1:1D]in the middle of[N]the [LU1:96]painting of[N]the big white bird.[END]`