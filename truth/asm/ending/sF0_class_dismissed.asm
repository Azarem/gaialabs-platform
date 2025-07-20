
!joypad_mask_std                065A
!_TM                            212C

---------------------------------------------

h_sF0_class_dismissed [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_sF0_class_dismissed {
    LDA #$1000
    TSB $12
    LDA #$4001
    TSB $09EC
    SEP #$20
    LDA #$15
    STA $_TM
    LDA #$FF
    STA $7F0C00
    REP #$20
    STZ $00E4
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [9B] ( @code_09DC2D )
    COP [A0] ( @code_09DC63, #$0098, #$0078, #$1000 )
    COP [A0] ( @code_09DC78, #$0000, #$0088, #$1000 )
    COP [A0] ( @code_09DC97, #$0000, #$0088, #$1000 )
    COP [A0] ( @code_09DCB6, #$0000, #$0088, #$1000 )
    COP [A0] ( @code_09DCD5, #$0000, #$0078, #$1000 )
    COP [A0] ( @code_09DCF4, #$0088, #$0040, #$3000 )
    COP [DA] ( #0F )
    INC $00E4
    COP [DB] ( #$00B3 )
    INC $00E4
    COP [DB] ( #$00B3 )
    COP [CA] ( #06 )
    COP [08] ( #$0909 )
    COP [C3] ( @code_09DBF3, #$001E )
}

code_09DBF3 {
    COP [CB]
    COP [DB] ( #$003B )
    COP [BF] ( &widestring_09DD10 )
    COP [DB] ( #$003B )
    COP [04] ( #02 )
    COP [DB] ( #$0077 )
    INC $00E4
    COP [DA] ( #13 )
    INC $00E4
    COP [DA] ( #13 )
    INC $00E4
    COP [DA] ( #27 )
    INC $00E4
    COP [DA] ( #27 )
    INC $00E4
    COP [DB] ( #$0077 )
    INC $00E4
    COP [C1]
    RTL 
}

code_09DC2D {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0001
    BEQ code_09DC3B
    RTL 
}

code_09DC3B {
    COP [37] ( #6A )
    COP [39]
    COP [C1]
    LDA $00E4
    CMP #$0002
    BEQ code_09DC4B
    RTL 
}

code_09DC4B {
    COP [37] ( #1C )
    COP [39]
    COP [C1]
    LDA $00E4
    CMP #$0007
    BEQ code_09DC5B
    RTL 
}

code_09DC5B {
    COP [37] ( #70 )
    COP [39]
    COP [C1]
    RTL 
}

code_09DC63 {
    LDA #$1000
    TSB $12

  code_09DC68:
    COP [80] ( #08 )
    COP [89]
    LDA $00E4
    CMP #$0007
    BNE code_09DC68
    COP [C1]
    RTL 
}

code_09DC78 {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0003
    BEQ code_09DC86
    RTL 
}

code_09DC86 {
    COP [81] ( #00, #01 )
    COP [89]
    LDA $00E4
    CMP #$0007
    BNE code_09DC86
    COP [C1]
    RTL 
}

code_09DC97 {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0004
    BEQ code_09DCA5
    RTL 
}

code_09DCA5 {
    COP [81] ( #01, #01 )
    COP [89]
    LDA $00E4
    CMP #$0007
    BNE code_09DCA5
    COP [C1]
    RTL 
}

code_09DCB6 {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0005
    BEQ code_09DCC4
    RTL 
}

code_09DCC4 {
    COP [81] ( #02, #01 )
    COP [89]
    LDA $00E4
    CMP #$0007
    BNE code_09DCC4
    COP [C1]
    RTL 
}

code_09DCD5 {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0006
    BEQ code_09DCE3
    RTL 
}

code_09DCE3 {
    COP [81] ( #03, #01 )
    COP [89]
    LDA $00E4
    CMP #$0007
    BNE code_09DCE3
    COP [C1]
    RTL 
}

code_09DCF4 {
    LDA #$1000
    TSB $12
    LDA $00E4
    CMP #$0008
    BEQ code_09DD02
    RTL 
}

code_09DD02 {
    LDA #$2000
    TRB $10
    COP [82] ( #09, #11 )
    COP [89]
    COP [C1]
    RTL 
}

widestring_09DD10 `[DLG:0,17][SIZ:F,3][DLY:5]         Class is over.[N][PAU:B4][CLR]       Please be careful[N]      crossing the street.[N][PAU:F0][CLR]      We have had a lot of[N]    traffic accidents lately.[N][PAU:68][CLD]`