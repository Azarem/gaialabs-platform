

---------------------------------------------

h_eu91_shop_door [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_eu91_shop_door {
    COP [C1]
    COP [13] ( &code_07D5DF )
    RTL 
}

code_07D5DF {
    COP [DB] ( #$0707 )
    COP [0C]
    BRA e_eu91_shop_door
}