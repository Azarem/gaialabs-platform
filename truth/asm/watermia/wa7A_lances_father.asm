
---------------------------------------------

h_wa7A_lances_father [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_wa7A_lances_father {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_07B3AF )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_07B3AF {
    COP [D0] ( #A5, #01, &code_07B3BD )
    COP [BF] ( &widestring_07B3C2 )
    COP [CC] ( #01 )
    RTL 
}

code_07B3BD {
    COP [BF] ( &widestring_07B412 )
    RTL 
}

widestring_07B3C2 `[TPL:B][TPL:3][SFX:10]Lance's father: [N]I [LU2:C1]on an expedition [N][LU1:F0]Olman. [N]It was scary, but fun.[PAL:0][END]`

widestring_07B412 `[TPL:B][TPL:3][SFX:10]Lance's father: [N]Oh, Will. [LU2:35]I [N][LU1:B3]you worry. [FIN]Lance and [LU1:2C]did [LU1:E1][N][LU2:4D]to nurse me [LU1:73][N]to health. [FIN]I [LU1:BB][LU1:FC]to be[N]controlled by my son,[N]but [LU1:9F]nice now to[N][LU1:98][LU1:FE]own child.[PAL:0][END]`