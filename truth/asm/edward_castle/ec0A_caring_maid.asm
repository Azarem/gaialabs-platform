
---------------------------------------------

h_ec0A_caring_maid [
  h_actor < #25, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_caring_maid {
    COP [BC] ( #10, #00 )
    COP [0B]
    COP [C0] ( &code_04C8F6 )
    COP [C1]
    RTL 
}

code_04C8F6 {
    COP [BF] ( &widestring_04C8FB )
    RTL 
}

widestring_04C8FB `[TPL:B][LU1:63]he's[N]shy...[FIN]I'm glad [LU1:D7]somewhere[N]in the [LU1:F5][LU1:D9]is[N][LU1:CF]who is[N]thinking of me.[END]`