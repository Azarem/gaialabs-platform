
---------------------------------------------

h_fr36_mother [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_fr36_mother {
    COP [C0] ( &code_05BB6A )

  code_05BB4E:
    COP [85] ( #10, #07, #12 )
    COP [8A]
    COP [84] ( #0A, #06 )
    COP [8A]
    COP [85] ( #11, #07, #11 )
    COP [8A]
    COP [84] ( #0A, #06 )
    COP [8A]
    BRA code_05BB4E
}

code_05BB6A {
    COP [BF] ( &widestring_05BB6F )
    RTL 
}

widestring_05BB6F `[TPL:A]Mothers are always[N]worrying [LU1:6B]things.[FIN]I was afraid you'd been[N]kidnapped by someone, or[N]had [LU1:70]wounded...[FIN]My [LU2:85]suffered[N][LU1:A5]that.[END]`