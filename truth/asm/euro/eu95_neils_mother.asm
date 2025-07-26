
---------------------------------------------

h_eu95_neils_mother [
  h_actor < #0D, #00, #10 >   ;00
]

---------------------------------------------

e_eu95_neils_mother {
    COP [D0] ( #A8, #01, &code_07E314 )
    LDA #$1200
    TSB $12
    COP [0B]
    COP [C0] ( &code_07E316 )
    COP [D2] ( #A8, #01 )
    COP [0C]
    COP [BC] ( #00, #F0 )
    COP [86] ( #2F, #03, #12 )
    COP [8A]
    COP [84] ( #2F, #06 )
    COP [8A]
    LDA #$0268
    STA $7F0018, X
    LDA #$0060
    STA $7F001A, X
    COP [22] ( #2F, #01 )
}

code_07E314 {
    COP [E0]
}

code_07E316 {
    COP [BF] ( &widestring_07E31B )
    RTL 
}

widestring_07E31B `[TPL:B][LU1:37]mother: [LU2:41][N][LU1:B3]money and wish [N]to spend our remaining [N][LU2:C6]enjoying [LU2:7D][FIN]Why [LU1:82]you[N]succeed us...[END]`