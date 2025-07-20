?INCLUDE 'table_0EE000'


---------------------------------------------

h_ec11_actor_09AA40 [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_ec11_actor_09AA40 {
    COP [D0] ( #DF, #01, &code_09AA6C )
    COP [CC] ( #DF )
    COP [88] ( @table_0EE000 )
    COP [84] ( #33, #02 )
    COP [8A]
    LDA #$0048
    STA $7F0018, X
    LDA #$0050
    STA $7F001A, X
    COP [52] ( #33, #02, #FF )
    COP [53]
}

code_09AA6C {
    COP [E0]
}