
!player_actor                   09AA
!MEMSEL                         420D

---------------------------------------------

h_actor_09BA80 [
  h_actor < #00, #00, #03 >   ;00
]

---------------------------------------------

e_actor_09BA80 {
    LDA #$0013
    STA $0ACA
    STA $0ACE
    LDA #$0020
    STA $0ADE
    INC 
    STA $0ADC
    SEP #$20
    LDA #$01
    STA $MEMSEL
    REP #$20
    LDA #$0002
    STA $0AD4
    LDA #$00FF
    STA $0AA2
    LDY $player_actor
    LDA #$0200
    ORA $0010, Y
    STA $0010, Y
    LDA #$0000
    STA $28

  code_09BABC:
    COP [C1]
    COP [8B]
    LDA $0656
    BIT #$0080
    BNE code_09BAC9
    RTL 
}

code_09BAC9 {
    LDA $28
    INC 
    CMP #$0042
    BCC code_09BAD4
    LDA #$0000
}

code_09BAD4 {
    STA $28
    STZ $2A
    LDA #$0080
    TSB $0658
    COP [C2]
    BRA code_09BABC
    RTL 
}