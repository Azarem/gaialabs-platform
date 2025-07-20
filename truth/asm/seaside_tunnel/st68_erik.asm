

---------------------------------------------

h_st68_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_st68_erik {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06ADFC )
}

code_list_06ADFC [
  &code_06AE02   ;00
  &code_06AE62   ;01
  &code_06AE64   ;02
]

code_06AE02 {
    COP [D2] ( #01, #01 )
    COP [82] ( #0E, #11 )
    COP [89]
    COP [81] ( #10, #02 )
    COP [89]
    COP [82] ( #0E, #01 )
    COP [89]
    COP [85] ( #10, #03, #02 )
    COP [8A]
    COP [81] ( #10, #12 )
    COP [89]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [C0] ( &code_06AE6B )
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [85] ( #11, #03, #01 )
    COP [8A]
    COP [82] ( #0F, #12 )
    COP [89]
    COP [80] ( #0D )
    COP [89]
    COP [BF] ( &widestring_06AE88 )
    INC $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #68, #$0070, #$01A0, #03, #$2110 )
    COP [C1]
    RTL 
}

code_06AE62 {
    COP [E0]
}

code_06AE64 {
    COP [25] ( #17, #1A )
    COP [C1]
    RTL 
}

code_06AE6B {
    COP [BF] ( &widestring_06AE70 )
    RTL 
}

widestring_06AE70 `[TPL:A][TPL:3]Erik: [N][LU1:1C][N][LU1:82]look![PAL:0][END]`

widestring_06AE88 `[TPL:A][TPL:0]In [LU1:D6]way, [LU1:6E]day [N]passed slowly...[PAL:0][END]`