

---------------------------------------------

h_fr37_caution [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_fr37_caution {
    COP [C0] ( &code_05BD0B )
    COP [0B]
    COP [C1]
    RTL 
}

code_05BD0B {
    COP [BF] ( &widestring_05BD10 )
    RTL 
}

widestring_05BD10 `[TPL:A]Listen to me carefully. [N]You'd [LU2:50]not go [N]on the [LU1:73]streets. [FIN][LU1:24]as a rose has[N]thorns, a [LU2:92]town[N]has [LU1:6E]side.[END]`