?INCLUDE 'actor_00E98B'
?INCLUDE 'gs2B_actor_058027'


---------------------------------------------

e_sg55_actor_0AD000 {
    COP [9A] ( @e_actor_00E98B, #$2800 )
    LDA #$0201
    STA $0014, Y
    LDA #$0000
    STA $0016, Y
    LDA $24
    STA $7F0010, X
    COP [DA] ( #02 )
    COP [63] ( #00, #09, #00 )
    COP [C2]
    COP [64]
    LDA $7F002E, X
    LDY $04
    STA $0016, Y
    CMP #$000C
    BCS code_0AD034
    RTL 
}

code_0AD034 {
    COP [9C] ( @code_05F859, #$2B00 )
    COP [CA] ( #04 )
    COP [23]
    COP [9C] ( @code_0AD07A, #$0B01 )
    LDA $0410
    AND #$0033
    STA $08
    COP [CB]
    COP [9C] ( @code_0AD060, #$0B02 )
    COP [23]
    AND #$0070
    STA $08
    RTL 
}

code_0AD060 {
    JSR $&sub_0AD0A5
    INC 
    INC 
    ASL 
    STA $7F001A, X
    COP [B6] ( #30 )

  code_0AD06D:
    COP [B1]
    COP [80] ( #06 )
    COP [89]
    LDA $16
    BPL code_0AD06D
    COP [E0]
}

code_0AD07A {
    JSR $&sub_0AD0A5
    ASL 
    STA $7F001A, X
    COP [B6] ( #20 )
    LDA $0036
    LSR 
    BCS code_0AD098

  code_0AD08B:
    COP [B1]
    COP [80] ( #07 )
    COP [89]
    LDA $16
    BPL code_0AD08B
    COP [E0]
}

code_0AD098 {
    COP [B1]
    COP [80] ( #08 )
    COP [89]
    LDA $16
    BPL code_0AD098
    COP [E0]
}

---------------------------------------------

sub_0AD0A5 {
    LDA #$0000
    STA $7F0018, X
    LDA $068E
    CLC 
    ADC #$00FF
    STA $16
    LDA $068A
    CLC 
    ADC #$0080
    STA $14
    COP [23]
    SEC 
    SBC #$0080
    CLC 
    ADC $14
    STA $14
    LDA $0410
    AND #$0003
    BNE code_0AD0D4
    LDA #$0003
}

code_0AD0D4 {
    RTS 
}