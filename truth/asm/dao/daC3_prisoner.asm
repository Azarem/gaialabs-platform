
---------------------------------------------

h_daC3_prisoner [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_daC3_prisoner {
    COP [C0] ( &code_08AC8D )

  code_08AC56:
    COP [2A] ( #$0008, &code_08AC67, &code_08AC60, &code_08AC7A )
}

code_08AC60 {
    COP [80] ( #0A )
    COP [89]
    BRA code_08AC56
}

code_08AC67 {
    COP [14] ( #FE, #00, &code_08AC72 )
    COP [C4] ( @code_08AC56 )
}

code_08AC72 {
    COP [81] ( #0E, #12 )
    COP [89]
    BRA code_08AC56
}

code_08AC7A {
    COP [14] ( #03, #00, &code_08AC85 )
    COP [C4] ( @code_08AC56 )
}

code_08AC85 {
    COP [81] ( #0E, #11 )
    COP [89]
    BRA code_08AC56
}

code_08AC8D {
    COP [BF] ( &widestring_08AC92 )
    RTL 
}

widestring_08AC92 `[DEF][TPL:0]I [LU2:6E]he [LU1:83][N][LU1:E9][LU1:F7]I said. [N]His [LU2:60][LU1:F2][N]expressive...[PAL:0][END]`