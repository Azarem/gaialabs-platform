?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'f_inventory_full'


---------------------------------------------

h_pyDA_lithograph4 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph4 {
    COP [D0] ( #C5, #01, &code_08C9B6 )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08C9BD )
    COP [D2] ( #C5, #01 )
}

code_08C9B6 {
    COP [32] ( #97 )
    COP [33]
    COP [E0]
}

code_08C9BD {
    COP [D0] ( #C5, #01, &code_08C9DB )
    COP [BF] ( &widestring_08C9DC )
    COP [D4] ( #21, &pyDA_lithograph4_full )
    COP [CC] ( #C5 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08C9DB {
    RTL 
}

widestring_08C9DC `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

---------------------------------------------

pyDA_lithograph4_full {
    JML $@f_inventory_full
}