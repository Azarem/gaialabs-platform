?INCLUDE 'func_06B9F2'


---------------------------------------------

h_eu9D_slaves [
  h_actor < #36, #00, #10 >   ;00
]

---------------------------------------------

e_eu9D_slaves {
    LDA #$0200
    TSB $12
    JSL $@func_06B9F2
    COP [C0] ( &code_07D0AE )
    COP [0B]
    COP [C1]
    RTL 
}

code_07D0AE {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07D0B9 )
}

code_list_07D0B9 [
  &code_07D0C3   ;00
  &code_07D0C8   ;01
  &code_07D0CD   ;02
  &code_07D0D2   ;03
  &code_07D0D7   ;04
]

code_07D0C3 {
    COP [BF] ( &widestring_07D0DC )
    RTL 
}

code_07D0C8 {
    COP [BF] ( &widestring_07D167 )
    RTL 
}

code_07D0CD {
    COP [BF] ( &widestring_07D196 )
    RTL 
}

code_07D0D2 {
    COP [BF] ( &widestring_07D1D3 )
    RTL 
}

code_07D0D7 {
    COP [BF] ( &widestring_07D207 )
    RTL 
}

widestring_07D0DC `[DEF]Near our homes, [N]various diseases are [N]increasing... [FIN]Terrible diseases[N][LU1:D7][LU2:B9][LU1:FE]body[N]to stone...[FIN]Though I'm a laborer,[N]I'm [LU1:93]to run away...[END]`

widestring_07D167 `[DEF]I miss speaking my own[N][LU2:7B]But [LU1:1F][N][LU1:98]to fight...[END]`

widestring_07D196 `[DEF]Those skeletons over[N][LU1:D9]are our friends.[N]It was by orders...[END]`

widestring_07D1D3 `[DEF]We learned the language[N][LU2:74]We can be sold[N][LU2:A9]else...[END]`

widestring_07D207 `[DEF]I speak [LU2:89]a little[N]of the [LU2:7B]We[N][LU1:80][LU1:8E]far away...[END]`