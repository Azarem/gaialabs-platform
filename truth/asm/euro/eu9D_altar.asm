
---------------------------------------------

h_eu9D_altar [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_eu9D_altar {
    COP [C0] ( &code_07E5A1 )

  code_07E574:
    COP [C1]
    COP [D0] ( #01, #01, &code_07E58C )
    COP [45] ( #0F, #07, #10, #09, &code_07E588 )
    COP [CE] ( #00 )
    RTL 
}

code_07E588 {
    COP [CC] ( #00 )
    RTL 
}

code_07E58C {
    COP [08] ( #$0101 )
    COP [32] ( #69 )
    COP [33]
    COP [C0] ( #$0000 )
    COP [CE] ( #01 )
    COP [C4] ( @code_07E574 )
}

code_07E5A1 {
    COP [BF] ( &widestring_07E5BE )
    COP [BE] ( #02, #01, &code_list_07E5AB )
}

code_list_07E5AB [
  &code_07E5B1   ;00
  &code_07E5B6   ;01
  &code_07E5B1   ;02
]

code_07E5B1 {
    COP [BF] ( &widestring_07E602 )
    RTL 
}

code_07E5B6 {
    COP [BF] ( &widestring_07E602 )
    COP [CC] ( #01 )
    RTL 
}

widestring_07E5BE `[DEF][TPL:0]Will: What? [N]The [LU2:C5]is blowing [LU1:8E][N][LU2:51]the statue... [FIN]Look?[N] Yes[N] No`

widestring_07E602 `[CLD]`