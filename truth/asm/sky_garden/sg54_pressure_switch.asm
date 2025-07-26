
---------------------------------------------

h_sg54_pressure_switch [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_sg54_pressure_switch {
    COP [D1] ( #$012F, #01, &code_05F768 )
    COP [C1]
    COP [29] ( #03, #$0348, #$02E0, &code_05F75F )
    RTL 
}

code_05F75F {
    COP [32] ( #2F )
    COP [33]
    COP [CD] ( #$012F )
}

code_05F768 {
    COP [E0]
    RTL 
}