
---------------------------------------------

h_ec0A_shy_guard [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_shy_guard {
    COP [BC] ( #10, #00 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04C8C5 )
    COP [C1]
    RTL 
}

code_04C8C5 {
    COP [BF] ( &widestring_04C8CA )
    RTL 
}

widestring_04C8CA `[TPL:B][TPL:7]I... I love... you...[PAL:0][END]`