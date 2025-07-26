
---------------------------------------------

h_fireplace_journal [
  h_actor < #22, #00, #10 >   ;00
]

---------------------------------------------

e_fireplace_journal {
    COP [D0] ( #8F, #01, &code_07B4D4 )
    LDA #$0200
    TSB $12
    COP [BC] ( #03, #00 )
    COP [C0] ( &code_07B4D6 )
    COP [C1]
    RTL 
}

code_07B4D4 {
    COP [E0]
}

code_07B4D6 {
    COP [BF] ( &widestring_07B4E5 )
    COP [CC] ( #8F )
    COP [D4] ( #15, &code_07B4E4 )
    COP [E0]
}

code_07B4E4 {
    RTL 
}

widestring_07B4E5 `[DEF][TPL:0][SFX:10]There's a journal in a[N]crack in the fireplace.[FIN][SFX:0]He [LU2:6D]the journal.[PAL:0][END]`