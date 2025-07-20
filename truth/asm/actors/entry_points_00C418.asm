?INCLUDE 'table_0EE000'
?INCLUDE 'player_character'

!joypad_mask_std                065A
!player_flags                   09AE

---------------------------------------------

func_00C418 {
    COP [A5] ( @code_00C423, #00, #00, #$0302 )
    COP [E0]
}

code_00C423 {
    COP [06] ( #09 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #2A )
    COP [89]
    COP [E0]
}

---------------------------------------------

func_00C432 {
    COP [D0] ( #00, #01, &func_00C43D )
    COP [8F] ( #01 )
    BRA code_00C440
}

---------------------------------------------

func_00C43D {
    COP [8F] ( #11 )
}

code_00C440 {
    COP [C1]
    COP [89]
    BRA code_00C440
}

---------------------------------------------

func_00C446 {
    LDA #$0200
    TSB $10
    COP [8E] ( #04 )

  code_00C44E:
    COP [80] ( #1F )
    COP [89]
    BRA code_00C44E
}

---------------------------------------------

func_00C455 {
    LDA #$0200
    TRB $10
}

---------------------------------------------

func_00C45A {
    JML $@code_02C3C8
}

---------------------------------------------

func_00C45E {
    COP [8E] ( #04 )
    COP [C1]
    COP [80] ( #20 )
    COP [89]
    RTL 
    JML $@code_02C3C8
}

---------------------------------------------

func_00C46D {
    COP [8E] ( #04 )
    COP [80] ( #20 )
    COP [89]
    JML $@code_02C3C8
}

---------------------------------------------

func_00C479 {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0800
    TSB $player_flags
    LDA #$0008
    TRB $10
    LDA #$2200
    TSB $10
    LDA #$0200
    TSB $06EE
    COP [DA] ( #03 )
    COP [BC] ( #00, #80 )
    LDA #$2000
    TRB $10
    COP [CA] ( #08 )
    COP [91] ( #19, #07 )
    COP [89]
    COP [CB]
    COP [06] ( #2C )
    COP [91] ( #1C, #00 )
    COP [89]
    LDA #$0008
    TSB $10
    LDA #$0200
    TRB $10
    LDA #$0200
    TRB $06EE
    LDA #$CFF0
    TRB $joypad_mask_std
    STZ $08
    JML $@code_02C3C8
}

---------------------------------------------

func_00C4D1 {
    LDA #$0008
    TRB $10
    LDA #$2200
    TSB $10
    COP [BC] ( #00, #C0 )
    COP [C2]
    LDA #$0200
    TSB $06EE
    COP [DA] ( #03 )
    COP [BC] ( #00, #40 )
    LDA #$2000
    TRB $10
    COP [B9]
    COP [BC] ( #00, #E0 )
    COP [91] ( #1A, #08 )
    COP [89]
    COP [CA] ( #03 )
    COP [91] ( #1B, #08 )
    COP [89]
    COP [CB]
    COP [91] ( #1B, #04 )
    COP [89]
    COP [91] ( #1B, #04 )
    COP [89]
    COP [91] ( #1B, #02 )
    COP [89]
    COP [91] ( #1B, #02 )
    COP [89]
    COP [B9]
    COP [BC] ( #00, #20 )
    COP [8F] ( #1E )
    COP [89]
    COP [91] ( #1E, #01 )
    COP [89]
    COP [91] ( #1E, #03 )
    COP [89]
    COP [06] ( #2C )
    COP [8F] ( #1F )
    COP [89]
    LDA #$0008
    TSB $10
    LDA #$0200
    TRB $10
    LDA #$0200
    TRB $06EE
    STZ $08
    JML $@code_02C3C8
}

---------------------------------------------

func_00C557 {
    LDA #$0800
    TSB $player_flags
    LDA #$0008
    TRB $10
    LDA #$0200
    TSB $10
    COP [8E] ( #08 )
    COP [80] ( #00 )
    COP [89]
    LDA $14
    STA $24
    LDA $16
    STA $26
    LDA $16
    AND #$FFF0
    STA $16

  code_00C57E:
    COP [13] ( &code_00C58C )
    LDA $16
    CLC 
    ADC #$0010
    STA $16
    BRA code_00C57E
}

code_00C58C {
    COP [1C] ( #04, &code_00C5A1 )
    LDA $24
    STA $14
    LDA $26
    STA $16
    COP [80] ( #01 )
    COP [89]
    JMP $&code_00C5E3
}

code_00C5A1 {
    LDA $24
    STA $14
    LDA $26
    STA $16
    LDA #$2000
    TSB $10

  code_00C5AE:
    LDA $16
    AND #$000F
    BNE code_00C5BA
    COP [1A] ( #04, &code_00C5C1 )
}

code_00C5BA {
    INC $16
    COP [C4] ( @code_00C5AE )
}

code_00C5C1 {
    LDA #$2000
    TRB $10
    LDA #$0002
    TSB $10

  code_00C5CB:
    COP [82] ( #02, #01 )
    COP [89]
    COP [1A] ( #00, &code_00C5D8 )
    BRA code_00C5CB
}

code_00C5D8 {
    LDA #$0002
    TRB $10
    COP [91] ( #1C, #00 )
    COP [89]
}

code_00C5E3 {
    LDA #$0008
    TSB $10
    LDA #$0200
    TRB $10
    STZ $08
    JML $@code_02C3C8
}