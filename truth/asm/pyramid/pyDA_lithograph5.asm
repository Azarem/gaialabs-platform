
?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'f_inventory_full'

---------------------------------------------

h_pyDA_lithograph5 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph5 {
    COP [D0] ( #C6, #01, &code_08CA5E )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08CA65 )
    COP [D2] ( #C6, #01 )
}

code_08CA5E {
    COP [32] ( #98 )
    COP [33]
    COP [E0]
}

code_08CA65 {
    COP [D0] ( #C6, #01, &code_08CA83 )
    COP [BF] ( &widestring_08CA84 )
    COP [D4] ( #22, &pyDA_lithograph5_full )
    COP [CC] ( #C6 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08CA83 {
    RTL 
}

widestring_08CA84 `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

---------------------------------------------

pyDA_lithograph5_full {
    JML $@f_inventory_full
}