

---------------------------------------------

h_ir26_journal_bones [
  h_actor < #2E, #01, #10 >   ;00
]

---------------------------------------------

e_ir26_journal_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_09C908 )
    COP [C1]
    RTL 
}

code_09C908 {
    COP [BF] ( &widestring_09C90D )
    RTL 
}

widestring_09C90D `[DEF][TPL:0]There's [LU1:D0]kind[N]of journal...[FIN][PAL:0][N]  Note [LU1:6B]the Incas[FIN]They [LU1:98]no written[N][LU2:7B]They've left[N][LU1:E1]legends in sound.[FIN]I [LU1:98]succeeded in [N]deciphering the Incan [N][LU1:34]of the Wind. [FIN]"Chant in the Golden[N]Room.ˮ Does that[N]mean to play the Melody[N]of the Wind...?[END]`