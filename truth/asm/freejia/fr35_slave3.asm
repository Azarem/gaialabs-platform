

---------------------------------------------

h_fr35_slave3 [
  h_actor < #27, #00, #10 >   ;00
]

---------------------------------------------

e_fr35_slave3 {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C409 )
    COP [C1]
    RTL 
}

code_05C409 {
    COP [BF] ( &widestring_05C40E )
    RTL 
}

widestring_05C40E `[TPL:A]I [LU1:82]believe in the [N]spirits.[FIN]If [LU1:D9][LU1:F2]spirits,[N][LU1:E0][LU1:A5]status [N][LU1:FB]matter....[END]`