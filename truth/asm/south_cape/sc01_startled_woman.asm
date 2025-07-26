
---------------------------------------------

h_sc01_startled_woman [
  h_actor < #14, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_startled_woman {
    COP [C0] ( &code_0487BA )
    COP [0B]
    COP [C1]
    COP [28] ( #$02A8, #$01C8, &code_048776 )
    RTL 
}

code_048776 {
    COP [0C]
    COP [25] ( #28, #25 )
    COP [85] ( #19, #01, #11 )
    COP [8A]
    COP [C1]
    COP [28] ( #$02A8, #$0250, &code_04878E )
    RTL 
}

code_04878E {
    COP [C3] ( @code_048795, #$0010 )
}

code_048795 {
    COP [BF] ( &widestring_0487BF )
    COP [C0] ( &code_0487B5 )
    COP [85] ( #18, #04, #12 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [0B]
    COP [C1]
    RTL 
    COP [BF] ( &widestring_0487BF )
    RTL 
}

code_0487B5 {
    COP [BF] ( &widestring_0487F1 )
    RTL 
}

code_0487BA {
    COP [BF] ( &widestring_0487F5 )
    RTL 
}

widestring_0487BF `[DEF]Oh, no![FIN][::][LU1:62]are you doing![N]This child![N]Honestly...[END]`

widestring_0487F1 `[DEF][JMP:&widestring_0487BF+M]`

widestring_0487F5 `[DEF]I envy you [LU1:F6]I see [N]the sea breeze blowing [N][LU1:FE]hair [LU1:A5]that... [FIN]Not [LU1:A5]mine,[N][LU1:EA][LU1:D6]scarf.... [END]`