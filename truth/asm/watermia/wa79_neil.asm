

---------------------------------------------

h_wa79_neil [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_wa79_neil {
    COP [D0] ( #94, #01, &code_07A1C8 )
    COP [0B]
    COP [D0] ( #97, #01, &code_07A1C1 )
    COP [D0] ( #96, #01, &code_07A1BA )
    COP [C0] ( &code_07A1CA )
    COP [C1]
    RTL 
}

code_07A1BA {
    COP [C0] ( &code_07A1CF )
    COP [C1]
    RTL 
}

code_07A1C1 {
    COP [C0] ( &code_07A1D4 )
    COP [C1]
    RTL 
}

code_07A1C8 {
    COP [E0]
}

code_07A1CA {
    COP [BF] ( &widestring_07A217 )
    RTL 
}

code_07A1CF {
    COP [BF] ( &widestring_07A255 )
    RTL 
}

code_07A1D4 {
    COP [D0] ( #01, #01, &code_07A1DF )
    COP [BF] ( &widestring_07A2BE )
    RTL 
}

code_07A1DF {
    COP [BF] ( &widestring_07A366 )
    COP [CC] ( #94 )
    LDA #$0007
    STA $0D60
    LDA #$0008
    STA $0D62
    LDA #$0009
    STA $0D64
    LDA #$000A
    STA $0D66
    LDA #$0404
    STA $064A
    COP [65] ( #$02D4, #$01A4, #00, #15 )
    COP [26] ( #91, #$0370, #$0430, #06, #$5400 )
    RTL 
}

widestring_07A217 `[TPL:A][TPL:6][LU1:36]The [LU2:70]on [LU1:D6][N]raft gives me an idea [N]for a new invention.[END]`

widestring_07A255 `[TPL:A][TPL:6][LU1:36]If you go [N]west of here, [LU1:DB][N]a [LU1:9C]desert. [FIN]You [LU1:78]cross it [N]on foot [N][LU1:F8]Kruks. [FIN]How [LU1:EF]I get [N]a Kruk?[PAL:0][END]`

widestring_07A2BE `[TPL:A][TPL:6][LU1:36][N]You got Kruks? [LU1:5D][N]so expensive . .? [FIN]Why [LU1:CE]a sad face? [N][LU1:30]I [LU2:A8]ask [N][LU1:F7]the reason is. [FIN]I [LU1:DA]we [N][LU1:CA]go west, [N]to Euro... [FIN]Lance and [LU1:2C][LU1:F1][N]to stay [LU2:74]You [N][LU1:CA]ask [LU1:E6]why. [END]`

widestring_07A366 `[TPL:B][TPL:6][LU1:36]The moment [LU1:F6]a [N]man and [LU2:C4]are [LU2:61][N]attracted to each [LU1:BD][N]is [LU1:A5]magic. [FIN]I [LU1:82][LU1:DA]you ever[N][LU2:6A][LU1:D7]feeling.[FIN]By the way. Euro is [N][LU1:F4]my parents [N]live. It [LU1:EF]help you [N]if we go there. [FIN][LU2:3F]leaving for Euro![END]`