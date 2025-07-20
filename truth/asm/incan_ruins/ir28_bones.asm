

---------------------------------------------

h_ir28_bones [
  h_actor < #2E, #01, #10 >   ;00
]

---------------------------------------------

e_ir28_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_09C8AE )
    COP [C1]
    RTL 
}

code_09C8AE {
    COP [BF] ( &widestring_09C8B3 )
    RTL 
}

widestring_09C8B3 `[DEF][TPL:0]An [LU1:8A]who sought [N]the Incan [LU1:19]Ship...? [FIN]He [LU2:7A]his [LU1:B0]in [N]a trap... [END]`