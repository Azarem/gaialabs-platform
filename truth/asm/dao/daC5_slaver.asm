

---------------------------------------------

h_daC5_slaver [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_daC5_slaver {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08B3B7 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08B3B7 {
    COP [BF] ( &widestring_08B3BC )
    RTL 
}

widestring_08B3BC `[TPL:E][LU1:5E]women are[N]weaving carpets.[FIN]This [LU1:EF][LU1:E7]almost[N]40 [LU2:C6]to weave.[FIN]This [LU2:C4]has worked[N]on it continuously since[N]she was a child.[FIN]Remember, [LU1:A7]man.[N]Some are born to[N]misfortune.[END]`