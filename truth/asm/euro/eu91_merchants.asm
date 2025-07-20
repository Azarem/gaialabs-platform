?INCLUDE 'func_06B9F2'


---------------------------------------------

h_eu91_merchant1 [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_merchant1 {
    LDA #$0200
    TSB $12
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0007
    CLC 
    ADC #$0012
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    LDA #$6000
    STA $0E
    COP [C0] ( &code_07C2DF )
    COP [0B]
    COP [C1]
    RTL 
}

---------------------------------------------

h_eu91_merchant2 [
  h_actor < #12, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_merchant2 {
    LDA #$0200
    TSB $12
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0007
    CLC 
    ADC #$0012
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_07C2DF )
    COP [0B]
    COP [C1]
    RTL 
}

code_07C2DF {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07C2EA )
}

code_list_07C2EA [
  &code_07C300   ;00
  &code_07C305   ;01
  &code_07C30A   ;02
  &code_07C30F   ;03
  &code_07C314   ;04
  &code_07C319   ;05
  &code_07C31E   ;06
  &code_07C323   ;07
  &code_07C328   ;08
  &code_07C32D   ;09
  &code_07C332   ;0A
]

code_07C300 {
    COP [BF] ( &widestring_07C337 )
    RTL 
}

code_07C305 {
    COP [BF] ( &widestring_07C361 )
    RTL 
}

code_07C30A {
    COP [BF] ( &widestring_07C363 )
    RTL 
}

code_07C30F {
    COP [BF] ( &widestring_07C365 )
    RTL 
}

code_07C314 {
    COP [BF] ( &widestring_07C367 )
    RTL 
}

code_07C319 {
    COP [BF] ( &widestring_07C369 )
    RTL 
}

code_07C31E {
    COP [BF] ( &widestring_07C36B )
    RTL 
}

code_07C323 {
    COP [BF] ( &widestring_07C36D )
    RTL 
}

code_07C328 {
    COP [BF] ( &widestring_07C36F )
    RTL 
}

code_07C32D {
    COP [BF] ( &widestring_07C371 )
    RTL 
}

code_07C332 {
    COP [BF] ( &widestring_07C373 )
    RTL 
}

widestring_07C337 `[DEF][LU2:15][LU1:D][LU2:5D]go[N][LU1:BE]there.[N]Cross [LU1:BE]to[N]the [LU1:BD]side![END]`

widestring_07C361 `[DEF][END]`

widestring_07C363 `[DEF][END]`

widestring_07C365 `[DEF][END]`

widestring_07C367 `[DEF][END]`

widestring_07C369 `[DEF][END]`

widestring_07C36B `[DEF][END]`

widestring_07C36D `[DEF][END]`

widestring_07C36F `[DEF][END]`

widestring_07C371 `[DEF][END]`

widestring_07C373 `[DEF][END]`

---------------------------------------------

h_eu91_merchant3 [
  h_actor < #1A, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_merchant3 {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_07C38A )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_07C38A {
    COP [BF] ( &widestring_07C38F )
    RTL 
}

widestring_07C38F `[DEF][LU2:15][LU1:D][LU2:5D]go[N][LU1:BE]there.[N]Cross [LU1:BE]to[N]the [LU1:BD]side![END]`

---------------------------------------------

h_eu91_merchant4 [
  h_actor < #17, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_merchant4 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_07C3CF )
    COP [0B]
    COP [C1]
    COP [80] ( #97 )
    COP [89]
    RTL 
}

code_07C3CF {
    COP [BF] ( &widestring_07C3D4 )
    RTL 
}

widestring_07C3D4 `[DEF]Thanks to customers [LU1:A5][N]this, we can survive.[END]`