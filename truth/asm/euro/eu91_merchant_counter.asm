
?INCLUDE 'f_inventory_full'

---------------------------------------------

h_eu91_merchant_counter [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_merchant_counter {
    LDA #$0200
    TSB $12
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0007
    STA $24
    LDA $0E
    AND #$000F
    CLC 
    ADC #$001B
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    LDA #$3000
    STA $0E
    COP [C0] ( &code_07C08B )
    COP [C1]
    RTL 
}

code_07C08B {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07C096 )
}

code_list_07C096 [
  &code_07C0A6   ;00
  &code_07C0A7   ;01
  &code_07C0BF   ;02
  &code_07C0C4   ;03
  &code_07C0C9   ;04
  &code_07C0CE   ;05
  &code_07C0D3   ;06
  &code_07C0D8   ;07
]

code_07C0A6 {
    RTL 
}

code_07C0A7 {
    COP [D6] ( #28, &code_07C0B6 )
    COP [BF] ( &widestring_07C0F3 )
    COP [D4] ( #28, &code_07C0BB )
    RTL 
}

code_07C0B6 {
    COP [BF] ( &widestring_07C0DD )
    RTL 
}

code_07C0BB {
    JML $@f_inventory_full
}

code_07C0BF {
    COP [BF] ( &widestring_07C12A )
    RTL 
}

code_07C0C4 {
    COP [BF] ( &widestring_07C142 )
    RTL 
}

code_07C0C9 {
    COP [BF] ( &widestring_07C160 )
    RTL 
}

code_07C0CE {
    COP [BF] ( &widestring_07C182 )
    RTL 
}

code_07C0D3 {
    COP [BF] ( &widestring_07C1B6 )
    RTL 
}

code_07C0D8 {
    COP [BF] ( &widestring_07C1DC )
    RTL 
}

widestring_07C0DD `[DEF]How [LU1:6B]a sweet apple?[END]`

widestring_07C0F3 `[DEF]I see [LU1:D7]you want[N]it. [LU1:1F][LU1:97]you one.[FIN]Will got the apple![END]`

widestring_07C12A `[DEF]This is a green apple.[END]`

widestring_07C142 `[DEF]Our fruit is soft[N]and tasty.[END]`

widestring_07C160 `[DEF]Heh heh.[N][LU1:69][LU2:8F]too[N]young for this.[END]`

widestring_07C182 `[DEF]This is the [LU2:62]shop.[N]We can buy fresh[N][LU2:62][LU1:8E]Watermia.[END]`

widestring_07C1B6 `[DEF]This is corn meal,[N]for making bread.[END]`

widestring_07C1DC `[DEF]This is a teapot.[N]We call it a "Tear Potˮ.[FIN][LU1:39]we [LU1:F2]caught[N]up in a war.[FIN]After the women sent[N][LU1:E1]husbands to war,[N][LU2:AB]saved [LU1:E1]tears[N]in [LU1:E4]pots.[END]`