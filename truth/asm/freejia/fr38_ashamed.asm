
---------------------------------------------

h_fr38_ashamed [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr38_ashamed {
    COP [0B]
    COP [C0] ( &code_05BA5D )
    COP [C1]
    RTL 
}

code_05BA5D {
    COP [BF] ( &widestring_05BA62 )
    RTL 
}

widestring_05BA62 `[TPL:A]The upstairs is a mess...[N]I'm ashamed...[END]`