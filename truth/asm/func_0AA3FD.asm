
?INCLUDE 'stats_01ABF0'

---------------------------------------------

func_0AA3FD {
    LDA #$0030
    TSB $12
    LDA $7F002A, X
    ORA #$0080
    STA $7F002A, X
    LDA #$&stats_01ABF0
    STA $7F0020, X
    LDA #$0001
    STA $7F0026, X
    RTL 
}