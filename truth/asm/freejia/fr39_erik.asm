
---------------------------------------------

h_fr39_erik [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_fr39_erik {
    COP [D0] ( #65, #00, &code_05CB42 )
    COP [0B]
    COP [C0] ( &code_05CB4B )
    COP [C1]
    RTL 
}

code_05CB42 {
    COP [E0]
    COP [C0] ( &code_05CB56 )
    COP [C1]
    RTL 
}

code_05CB4B {
    COP [D0] ( #68, #01, &code_05CB56 )
    COP [BF] ( &widestring_05CB93 )
    RTL 
}

code_05CB56 {
    COP [BF] ( &widestring_05CBF7 )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0002
    STA $0D64
    LDA #$0003
    STA $0D66
    LDA #$0004
    STA $0D68
    LDA #$0404
    STA $064A
    COP [65] ( #$0254, #$02D4, #00, #0C )
    COP [26] ( #49, #$0050, #$00D0, #00, #$1100 )
    COP [C1]
    RTL 
}

widestring_05CB93 `[TPL:A][TPL:3]Erik: It is [LU1:94]to be [N]among friends again. [N]If [LU2:89]I wasn't so sad.[FIN]My tears have[N]all [LU1:70]cried...[PAL:0][END]`

widestring_05CBF7 `[TPL:B][TPL:3]Erik: [LU1:63][LU1:DB]an [N]eccentric inventor in [N]the woods nearby. [N][LU2:34]we go? [FIN]I [LU1:DA]his name [N]is Neil... [FIN][TPL:0]Will: [N]Did you say Neil!!! [FIN]That's the [LU1:CD]name as[N]my [LU2:7A]cousin!![FIN]My cousin Neil, the [N]inventor, flew in the [N]sky in a [LU1:E3][N][LU2:54]an airplane. [FIN][PAL:0]So Will and his group went[N]to the inventor's house.[END]`