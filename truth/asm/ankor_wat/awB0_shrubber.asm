
---------------------------------------------

h_awB0_shrubber1 [
  h_actor < #0A, #00, #01 >   ;00
]

---------------------------------------------

e_awB0_shrubber1 {
    LDA #$0018
    TSB $12
    COP [5B] ( #$0008 )
    COP [58] ( &code_0BB1C9 )
    COP [0B]
    COP [C1]
    RTL 
}

code_0BB1C9 {
    COP [0C]
    LDA #$0100
    TRB $10
    LDA #$0110
    TRB $12
    BRA code_0BB1E9
}

---------------------------------------------

h_awB0_shrubber2 [
  h_actor < #0A, #00, #00 >   ;00
]

---------------------------------------------

e_awB0_shrubber2 {
    COP [80] ( #0A )
    COP [89]
    COP [27] ( #15 )
    COP [21] ( #05, &code_0BB1E9 )
    BRA e_awB0_shrubber2
}

code_0BB1E9 {
    COP [80] ( #0B )
    COP [89]
    COP [80] ( #0C )
    COP [89]
    COP [2C] ( &code_0BB1F9, &code_0BB237 )
}

code_0BB1F9 {
    COP [2A] ( #$0000, &code_0BB203, &code_0BB203, &code_0BB218 )
}

code_0BB203 {
    COP [17] ( &code_0BB20F )
    COP [81] ( #0E, #04 )
    COP [89]
    BRA code_0BB203
}

code_0BB20F {
    COP [83] ( #0B, #4B, #49 )
    COP [89]
    BRA e_awB0_shrubber2
}

code_0BB218 {
    COP [18] ( &code_0BB224 )
    COP [81] ( #0E, #03 )
    COP [89]
    BRA code_0BB218
}

code_0BB224 {
    LDA #$4000
    TSB $12
    COP [83] ( #0B, #4B, #49 )
    COP [89]
    LDA #$4000
    TRB $12
    BRA e_awB0_shrubber2
}

code_0BB237 {
    COP [2B] ( #$0000, &code_0BB241, &code_0BB241, &code_0BB256 )
}

code_0BB241 {
    COP [15] ( &code_0BB24D )
    COP [82] ( #0D, #04 )
    COP [89]
    BRA code_0BB241
}

code_0BB24D {
    COP [82] ( #0B, #4B )
    COP [89]
    JMP $&e_awB0_shrubber2
}

code_0BB256 {
    COP [16] ( &code_0BB262 )
    COP [82] ( #0D, #03 )
    COP [89]
    BRA code_0BB256
}

code_0BB262 {
    LDA #$2000
    TSB $12
    COP [82] ( #0B, #4B )
    COP [89]
    LDA #$2000
    TRB $12
    JMP $&e_awB0_shrubber2
}