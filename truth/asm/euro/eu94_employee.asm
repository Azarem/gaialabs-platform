

---------------------------------------------

h_eu94_employee [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_eu94_employee {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_07CF1A )
    COP [C1]
    COP [45] ( #06, #07, #07, #08, &code_07CF13 )
    RTL 
}

code_07CF13 {
    COP [BF] ( &widestring_07CF75 )
    COP [C1]
    RTL 
}

code_07CF1A {
    COP [BF] ( &widestring_07CF1F )
    RTL 
}

widestring_07CF1F `[TPL:A][TPL:4]Company employee:[N]What?!![N]A child...[FIN]The old guys are talking[N][LU1:6B]work. Go[N][LU1:BE]there![END]`

widestring_07CF75 `[TPL:B][SFX:0][TPL:0]It sounds [LU1:A5]they're[N]talking [LU1:6B]work...[FIN][SFX:10][PAL:0][LU1:32]I [LU1:9B]if I do [N]business [LU1:F0][LU1:D6][N]company, I can get [N][LU1:6C]I want... [FIN][TPL:4]Company employee:[N]We can get anything.[N]Tea, fruit, even furs...[FIN]I [LU1:78]say it out loud, [N]but workers, too...[PAL:0][END]`