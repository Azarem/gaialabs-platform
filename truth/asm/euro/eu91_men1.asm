?INCLUDE 'func_06B9F2'


---------------------------------------------

h_eu91_men1 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_men1 {
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    CLC 
    ADC #$0002
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_07C427 )
    COP [0B]
    COP [C1]
    RTL 
}

code_07C427 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07C432 )
}

code_list_07C432 [
  &code_07C444   ;00
  &code_07C449   ;01
  &code_07C44E   ;02
  &code_07C453   ;03
  &code_07C458   ;04
  &code_07C45D   ;05
  &code_07C462   ;06
  &code_07C467   ;07
  &code_07C46C   ;08
]

code_07C444 {
    COP [BF] ( &widestring_07C480 )
    RTL 
}

code_07C449 {
    COP [BF] ( &widestring_07C4AA )
    RTL 
}

code_07C44E {
    COP [BF] ( &widestring_07C4D0 )
    RTL 
}

code_07C453 {
    COP [BF] ( &widestring_07C509 )
    RTL 
}

code_07C458 {
    COP [BF] ( &widestring_07C56C )
    RTL 
}

code_07C45D {
    COP [BF] ( &widestring_07C5AB )
    RTL 
}

code_07C462 {
    COP [BF] ( &widestring_07C60A )
    RTL 
}

code_07C467 {
    COP [BF] ( &widestring_07C63F )
    RTL 
}

code_07C46C {
    COP [BF] ( &widestring_07C6FE )
    RTL 
    COP [BF] ( &widestring_07C74B )
    RTL 
    COP [BF] ( &widestring_07C74D )
    RTL 
    COP [BF] ( &widestring_07C74F )
    RTL 
}

widestring_07C480 `[DEF]This is Euro. [LU1:1D]a[N]crowded merchant town.[END]`

widestring_07C4AA `[DEF]Villagers [LU1:AF]here.[N]Outsiders [LU1:78]enter.[END]`

widestring_07C4D0 `[DEF]This is the marketplace.[N]You can [LU1:90]anything[N]you [LU1:F1]here.[END]`

widestring_07C509 `[DEF]The [LU1:E2]prospers thanks[N]to the [LU1:44]company.[FIN]There are lots of bad[N]rumors, but I think[N]the [LU1:7C]is great.[END]`

widestring_07C56C `[DEF]This is the shrine. The [N][LU2:8D]of the [N][LU1:7C]and his [N]wife [LU1:79][LU2:73]often.[END]`

widestring_07C5AB `[DEF]This is the Rolek[N]corporate office.[FIN]Almost everything you [N]buy in the [LU1:E2]comes [N][LU1:DC]the company.[END]`

widestring_07C60A `[DEF][LU1:32][LU1:6A]the company[N]handles [LU2:47]anything[N]you can imagine.[END]`

widestring_07C63F `[DEF]My brother and I once[N][LU2:C1]to Mt.Kress and[N]got [LU2:7A]at the temple.[FIN]Big [LU2:83]and[N]plants grow in circles[N][LU1:A5]a maze.[FIN]Water [LU1:8E]the mushrooms[N]drips onto broken stems.[N]New growth sprouts up,[N]forming a path.[END]`

widestring_07C6FE `[DEF]The drops [LU1:8E]the[N][LU2:83]are all around[N]the [LU1:E5]grounds...[FIN]Ah, [LU1:FF]growing up[N]quickly.[END]`

widestring_07C74B `[DEF][END]`

widestring_07C74D `[DEF][END]`

widestring_07C74F `[DEF][END]`