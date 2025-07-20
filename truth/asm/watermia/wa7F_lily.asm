
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_wa7F_lily [
  h_actor < #24, #00, #10 >   ;00
]

---------------------------------------------

e_wa7F_lily {
    COP [BC] ( #08, #00 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [DA] ( #1D )
    COP [BF] ( &widestring_07B277 )
    COP [DA] ( #1D )
    COP [CC] ( #01 )
    COP [DA] ( #27 )
    COP [BF] ( &widestring_07B2E4 )
    COP [81] ( #28, #14 )
    COP [89]
    COP [80] ( #24 )
    COP [89]
    COP [DA] ( #1D )
    COP [CC] ( #02 )
    COP [9E] ( @func_07B1CD, #$FFF7, #$FFF5, #$1002 )
    COP [84] ( #39, #1E )
    COP [8A]
    COP [BF] ( &widestring_07B329 )
    COP [CC] ( #03 )
    COP [D2] ( #04, #01 )
    LDA #$0800
    TSB $10
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #33, #06 )
    COP [8A]
    COP [83] ( #33, #13, #11 )
    COP [89]
    COP [83] ( #33, #11, #01 )
    COP [89]
    COP [83] ( #33, #01, #03 )
    COP [89]
    COP [CC] ( #05 )
    COP [87] ( #33, #08, #01, #03 )
    COP [8A]
    COP [E0]
}

widestring_07B277 `[DEF][TPL:2][LU1:2A]What?[FIN][LU1:69]not yourself.[N]Relax.[FIN][TPL:4]Lance: [N][LU1:69][LU2:99]I'm [N]not myself [LU2:94]now. [FIN]This is [LU1:FE]birthday[N][LU1:C3]I [LU2:71]you[N][LU1:A5]it.[PAL:0][END]`

widestring_07B2E4 `[DEF][TPL:2][LU1:2A][N]Oh, Lance! A [LU2:4F][N]of roses! [FIN]Rose buds. They'll[N]open up [LU1:A1]roses.[END]`

widestring_07B329 `[DEF][TPL:2]Lilly:[N]They smell wonderful...[FIN]Thank you.[N][LU1:5D]beautiful...[FIN][TPL:4]Lance: I [LU1:98][LU1:6E][N][LU1:C3][LU1:4B]I [N][LU1:F1]to [LU2:AD]you... [FIN][TPL:2]Lilly:[N]What?[END]`

---------------------------------------------

func_07B1CD {
    COP [80] ( #BA )
    COP [89]
    COP [D2] ( #04, #01 )
    COP [E0]
}