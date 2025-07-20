

---------------------------------------------

h_eu9A_friezer [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_eu9A_friezer {
    COP [D0] ( #A7, #01, &eu9A_friezer_destroy )
    COP [C0] ( &code_07E618 )
    COP [0B]
    COP [C1]
    RTL 
}

eu9A_friezer_destroy {
    COP [E0]
}

code_07E618 {
    COP [BF] ( &widestring_07E61D )
    RTL 
}

widestring_07E61D `[DEF]Friezer: I am the [N]explorer, Friezer.[FIN]I, [LU2:B7]plan on leaving[N]my name in history[N]as the discoverer [N]of the Tower of Babel.[END]`