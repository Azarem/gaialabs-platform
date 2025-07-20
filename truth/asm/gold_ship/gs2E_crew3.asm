

---------------------------------------------

h_gs2E_crew3 [
  h_actor < #15, #00, #10 >   ;00
]

---------------------------------------------

e_gs2E_crew3 {
    COP [0B]
    COP [C0] ( &code_0589D6 )
    COP [C1]
    RTL 
}

code_0589D6 {
    COP [BF] ( &widestring_0589DB )
    RTL 
}

widestring_0589DB `[TPL:A]Why must[N]we flee? It is[N]our home.[END]`