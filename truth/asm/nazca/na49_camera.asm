
?INCLUDE 'table_0EE000'

---------------------------------------------

h_na49_camera [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_na49_camera {
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    COP [C0] ( &code_05E54E )
    COP [C1]
    RTL 
}

code_05E54E {
    COP [BF] ( &widestring_05E55C )
    LDA $0AA6
    ORA #$0008
    STA $0AA6
    RTL 
}

widestring_05E55C `[TPL:B][TPL:6]That's a camera. It will[N]burn a copy of a scene[N]onto printing paper.[FIN]The problem is [LU1:D7]it[N]takes [LU2:47]30 minutes.[FIN]Scenery [LU1:84]move,[N]but to photograph a[N]person means [LU2:AB]can't[N][LU1:B5]for 30 minutes.[FIN][LU1:61]I [LU2:BB]it, the [N][LU2:60][LU2:B3]bright red [N][LU1:A5]a rabbit's.[PAL:0][END]`