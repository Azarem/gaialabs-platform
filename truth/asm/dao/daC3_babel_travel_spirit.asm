?INCLUDE 'table_0EDA00'


---------------------------------------------

h_daC3_babel_travel_spirit [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_babel_travel_spirit {
    LDA #$0200
    TSB $12
    COP [D0] ( #D2, #00, &code_0980E6 )
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C0] ( &code_0980E8 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_0980E6 {
    COP [E0]
}

code_0980E8 {
    COP [BF] ( &widestring_09811E )
    COP [BE] ( #02, #01, &code_list_0980F2 )
}

code_list_0980F2 [
  &code_0980F8   ;00
  &code_0980F8   ;01
  &code_0980FD   ;02
]

code_0980F8 {
    COP [BF] ( &widestring_098144 )
    RTL 
}

code_0980FD {
    COP [BF] ( &widestring_098144 )
    STZ $066D
    STZ $0670
    LDA #$0404
    STA $064A
    LDA #$0202
    STA $0648
    COP [26] ( #E3, #$0280, #$01B0, #00, #$2310 )
    RTL 
}

widestring_09811E `[TPL:A]Go to Tower of Babel?[N] Quit[N] Return`

widestring_098144 `[CLD]`