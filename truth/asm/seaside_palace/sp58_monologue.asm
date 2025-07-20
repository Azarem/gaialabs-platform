

---------------------------------------------

h_sp58_actor_068380 [
  h_actor < #05, #00, #18 >   ;00
]

---------------------------------------------

e_sp58_actor_068380 {
    LDA $0AA6
    CMP #$0001
    BNE code_0683C0
    BRA code_0683B4
}

---------------------------------------------

h_sp58_monologue [
  h_actor < #05, #00, #18 >   ;00
]

---------------------------------------------

e_sp58_monologue {
    LDA $0AA6
    CMP #$0001
    BNE code_0683C0
    COP [9C] ( @code_0683C2, #$2000 )
    COP [DA] ( #0F )
    COP [04] ( #1B )
    LDY #$1000
    TYA 
    CLC 
    ADC #$0030
    TAY 
    LDA #$0001
    STA $002E, Y
}

code_0683B4 {
    COP [BC] ( #00, #B0 )

  code_0683B8:
    COP [82] ( #05, #13 )
    COP [89]
    BRA code_0683B8
}

code_0683C0 {
    COP [E0]
}

code_0683C2 {
    COP [DA] ( #EF )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_0683EB )
    COP [DA] ( #77 )
    LDA #$0404
    STA $064A
    LDA #$0200
    STA $0648
    STA $0688
    COP [26] ( #5A, #$0090, #$0070, #83, #$1400 )
    COP [C1]
    RTL 
}

widestring_0683EB `[TPL:B][TPL:0]Will: We got out of [N]the airplane in the [N]nick of time... [FIN][LU1:37]a [LU1:94]inventor, [N]but it [LU1:CC][LU1:DB][N][LU2:44][LU1:C8]missing [N]in his inventions..... [FIN]I [LU2:6E]nobody's [N]perfect, including [N]Neil.[PAL:0][END]`