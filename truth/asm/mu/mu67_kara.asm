
---------------------------------------------

h_mu67_kara [
  h_actor < #1B, #00, #30 >   ;00
]

---------------------------------------------

e_mu67_kara {
    COP [D2] ( #88, #01 )
    COP [DA] ( #1D )
    LDA #$2000
    TRB $10
    COP [86] ( #1F, #02, #02 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [80] ( #1C )
    COP [89]
    COP [D2] ( #06, #01 )
    COP [DA] ( #3B )
    COP [84] ( #1B, #1E )
    COP [8A]
    COP [BF] ( &widestring_06A894 )
    LDA #$0000
    STA $0AA6
    LDA #$0404
    STA $064A
    COP [26] ( #68, #$0070, #$00C0, #00, #$1200 )
    COP [C1]
    RTL 
}

widestring_06A894 `[TPL:B][TPL:1][LU1:25][N]It [LU1:84]matter! [FIN][LU1:2B][LU1:DA][LU1:6B]how[N]to [LU1:AC]Mu![FIN][TPL:2][LU1:2A]That's good. We[N][LU1:99][LU1:D0][LU1:E0]from[N][LU1:CF][LU2:54]Rama.[FIN][TPL:0]Will told [LU1:89][LU1:6B][N]Mu and the [LU1:C1][N]who had [LU1:79][LU1:DC][N]the [LU1:EB]tunnel... [FIN][TPL:1][LU1:25][N][LU1:1D][LU1:CE]a sad story... [FIN]separated [LU1:8E]those [N][LU1:F0]whom [LU2:AB]lived.[FIN]Others remaining under[N]water... [FIN][TPL:6][LU1:36]If we go [LU1:DC][N]the tunnel, maybe we[N]can reach the mainland.[FIN][TPL:4]Lance: Good idea! [N][LU1:2B]get out of here!![PAL:0][END]`