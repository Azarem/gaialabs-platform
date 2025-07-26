
?INCLUDE 'table_14C000'

!camera_bounds_y                06DC

---------------------------------------------

h_fr32_actor_05B01E [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_fr32_actor_05B01E {
    LDA #$0420
    STA $camera_bounds_y
    COP [9B] ( @code_05B03E )
    COP [54] ( @misc_fx_1CD080 )
    COP [88] ( @table_14C000 )
    COP [55] ( #00, #$3FE0 )
    COP [56]
    RTL 
}

code_05B03E {
    COP [54] ( @misc_fx_1CD080 )
    COP [88] ( @table_14C000 )
    COP [55] ( #01, #$3FF0 )
    COP [56]
    RTL 
}