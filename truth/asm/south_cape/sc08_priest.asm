
!joypad_mask_std                065A

---------------------------------------------

h_sc08_priest [
  h_actor < #35, #00, #10 >   ;00
]

---------------------------------------------

e_sc08_priest {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_048AD9 )
    COP [0B]
    COP [D0] ( #10, #00, &code_048AA3 )
    COP [C1]
    RTL 
}

code_048AA3 {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0400
    STA $064A
    COP [DA] ( #1D )
    COP [BF] ( &widestring_048AE9 )
    COP [DA] ( #3B )
    COP [CA] ( #06 )
    COP [08] ( #$0909 )
    COP [C3] ( @code_048AC7, #$001E )
}

code_048AC7 {
    COP [CB]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_048C01 )
    COP [DA] ( #3B )
    COP [CC] ( #10 )
    COP [C1]
    RTL 
}

code_048AD9 {
    COP [D0] ( #21, #01, &code_048AE4 )
    COP [BF] ( &widestring_048C98 )
    RTL 
}

code_048AE4 {
    COP [BF] ( &widestring_048CDB )
    RTL 
}

widestring_048AE9 `[DLG:3,6][SIZ:D,3][TPL:0][DLY:0]My name is Will.[FIN]A year has passed since[N]I [LU2:C1]to the Tower of[N]Babel [LU1:F0]my father.[FIN]My [LU2:67]and his party[N]met [LU1:F0]disaster.[FIN]Somehow, I [LU1:B3]it[N][LU1:73]to [LU1:47]Cape...[FIN]I [LU1:D3][LU1:78]believe[N]my [LU2:67]is gone.[N][LU1:1F][LU1:BB]believe it...[FIN][LU1:61]I grow up, I'll[N]be an [LU1:8A]and[N]see the world.[FIN]Somewhere, I [LU1:EF]meet[N]my father...[END]`

widestring_048C01 `[DEF]Teacher:[N]That's all for[N]today's lesson.[FIN]You four do [LU1:FE]best[N]not to fall behind.[FIN]Demons [LU1:98]appeared[N][LU1:BF]of town. If you[N]go [LU1:ED]far, you must[N]go [LU1:F0][LU1:FE]parents.[END]`

widestring_048C98 `[DEF]Oh, Will. [N][LU1:3B]recite [LU1:F0]me.[FIN]The [LU1:F5]shines[N]on brightly[N][LU1:DC]eternity....[END]`

widestring_048CDB `[DEF][LU1:62]is it, Will? Looking[N]at [LU1:FE]face, I wonder[N]if [LU1:FF]plotting[N][LU1:C8]again....[END]`