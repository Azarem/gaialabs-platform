
!player_actor                   09AA

---------------------------------------------

h_ec0B_guard [
  h_actor < #1B, #00, #10 >   ;00
]

---------------------------------------------

e_ec0B_guard {
    COP [D0] ( #42, #00, &code_04DC26 )
    COP [12] ( #09, #17 )
}

code_04DC26 {
    COP [D0] ( #43, #00, &code_04DC30 )
    COP [12] ( #14, #17 )
}

code_04DC30 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DC59 )
    COP [0B]
    COP [C1]
    COP [45] ( #0D, #12, #11, #14, &code_04DC4F )
    LDY $player_actor
    LDA #$2000
    STA $000E, Y
    RTL 
}

code_04DC4F {
    LDY $player_actor
    LDA #$3000
    STA $000E, Y
    RTL 
}

code_04DC59 {
    COP [BF] ( &widestring_04DC5E )
    RTL 
}

widestring_04DC5E `[TPL:E]I [LU1:82][LU1:BA]anyone's[N]help... I can[N]get out by myself...[END]`