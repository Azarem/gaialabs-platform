
---------------------------------------------

func_02F06A {
    PHX 
    PHP 
    REP #$20
    LDA #$0000
    LDX #$0140
    BRA code_02F07E
}

---------------------------------------------

func_02F076 {
    PHX 
    PHP 
    REP #$20
    LDA #$0000
    TAX 
}

code_02F07E {
    STA $7F0200, X
    INX 
    INX 
    CPX #$0800
    BNE code_02F07E
    PLP 
    PLX 
    RTL 
}