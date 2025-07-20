?INCLUDE 'stats_01ABF0'
?INCLUDE 'func_00C7FA'


---------------------------------------------

h_sp5A_phantom_ribber [
  h_actor < #00, #00, #01 >   ;00
]

---------------------------------------------

e_sp5A_phantom_ribber {
    COP [D0] ( #70, #01, &code_068A14 )
    LDA #$00FF
    STA $7F0026, X
    LDA #$&stats_01ABF0+44
    STA $7F0020, X
    LDA #$0020
    TSB $12
    COP [58] ( &code_0689F3 )

  code_0689C3:
    COP [CA] ( #04 )
    COP [81] ( #07, #12 )
    COP [89]
    COP [81] ( #08, #12 )
    COP [89]
    COP [CB]
    COP [84] ( #00, #14 )
    COP [8A]
    COP [CA] ( #04 )
    COP [81] ( #87, #11 )
    COP [89]
    COP [81] ( #88, #11 )
    COP [89]
    COP [CB]
    COP [84] ( #00, #14 )
    COP [8A]
    BRA code_0689C3
}

code_0689F3 {
    COP [A0] ( @func_00C7FA, #$0000, #$0000, #$2800 )
    LDA #$1000
    TSB $10
    LDA #$0200
    TSB $12
    COP [C0] ( &code_068A16 )
    COP [80] ( #00 )
    COP [89]
    COP [C1]
    RTL 
}

code_068A14 {
    COP [E0]
}

code_068A16 {
    COP [BF] ( &widestring_068A1B )
    RTL 
}

widestring_068A1B `[TPL:A][TPL:0]Will: That's odd. [N][LU1:12]if I touch it [N]no damage occurs...[PAL:0][END]`