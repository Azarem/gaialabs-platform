
---------------------------------------------

h_daC3_sandy [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_sandy {
    COP [C0] ( &code_08A86B )
    COP [0B]
    COP [C1]
    RTL 
}

code_08A86B {
    COP [BF] ( &widestring_08A870 )
    RTL 
}

widestring_08A870 `[DEF]I got sand in my eyes. [N]It [LU1:CB]to sting... [END]`