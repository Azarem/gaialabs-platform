
---------------------------------------------

h_sp58_missed_flight [
  h_actor < #03, #00, #18 >   ;00
]

---------------------------------------------

e_sp58_missed_flight {
    LDA #$1000
    TSB $12
    LDA $0AA6
    BNE code_068040
    LDA #$FFA4
    STA $14
    COP [85] ( #03, #2A, #01 )
    COP [8A]
    COP [9C] ( @code_068042, #$2000 )

  code_068020:
    COP [81] ( #03, #01 )
    COP [89]
    COP [D0] ( #01, #00, &code_068020 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    LDA #$01C0
    STA $14

  code_068038:
    COP [81] ( #83, #02 )
    COP [89]
    BRA code_068038
}

code_068040 {
    COP [E0]
}

code_068042 {
    COP [DA] ( #1D )
    COP [BF] ( &widestring_06805C )
    COP [C1]
    LDY $04
    LDA $0014, Y
    CMP #$0120
    BCS code_068056
    RTL 
}

code_068056 {
    COP [CC] ( #01 )
    COP [C1]
    RTL 
}

widestring_06805C `[TPL:A][TPL:6][LU1:36][N]Shoot!! [N]I dropped a contact!! [FIN][TPL:1][LU1:25]You what!!! [N]Idiot! Will is [N]doomed for [LU2:A6]now! [FIN][TPL:4]Lance: Neil! [LU1:1D][LU1:D3][N]a [LU1:A7]ways to the [N]ground. Try again! [FIN][TPL:6][LU1:36][N]Okay! [N][LU1:1F]get him [LU1:D6]time!![PAL:0][END]`