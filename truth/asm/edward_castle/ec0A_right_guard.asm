?INCLUDE 'hidden_red_jewel'


---------------------------------------------

h_ec0A_right_guard [
  h_actor < #1C, #00, #10 >   ;00
]

---------------------------------------------

e_ec0A_right_guard {
    COP [D0] ( #21, #01, &code_04C1F4 )
    COP [C0] ( &code_04C1FF )
    COP [85] ( #20, #07, #12 )
    COP [8A]
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [85] ( #21, #1B, #11 )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [C0] ( &code_04C204 )
    COP [C1]
    RTL 
}

code_04C1F4 {
    COP [25] ( #38, #29 )
    COP [C0] ( &code_04C224 )
    COP [C1]
    RTL 
}

code_04C1FF {
    COP [BF] ( &widestring_04C229 )
    RTL 
}

code_04C204 {
    COP [D0] ( #D8, #01, &code_04C21F )
    COP [BF] ( &widestring_04C271 )
    COP [D4] ( #01, &code_04C21B )
    COP [BF] ( &widestring_04C299 )
    COP [CC] ( #D8 )
    RTL 
}

code_04C21B {
    JML $@code_00C6A1
}

code_04C21F {
    COP [BF] ( &widestring_04C2C2 )
    RTL 
}

code_04C224 {
    COP [BF] ( &widestring_04C2E9 )
    RTL 
}

widestring_04C229 `[TPL:B]This is [LU1:27]Edward's[N]castle. Be courteous[N]and [LU1:A4][LU1:D7]the King[N]is [LU1:ED]strict.[END]`

widestring_04C271 `[TPL:9][LU1:D]raise [LU1:FE]voice.[N]And mind [LU1:FE]manners.[FIN]`

widestring_04C299 `In exchange, I [LU1:EF]give[N]you one Red Jewel.[END]`

widestring_04C2C2 `[TPL:9][LU1:D]raise [LU1:FE]voice.[N]And mind [LU1:FE]manners.[END]`

widestring_04C2E9 `[TPL:8]Zzzzzz...Zzzzzz...[END]`