
?INCLUDE 'player_character'

!player_actor                   09AA

---------------------------------------------

func_00C6E4 {
    PHX 
    ASL 
    TAX 
    LDA $@table_00C710, X
    LDX $player_actor
    STA $0000, X
    SEP #$20
    LDA #$^func_02C47F
    STA $0002, X
    REP #$20
    STZ $0008, X
    STZ $002C, X
    STZ $002E, X
    LDA #$0000
    STA $7F002C, X
    STA $7F002E, X
    PLX 
    RTL 
}

---------------------------------------------

table_00C710 [
  &func_02C47F   ;00
  &func_02C48F   ;01
  &func_02C49F   ;02
  &func_02C4AF   ;03
]