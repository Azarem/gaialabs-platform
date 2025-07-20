?INCLUDE 'table_0EE000'


---------------------------------------------

h_na49_wings [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_na49_wings {
    COP [BC] ( #08, #00 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    COP [C0] ( &code_05E40B )
    COP [C1]
    RTL 
}

code_05E40B {
    COP [BF] ( &widestring_05E419 )
    LDA $0AA6
    ORA #$0002
    STA $0AA6
    RTL 
}

widestring_05E419 `[TPL:B][TPL:6][LU1:36]Those are [N]airplane wings. [FIN][LU1:1D]part of a machine[N][LU1:D7][LU1:EF]fulfill man's[N]dream of flying in the[N]air [LU1:A5]a bird.[FIN]The body's too big, and[N]you [LU1:BA]a runway to[N][LU1:E7]off, so it's[N]hidden in the desert.[PAL:0][END]`