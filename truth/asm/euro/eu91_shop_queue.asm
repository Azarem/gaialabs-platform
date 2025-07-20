?INCLUDE 'func_06B9F2'

!player_x_pos                   09A2
!player_y_pos                   09A4

---------------------------------------------

h_eu91_shop_queue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_eu91_shop_queue {
    LDA #$0188
    TSB $12
    LDA $0E
    LSR 
    AND #$0038
    CLC 
    ADC #$0002
    STA $26
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_07D39A )
    TXY 
    LDA $24
    STA $0000
    BEQ code_07D287

  code_07D27E:
    LDA $0004, Y
    TAY 
    DEC $0000
    BNE code_07D27E
}

code_07D287 {
    TYA 
    STA $20
    COP [0B]
    BRA code_07D2F9
}

---------------------------------------------

func_07D28E {
    COP [25] ( #2C, #40 )
    COP [DA] ( #07 )
    LDA #$2000
    TRB $10
    LDA $26
    CLC 
    ADC #$0004
    STA $28
    STZ $2A
    COP [8B]

  code_07D2A6:
    LDA $16
    CMP #$0420
    BEQ func_07D2EB
    BRA code_07D2B1
}

---------------------------------------------

func_07D2AF {
    COP [C2]
}

code_07D2B1 {
    JSR $&code_07D513
    BCS func_07D2AF
    COP [16] ( &func_07D2AF )
    JSR $&code_07D593
    BCC func_07D2AF
    COP [0D] ( #00, #01 )
    LDA $26
    CLC 
    ADC #$0004
    STA $28
    STZ $2A
    COP [AB] ( #11 )
    COP [C1]
    COP [89]
    LDA $26
    CLC 
    ADC #$0004
    STA $28
    STZ $2A
    COP [8B]
    JSR $&sub_07D4FF
    BCS code_07D2A6
    COP [0E] ( #00, #FF )
    BRA code_07D2A6
}

---------------------------------------------

func_07D2EB {
    LDA $26
    CLC 
    ADC #$0006
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
}

code_07D2F9 {
    LDA $14
    CMP #$0228
    BEQ func_07D33E
    BRA code_07D304
}

---------------------------------------------

func_07D302 {
    COP [C2]
}

code_07D304 {
    JSR $&code_07D555
    BCS func_07D302
    COP [17] ( &func_07D302 )
    JSR $&sub_07D583
    BCC func_07D302
    COP [0D] ( #FF, #00 )
    LDA $26
    CLC 
    ADC #$0006
    STA $28
    STZ $2A
    COP [AA] ( #12 )
    COP [C1]
    COP [89]
    LDA $26
    CLC 
    ADC #$0006
    STA $28
    STZ $2A
    COP [8B]
    JSR $&sub_07D541
    BCS code_07D2F9
    COP [0E] ( #01, #00 )
    BRA code_07D2F9
}

---------------------------------------------

func_07D33E {
    LDA $16
    CMP #$0400
    BEQ func_07D390
    BRA code_07D349
}

---------------------------------------------

func_07D347 {
    COP [C2]
}

code_07D349 {
    JSR $&sub_07D4FF
    BCS func_07D347
    JSR $&code_07D59B
    BCC func_07D347
    COP [15] ( &func_07D347 )
    LDA $16
    CMP #$0410
    BNE code_07D362
    COP [15] ( &func_07D347 )
}

code_07D362 {
    LDA $26
    CLC 
    ADC #$0005
    STA $28
    STZ $2A
    COP [0D] ( #00, #FF )
    COP [AB] ( #12 )
    COP [C1]
    COP [89]
    LDA $26
    CLC 
    ADC #$0005
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSR $&code_07D513
    BCS func_07D33E
    COP [0E] ( #00, #01 )
    BRA func_07D33E
}

---------------------------------------------

func_07D390 {
    LDA #$2000
    TSB $10
    COP [C4] ( @func_07D28E )
}

code_07D39A {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07D3A5 )
}

code_list_07D3A5 [
  &code_07D3B1   ;00
  &code_07D3B6   ;01
  &code_07D3BB   ;02
  &code_07D3C0   ;03
  &code_07D3C5   ;04
  &code_07D3CA   ;05
]

code_07D3B1 {
    COP [BF] ( &widestring_07D3CF )
    RTL 
}

code_07D3B6 {
    COP [BF] ( &widestring_07D3F6 )
    RTL 
}

code_07D3BB {
    COP [BF] ( &widestring_07D423 )
    RTL 
}

code_07D3C0 {
    COP [BF] ( &widestring_07D43E )
    RTL 
}

code_07D3C5 {
    COP [BF] ( &widestring_07D479 )
    RTL 
}

code_07D3CA {
    COP [BF] ( &widestring_07D4A9 )
    RTL 
}

widestring_07D3CF `[DEF]You can buy the best[N]goods in [LU1:D6]shop.[END]`

widestring_07D3F6 `[DEF]I saw the line and [N][LU2:C2]why [LU1:C1][N][LU1:F2]lining up...[END]`

widestring_07D423 `[DEF]We are [LU2:44]waiting[N]in line.[END]`

widestring_07D43E `[DEF]In [LU2:AA]of trouble, [N][LU1:C1]are grateful for [N]whatever [LU2:AB]can get.[END]`

widestring_07D479 `[DEF]I saw the line and[N][LU2:C2]why people[N][LU1:F2]lining up...[END]`

widestring_07D4A9 `[DEF]You can buy Life[N]Medicine in [LU1:D6]shop.[FIN]I [LU1:82][LU1:A4]if it[N]helps, but everyone[N]wants a [LU1:A6]life.[END]`

---------------------------------------------

sub_07D4FF {
    LDA #$0005
    STA $0000
    LDA $20
    TAY 
    LDA $16
    SEC 
    SBC #$0010
    STA $001C
    BRA code_07D525
}

code_07D513 {
    LDA #$0005
    STA $0000
    LDA $20
    TAY 
    LDA $16
    CLC 
    ADC #$0010
    STA $001C
}

code_07D525 {
    LDA $001C
    CMP $0016, Y
    BNE code_07D534
    LDA $14
    CMP $0014, Y
    BEQ code_07D53F
}

code_07D534 {
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_07D525
    CLC 
    RTS 
}

code_07D53F {
    SEC 
    RTS 
}

---------------------------------------------

sub_07D541 {
    LDA #$0005
    STA $0000
    LDA $20
    TAY 
    LDA $14
    CLC 
    ADC #$0010
    STA $0018
    BRA code_07D567
}

code_07D555 {
    LDA #$0005
    STA $0000
    LDA $20
    TAY 
    LDA $14
    SEC 
    SBC #$0010
    STA $0018
}

code_07D567 {
    LDA $0018
    CMP $0014, Y
    BNE code_07D576
    LDA $16
    CMP $0016, Y
    BEQ code_07D581
}

code_07D576 {
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_07D567
    CLC 
    RTS 
}

code_07D581 {
    SEC 
    RTS 
}

---------------------------------------------

sub_07D583 {
    LDA $14
    SEC 
    SBC #$0010
    STA $0018
    LDA $16
    STA $001C
    BRA code_07D5A9
}

code_07D593 {
    LDA $16
    CLC 
    ADC #$0010
    BRA code_07D5A1
}

code_07D59B {
    LDA $16
    SEC 
    SBC #$0010
}

code_07D5A1 {
    STA $001C
    LDA $14
    STA $0018
}

code_07D5A9 {
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $0018
    BPL code_07D5BA
    EOR #$FFFF
    INC 
}

code_07D5BA {
    CMP #$000D
    BCC code_07D5C0
    RTS 
}

code_07D5C0 {
    LDA $player_y_pos
    CLC 
    ADC #$0010
    SEC 
    SBC $001C
    BPL code_07D5D1
    EOR #$FFFF
    INC 
}

code_07D5D1 {
    CMP #$000D
    RTS 
}