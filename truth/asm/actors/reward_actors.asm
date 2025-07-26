
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'

!scene_current                  0644
!player_actor                   09AA

---------------------------------------------

e_hp_increase {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [8D] ( #0C )
    COP [C8] ( &func_00E110 )
    LDA $0ACA
    CLC 
    ADC #$0001
    BVC code_00E048
    LDA #$0255
}

code_00E048 {
    STA $0ACA
    SEC 
    SBC $0ACE
    STA $0B22
    COP [BF] ( &widestring_00E058 )
    COP [E0]
}

widestring_00E058 `[DEF][DLY:1][SFX:0][LU1:68]HP (Power) [N]has increased! [END]`

---------------------------------------------

e_str_increase {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [8D] ( #0D )
    COP [C8] ( &func_00E110 )
    LDA $0ADE
    CLC 
    ADC #$0001
    BVC code_00E096
    LDA #$0255
}

code_00E096 {
    STA $0ADE
    COP [BF] ( &widestring_00E09F )
    COP [E0]
}

widestring_00E09F `[DEF][DLY:1][SFX:0][LU1:68]STR (Strength) [N]has increased! [END]`

---------------------------------------------

e_def_increase {
    COP [88] ( @table_0EE000 )
    COP [B7] ( #00 )
    COP [8D] ( #0E )
    COP [C8] ( &func_00E110 )
    LDA $0ADC
    CLC 
    ADC #$0001
    BVC code_00E0E1
    LDA #$0255
}

code_00E0E1 {
    STA $0ADC
    COP [BF] ( &widestring_00E0EA )
    COP [E0]
}

widestring_00E0EA `[DEF][DLY:1][SFX:0][LU1:68]DEF (Defense) [N]has increased! [END]`

---------------------------------------------

func_00E110 {
    LDA #$6000
    TRB $12
    COP [86] ( #FF, #04, #12 )
    COP [8A]
    COP [84] ( #FF, #03 )
    COP [8A]
    LDY $player_actor
    LDA $0014, Y
    STA $7F0018, X
    LDA $0016, Y
    SEC 
    SBC #$0008
    STA $7F001A, X
    COP [52] ( #FF, #02, #FF )
    COP [53]
    LDA #$2000
    TSB $10
    LDA #$0080
    TRB $09EC
    COP [06] ( #25 )
    LDA $scene_current
    JSL $@func_00B4A1
    COP [C5]
}