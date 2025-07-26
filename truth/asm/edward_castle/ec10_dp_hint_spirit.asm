
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_ec10_dp_hint_spirit [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_ec10_dp_hint_spirit {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DD1B )
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C1]
    COP [80] ( #04 )
    COP [89]
    RTL 
}

code_04DD1B {
    COP [BF] ( &widestring_04DD20 )
    RTL 
}

widestring_04DD20 `[DEF][LU1:61]you defeat the[N]enemies, a shiny silver[N][LU1:C]Gem [LU1:EF]appear.[FIN]If you collect 100 of[N]these, you gain[N]one life...[FIN][LU1:12]if [LU1:FF]defeated,[N]you [LU1:FA][LU1:98]to go[N][LU1:73][LU1:ED]far...[END]`