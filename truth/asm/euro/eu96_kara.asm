

---------------------------------------------

h_eu96_kara [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_eu96_kara {
    COP [D0] ( #AC, #01, &code_07D9C4 )
    COP [D0] ( #AB, #01, &code_07D9BB )
    COP [0B]
    COP [C0] ( &code_07D9C6 )
    COP [BC] ( #00, #FE )
    COP [D2] ( #AA, #01 )
    COP [80] ( #1D )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [81] ( #21, #01 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [CE] ( #01 )
}

code_07D9BB {
    COP [C0] ( &code_07D9CB )
    COP [0B]
    COP [C1]
    RTL 
}

code_07D9C4 {
    COP [E0]
}

code_07D9C6 {
    COP [BF] ( &widestring_07DA00 )
    RTL 
}

code_07D9CB {
    COP [BF] ( &widestring_07DA3D )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0004
    STA $0D64
    LDA #$0006
    STA $0D66
    LDA #$0404
    STA $064A
    COP [65] ( #$01D4, #$0134, #00, #19 )
    COP [26] ( #AC, #$01C0, #$01D0, #06, #$2200 )
    RTL 
}

widestring_07DA00 `[TPL:B][TPL:1][LU1:25][LU1:62]a big house! [N]The [LU2:AE][N][LU2:9E]to be richer [N][LU2:B5]the King...[PAL:0][END]`

widestring_07DA3D `[TPL:A][TPL:1][LU1:25]To the west of [N][LU2:73]are the [LU2:98]of [N]Ankor Wat. [FIN]That is [LU1:F4]the[N]laborer's [LU2:72]is[N]located.[FIN][LU1:2B]go![PAL:0][END]`