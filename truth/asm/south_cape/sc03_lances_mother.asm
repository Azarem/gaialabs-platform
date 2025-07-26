
---------------------------------------------

h_sc03_lances_mother [
  h_actor < #13, #00, #10 >   ;00
]

---------------------------------------------

e_sc03_lances_mother {
    COP [C0] ( &code_048F14 )

  code_048E8B:
    COP [81] ( #18, #12 )
    COP [89]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [82] ( #17, #14 )
    COP [89]
    LDA #$01B0
    STA $16
    COP [82] ( #16, #11 )
    COP [89]
    COP [85] ( #18, #04, #12 )
    COP [8A]
    COP [86] ( #17, #03, #12 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [81] ( #18, #12 )
    COP [89]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [86] ( #16, #03, #11 )
    COP [8A]
    COP [85] ( #19, #05, #11 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    LDA #$0070
    STA $16
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [85] ( #18, #05, #12 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    JMP $&code_048E8B
}

code_048F14 {
    COP [BF] ( &widestring_048F19 )
    RTL 
}

widestring_048F19 `[DEF]Lance's mother: Your[N][LU2:67]has [LU1:70][LU2:7A]at[N]the Tower of Babel[N]for a year now...[FIN]It [LU1:CC]like[N][LU2:89]yesterday...[END]`