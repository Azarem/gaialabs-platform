

---------------------------------------------

h_fr3A_harborer [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_fr3A_harborer {
    COP [D0] ( #5A, #01, &code_05BC68 )
    COP [C0] ( &code_05BC6A )
    COP [0B]
    COP [C1]
    RTL 
}

code_05BC68 {
    COP [E0]
}

code_05BC6A {
    COP [BF] ( &widestring_05BC6F )
    RTL 
}

widestring_05BC6F `[TPL:A]There was [LU1:B9]he[N][LU1:7A]do [LU1:6B]being[N]found.[FIN]He's the laborer[N]who ran away yesterday.[FIN]I [LU1:CA][LU2:AD]the labor[N]traders.[FIN]I was prepared[N]for the worst[N][LU1:F6]I did it.[END]`