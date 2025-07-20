?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'f_inventory_full'


---------------------------------------------

h_pyDA_lithograph3 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph3 {
    COP [D0] ( #C4, #01, &code_08C90E )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08C915 )
    COP [D2] ( #C4, #01 )
}

code_08C90E {
    COP [32] ( #96 )
    COP [33]
    COP [E0]
}

code_08C915 {
    COP [D0] ( #C4, #01, &code_08C933 )
    COP [BF] ( &widestring_08C934 )
    COP [D4] ( #20, &pyDA_lithograph3_full )
    COP [CC] ( #C4 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08C933 {
    RTL 
}

widestring_08C934 `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

---------------------------------------------

pyDA_lithograph3_full {
    JML $@f_inventory_full
}