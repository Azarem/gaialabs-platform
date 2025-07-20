?INCLUDE 'actor_00E4DB'
?INCLUDE 'dm_func_0ADB6B'

!player_actor                   09AA

---------------------------------------------

func_0ADB45_noref {
    COP [5B] ( #$0010 )
    COP [C8] ( &code_0ADC25 )
    LDA $player_actor
    STA $24
    LDA #$0008
    STA $0028, X
    LDA #$0002
    STA $7F0014, X
    SEP #$20
    LDA #$^e_actor_00E4DB
    PHA 
    REP #$20
    LDA #$&e_actor_00E4DB-1
    PHA 
    RTL 
}