?INCLUDE 'system_strings'

!_TM                            212C

---------------------------------------------

h_sFC_actor_0BC924 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sFC_actor_0BC924 {
    LDA #$4001
    TSB $09EC
    COP [50] ( @pal_title, #00, #00, #20 )
    COP [50] ( @palette_1E1D35, #00, #00, #08 )
    LDA #$0000
    STA $7F0A00
    COP [A0] ( @code_0BC988, #$0080, #$0050, #$1800 )
    SEP #$20
    LDA #$10
    STA $_TM
    REP #$20
    LDA #$0804
    STA $064A
    COP [DA] ( #B3 )
    COP [BD] ( @asciistring_01DA5E )
    COP [DA] ( #77 )
    COP [BD] ( @asciistring_01DA47 )
    COP [DB] ( #$09D3 )
    COP [CC] ( #F4 )
    LDA #$0804
    STA $064A
    COP [26] ( #8C, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

code_0BC988 {
    COP [B6] ( #10 )
    COP [84] ( #00, #F0 )
    COP [8A]
    COP [85] ( #00, #40, #02 )
    COP [8A]
    COP [DA] ( #3B )
    SEP #$20
    LDA #$16
    STA $_TM
    REP #$20
    COP [C1]
    RTL 
}

---------------------------------------------

func_0BC9A7_noref {
    COP [37] ( #2D )
    COP [39]
    COP [E0]
}