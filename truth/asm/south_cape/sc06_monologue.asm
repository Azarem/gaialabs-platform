
!joypad_mask_std                065A
!_TM                            212C

---------------------------------------------

h_sc06_monologue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sc06_monologue {
    COP [D0] ( #1D, #01, &code_04A4CA )
    COP [D0] ( #1C, #01, &code_04A4B4 )
    COP [C1]
    COP [28] ( #$0008, #$0210, &code_04A47B )
    RTL 
}

code_04A47B {
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$04
    STA $_TM
    REP #$20
    LDA #$0000
    STA $7F0A00
    COP [DA] ( #77 )
    COP [BF] ( &widestring_04A4CC )
    COP [CC] ( #1C )
    LDA #$0404
    STA $064A
    LDA #$0200
    STA $0648
    COP [26] ( #06, #$00A0, #$0078, #03, #$1100 )
    COP [C1]
    RTL 
}

code_04A4B4 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [CC] ( #1D )
    COP [BF] ( &widestring_04A582 )
    LDA #$CFF0
    TRB $joypad_mask_std
}

code_04A4CA {
    COP [E0]
}

widestring_04A4CC `[DLG:3,B][SIZ:D,3][TPL:0]Will: We sat down to[N]a feast of snail pie...[N][LU1:F0]whipped cream![FIN]I [LU2:89]got one piece,[N]but [LU1:1A]Bill ate[N]half the pie.[FIN]That night Will dreamed[N][LU1:D7][LU1:26]and he took a[N]trip [LU1:6D]the world...[PAL:0][END]`

widestring_04A582 `[DLG:3,11][SIZ:D,3]And the [LU1:BC]morning[N][LU1:C8]began to[N]happen...[END]`