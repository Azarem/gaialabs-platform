

---------------------------------------------

h_gs2D_kara [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_gs2D_kara {
    COP [0B]
    COP [C0] ( &code_058C17 )
    COP [D2] ( #02, #01 )
    COP [C0] ( &code_058C1C )
    COP [C1]
    RTL 
}

code_058C17 {
    COP [BF] ( &widestring_058C21 )
    RTL 
}

code_058C1C {
    COP [BF] ( &widestring_058C8F )
    RTL 
}

widestring_058C21 `[TPL:A][TPL:1][LU1:25]They perished [N][LU1:FD]for the [N]King's return... [FIN]I [LU1:78]stand anything[N][LU1:D7]disrupts people's[N]peaceful lives....[PAL:0][END]`

widestring_058C8F `[TPL:B][TPL:1][LU1:25][N][LU1:62]. . . ?[PAL:0][END]`