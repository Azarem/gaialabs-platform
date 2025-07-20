?INCLUDE 'table_0EE000'

!player_actor                   09AA

---------------------------------------------

e_py_actor_08B6F4 {
    LDY $player_actor
    LDA $0014, Y
    STA $14
    LDA $0016, Y
    STA $16
    COP [88] ( @table_0EE000 )
    COP [80] ( #1C )
    COP [89]
    COP [E0]
}