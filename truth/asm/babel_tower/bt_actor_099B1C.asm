?INCLUDE 'table_0EE000'


---------------------------------------------

e_bt_actor_099B1C {
    LDA #$1000
    TSB $12
    COP [88] ( @table_0EE000 )
    COP [C1]
    COP [80] ( #2C )
    COP [89]
    RTL 
}