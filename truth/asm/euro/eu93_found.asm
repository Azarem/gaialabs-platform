

---------------------------------------------

h_eu93_found [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_eu93_found {
    COP [0B]
    COP [C0] ( &code_07E517 )
    COP [C1]
    RTL 
}

code_07E517 {
    COP [D0] ( #A6, #01, &code_07E52C )
    COP [CC] ( #A6 )
    COP [BF] ( &widestring_07E531 )
    LDA $0ADE
    INC 
    STA $0ADE
    RTL 
}

code_07E52C {
    COP [BF] ( &widestring_07E566 )
    RTL 
}

widestring_07E531 `[DEF]You [LU1:8F]it [LU2:74]I[N][LU1:E9][LU1:FE]wishes.[N][LU1:1F][LU1:97]you the power[N]at once.[END]`

widestring_07E566 `[DEF][LU1:63]go.[END]`