

---------------------------------------------

h_fr32_hotel_hint [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_hotel_hint {
    COP [B6] ( #10 )
    COP [9E] ( @code_05B67C, #$0000, #$0018, #$3000 )
    LDA #$0800
    TSB $10
    COP [C1]
    RTL 
}

code_05B67C {
    COP [C0] ( &code_05B683 )
    COP [C1]
    RTL 
}

code_05B683 {
    COP [BF] ( &widestring_05B688 )
    RTL 
}

widestring_05B688 `[DEF][LU1:66]A man working[N]at the hotel was caught[N]by a [LU1:AD]trader.[END]`