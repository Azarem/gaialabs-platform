

---------------------------------------------

h_it18_warning_man [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_it18_warning_man {
    COP [0B]
    COP [C0] ( &code_04DDC2 )
    COP [C1]
    RTL 
}

code_04DDC2 {
    COP [BF] ( &widestring_04DDC7 )
    RTL 
}

widestring_04DDC7 `[TPL:A][LU2:20][LU1:C1]have[N][LU1:79][LU2:73]to gather[N]Incan gold.[FIN]But [LU1:B6]who set foot[N]in the Incan [LU2:98]have[N][LU1:BB]returned...[END]`