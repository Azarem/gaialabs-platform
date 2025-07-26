
?INCLUDE 'chunk_008000'

---------------------------------------------

h_ir1F_gold_tile [
  h_actor < #00, #00, #23 >   ;00
]

---------------------------------------------

e_ir1F_gold_tile {
    COP [D0] ( #3C, #01, &code_09C40E )
    COP [BC] ( #08, #08 )

  code_09C3C8:
    COP [C1]
    COP [21] ( #01, &code_09C3EE )
    COP [20] ( #02, #01, &code_09C407 )
    COP [20] ( #03, #01, &code_09C407 )
    COP [20] ( #04, #01, &code_09C407 )
    COP [20] ( #05, #01, &code_09C407 )
    LDA $0E
    JSL $@func_00B4C5
    RTL 
}

code_09C3EE {
    COP [D0] ( #0F, #01, &code_09C3FB )
    COP [BF] ( &widestring_09C410 )
    COP [CC] ( #0F )
}

code_09C3FB {
    COP [C1]
    COP [21] ( #01, &code_09C407 )
    COP [C4] ( @code_09C3C8 )
}

code_09C407 {
    LDA $0E
    JSL $@func_00B4BE
    RTL 
}

code_09C40E {
    COP [E0]
}

widestring_09C410 `[DEF]Stepping on a gold [N]tile emits a sound. [FIN]There are[N]four gold tiles. [FIN]Stand on each of the[N]four tiles at the same[N]time. [END]`