?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'f_inventory_full'


---------------------------------------------

h_pyDA_lithograph2 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph2 {
    COP [D0] ( #C3, #01, &code_08C866 )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08C86D )
    COP [D2] ( #C3, #01 )
}

code_08C866 {
    COP [32] ( #95 )
    COP [33]
    COP [E0]
}

code_08C86D {
    COP [D0] ( #C3, #01, &code_08C88B )
    COP [BF] ( &widestring_08C88C )
    COP [D4] ( #1F, &pyDA_lithograph2_full )
    COP [CC] ( #C3 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08C88B {
    RTL 
}

widestring_08C88C `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

---------------------------------------------

pyDA_lithograph2_full {
    JML $@f_inventory_full
}