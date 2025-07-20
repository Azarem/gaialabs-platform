

---------------------------------------------

h_av69_lily [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_av69_lily {
    COP [D0] ( #8D, #01, &av69_lily_destroy )
    COP [D0] ( #75, #01, &av69_lily_destroy )
    COP [D2] ( #01, #01 )
    COP [82] ( #27, #12 )
    COP [89]
    COP [81] ( #28, #12 )
    COP [89]
    COP [80] ( #22 )
    COP [89]
    COP [BF] ( &widestring_06C224 )
    COP [CC] ( #02 )
    COP [D2] ( #03, #01 )
    COP [80] ( #24 )
    COP [89]
    COP [BF] ( &widestring_06C23C )
    COP [CC] ( #04 )
    COP [CA] ( #02 )
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [CB]
    COP [84] ( #33, #04 )
    COP [8A]
    LDA #$02A8
    STA $7F0018, X
    LDA #$0060
    STA $7F001A, X
    COP [22] ( #33, #01 )
}

av69_lily_destroy {
    COP [E0]
}

widestring_06C224 `[TPL:A][TPL:2][LU1:2A][N]Will, let's go. [END]`

widestring_06C23C `[TPL:A][TPL:2][LU1:2A]Why are[N]you so grouchy...[FIN][TPL:4]Lance: [N][LU1:30]she's [LU1:A3]tired. [N]Let her be for now.[PAL:0][END]`