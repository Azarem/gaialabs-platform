

---------------------------------------------

h_ec0A_door_guard [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_door_guard {
    COP [0B]
    COP [C0] ( &code_04C5D4 )
    COP [C1]
    RTL 
}

code_04C5D4 {
    COP [BF] ( &widestring_04C5D9 )
    RTL 
}

widestring_04C5D9 `[DEF][LU1:45]So you are [N]Will.[FIN][LU2:35]to [LU1:98]kept[N]you waiting. [LU1:2B]go[N]see [LU1:27]Edward.[END]`