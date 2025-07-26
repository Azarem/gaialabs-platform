
---------------------------------------------

h_fr3C_sam [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_fr3C_sam {
    COP [D0] ( #6A, #01, &code_05C08A )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C08C )
    COP [C1]
    RTL 
}

code_05C08A {
    COP [E0]
}

code_05C08C {
    COP [BF] ( &widestring_05C094 )
    COP [CC] ( #66 )
    RTL 
}

widestring_05C094 `[DEF][TPL:5]I am Sam. [FIN]We [LU1:F2]rescued [LU2:79][N]night by a man named [N]Erik who was working [N]at the hotel. [FIN]But we [LU1:F2]caught by[N]the [LU1:AD]traders...[FIN]He's [LU1:77]held in a[N][LU2:70]on the corner of[N]a [LU1:73]street in town.[N][LU1:3B][LU1:D1]him.[PAL:0][END]`