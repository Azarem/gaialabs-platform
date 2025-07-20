?INCLUDE 'table_0EE000'


---------------------------------------------

h_dm45_key [
  h_actor < #02, #01, #10 >   ;00
]

---------------------------------------------

e_dm45_key {
    COP [D0] ( #5D, #01, &code_05D4E4 )
    COP [88] ( @table_0EE000 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D4D0 )

  code_05D4C6:
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #EF )
    BRA code_05D4C6
}

code_05D4D0 {
    COP [D4] ( #0B, &code_05D4E6 )
    COP [CC] ( #5D )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_05D4EB )
}

code_05D4E4 {
    COP [E0]
}

code_05D4E6 {
    COP [BF] ( &widestring_05D506 )
    RTL 
}

widestring_05D4EB `[DEF][SFX:0][DLY:9]You [LU1:8F]the Mine Key![PAU:FF][END]`

widestring_05D506 `[DEF]You [LU1:8F]the Mine Key![N][LU1:68][LU1:A0]is full![END]`