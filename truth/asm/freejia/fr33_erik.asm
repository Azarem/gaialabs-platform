
!joypad_mask_std                065A

---------------------------------------------

h_fr33_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_fr33_erik {
    COP [D0] ( #65, #01, &code_05CDA3 )
    COP [0B]
    COP [C0] ( &code_05CDA5 )
    COP [D2] ( #65, #01 )
    COP [0C]
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [85] ( #10, #03, #12 )
    COP [8A]
    COP [86] ( #0E, #06, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_05CDA3 {
    COP [E0]
}

code_05CDA5 {
    COP [BF] ( &widestring_05CDBC )
    COP [CC] ( #57 )
    COP [CC] ( #58 )
    COP [CC] ( #64 )
    COP [CC] ( #65 )
    LDA #$0007
    STA $0AA6
    RTL 
}

widestring_05CDBC `[TPL:E][TPL:3]Erik: [N]Impossible! [LU1:67][LU1:79][N]to rescue me!! [FIN]I [LU1:83][LU1:DA]you [LU1:7A][N]break down the door! [FIN]The man ran away, [N]scared. [FIN]I [LU1:DD]to sneak [LU1:A1]the[N]camp to rescue three[N][LU2:7E]brothers.[FIN]I was discovered, and[N]now I'm [LU1:A5]this...[FIN]The laborers were[N][LU2:69]to work in[N]the diamond mine.[FIN][LU1:1F][LU2:AD]you where. [N][LU1:3B][LU1:D1]them! [FIN]Will learns the[N]location of the mine![N][PAL:0][END]`