
?INCLUDE 'table_0EE000'
?INCLUDE 'f_inventory_full'

---------------------------------------------

h_awBA_glasses [
  h_actor < #02, #01, #10 >   ;00
]

---------------------------------------------

e_awBA_glasses {
    COP [D0] ( #BA, #01, &code_089FB5 )
    LDA #$0200
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [C0] ( &code_089F9D )

  code_089F93:
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #3B )
    BRA code_089F93
}

code_089F9D {
    COP [BF] ( &widestring_089FBB )
    COP [D4] ( #1C, &code_089FB7 )
    COP [CC] ( #BA )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_089FDC )
}

code_089FB5 {
    COP [E0]
}

code_089FB7 {
    JML $@f_inventory_full
}

widestring_089FBB `[DEF]There's [LU1:C8]shiny[N]on the ground.[FIN]`

widestring_089FDC `[CLR][SFX:0][DLY:9][LU1:67][LU1:8F]the Black[N][LU1:7]Glasses![PAU:78][END]`