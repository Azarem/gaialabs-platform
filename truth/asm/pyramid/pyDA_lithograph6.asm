?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'f_inventory_full'


---------------------------------------------

h_pyDA_lithograph6 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph6 {
    COP [D0] ( #C7, #01, &code_08CB06 )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08CB0D )
    COP [D2] ( #C7, #01 )
}

code_08CB06 {
    COP [32] ( #99 )
    COP [33]
    COP [E0]
}

code_08CB0D {
    COP [D0] ( #C7, #01, &code_08CB2B )
    COP [BF] ( &widestring_08CB2C )
    COP [D4] ( #23, &pyDA_lithograph6_full )
    COP [CC] ( #C7 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08CB2B {
    RTL 
}

widestring_08CB2C `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

---------------------------------------------

pyDA_lithograph6_full {
    JML $@f_inventory_full
}