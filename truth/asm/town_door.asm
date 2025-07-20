?INCLUDE 'table_0EDA00'


---------------------------------------------

h_town_door [
  h_actor < #01, #00, #10 >   ;00
]

---------------------------------------------

e_town_door {
    COP [88] ( @table_0EDA00 )
    COP [80] ( #01 )
    COP [89]
    COP [0B]
    COP [21] ( #01, &code_00C623 )
    COP [27] ( #0A )

  code_00C60A:
    COP [21] ( #01, &code_00C610 )
    RTL 
}

code_00C610 {
    COP [CA] ( #08 )
    COP [40] ( #$0800, &code_00C61E )
    COP [C4] ( @code_00C60A )
}

code_00C61E {
    COP [CB]
    COP [06] ( #0E )
}

code_00C623 {
    COP [0C]
    COP [80] ( #00 )
    COP [89]
    COP [C1]
    RTL 
}