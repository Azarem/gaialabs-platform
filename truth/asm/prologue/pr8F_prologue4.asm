?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'pr_thinkers'


---------------------------------------------

h_pr8F_prologue4 [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_pr8F_prologue4 {
    LDA #$4001
    TSB $09EC
    COP [50] ( @palette_1E1B35, #00, #00, #20 )
    COP [A0] ( @code_0BCF8F, #$0020, #$0020, #$2000 )
    LDA #$&spritestring_0BD222
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$010D )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #59 )
    LDA #$0804
    STA $064A
    COP [26] ( #8C, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

---------------------------------------------

spritestring_0BD222 ~Some said there[N]were traps to[N]protect the[N]treasure, others[N]said it was a[N]curse.~