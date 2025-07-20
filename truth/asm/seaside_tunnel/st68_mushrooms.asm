

---------------------------------------------

h_st68_mushrooms [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_st68_mushrooms {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06B84F )
}

code_list_06B84F [
  &code_06B855   ;00
  &code_06B86C   ;01
  &code_06B86C   ;02
]

code_06B855 {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_06B863 )
    COP [C1]
    RTL 
}

code_06B863 {
    COP [BF] ( &widestring_06B86E )
    COP [0C]
    COP [CC] ( #02 )
}

code_06B86C {
    COP [E0]
}

widestring_06B86E `[TPL:A][TPL:0][LU1:5E][LU2:83]grow all[N][LU1:BE]in the tunnel.[N][LU1:1D]our [LU2:89]food.[FIN]Yesterday baked[N]mushroom.[FIN]The day before,[N]boiled mushroom.[FIN]Before that, raw.[N]Awfully tasteless...[FIN]We [LU1:78]ask too much. [N][LU1:1F]do it to live. [N]We [LU1:98]to eat...[PAL:0][END]`