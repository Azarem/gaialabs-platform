?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'pr_thinkers'

!M7SEL                          211A

---------------------------------------------

h_pr8D_prologue2 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_pr8D_prologue2 {
    SEP #$20
    STZ $M7SEL
    REP #$20
    COP [50] ( @palette_1E1935, #00, #00, #20 )
    COP [D1] ( #$017C, #01, &code_0BCB8A )
    COP [CD] ( #$017C )
    COP [9A] ( @code_0BCC2B, #$2800 )
    COP [A0] ( @code_0BCF8F, #$0020, #$0050, #$2000 )
    LDA #$&spritestring_0BD0B2
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCB8A {
    COP [D1] ( #$017D, #01, &code_0BCBB4 )
    COP [CD] ( #$017D )
    COP [9A] ( @code_0BCC5B, #$2800 )
    COP [A0] ( @code_0BCF8F, #$0064, #$0058, #$2000 )
    LDA #$&spritestring_0BD0E3
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCBB4 {
    COP [D1] ( #$017E, #01, &code_0BCBDE )
    COP [CD] ( #$017E )
    COP [9A] ( @code_0BCC85, #$2800 )
    COP [A0] ( @code_0BCF8F, #$0038, #$007C, #$2000 )
    LDA #$&spritestring_0BD11C
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCBDE {
    COP [D1] ( #$017F, #01, &code_0BCC08 )
    COP [CD] ( #$017F )
    COP [9A] ( @code_0BCCAE, #$2800 )
    COP [A0] ( @code_0BCF8F, #$0040, #$0020, #$2000 )
    LDA #$&spritestring_0BD144
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCC08 {
    COP [9A] ( @code_0BCCD7, #$2800 )
    COP [CF] ( #$017C )
    COP [A0] ( @code_0BCF8F, #$0038, #$0050, #$2000 )
    LDA #$&spritestring_0BD189
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [E0]
}

code_0BCC2B {
    JSR $&sub_0BCD26
    COP [C1]
    LDA $0036
    AND #$0003
    BNE code_0BCC3E
    DEC $00CA
    DEC $06BE
}

code_0BCC3E {
    DEC $00C2
    DEC $00C8
    LDA $00C2
    CMP #$00E0
    BEQ code_0BCC55
    CMP #$008B
    BCC code_0BCC52
    RTL 
}

code_0BCC52 {
    JMP $&code_0BCCF5
}

code_0BCC55 {
    COP [3C] ( @e_pr_thinker_0BD039 )
    RTL 
}

code_0BCC5B {
    JSR $&sub_0BCD26
    COP [C1]
    LDA $0036
    AND #$0003
    BNE code_0BCC6E
    INC $00CA
    INC $06BE
}

code_0BCC6E {
    DEC $00C2
    DEC $00C8
    LDA $00C2
    CMP #$00E0
    BEQ code_0BCC55
    CMP #$008B
    BCC code_0BCC82
    RTL 
}

code_0BCC82 {
    JMP $&code_0BCCF5
}

code_0BCC85 {
    JSR $&sub_0BCD26
    COP [C1]
    LDA $0036
    AND #$0003
    BNE code_0BCC98
    INC $00CC
    INC $06C2
}

code_0BCC98 {
    DEC $00C2
    DEC $00C8
    LDA $00C2
    CMP #$00E0
    BEQ code_0BCC55
    CMP #$008B
    BCC code_0BCCAC
    RTL 
}

code_0BCCAC {
    BRA code_0BCCF5
}

code_0BCCAE {
    JSR $&sub_0BCD26
    COP [C1]
    LDA $0036
    AND #$0003
    BNE code_0BCCC1
    DEC $00CC
    DEC $06C2
}

code_0BCCC1 {
    DEC $00C2
    DEC $00C8
    LDA $00C2
    CMP #$00E0
    BEQ code_0BCC55
    CMP #$008B
    BCC code_0BCCD5
    RTL 
}

code_0BCCD5 {
    BRA code_0BCCF5
}

code_0BCCD7 {
    JSR $&sub_0BCD26
    COP [C1]
    DEC $00C2
    DEC $00C8
    LDA $00C2
    CMP #$0050
    BNE code_0BCCED
    JMP $&code_0BCC55
}

code_0BCCED {
    CMP #$0000
    BEQ code_0BCCF3
    RTL 
}

code_0BCCF3 {
    BRA code_0BCCF5
}

code_0BCCF5 {
    COP [D1] ( #$017C, #00, &code_0BCD14 )
    LDA #$0200
    STA $064A
    LDA #$0001
    STA $0648
    COP [26] ( #8D, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

code_0BCD14 {
    LDA #$0804
    STA $064A
    COP [26] ( #8E, #$0000, #$0000, #00, #$1100 )
    COP [E0]
}

---------------------------------------------

sub_0BCD26 {
    LDA #$0200
    STA $00C2
    LDA #$0200
    STA $00C8
    LDA #$0200
    STA $00CA
    LDA #$0200
    STA $00CC
    LDA #$0180
    STA $06BE
    LDA #$0180
    STA $06C2
    RTS 
}

---------------------------------------------

spritestring_0BD0B2 ~As time passed,[N]many legends [N]began to surface. ~

---------------------------------------------

spritestring_0BD0E3 ~A legend from each[N]ruin,[N]a legend from each[N]culture.... ~

---------------------------------------------

spritestring_0BD11C ~Various relics[N]were found in the[N]ruins.~

---------------------------------------------

spritestring_0BD144 ~One of the[N]legends told of[N]strange statues[N]in the shapes of[N]spirits.~

---------------------------------------------

spritestring_0BD189 ~What was a spirit to[N]ancient people...[N]The ruins [N]don't tell us.~