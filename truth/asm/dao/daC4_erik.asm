
---------------------------------------------

h_daC4_erik [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_daC4_erik {
    COP [D0] ( #D2, #01, &code_08A579 )
    COP [0B]
    COP [C0] ( &code_08A57B )
    COP [C1]
    RTL 
}

code_08A579 {
    COP [E0]
}

code_08A57B {
    COP [BF] ( &widestring_08A580 )
    RTL 
}

widestring_08A580 `[TPL:A][TPL:3]Erik: [N]I [LU1:78]go [LU1:BF]in [N]a sandstorm [LU1:A5]this.[PAL:0][END]`