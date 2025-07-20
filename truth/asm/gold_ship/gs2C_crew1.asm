

---------------------------------------------

h_gs2C_crew1 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_gs2C_crew1 {
    COP [0B]
    COP [C0] ( &code_05825B )
    COP [C1]
    RTL 
}

code_05825B {
    COP [BF] ( &widestring_058260 )
    RTL 
}

widestring_058260 `[DEF]King! [LU1:69]safe![N]Now we can set sail.[END]`