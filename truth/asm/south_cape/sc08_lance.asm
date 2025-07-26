
---------------------------------------------

h_sc08_lance [
  h_actor < #03, #00, #10 >   ;00
]

---------------------------------------------

e_sc08_lance {
    COP [C0] ( &code_048D35 )
    COP [D0] ( #10, #00, &code_048D30 )
    COP [E0]
}

code_048D30 {
    COP [0B]
    COP [C1]
    RTL 
}

code_048D35 {
    COP [BF] ( &widestring_048D3A )
    RTL 
}

widestring_048D3A `[TPL:B][TPL:4]Lance:[N]Like always, the cave[N]at the seashore![PAL:0][END]`