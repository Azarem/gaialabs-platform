?INCLUDE 'sg4D_dynapede'
?INCLUDE 'func_00DB8A'
?INCLUDE 'func_00DF15'
?INCLUDE 'table_0EE000'


---------------------------------------------

h_sg4E_nitropede1 [
  h_actor < #25, #00, #00 >   ;00
]

---------------------------------------------

e_sg4E_nitropede1 {
    COP [B7] ( #04 )
    LDA #$0180
    TSB $12
    COP [57] ( @func_0ACB92 )
    JSR $&sub_0ACB7C

  code_0AC829:
    COP [27] ( #0F )
    JMP $&code_0AC848
}

---------------------------------------------

h_sg4E_nitropede2 [
  h_actor < #23, #00, #00 >   ;00
]

---------------------------------------------

e_sg4E_nitropede2 {
    COP [B7] ( #04 )
    LDA #$0180
    TSB $12
    COP [57] ( @func_0ACB92 )
    JSR $&sub_0ACB87

  code_0AC842:
    COP [27] ( #0F )
    JMP $&code_0ACA4B
}

code_0AC848 {
    LDA $10
    BIT #$4000
    BNE code_0AC829
    COP [C6] ( &code_0AC848 )
    COP [80] ( #25 )
    COP [89]
    BRA code_0AC863
}

---------------------------------------------

func_0AC85A {
    COP [C6] ( &func_0AC85A )
    COP [80] ( #25 )
    COP [89]
}

code_0AC863 {
    COP [2A] ( #$0020, &code_0ACB41, &code_0AC86D, &code_0ACB61 )
}

code_0AC86D {
    COP [C2]
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AC87D )
}

code_list_0AC87D [
  &code_0AC881   ;00
  &code_0AC94F   ;01
]

code_0AC881 {
    COP [23]
    LSR 
    BCC code_0AC8E9
    COP [14] ( #FE, #FC, &code_0AC8D1 )
    COP [C2]
    COP [14] ( #FF, #FC, &code_0AC8D1 )
    COP [C2]
    COP [14] ( #00, #FC, &code_0AC8D1 )
    COP [C2]
    COP [14] ( #01, #FC, &code_0AC8D1 )
    COP [C2]
    COP [14] ( #02, #FC, &code_0AC8D1 )
    COP [C2]
    COP [80] ( #2F )
    COP [89]
    LDA #$2000
    TRB $12
    LDA #$0300
    TSB $10
    COP [86] ( #30, #19, #50 )
    COP [8A]
    LDA #$0300
    TRB $10
    COP [80] ( #39 )
    COP [89]
    JMP $&code_0AC848
}

code_0AC8D1 {
    COP [15] ( &code_0ACA38 )
    COP [14] ( #00, #FE, &code_0ACA38 )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0ACA60 )
    JMP $&code_0ACAF3
}

code_0AC8E9 {
    COP [15] ( &code_0AC904 )
    COP [14] ( #00, #FE, &code_0AC904 )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0ACA60 )
    JSR $&sub_0ACB87
    JMP $&code_0ACAF3
}

code_0AC904 {
    COP [14] ( #FE, #FC, &code_0ACA38 )
    COP [C2]
    COP [14] ( #FF, #FC, &code_0ACA38 )
    COP [C2]
    COP [14] ( #00, #FC, &code_0ACA38 )
    COP [C2]
    COP [14] ( #01, #FC, &code_0ACA38 )
    COP [C2]
    COP [14] ( #02, #FC, &code_0ACA38 )
    COP [C2]
    COP [80] ( #2F )
    COP [89]
    LDA #$2000
    TRB $12
    LDA #$0300
    TSB $10
    COP [86] ( #30, #19, #50 )
    COP [8A]
    LDA #$0300
    TRB $10
    COP [80] ( #39 )
    COP [89]
    JMP $&code_0AC848
}

code_0AC94F {
    COP [23]
    LSR 
    BCC code_0AC9C6
    COP [14] ( #FE, #04, &code_0AC99F )
    COP [C2]
    COP [14] ( #FF, #04, &code_0AC99F )
    COP [C2]
    COP [14] ( #00, #04, &code_0AC99F )
    COP [C2]
    COP [14] ( #01, #04, &code_0AC99F )
    COP [C2]
    COP [14] ( #02, #04, &code_0AC99F )
    COP [C2]
    COP [80] ( #2F )
    COP [89]
    LDA #$2000
    TRB $12
    LDA #$0300
    TSB $10
    COP [86] ( #30, #1A, #4F )
    COP [8A]
    LDA #$0300
    TRB $10
    COP [80] ( #39 )
    COP [89]
    JMP $&func_0AC85A
}

code_0AC99F {
    COP [15] ( &code_0ACA38 )
    COP [14] ( #00, #FE, &code_0ACA38 )
    COP [C2]
    COP [16] ( &code_0ACA38 )
    COP [14] ( #00, #02, &code_0ACA38 )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0ACA4B )
    JSR $&sub_0ACB87
    JMP $&code_0ACB1C
}

code_0AC9C6 {
    COP [15] ( &code_0AC9ED )
    COP [14] ( #00, #FE, &code_0AC9ED )
    COP [C2]
    COP [16] ( &code_0AC9ED )
    COP [14] ( #00, #02, &code_0AC9ED )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0ACA4B )
    JSR $&sub_0ACB87
    JMP $&code_0ACB1C
}

code_0AC9ED {
    COP [14] ( #FE, #04, &code_0ACA38 )
    COP [C2]
    COP [14] ( #FF, #04, &code_0ACA38 )
    COP [C2]
    COP [14] ( #00, #04, &code_0ACA38 )
    COP [C2]
    COP [14] ( #01, #04, &code_0ACA38 )
    COP [C2]
    COP [14] ( #02, #04, &code_0ACA38 )
    COP [C2]
    COP [80] ( #2F )
    COP [89]
    LDA #$2000
    TRB $12
    LDA #$0300
    TSB $10
    COP [86] ( #30, #1A, #4F )
    COP [8A]
    LDA #$0300
    TRB $10
    COP [80] ( #39 )
    COP [89]
    JMP $&func_0AC85A
}

code_0ACA38 {
    COP [23]
    LSR 
    BCS code_0ACA44
    COP [C6] ( &code_0AC848 )
    JMP $&code_0ACB41
}

code_0ACA44 {
    COP [C6] ( &func_0AC85A )
    JMP $&code_0ACB61
}

code_0ACA4B {
    LDA $10
    BIT #$4000
    BEQ code_0ACA55
    JMP $&code_0AC842
}

code_0ACA55 {
    COP [C6] ( &code_0ACA4B )
    COP [80] ( #23 )
    COP [89]
    BRA code_0ACA69
}

code_0ACA60 {
    COP [C6] ( &code_0ACA60 )
    COP [80] ( #24 )
    COP [89]
}

code_0ACA69 {
    COP [2B] ( #$0020, &code_0ACAF3, &code_0ACA73, &code_0ACB1C )
}

code_0ACA73 {
    COP [C2]
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0ACA83 )
}

code_list_0ACA83 [
  &code_0ACAA6   ;00
  &code_0ACA87   ;01
]

code_0ACA87 {
    COP [C6] ( &code_0ACA87 )
    COP [18] ( &code_0ACACF )
    COP [14] ( #02, #00, &code_0ACACF )
    COP [C2]
    COP [80] ( #38 )
    COP [89]
    COP [C6] ( &func_0AC85A )
    JSR $&sub_0ACB7C
    JMP $&code_0ACB61
}

code_0ACAA6 {
    COP [C6] ( &code_0ACAA6 )
    COP [18] ( &code_0ACAE1 )
    COP [14] ( #02, #00, &code_0ACAE1 )
    COP [C2]
    COP [17] ( &code_0ACAE1 )
    COP [14] ( #FE, #00, &code_0ACAE1 )
    COP [80] ( #38 )
    COP [89]
    COP [C6] ( &code_0AC848 )
    JSR $&sub_0ACB7C
    JMP $&code_0ACB41
}

code_0ACACF {
    COP [C2]
    COP [16] ( &code_0ACAE1 )
    COP [14] ( #00, #02, &code_0ACAE1 )
    COP [C8] ( &code_0ACB1C )
    BRA code_0ACA87
}

code_0ACAE1 {
    COP [C2]
    COP [15] ( &code_0ACACF )
    COP [14] ( #00, #FE, &code_0ACACF )
    COP [C8] ( &code_0ACAF3 )
    BRA code_0ACAA6
}

code_0ACAF3 {
    COP [14] ( #00, #FE, &code_0ACA73 )
    COP [C2]
    COP [14] ( #00, #FD, &code_0ACA73 )
    COP [8D] ( #2A )
    LDA #$2000
    TSB $12
    COP [C1]
    COP [8C] ( #04 )
    COP [AB] ( #3F )
    COP [C1]
    COP [89]
    LDA #$2000
    TRB $12
    COP [C5]
}

code_0ACB1C {
    COP [16] ( &code_0ACA73 )
    COP [C2]
    COP [14] ( #00, #02, &code_0ACA73 )
    COP [8D] ( #29 )
    LDA #$2000
    TRB $12
    COP [AB] ( #3F )
    COP [C1]
    COP [8C] ( #08 )
    COP [AB] ( #00 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0ACB41 {
    COP [14] ( #FE, #00, &code_0AC86D )
    COP [C2]
    COP [14] ( #FD, #00, &code_0AC86D )
    LDA #$4000
    TSB $12
    COP [81] ( #2B, #3E )
    COP [89]
    LDA #$4000
    TRB $12
    COP [C5]
}

code_0ACB61 {
    COP [14] ( #02, #00, &code_0AC86D )
    COP [C2]
    COP [14] ( #03, #00, &code_0AC86D )
    LDA #$4000
    TRB $12
    COP [81] ( #2B, #3E )
    COP [89]
    COP [C5]
}

---------------------------------------------

sub_0ACB7C {
    LDA #$1818
    STA $20
    LDA #$0610
    STA $22
    RTS 
}

---------------------------------------------

sub_0ACB87 {
    LDA #$0908
    STA $20
    LDA #$131E
    STA $22
    RTS 
}

---------------------------------------------

func_0ACB92 {
    COP [C1]
    COP [89]
    PHX 
    LDA $28
    AND #$00FF
    SEC 
    SBC #$0023
    TAX 
    LDA $@binary_0AC79A, X
    AND #$00FF
    PLX 
    CMP #$0001
    BEQ code_0ACBB6
    COP [84] ( #33, #04 )
    COP [8A]
    BRA code_0ACBBC
}

code_0ACBB6 {
    COP [84] ( #34, #04 )
    COP [8A]
}

code_0ACBBC {
    LDA #$6000
    TRB $12
    COP [08] ( #$0505 )
    COP [CA] ( #07 )
    COP [9C] ( @code_0ACC20, #$2302 )
    COP [DA] ( #01 )
    COP [CB]
    COP [9C] ( @code_0ACBE0, #$2000 )
    COP [C7] ( @func_00DB8A )
}

code_0ACBE0 {
    COP [80] ( #2E )
    COP [89]
    COP [CA] ( #07 )
    COP [DA] ( #01 )
    COP [9C] ( @code_0ACC74, #$2302 )
    LDY $06
    COP [23]
    STA $0000
    AND #$00F0
    SEC 
    SBC #$0080
    ORA #$0008
    CLC 
    ADC $14
    STA $0014, Y
    LDA $0000
    AND #$0070
    SEC 
    SBC #$0030
    CLC 
    ADC $16
    STA $0016, Y
    COP [DA] ( #13 )
    COP [CB]
    COP [E0]
}

code_0ACC20 {
    COP [23]
    AND #$001F
    SEC 
    SBC #$0010
    CLC 
    ADC $14
    STA $14
    COP [B7] ( #00 )
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [C2]
    COP [B7] ( #04 )
    LDA #$2000
    TRB $10
    COP [80] ( #2E )
    COP [89]
    PHX 
    LDX $04
    LDA #$0007
    SEC 
    SBC $7F0014, X
    PLX 
    STA $7F0018, X
    LDA #$0000
    STA $7F001A, X
    COP [B1]
    COP [63] ( #0A, #09, #01 )

  code_0ACC67:
    COP [C2]
    COP [64]
    LDA $10
    BIT #$4000
    BEQ code_0ACC67
    COP [E0]
}

code_0ACC74 {
    COP [A2] ( @code_0ACCC2, #$0301 )
    COP [C2]
    LDA #$2000
    TRB $10
    COP [07] ( #13 )
    LDA $16
    STA $7F0010, X
    LDA $06C2
    SEC 
    SBC #$0100
    STA $16
    COP [AB] ( #0F )
    COP [B6] ( #30 )
    COP [C1]
    LDA $16
    BPL code_0ACCA1
    RTL 
}

code_0ACCA1 {
    CMP $7F0010, X
    BCS code_0ACCA8
    RTL 
}

code_0ACCA8 {
    COP [AB] ( #00 )
    LDA #$0102
    TRB $10
    COP [07] ( #06 )
    COP [B7] ( #00 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #01 )
    COP [89]
    COP [E0]
}

code_0ACCC2 {
    COP [13] ( &code_0ACCD2 )
    COP [88] ( @table_0EE000 )

  code_0ACCCB:
    COP [80] ( #31 )
    COP [89]
    BRA code_0ACCCB
}

code_0ACCD2 {
    COP [E0]
}