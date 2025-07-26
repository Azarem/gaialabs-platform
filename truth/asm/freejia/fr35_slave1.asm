
---------------------------------------------

h_fr35_slave1 [
  h_actor < #27, #00, #10 >   ;00
]

---------------------------------------------

e_fr35_slave1 {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C386 )
    COP [C1]
    RTL 
}

code_05C386 {
    COP [BF] ( &widestring_05C38B )
    RTL 
}

widestring_05C38B `[TPL:9][LU2:38]we [LU1:EF]be sent [N]away...[END]`