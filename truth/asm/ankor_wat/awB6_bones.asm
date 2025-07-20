

---------------------------------------------

h_awB6_bones [
  h_actor < #2C, #01, #10 >   ;00
]

---------------------------------------------

e_awB6_bones {
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_08A00D )
    COP [C1]
    RTL 
}

code_08A00D {
    COP [BF] ( &widestring_08A027 )
    COP [BE] ( #02, #02, &code_list_08A017 )
}

code_list_08A017 [
  &code_08A022   ;00
  &code_08A01D   ;01
  &code_08A022   ;02
]

code_08A01D {
    COP [BF] ( &widestring_08A096 )
    RTL 
}

code_08A022 {
    COP [BF] ( &widestring_08A094 )
    RTL 
}

widestring_08A027 `[DEF][TPL:0]The bones of a [LU2:7A][N][LU1:8A]fascinated by [N]something...? [FIN]There's [LU1:D0]kind of[N]journal hidden there...[N] Read[N] Quit[PAL:0]`

widestring_08A094 `[CLD]`

widestring_08A096 `[CLR]We crossed the jungle[N]to the native village.[N][PAU:1E][FIN]We [LU1:83][LU1:E9]the[N]language, but they[N]beckoned for us to stay.[FIN][LU1:61]I awoke in the [N]morning, [LU2:89]Captain [N]Friezer and I remained. [FIN]Hunger had [LU2:59][N][LU1:B6][LU1:C1]during the [N]night. [LU1:12]our friends. [FIN]We saw the bodies of our[N]comrades and ran [LU1:A1][N]the jungle. That's [LU1:F6][N]we [LU2:5B]Ankor Wat. [FIN]Rumor says [LU1:D7]you can[N]gain immortality here[N][LU1:F4]the spirits live,[FIN]but all I saw were[N]demons... [FIN]I'm [LU1:93][LU1:73]to my[N]friends... If I don't[N]survive, who [N][LU1:F3]mourn?[END]`