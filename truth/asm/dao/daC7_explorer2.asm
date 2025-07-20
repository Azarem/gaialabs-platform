

---------------------------------------------

h_daC7_explorer2 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_daC7_explorer2 {
    COP [C0] ( &code_08A9E9 )
    COP [0B]
    COP [C1]
    RTL 
}

code_08A9E9 {
    COP [BF] ( &widestring_08A9EE )
    RTL 
}

widestring_08A9EE `[DEF]There's a [LU1:C7]legend[N][LU1:6D]here.[FIN]"The [LU1:3F]is not for[N] the living. [LU1:38]those[N] who've transcended the[N] [LU1:72]may enter.ˮ[FIN][LU1:5E]are the words...[N]The [LU1:3F]is a big[N]tomb. The [LU1:B1]can't[N]go in? Hmmm...[END]`