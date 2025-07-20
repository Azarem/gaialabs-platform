
!joypad_mask_std                065A
!player_actor                   09AA
!INIDISP                        2100

---------------------------------------------

h_ec0A_throne_guard1 [
  h_actor < #1D, #00, #18 >   ;00
]

---------------------------------------------

e_ec0A_throne_guard1 {
    COP [C0] ( &code_04C66A )
    COP [B6] ( #30 )
    COP [0B]
    COP [D2] ( #0A, #01 )
    COP [0C]
    COP [C0] ( #$0000 )
    COP [85] ( #21, #04, #11 )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #0C, #01 )
    COP [85] ( #21, #03, #11 )
    COP [8A]
    COP [86] ( #1E, #05, #11 )
    COP [8A]
    COP [C1]
    RTL 
}

code_04C66A {
    COP [BF] ( &widestring_04C66F )
    RTL 
}

widestring_04C66F `[DEF][LU1:45]If you [LU1:F1]to[N]see the King, keep[N][LU1:FE]wits [LU1:6B]you.[END]`

---------------------------------------------

h_ec0A_throne_guard2 [
  h_actor < #1C, #00, #18 >   ;00
]

---------------------------------------------

e_ec0A_throne_guard2 {
    COP [C0] ( &code_04C765 )
    COP [B6] ( #30 )
    COP [0B]
    COP [D2] ( #0A, #01 )
    COP [0C]
    COP [C0] ( #$0000 )
    COP [85] ( #20, #04, #12 )
    COP [8A]
    COP [86] ( #1F, #04, #12 )
    COP [8A]
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_04C76A )
    COP [CC] ( #0B )
    COP [D2] ( #0C, #01 )
    COP [DA] ( #0B )
    COP [9C] ( @code_04C6F2, #$2000 )
    COP [86] ( #1E, #05, #11 )
    COP [8A]
    COP [C1]
    RTL 
}

code_04C6F2 {
    LDY $player_actor
    LDA $0014, Y
    CMP #$01F8
    BEQ code_04C707
    INC 
    STA $0014, Y
    COP [C2]
    COP [C2]
    BRA code_04C6F2
}

code_04C707 {
    COP [9C] ( @code_04C721, #$2000 )
    COP [CA] ( #50 )
    LDY $player_actor
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [C2]
    COP [CB]
    COP [E0]
}

code_04C721 {
    COP [DA] ( #1F )
    LDA #$000F
    STA $7F0010, X

  code_04C72B:
    LDA $7F0010, X
    DEC 
    BMI code_04C744
    STA $7F0010, X
    SEP #$20
    STA $INIDISP
    REP #$20
    COP [C3] ( @code_04C72B, #$0004 )
}

code_04C744 {
    COP [CC] ( #21 )
    LDA #$0404
    STA $064A
    LDA #$0301
    STA $0648
    COP [26] ( #0B, #$00E8, #$00A0, #83, #$3200 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_04C765 {
    COP [BF] ( &widestring_04C66F )
    RTL 
}

widestring_04C76A `[TPL:D][TPL:0]Will: [N]Ma'am! Save me!![FIN][TPL:3]Queen Edwina: [N]Did you say Ma'am??![PAL:0][END]`