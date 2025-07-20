?INCLUDE 'table_0EE000'


---------------------------------------------

h_na49_telescope [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_na49_telescope {
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    COP [C0] ( &code_05E4EB )
    COP [C1]
    RTL 
}

code_05E4EB {
    COP [BF] ( &widestring_05E4F9 )
    LDA $0AA6
    ORA #$0004
    STA $0AA6
    RTL 
}

widestring_05E4F9 `[TPL:A][TPL:6]That's a telescope.[N]You can see stars as if[N][LU2:AB][LU1:F2]in [LU1:FE]hand.[PAL:0][END]`