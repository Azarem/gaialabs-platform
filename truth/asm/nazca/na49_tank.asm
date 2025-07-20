?INCLUDE 'table_0EE000'


---------------------------------------------

h_na49_tank [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_na49_tank {
    COP [88] ( @table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    COP [C0] ( &code_05E319 )
    COP [C1]
    RTL 
}

code_05E319 {
    COP [BF] ( &widestring_05E327 )
    LDA $0AA6
    ORA #$0001
    STA $0AA6
    RTL 
}

widestring_05E327 `[TPL:B][TPL:6][LU1:36][N]That's an oxygen tank. [N]There's air inside. [FIN][LU2:40][LU1:D6]you can [N]breathe underwater, but [N][LU1:DB][LU2:89]one minute's [N]worth of air inside. [FIN]Compressing the air [N][LU1:F3]let you stay [N][LU1:EB]longer, but [N]I [LU1:82][LU1:A4]how to do it.[PAL:0][END]`