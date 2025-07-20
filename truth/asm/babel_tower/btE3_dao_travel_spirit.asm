?INCLUDE 'table_0EDA00'


---------------------------------------------

h_btE3_dao_travel_spirit [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_btE3_dao_travel_spirit {
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C0] ( &code_09801D )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_09801D {
    COP [BF] ( &widestring_098053 )
    COP [BE] ( #02, #02, &code_list_098027 )
}

code_list_098027 [
  &code_09802D   ;00
  &code_09802D   ;01
  &code_098032   ;02
]

code_09802D {
    COP [BF] ( &widestring_0980C1 )
    RTL 
}

code_098032 {
    COP [BF] ( &widestring_0980C1 )
    STZ $066D
    STZ $0670
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #C3, #$0210, #$0090, #03, #$2300 )
    RTL 
}

widestring_098053 `[TPL:B]If you proceed, you[N][LU1:EF]not be able to[N][LU2:B9]back...[FIN]If you [LU1:F1]to go to [N]Dao, [LU1:1F]transport [LU2:C7][N] [LU1:42][N] Return to Dao [LU1:EC]`

widestring_0980C1 `[CLD]`