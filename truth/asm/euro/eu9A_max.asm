
---------------------------------------------

h_eu9A_max [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_eu9A_max {
    COP [D0] ( #A7, #01, &eu9A_max_destroy )
    COP [C0] ( &code_07E6A8 )
    COP [0B]
    COP [C1]
    RTL 
}

code_07E6A8 {
    COP [BF] ( &widestring_07E6AD )
    RTL 
}

widestring_07E6AD `[DEF]Max: I [LU1:F9]where[N][LU1:FF]taking us[N]exploring [LU1:D6]time...[FIN]I'm afraid [LU1:9F]up to[N]the whims of the[N]captain. Heh heh.[END]`

---------------------------------------------

eu9A_max_destroy {
    COP [E0]
}