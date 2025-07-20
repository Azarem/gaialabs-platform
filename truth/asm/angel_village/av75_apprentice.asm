
!player_speed_ns                09B4

---------------------------------------------

h_av75_apprentice [
  h_actor < #04, #00, #10 >   ;00
]

---------------------------------------------

e_av75_apprentice {
    COP [45] ( #70, #00, #80, #10, &code_06DC5D )
    BRA code_06DC66
}

code_06DC5D {
    COP [CC] ( #00 )
    LDA #$FFFF
    STA $player_speed_ns
}

code_06DC66 {
    LDA $0AA6
    LSR 
    CMP #$0001
    BNE code_06DC75
    COP [25] ( #3A, #1D )
    BRA code_06DC89
}

code_06DC75 {
    CMP #$0002
    BNE code_06DC80
    COP [25] ( #57, #1D )
    BRA code_06DC89
}

code_06DC80 {
    CMP #$0003
    BNE code_06DC89
    COP [25] ( #00, #71 )
}

code_06DC89 {
    COP [0B]
    COP [C0] ( &code_06DC92 )
    COP [C1]
    RTL 
}

code_06DC92 {
    COP [BF] ( &widestring_06DC97 )
    RTL 
}

widestring_06DC97 `[TPL:B][LU2:17]apprentice:[N][LU1:61]you solve the[N]puzzle of the room[N]you may pass.[END]`