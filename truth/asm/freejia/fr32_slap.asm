
---------------------------------------------

h_fr32_slap [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr32_slap {
    COP [B6] ( #10 )
    COP [BC] ( #08, #04 )
    COP [C0] ( &code_05B58E )
    COP [27] ( #08 )
    RTL 
}

code_05B58E {
    COP [BF] ( &widestring_05B59B )
    COP [08] ( #$0505 )
    COP [BF] ( &widestring_05B60C )
    RTL 
}

widestring_05B59B `[DEF]I was startled....[N][LU1:4D]dropped[N][LU1:8E]the ceiling.[FIN]Thanks for showing [N]me [LU1:D7]impressive  [N]dive. I [LU1:EF][LU1:97][N]you something. [FIN]`

widestring_05B60C `[CLR][TPL:7]"Slap!!!!!!ˮ[FIN][PAL:0]Kids! If you do [N][LU1:C8][LU1:D6]dangerous [N]again, you'll be in [N]big trouble!!! [END]`