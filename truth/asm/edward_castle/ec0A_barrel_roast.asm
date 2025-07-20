?INCLUDE 'f_inventory_full'


---------------------------------------------

h_ec0A_barrel_roast [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_ec0A_barrel_roast {
    COP [BC] ( #08, #01 )
    COP [D0] ( #46, #01, &code_04D0FF )
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_04D0FA )
    COP [C1]
    COP [45] ( #22, #37, #26, #3D, &code_04D0F3 )
    RTL 
}

code_04D0F3 {
    COP [BF] ( &widestring_04D114 )
    COP [C1]
    RTL 
}

code_04D0FA {
    COP [D4] ( #0A, &code_04D110 )
}

code_04D0FF {
    COP [CC] ( #46 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_04D141 )
    COP [E0]
}

code_04D110 {
    JML $@f_inventory_full
}

widestring_04D114 `[TPL:A][TPL:1][LU1:25][N]I [LU1:DA][LU1:CF]put food[N]in one of [LU1:E4]barrels.[PAL:0][END]`

widestring_04D141 `[DEF][SFX:0][DLY:9][LU1:67][LU1:8F]a large,[N]yummy roast leg of yak![PAU:FF][FIN][DLY:1][TPL:1][LU1:25][N]Everything's ready![N][LU1:2B]go [LU1:74]the[N][LU2:A2][LU1:90]us![PAL:0][END]`