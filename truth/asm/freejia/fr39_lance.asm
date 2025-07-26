
?INCLUDE 'chunk_008000'
?INCLUDE 'table_0EE000'

!joypad_mask_std                065A

---------------------------------------------

h_fr39_lance [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr39_lance {
    COP [0B]
    COP [C0] ( &code_05C7E7 )
    COP [D2] ( #0F, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [9C] ( @code_05CD16, #$2800 )
    COP [DA] ( #77 )
    COP [B6] ( #30 )
    COP [BF] ( &widestring_05C85E )
    COP [CE] ( #0F )
    COP [3B] ( #1C, @func_00B519 )
    COP [B6] ( #20 )
    COP [DA] ( #77 )
    COP [05] ( #02 )
    COP [DB] ( #$012B )
    COP [84] ( #04, #14 )
    COP [8A]
    COP [84] ( #02, #14 )
    COP [8A]
    COP [84] ( #05, #14 )
    COP [8A]
    COP [84] ( #02, #28 )
    COP [8A]
    COP [DB] ( #$012B )
    COP [BF] ( &widestring_05CA69 )
    COP [CC] ( #68 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_05C7E7 {
    COP [D0] ( #68, #01, &code_05C7F5 )
    COP [CC] ( #02 )
    COP [BF] ( &widestring_05C7FA )
    RTL 
}

code_05C7F5 {
    COP [BF] ( &widestring_05CAEC )
    RTL 
}

widestring_05C7FA `[TPL:A][TPL:4]Lance: They say I [LU1:82][N][LU1:A4]who I am. [N]Kind of strange.... [FIN]If I [LU1:82][LU1:A4]who I[N]am, how did I get here?[PAL:0][END]`

widestring_05C85E `[TPL:B][TPL:4][DLY:2]Lance: [N][LU1:62]is [LU1:D6]place? [FIN][TPL:1][LU1:25][LU1:49]I [LU1:91][N]a [LU1:A7]homesick... [FIN][TPL:3]Erik: [N]I [LU1:91][LU1:A5]I'm [LU1:73]in [N]the womb.... [FIN][TPL:2][LU1:2A]Everything[N]that's [LU1:9D]and the[N][LU1:C1][LU1:20]met are[N]pouring [LU1:A1]my head...[FIN][TPL:4]Lance: I was [LU1:C5]in [N]the [LU1:E2]of [LU1:47]Cape. [FIN][LU1:61]my [LU2:67][N][LU1:83][LU1:79][LU1:73][N][LU1:8E]an expedition... [FIN]The [LU2:88]important [LU1:E3][N]in my [LU1:B0]was gone. I [N][LU1:83][LU1:A4][LU1:F7]to do. [FIN][TPL:1][LU1:25]I couldn't [N]stand my [LU2:67]using [N][LU2:A2]to invade [N][LU1:BD]countries. [FIN][LU1:1D]awful [LU1:F6]someone[N]loses [LU1:E1]life.[FIN][LU1:62]had [LU2:AF]years[N]to put together was[N][LU2:59]in one moment.[FIN][TPL:3]Erik: I [LU1:F9]if Seth [N]is all right...? [FIN][TPL:2][LU1:2A][LU1:3D][LU1:AF]on[N]because [LU2:AB]forget[N][LU1:6B]unpleasant things.[PAL:0][END]`

widestring_05CA69 `[TPL:A][TPL:4]Lance: What? [LU1:62][LU1:98]I [N][LU1:70]doing? [LU1:64][FIN][LU1:9D]to everyone? [FIN][TPL:2][LU1:2A]Lance! [N][LU1:68]memory is back! [FIN][TPL:1][LU1:25][N]I was worried! [FIN][TPL:3]Erik: I [LU2:C2][N][LU1:F7][LU1:F3]happen.[PAL:0][END]`

widestring_05CAEC `[TPL:B][TPL:4]Lance: I [LU2:6E][LU1:89][N]was worried. I'd [LU1:E7][N][LU2:57]of [LU1:CF]in the [N][LU1:CD]situation.[PAL:0][END]`

---------------------------------------------

code_05CD16 {
    COP [9C] ( @code_05CD30, #$0B01 )
    COP [23]
    AND #$0003
    ASL 
    ASL 
    STA $08
    COP [C2]
    COP [D0] ( #0F, #01, &code_05CD16 )
    COP [E0]
}

code_05CD30 {
    COP [88] ( @table_0EE000 )
    COP [B6] ( #30 )
    LDA #$0200
    STA $16
    COP [23]
    CLC 
    ADC #$0100
    STA $14
    AND #$0003
    BEQ code_05CD6B
    DEC 
    BEQ code_05CD62
    DEC 
    BEQ code_05CD59
    COP [86] ( #02, #10, #04 )
    COP [8A]
    COP [E0]
}

code_05CD59 {
    COP [86] ( #02, #08, #08 )
    COP [8A]
    COP [E0]
}

code_05CD62 {
    COP [86] ( #02, #06, #0C )
    COP [8A]
    COP [E0]
}

code_05CD6B {
    COP [86] ( #02, #04, #10 )
    COP [8A]
    COP [E0]
}