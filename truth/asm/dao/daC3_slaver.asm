

---------------------------------------------

h_daC3_slaver [
  h_actor < #1D, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_slaver {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08B302 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08B302 {
    COP [BF] ( &widestring_08B307 )
    RTL 
}

widestring_08B307 `[DEF][LU1:1C]hey.[N]This isn't a show!![N]Get out of here![END]`