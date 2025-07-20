?BANK 05


---------------------------------------------

h_na49_lily [
  h_actor < #23, #00, #10 >   ;00
]

---------------------------------------------

e_na49_lily {
    COP [0B]
    COP [C0] ( &code_05DDBB )
    COP [D2] ( #01, #01 )
    COP [86] ( #27, #05, #12 )
    COP [8A]
    COP [81] ( #28, #12 )
    COP [89]
    COP [80] ( #23 )
    COP [89]
    COP [CE] ( #01 )
    COP [D2] ( #02, #01 )
    COP [BF] ( &widestring_05DDC0 )
    COP [80] ( #25 )
    COP [89]
    COP [BF] ( &widestring_05DDDF )
    COP [CE] ( #02 )
    COP [D2] ( #05, #01 )
    COP [B6] ( #30 )
    COP [85] ( #28, #03, #12 )
    COP [8A]
    COP [80] ( #23 )
    COP [89]
    COP [0B]
    COP [D2] ( #07, #01 )
    COP [0C]
    COP [85] ( #29, #02, #11 )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_05DE46 )

  code_05DD9F:
    COP [BE] ( #02, #01, &code_list_05DDA5 )
}

code_list_05DDA5 [
  &code_05DDAB   ;00
  &code_05DDB1   ;01
  &code_05DDAB   ;02
]

code_05DDAB {
    COP [BF] ( &widestring_05DF9F )
    BRA code_05DD9F
}

code_05DDB1 {
    COP [BF] ( &widestring_05DFC3 )
    COP [CC] ( #08 )
    COP [C1]
    RTL 
}

code_05DDBB {
    COP [BF] ( &widestring_05DFDC )
    RTL 
}

widestring_05DDC0 `[TPL:A][TPL:1][LU1:25][N]This person stinks... [FIN]`

widestring_05DDDF `[TPL:A][CLR][TPL:2][LU1:2A][LU1:62]are you[N]saying! You shouldn't[N][LU2:AC][LU1:A5]that!![FIN]There's a wonderful [N]smell in [LU1:D6]room,  [N]isn't there?[END]`

widestring_05DE46 `[TPL:B][TPL:2][LU1:2A]There's a new[N]red star below the[N][LU1:7E]of Cygnus.[FIN][TPL:6][LU1:36][N]That's right! [N]You [LU1:A4]a lot! ! [FIN]The red star in Cygnus, [N]Will's interest in ruins.[FIN]Different elements are[N]bound together[N]organically...[FIN]I [LU1:82][LU1:A4]if it's[N]by coincidence or by[N]design, but something[N]is [LU1:93]to happen.[FIN]Fortunately, the Nazca [N][LU1:96]paintings are [N]a week's walk east [N]of [LU2:74][FIN][::]Go?[N] Yes[N] No`

widestring_05DF9F `[CLR][TPL:6][LU1:36][N][LU1:D]say that. [N][LU2:1]I [LU1:F1]to go. [FIN][JMP:&widestring_05DE46+M]`

widestring_05DFC3 `[CLR][TPL:6][LU1:36][N]Good! [LU1:1D]settled![PAL:0][END]`

widestring_05DFDC `[TPL:B][TPL:2][LU1:2A]I [LU2:A8]say [N][LU1:6C]bad [LU1:6B][N]Will's cousin, but [N][LU1:D6]inventor...[PAL:0][END]`