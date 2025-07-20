

---------------------------------------------

h_fr3C_remus [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_fr3C_remus {
    COP [D0] ( #6A, #01, &code_05BFC1 )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05BFD4 )
    COP [C1]
    RTL 
}

code_05BFC1 {
    COP [80] ( #27 )
    COP [89]
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05BFD9 )
    COP [C1]
    RTL 
}

code_05BFD4 {
    COP [BF] ( &widestring_05BFDE )
    RTL 
}

code_05BFD9 {
    COP [BF] ( &widestring_05C059 )
    RTL 
}

widestring_05BFDE `[DEF][TPL:5]I am Remus. Our game[N][LU2:5A]and we had[N][LU1:B9]to eat.[FIN]We had no choice but[N]to [LU1:71]laborers.[FIN]We [LU1:83][LU1:A4][LU1:F4]we [N][LU1:F3]be [LU2:AF]or [LU1:F7][N][LU1:F3]happen...[PAL:0][END]`

widestring_05C059 `[DEF]How can [LU1:E0]like[N][LU1:D6]happen?[END]`