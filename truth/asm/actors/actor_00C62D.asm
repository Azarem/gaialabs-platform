?INCLUDE 'table_0EDA00'


---------------------------------------------

h_actor_00C62D [
  h_actor < #07, #00, #10 >   ;00
]

---------------------------------------------

e_actor_00C62D {
    COP [88] ( @table_0EDA00 )
    COP [80] ( #07 )
    COP [89]
    COP [0B]
    COP [21] ( #01, &code_00C65D )
    COP [27] ( #0A )

  code_00C644:
    COP [21] ( #01, &code_00C64A )
    RTL 
}

code_00C64A {
    COP [CA] ( #08 )
    COP [40] ( #$0800, &code_00C658 )
    COP [C4] ( @code_00C644 )
}

code_00C658 {
    COP [CB]
    COP [06] ( #01 )
}

code_00C65D {
    COP [0C]
    COP [80] ( #00 )
    COP [89]
    COP [C1]
    RTL 
}