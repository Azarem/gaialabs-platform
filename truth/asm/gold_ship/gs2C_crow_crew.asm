?INCLUDE 'chunk_028000'
?INCLUDE 'thinker_00B7EA'

!joypad_mask_std                065A
!_TM                            212C
!CGADSUB                        2131
!COLDATA                        2132

---------------------------------------------

h_gs2C_crow_crew [
  h_actor < #02, #00, #30 >   ;00
]

---------------------------------------------

e_gs2C_crow_crew {
    COP [BC] ( #00, #FC )
    COP [C0] ( &code_0584A9 )
    COP [D0] ( #4F, #01, &code_058498 )
    COP [D2] ( #4C, #01 )
    COP [9C] ( @code_05857A, #$2000 )
    LDA #$2000
    TRB $10
    COP [D2] ( #4F, #01 )
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [04] ( #03 )
    COP [DA] ( #01 )
    JSL $@func_028043
    LDA #$0000
    STA $7F0C01
    SEP #$20
    STA $7F0C00
    LDA #$FF
    STA $COLDATA
    LDA #$17
    STA $_TM
    LDA #$A2
    STA $CGADSUB
    REP #$20
    COP [DA] ( #3B )
    COP [3C] ( @e_thinker_00B7EA )
    COP [DA] ( #BF )
    SEP #$20
    LDA #$22
    STA $CGADSUB
    REP #$20
    COP [DA] ( #77 )
    COP [BF] ( &widestring_0584FB )
    LDA #$EFF0
    TRB $joypad_mask_std
}

code_058498 {
    LDA #$2000
    TRB $10
    COP [DA] ( #01 )
    LDA #$0002
    STA $06F6
    COP [C1]
    RTL 
}

code_0584A9 {
    COP [D0] ( #4F, #01, &code_0584B7 )
    COP [BF] ( &widestring_0584BC )
    COP [CC] ( #4F )
    RTL 
}

code_0584B7 {
    COP [BF] ( &widestring_0584FB )
    RTL 
}

widestring_0584BC `[DEF]Guard: Oh short King,[N][LU1:A9]there. The ship is[N][LU1:81]out of the cave![END]`

widestring_0584FB `[DEF]Guard: After [LU1:B1]in [N]darkness for so long, [N]the brightness is [LU1:A5][N]a new beginning. [FIN]How can invaders come[N]to [LU1:88]a [LU1:F5]as[N][LU1:76]as this?[END]`

code_05857A {
    COP [C1]
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$A1
    STA $CGADSUB
    LDA #$E0
    STA $COLDATA
    REP #$20
    COP [D0] ( #4F, #01, &code_058596 )
    RTL 
}

code_058596 {
    COP [E0]
}