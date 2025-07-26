
---------------------------------------------

h_daC3_training_man [
  h_actor < #1F, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_training_man {
    LDA #$0200
    TSB $12
    COP [9E] ( @code_08ADF3, #$FFE0, #$0020, #$1000 )
    COP [9E] ( @code_08ADF3, #$FFF0, #$0020, #$1000 )
    LDA #$0008
    STA $0008, Y
    COP [9E] ( @code_08ADF3, #$0000, #$0020, #$1000 )
    LDA #$0010
    STA $0008, Y
    COP [9E] ( @code_08ADF3, #$0010, #$0020, #$1000 )
    LDA #$0018
    STA $0008, Y
    COP [9E] ( @code_08ADF3, #$0020, #$0020, #$1000 )
    LDA #$0020
    STA $0008, Y
    COP [0B]
    COP [C0] ( &code_08AE09 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08ADF3 {
    COP [8D] ( #20 )
    COP [0B]

  code_08ADF8:
    COP [80] ( #24 )
    COP [89]
    COP [80] ( #20 )
    COP [89]
    COP [80] ( #25 )
    COP [89]
    BRA code_08ADF8
}

code_08AE09 {
    COP [BF] ( &widestring_08AE0E )
    RTL 
}

widestring_08AE0E `[DEF][LU2:14]you [LU2:5D]played[N]Snake Panic? I'm still[N]in training for it.[END]`