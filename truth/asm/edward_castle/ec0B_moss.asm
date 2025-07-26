
---------------------------------------------

h_ec0B_moss [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_ec0B_moss {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DB59 )
    COP [C1]
    RTL 
}

code_04DB59 {
    COP [BF] ( &widestring_04DB62 )
    COP [CC] ( #03 )
    COP [E0]
}

widestring_04DB62 `[TPL:E][TPL:0]Will: This moss has seen[N][LU2:B8]of prisoners [N][LU1:79]and go... [FIN]Those prisoners [LU1:B2][N][LU1:98][LU1:70]encouraged [N]by any sign of life....[PAL:0][END]`