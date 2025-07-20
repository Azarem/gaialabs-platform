?INCLUDE 'actor_00E4DB'
?INCLUDE 'table_0EE000'
?INCLUDE 'func_00DB8A'
?INCLUDE 'actor_00DA78'
?INCLUDE 'func_00DF15'
?INCLUDE 'chunk_008000'
?INCLUDE 'func_00DDF2'

!player_actor                   09AA

---------------------------------------------

h_awB1_wall_walker1 [
  h_actor < #13, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_wall_walker1 {
    LDA #$0001
    STA $26
    BRA code_0BBB6B
}

---------------------------------------------

h_awB1_wall_walker2 [
  h_actor < #13, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_wall_walker2 {
    STZ $26
}

code_0BBB6B {
    LDA #$0011
    TSB $12
    COP [57] ( @code_0BBD48 )

  code_0BBB75:
    COP [58] ( &code_0BBB96 )

  code_0BBB79:
    COP [C1]
    COP [21] ( #06, &code_0BBB88 )
    COP [23]
    AND #$000F
    STA $08
    RTL 
}

code_0BBB88 {
    COP [A4] ( @code_0BBD02, #00, #E6, #$0202 )
    COP [DA] ( #77 )
    BRA code_0BBB79
}

code_0BBB96 {
    COP [80] ( #14 )
    COP [89]
    LDA $26
    BNE code_0BBBD1
    COP [9E] ( @code_0BBC04, #$0000, #$0000, #$0302 )
    JSR $&sub_0BBD81
    COP [C2]
    COP [9E] ( @code_0BBC04, #$0000, #$0000, #$0302 )
    JSR $&sub_0BBD81
    COP [C2]
    COP [9E] ( @code_0BBC04, #$0000, #$0000, #$0302 )
    COP [80] ( #2B )
    COP [89]
    BRA code_0BBB75
}

code_0BBBD1 {
    COP [9E] ( @code_0BBC86, #$0000, #$0000, #$0302 )
    JSR $&sub_0BBD81
    COP [C2]
    COP [9E] ( @code_0BBC86, #$0000, #$0000, #$0302 )
    JSR $&sub_0BBD81
    COP [C2]
    COP [9E] ( @code_0BBC86, #$0000, #$0000, #$0302 )
    COP [80] ( #2B )
    COP [89]
    JMP $&code_0BBB75
}

code_0BBC04 {
    COP [07] ( #28 )
    LDA #$00A0
    TSB $12
    COP [23]
    LSR 
    BCS code_0BBC1F
    COP [14] ( #00, #03, &code_0BBC1F )
    LDA $16
    CLC 
    ADC #$0030
    BRA code_0BBC31
}

code_0BBC1F {
    COP [14] ( #00, #02, &code_0BBD00 )
    LDA $14
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0020
}

code_0BBC31 {
    STA $7F001A, X
    LDA $14
    STA $7F0018, X
    COP [22] ( #2F, #02 )
    COP [5B] ( #$0080 )
    LDA #$0302
    TRB $10
    COP [2A] ( #$0000, &code_0BBC52, &code_0BBC52, &code_0BBC6C )
}

code_0BBC52 {
    COP [C2]
    COP [17] ( &code_0BBC6C )
    COP [80] ( #A0 )
    COP [89]
    COP [81] ( #A7, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BBC52
    COP [E0]
}

code_0BBC6C {
    COP [C2]
    COP [18] ( &code_0BBC52 )
    COP [80] ( #20 )
    COP [89]
    COP [81] ( #27, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BBC6C
    COP [E0]
}

code_0BBC86 {
    COP [07] ( #28 )
    LDA #$00A0
    TSB $12
    COP [23]
    LSR 
    BCS code_0BBCA1
    COP [14] ( #01, #02, &code_0BBCA1 )
    LDA $14
    CLC 
    ADC #$0010
    BRA code_0BBCA9
}

code_0BBCA1 {
    COP [14] ( #00, #02, &code_0BBD00 )
    LDA $14
}

code_0BBCA9 {
    STA $7F0018, X
    LDA $16
    CLC 
    ADC #$0020
    STA $7F001A, X
    COP [22] ( #2F, #02 )
    COP [5B] ( #$0080 )
    LDA #$0302
    TRB $10
    COP [2B] ( #$0000, &code_0BBCCE, &code_0BBCCE, &code_0BBCE8 )
}

code_0BBCCE {
    COP [C2]
    COP [15] ( &code_0BBCE8 )
    COP [80] ( #1F )
    COP [89]
    COP [82] ( #26, #04 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BBCCE
    COP [E0]
}

code_0BBCE8 {
    COP [C2]
    COP [16] ( &code_0BBCCE )
    COP [80] ( #1F )
    COP [89]
    COP [82] ( #26, #03 )
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_0BBCE8
}

code_0BBD00 {
    COP [E0]
}

code_0BBD02 {
    COP [80] ( #23 )
    COP [89]
    COP [9E] ( @code_0BBD19, #$0000, #$0002, #$0202 )
    COP [80] ( #24 )
    COP [89]
    COP [E0]
}

code_0BBD19 {
    COP [07] ( #1E )
    COP [5B] ( #$0010 )
    COP [88] ( @table_0EE000 )
    COP [80] ( #03 )
    COP [89]
    LDA $player_actor
    STA $24
    LDA #$0003
    STA $0028, X
    LDA #$0002
    STA $7F0014, X
    SEP #$20
    LDA #$^e_actor_00E4DB
    PHA 
    REP #$20
    LDA #$&e_actor_00E4DB-1
    PHA 
    RTL 
}

code_0BBD48 {
    LDA $0AEC
    CMP #$0001
    BNE code_0BBD55
    COP [C7] ( @func_00DB8A )
}

code_0BBD55 {
    COP [C8] ( &code_0BC11B )
    COP [9C] ( @e_actor_00DA78, #$0020 )
    LDA $7F0010, X
    STA $0026, Y
    COP [CA] ( #28 )
    COP [80] ( #15 )
    COP [89]
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [C2]
    COP [CB]
    COP [E0]
}

---------------------------------------------

sub_0BBD81 {
    COP [23]
    AND #$001F
    CLC 
    ADC #$0008
    STA $08
    RTS 
}

---------------------------------------------

h_awB1_wall_walker3 [
  h_actor < #16, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_wall_walker3 {
    JSR $&sub_0BC001
    COP [B7] ( #0A )
    COP [27] ( #15 )
    LDA #$0000
    STA $26
    STA $24
    BRA code_0BBFE0
}

---------------------------------------------

h_awB1_wall_walker4 [
  h_actor < #16, #00, #00 >   ;00
]

---------------------------------------------

e_awB1_wall_walker4 {
    JSR $&sub_0BC001
    COP [B7] ( #0A )
    LDA #$0001
    STA $26
    STA $24
}

code_0BBFE0 {
    LDA #$0011
    TSB $12
    COP [A2] ( @code_0BC0EA, #$2000 )
    LDA $7F0010, X
    STA $0000
    COP [D9] ( #$0000, &code_list_0BBFF9 )
}

code_list_0BBFF9 [
  &code_0BC07C   ;00
  &func_0BC00D   ;01
  &code_0BC0AD   ;02
  &code_0BC047   ;03
]

---------------------------------------------

sub_0BC001 {
    LDA $0E
    XBA 
    AND #$0006
    LSR 
    STA $7F0010, X
    RTS 
}

---------------------------------------------

func_0BC00D {
    COP [C2]

  code_0BC00F:
    COP [17] ( &code_0BC018 )
    JMP $&code_0BC0B5
}

---------------------------------------------

func_0BC016 {
    COP [C2]
}

code_0BC018 {
    COP [15] ( &code_0BC04F )
    LDA $24
    STA $26
    LDA $26
    EOR #$FFFF
    INC 
    STA $7F002E, X
    COP [C2]
    LDA $26
    EOR #$FFFF
    INC 
    STA $7F002E, X
    LDA $16
    AND #$000F
    BEQ code_0BC03E
    RTL 
}

code_0BC03E {
    LDA #$0000
    STA $7F002E, X
    BRA code_0BC00F
}

code_0BC047 {
    COP [C2]

  code_0BC049:
    COP [15] ( &code_0BC051 )
    BRA func_0BC016
}

code_0BC04F {
    COP [C2]
}

code_0BC051 {
    COP [18] ( &code_0BC084 )
    LDA $24
    STA $26
    LDA $26
    STA $7F002C, X
    COP [C2]
    LDA $26
    STA $7F002C, X
    LDA $14
    SEC 
    SBC #$0008
    AND #$000F
    BEQ code_0BC073
    RTL 
}

code_0BC073 {
    LDA #$0000
    STA $7F002C, X
    BRA code_0BC049
}

code_0BC07C {
    COP [C2]

  code_0BC07E:
    COP [18] ( &code_0BC086 )
    BRA code_0BC04F
}

code_0BC084 {
    COP [C2]
}

code_0BC086 {
    COP [16] ( &code_0BC0B5 )
    LDA $24
    STA $26
    LDA $26
    STA $7F002E, X
    COP [C2]
    LDA $26
    STA $7F002E, X
    LDA $16
    AND #$000F
    BEQ code_0BC0A4
    RTL 
}

code_0BC0A4 {
    LDA #$0000
    STA $7F002E, X
    BRA code_0BC07E
}

code_0BC0AD {
    COP [C2]

  code_0BC0AF:
    COP [16] ( &code_0BC0B7 )
    BRA code_0BC084
}

code_0BC0B5 {
    COP [C2]
}

code_0BC0B7 {
    COP [17] ( &func_0BC016 )
    LDA $24
    STA $26
    LDA $26
    EOR #$FFFF
    INC 
    STA $7F002C, X
    COP [C2]
    LDA $26
    EOR #$FFFF
    INC 
    STA $7F002C, X
    LDA $14
    SEC 
    SBC #$0008
    AND #$000F
    BEQ code_0BC0E1
    RTL 
}

code_0BC0E1 {
    LDA #$0000
    STA $7F002C, X
    BRA code_0BC0AF
}

code_0BC0EA {
    COP [C1]
    LDY $04
    LDA $0010, Y
    BIT #$0080
    BNE code_0BC0F7
    RTL 
}

code_0BC0F7 {
    LDA $0024, Y
    BNE code_0BC101
    LDA #$0001
    BRA code_0BC102
}

code_0BC101 {
    ASL 
}

code_0BC102 {
    STA $0024, Y
    CMP #$0008
    BCS code_0BC119
    COP [C1]
    LDY $04
    LDA $0010, Y
    BIT #$0080
    BEQ code_0BC117
    RTL 
}

code_0BC117 {
    BRA code_0BC0EA
}

code_0BC119 {
    COP [E0]
}

code_0BC11B {
    COP [07] ( #06 )
    SED 
    LDA $0AEE
    SEC 
    SBC #$0001
    STA $0AEE
    CLD 
    LDA $0AEC
    DEC 
    STA $0AEC
    STA $7F0010, X
    COP [AC] ( #00, #00 )
    LDA #$0000
    STA $7F002C, X
    STA $7F002E, X
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [D8]
    LDA $7F002A, X
    BIT #$0008
    BEQ code_0BC15A
    COP [0C]
}

code_0BC15A {
    LDA $7F0024, X
    BEQ code_0BC182
    JSL $@func_00B4F6
    BCS code_0BC182
    LDA $7F0024, X
    JSL $@func_00B4E0
    COP [A5] ( @func_00DDF2, #00, #00, #$0342 )
    PHX 
    LDA $7F0024, X
    TYX 
    STA $7F0024, X
    PLX 
}

code_0BC182 {
    COP [C5]
}