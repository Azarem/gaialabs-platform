
!joypad_mask_std                065A
!jewels_collected               0AB0

---------------------------------------------

h_wa79_kara [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_wa79_kara {
    COP [D0] ( #94, #01, &code_07A59E )
    COP [D0] ( #97, #01, &code_07A5F6 )
    COP [D0] ( #96, #01, &code_07A5ED )
    COP [0B]
    COP [D0] ( #91, #01, &code_07A5A0 )
    COP [C0] ( &code_07A5FF )
    COP [D2] ( #02, #01 )
    COP [86] ( #1F, #02, #12 )
    COP [8A]
    COP [84] ( #1B, #3C )
    COP [8A]
    COP [86] ( #1F, #02, #13 )
    COP [8A]
    COP [84] ( #1B, #1E )
    COP [8A]
    COP [86] ( #1F, #02, #13 )
    COP [8A]
    COP [84] ( #1B, #28 )
    COP [8A]
    COP [9E] ( @code_07A860, #$0010, #$FFF2, #$1002 )
    COP [84] ( #1D, #3C )
    COP [8A]
    COP [BF] ( &widestring_07A6AF )
    COP [CC] ( #03 )
    COP [C1]
    RTL 
}

code_07A59E {
    COP [E0]
}

code_07A5A0 {
    COP [D0] ( #92, #01, &code_07A5E1 )
    COP [D4] ( #16, &code_07A5AD )
    BRA code_07A5CB
}

code_07A5AD {
    COP [D6] ( #01, &code_07A5B7 )
    COP [D6] ( #06, &code_07A5E8 )
}

code_07A5B7 {
    COP [D5] ( #01 )
    SED 
    LDA $jewels_collected
    CLC 
    ADC #$0001
    STA $jewels_collected
    CLD 

  code_07A5C6:
    COP [D4] ( #16, &code_07A5CB )
}

code_07A5CB {
    COP [CC] ( #92 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07A79C )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_07A5E1 {
    COP [C0] ( &code_07A604 )
    COP [C1]
    RTL 
}

code_07A5E8 {
    COP [D5] ( #06 )
    BRA code_07A5C6
}

code_07A5ED {
    COP [0B]
    COP [C0] ( &code_07A609 )
    COP [C1]
    RTL 
}

code_07A5F6 {
    COP [0B]
    COP [C0] ( &code_07A60E )
    COP [C1]
    RTL 
}

code_07A5FF {
    COP [BF] ( &widestring_07A613 )
    RTL 
}

code_07A604 {
    COP [BF] ( &widestring_07A7E2 )
    RTL 
}

code_07A609 {
    COP [BF] ( &widestring_07A811 )
    RTL 
}

code_07A60E {
    COP [BF] ( &widestring_07A833 )
    RTL 
}

widestring_07A613 `[TPL:B][TPL:1][SFX:1B][LU1:25]Watermia is [LU1:ED][N]pretty, but [LU1:20][LU1:99][N]a [LU1:DE]rumor. [FIN]They play games with[N][LU1:9A]lives...[FIN]Freejia was the [LU1:CD][N]way, but beautiful. [N]Things [LU2:44][LU1:98][N][LU1:6E]side to them...[PAL:0][END]`

widestring_07A6AF `[TPL:A][TPL:1][SFX:1B][LU1:25][N]Yes. Birthday cake! [N][LU2:23][LU1:B3]it. [FIN][TPL:6][SFX:1A][LU1:36]Ha ha ha. [N]My [LU2:61]cake. [FIN]It was harder than[N]building an airplane.[FIN][TPL:2][SFX:19]Lilly:[N]Thank you, [LU1:89]. . .[FIN]I'm the luckiest[N][LU2:6C]in the world.[FIN][TPL:0][SFX:10]So began Lilly's[N][LU1:A7]birthday[N]party.[FIN]The end of the party...[PAL:0][END]`

widestring_07A79C `[TPL:A][TPL:0]Will:[N]So in the morning...[FIN][LU1:61]I awoke, Lance [N]had disappeared...[PAL:0][END]`

widestring_07A7E2 `[TPL:A][TPL:1][LU1:25][N][LU1:62][LU1:9D]to Lance [N]and Lilly? I'm worried.[PAL:0][END]`

widestring_07A811 `[TPL:A][TPL:1][LU1:25][N]A Kruk is an odd animal.[PAL:0][END]`

widestring_07A833 `[TPL:B][TPL:1][LU1:25][N][LU1:37]family runs [N]a trading [LU1:7C]in[N]Euro.[PAL:0][END]`

code_07A860 {
    COP [B6] ( #30 )
    COP [85] ( #37, #20, #11 )
    COP [8A]
    COP [C1]
    RTL 
}