?INCLUDE 'chunk_008000'

!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_sp58_red_eye [
  h_actor < #07, #00, #18 >   ;00
]

---------------------------------------------

e_sp58_red_eye {
    LDA #$1000
    TSB $12
    LDA $0AA6
    CMP #$0002
    BNE code_06821A
    COP [DA] ( #01 )
    COP [05] ( #02 )
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA #$EFF0
    TSB $joypad_mask_std
    LDY #$1000
    TYA 
    CLC 
    ADC #$0030
    TAY 
    LDA #$0001
    STA $002C, Y
    LDA #$0000
    STA $002E, Y
    COP [9C] ( @code_06821C, #$2000 )
    LDA $14
    SEC 
    SBC #$009C
    STA $14
    COP [85] ( #07, #68, #13 )
    COP [8A]

  code_0681E3:
    COP [D0] ( #01, #01, &code_0681F0 )
    COP [80] ( #07 )
    COP [89]
    BRA code_0681E3
}

code_0681F0 {
    LDY #$1000
    TYA 
    CLC 
    ADC #$0030
    TAY 
    LDA #$0002
    STA $002C, Y
    COP [85] ( #07, #3C, #11 )
    COP [8A]
    JSL $@func_00B4CC
    LDA #$0404
    STA $064A
    COP [26] ( #59, #$0000, #$0000, #00, #$1100 )
}

code_06821A {
    COP [E0]
}

code_06821C {
    COP [DB] ( #$012B )
    COP [BF] ( &widestring_068230 )
    COP [CC] ( #01 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_06834A )
    COP [E0]
}

widestring_068230 `[TPL:A][TPL:6][LU1:36][N]That was a close one! [FIN][TPL:1][LU1:25][N]Sob...sob... [FIN][TPL:3]Erik: [N]Sniff...sniff... [FIN][TPL:4]Lance: [LU1:D]cry. [N]Will's [LU1:70]saved. [FIN][TPL:2][LU1:2A]Neil, you [LU1:F2][N]great. This invention [N]saved Will's life! [FIN][TPL:6][LU1:36]Ha ha. [N][LU1:D]flatter me. [FIN]We [LU1:CA]try and [N]locate the [LU1:BC]ruins. [FIN]I expect the [LU2:A3]of[N]Cygnus is the [LU1:CD]as[N]the [LU2:A3]of Mu.[END]`

widestring_06834A `[TPL:A][TPL:6][LU1:36][N][LU1:63]to the ocean! [FIN]Mu lies somewhere[N]in [LU1:D6]ocean.[END]`