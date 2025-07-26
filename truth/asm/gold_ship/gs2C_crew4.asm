
---------------------------------------------

h_gs2C_crew4 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_gs2C_crew4 {
    COP [0B]
    COP [C0] ( &code_05838F )
    COP [C1]
    RTL 
}

code_05838F {
    COP [BF] ( &widestring_058394 )
    RTL 
}

widestring_058394 `[DEF][LU1:1D]the King![N][LU1:69]safe![FIN][::][TPL:0]Will: [N](I'm the King???)[PAL:0][END]`