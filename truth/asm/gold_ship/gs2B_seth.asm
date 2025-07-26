
?INCLUDE 'hidden_red_jewel'

---------------------------------------------

h_gs2B_seth [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_gs2B_seth {
    COP [D0] ( #51, #01, &code_059650 )
    COP [0B]
    COP [C0] ( &code_059652 )
    COP [C1]
    RTL 
}

code_059650 {
    COP [E0]
}

code_059652 {
    COP [D0] ( #E0, #01, &code_059669 )
    COP [BF] ( &widestring_05966E )
    COP [D4] ( #01, &code_059665 )
    COP [CC] ( #E0 )
    RTL 
}

code_059665 {
    JML $@code_00C6A1
}

code_059669 {
    COP [BF] ( &widestring_0596C1 )
    RTL 
}

widestring_05966E `[TPL:F][TPL:5]Seth: I [LU1:8F][N]a [LU1:C7]jewel [N]on board the ship. [N][LU1:1F][LU1:97]it to [LU2:C7][FIN][PAL:0]Will [LU2:6D]a Red Jewel![PAL:0][END]`

widestring_0596C1 `[TPL:F][TPL:5][LU1:1D]the [LU2:61][LU1:DF]I've[N][LU2:5D]given you anything.[N]Take [LU2:57]of it.[PAL:0][END]`