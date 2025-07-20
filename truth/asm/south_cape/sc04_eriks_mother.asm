

---------------------------------------------

h_sc04_eriks_mother [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_sc04_eriks_mother {
    COP [9E] ( @code_04906E, #$0009, #$FFF8, #$1002 )
    COP [C0] ( &code_049076 )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C1]
    RTL 
}

code_04906E {
    COP [80] ( #01 )
    COP [89]
    COP [C1]
    RTL 
}

code_049076 {
    COP [BF] ( &widestring_04907B )
    RTL 
}

widestring_04907B `[DEF]Erik's mother: Don't[N]worry, I'm not on fire.[N][LU1:1D][LU1:A3]a treatment[N]for my sore body.[FIN]Cleaning [LU1:D6]big house[N]all day makes my[N]brain ache...[END]`