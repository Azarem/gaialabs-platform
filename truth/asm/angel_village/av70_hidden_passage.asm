
!scene_current                  0644

---------------------------------------------

h_av70_hidden_passage [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_av70_hidden_passage {
    LDA $scene_current
    CMP #$0073
    BEQ code_06D5C7
    COP [D1] ( #$0143, #01, &code_06D5C5 )
    COP [C0] ( &code_06D5E5 )
    COP [D2] ( #01, #01 )
    COP [08] ( #$0F0F )
    COP [32] ( #43 )
    COP [33]
    COP [CD] ( #$0143 )
}

code_06D5C5 {
    COP [E0]
}

code_06D5C7 {
    COP [D1] ( #$0144, #01, &code_06D5E3 )
    COP [C0] ( &code_06D5E5 )
    COP [D2] ( #01, #01 )
    COP [08] ( #$0F0F )
    COP [32] ( #44 )
    COP [33]
    COP [CD] ( #$0144 )
}

code_06D5E3 {
    COP [E0]
}

code_06D5E5 {
    COP [BF] ( &widestring_06D5ED )
    COP [CC] ( #01 )
    RTL 
}

widestring_06D5ED `[TPL:9][TPL:0]The [LU2:C5]blows through[N]a crack in the wall.[FIN]I [LU1:8F]a hidden pass![PAL:0][END]`