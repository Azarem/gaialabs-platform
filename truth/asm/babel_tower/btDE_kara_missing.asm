
?INCLUDE 'func_00C806'
?INCLUDE 'chunk_03BAE1'
?INCLUDE 'table_0EE000'

!scene_current                  0644
!joypad_mask_std                065A
!player_actor                   09AA

---------------------------------------------

h_btDE_kara_missing [
  h_actor < #1A, #00, #0B >   ;00
]

---------------------------------------------

e_btDE_kara_missing {
    COP [D0] ( #D4, #00, &btDE_kara_missing_destroy )
    LDA $scene_current
    CMP #$00E0
    BNE code_09865A
    COP [D1] ( #$0178, #00, &code_09865A )
    COP [CE] ( #D4 )
    LDA #$2000
    TSB $10
    LDA #$0800
    TRB $10
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_0986E1 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}

code_09865A {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [9C] ( @func_00C806, #$2800 )
    PHX 
    TYX 
    JSL $@func_03F0CA
    EOR #$0001
    INC 
    STA $7F0010, X
    CMP #$0001
    BEQ code_098687
    COP [BC] ( #00, #F0 )
    BRA code_09868B
}

code_098687 {
    COP [BC] ( #00, #10 )
}

code_09868B {
    LDA #$001A
    STA $7F0012, X
    PLX 
    COP [C1]
    COP [89]

  code_098697:
    COP [C1]
    COP [C1]
    COP [8B]
    LDY $player_actor
    LDA $000E, Y
    BIT #$2000
    BEQ code_0986A9
    RTL 
}

code_0986A9 {
    LDA #$2000
    TSB $10
    COP [A5] ( @code_09870C, #00, #00, #$1002 )
    COP [C1]
    COP [C1]
    COP [8B]
    LDY $player_actor
    LDA $000E, Y
    BIT #$2000
    BNE code_0986C9
    RTL 
}

code_0986C9 {
    COP [DA] ( #07 )
    COP [A5] ( @code_09870C, #00, #00, #$1002 )
    COP [DA] ( #0F )
    LDA #$2000
    TRB $10
    BRA code_098697
}

btDE_kara_missing_destroy {
    COP [E0]
}

widestring_0986E1 `[TPL:A][TPL:0]Kara's not here... [N][LU1:65]did she go...?[PAL:0][END]`

code_09870C {
    COP [88] ( @table_0EE000 )
    COP [80] ( #1C )
    COP [89]
    COP [E0]
}