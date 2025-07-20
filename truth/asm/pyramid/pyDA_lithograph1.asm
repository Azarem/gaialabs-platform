?INCLUDE 'f_inventory_full'

!camera_bounds_y                06DC

---------------------------------------------

h_pyDA_lithograph1 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pyDA_lithograph1 {
    LDA #$0100
    STA $camera_bounds_y
    COP [D0] ( #C2, #01, &code_08C79F )
    LDA #$0200
    TSB $12
    COP [BC] ( #00, #02 )
    COP [C0] ( &code_08C7A6 )
    COP [D2] ( #C2, #01 )
}

code_08C79F {
    COP [32] ( #94 )
    COP [33]
    COP [E0]
}

code_08C7A6 {
    COP [D0] ( #C2, #01, &code_08C7C4 )
    COP [BF] ( &widestring_08C7C9 )
    COP [D4] ( #1E, &pyDA_lithograph1_full )
    COP [CC] ( #C2 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_08C831 )
}

code_08C7C4 {
    RTL 
}

pyDA_lithograph1_full {
    JML $@f_inventory_full
}

widestring_08C7C9 `[DEF][TPL:0]There's a lithograph on[N][LU1:D6]wall. I [LU1:99]in[N]Dao [LU1:D7]it's[N]a hieroglyph...[FIN][LU1:2B]try to remove[N]the lithograph.[PAL:0][FIN]`

widestring_08C831 `[CLR][SFX:0][DLY:9][LU1:67]got the [N][LU1:1B]Stone![PAU:78][END]`