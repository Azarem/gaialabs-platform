
?INCLUDE 'hidden_red_jewel'

---------------------------------------------

h_fr32_creep [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_creep {
    COP [C0] ( &code_05B6CC )
    COP [0B]
    COP [C1]
    RTL 
}

code_05B6CC {
    COP [D0] ( #E1, #01, &code_05B6E3 )
    COP [BF] ( &widestring_05B6E8 )
    COP [D4] ( #01, &code_05B6DF )
    COP [CC] ( #E1 )
    RTL 
}

code_05B6DF {
    JML $@code_00C6A1
}

code_05B6E3 {
    COP [BF] ( &widestring_05B78C )
    RTL 
}

widestring_05B6E8 `[DEF]Ha ha ha. You[N][LU1:E9][LU1:D6]place.[FIN][LU1:4A][LU1:F7]you think[N]is unimportant is the[N][LU2:88]important thing.[N]Life is [LU1:A5]that.[FIN]This is a gift.[N][LU1:3B][LU1:E7]it.[FIN]The old man secretly put[N][LU1:C8]in Will's[N]bags![END]`

widestring_05B78C `[DEF]Ha  ha  ha.[END]`