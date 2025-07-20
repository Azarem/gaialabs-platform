

---------------------------------------------

h_fr32_hp_jewel [
  h_actor < #25, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_hp_jewel {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05CF96 )
    COP [0B]
    COP [C1]
    RTL 
}

code_05CF96 {
    COP [D0] ( #54, #01, &code_05CFA6 )
    COP [CC] ( #54 )
    COP [BF] ( &widestring_05CFA7 )
    INC $0ACA
}

code_05CFA6 {
    RTL 
}

widestring_05CFA7 `[DEF]You [LU1:8F]the HP jewel![END]`