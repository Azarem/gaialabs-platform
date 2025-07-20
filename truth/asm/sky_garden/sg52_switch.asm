

---------------------------------------------

h_sg52_switch [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_sg52_switch {
    COP [D1] ( #$012E, #01, &code_05F6F8 )

  code_05F6DA:
    COP [C1]
    COP [21] ( #01, &code_05F70E )
    COP [29] ( #03, #$0258, #$0330, &code_05F6EB )
    RTL 
}

code_05F6EB {
    COP [32] ( #2E )
    COP [33]
    COP [CD] ( #$012D )
    COP [CD] ( #$012E )
}

code_05F6F8 {
    LDY #$1090
    LDA #$0258
    STA $0014, Y
    LDA #$0330
    STA $0016, Y
    COP [10] ( #38, #32 )
    COP [C1]
    RTL 
}

code_05F70E {
    COP [BF] ( &widestring_05F71C )
    COP [C1]
    COP [21] ( #01, &code_05F71B )
    BRA code_05F6DA
}

code_05F71B {
    RTL 
}

widestring_05F71C `[DEF][LU1:61]you step on this[N]tile it makes a sound...[END]`