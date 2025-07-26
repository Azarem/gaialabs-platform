?BANK 03

?INCLUDE 'chunk_008000'
?INCLUDE 'overworld_options'
?INCLUDE 'pr_proc_03A83E'
?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'overworld_routes'
?INCLUDE 'table_01B086'
?INCLUDE 'overworld_names'

!scene_next                     0642
!joypad_mask_std                065A

---------------------------------------------

h_sFE_actor_03A2F1 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_sFE_actor_03A2F1 {
    LDA #$0000
    STA $0AD4
    COP [3B] ( #0B, @func_00B519 )
    JSL $@func_00B4CC
    COP [3B] ( #0B, @func_00B519 )
    COP [9C] ( @code_03A35E, #$3800 )
    LDA #$FFF0
    TSB $joypad_mask_std
    LDA $0D58
    BEQ code_03A35C
    COP [C2]
    PHX 
    TYX 
    LDA $7F000E, X
    ORA #$0804
    STA $7F000E, X
    PLX 
    LDA $0D58
    STA $24
    AND #$001F
    STA $0000
    COP [C6] ( &code_03A341 )
    COP [D9] ( #$0000, &overworld_options )
}

code_03A341 {
    LDA $0D5A
    BEQ code_03A35C
    SEP #$20
    LDA $scene_next
    STA $0D6E
    REP #$20
    LDA $0652
    STA $0D6C
    STZ $0652
    STZ $scene_next
}

code_03A35C {
    COP [E0]
}

code_03A35E {
    LDA $0D54
    STA $14
    SEC 
    SBC #$0080
    STA $06BE
    LDA $0D56
    STA $16
    SEC 
    SBC #$0070
    STA $06C2
    COP [63] ( #20, #05, #00 )
    COP [CA] ( #2C )
    COP [64]
    LDA $7F002E, X
    CLC 
    ADC $00B8
    STA $00B8
    COP [C2]
    COP [CB]
    LDA $0D58
    BEQ code_03A3A4
    COP [DA] ( #0F )
    COP [3C] ( @e_pr_proc_03A83E )
    COP [C1]
    LDA $0D5A
    BNE code_03A3A4
    RTL 
}

code_03A3A4 {
    LDA $0D6F
    AND #$00FF
    STA $0000
    COP [9A] ( @e_pr_actor_0BCF52, #$2000 )
    JSR $&sub_03A692
    TYA 
    LDY $04
    STA $0026, Y
    COP [63] ( #00, #07, #00 )
    COP [CA] ( #5D )
    COP [64]
    LDA $00B6
    CLC 
    ADC $7F002E, X
    STA $00B6
    INC $00B8
    COP [CB]
    LDA #$0000
    STA $7F002E, X
    LDA #$2000
    TRB $10
    LDY #$0000

  code_03A3E6:
    INY 
    INY 
    CPY #$000C
    BCS code_03A3F2
    LDA $0D60, Y
    BNE code_03A3E6
}

code_03A3F2 {
    PHX 
    TYX 
    DEX 
    DEX 
    LDA $@table_03A503, X
    STA $18
    LDA #$*table_03A503
    STA $1A
    PLX 
    LDA $0D60
    STA $28
    LDA [$18]
    STA $24
    AND #$00FF
    CLC 
    ADC $06BE
    STA $14
    LDA $25
    AND #$00FF
    CLC 
    ADC $06C2
    STA $16
    INC $18
    INC $18
    LDY #$0000

  code_03A426:
    INY 
    INY 
    STY $26
    LDA $0D60, Y
    BEQ code_03A450
    PHA 
    COP [9C] ( @code_03A469, #$1800 )
    PLA 
    STA $0028, Y
    LDA [$18]
    STA $0024, Y
    LDA $24
    STA $0026, Y
    INC $18
    INC $18
    LDY $26
    CPY #$000A
    BCC code_03A426
}

code_03A450 {
    LDA $24
    STA $7F0012, X
    COP [CA] ( #02 )
    COP [C1]
    COP [89]
    COP [CB]
    STZ $00DA
    COP [99] ( @func_03A52F )
    BRA code_03A497
}

code_03A469 {
    LDA $26
    STA $7F0012, X
    LDA $24
    STA $7F0010, X
    AND #$00FF
    CLC 
    ADC $06BE
    STA $7F0018, X
    LDA $25
    AND #$00FF
    CLC 
    ADC $06C2
    STA $7F001A, X
    COP [22] ( #FF, #01 )
    LDA $7F0010, X
    STA $24
}

code_03A497 {
    COP [C1]
    COP [8B]
    LDA $08
    STZ $08
    STA $26
    COP [C1]
    LDA $24
    AND #$00FF
    CLC 
    ADC $06BE
    STA $14
    LDA $24
    XBA 
    AND #$00FF
    CLC 
    ADC $06C2
    STA $16
    LDA $0D5A
    BEQ code_03A4C6
    DEC $26
    BMI code_03A4C4
    RTL 
}

code_03A4C4 {
    BRA code_03A497
}

code_03A4C6 {
    LDA $7F0012, X
    AND #$00FF
    CLC 
    ADC $06BE
    STA $7F0018, X
    CMP $14
    BNE code_03A4EE
    LDA $7F0013, X
    AND #$00FF
    CLC 
    ADC $06C2
    STA $7F001A, X
    CMP $16
    BNE code_03A4EE
    COP [E0]
}

code_03A4EE {
    LDA $7F0013, X
    AND #$00FF
    CLC 
    ADC $06C2
    STA $7F001A, X
    COP [22] ( #FF, #01 )
    COP [E0]
}

---------------------------------------------

table_03A503 [
  &binary_03A511   ;00
  &binary_03A521   ;01
  &binary_03A511   ;02
  &binary_03A511   ;03
  &binary_03A525   ;04
  &binary_03A511   ;05
  &binary_03A511   ;06
]

binary_03A511 #80807090909068A098A0809860B0A0B0

binary_03A521 #78808880

binary_03A525 #80807090909068A098A0

---------------------------------------------

func_03A52F {
    PHX 
    LDA $0D5A
    ASL 
    TAX 
    LDA $@overworld_routes, X
    STA $2C
    LDA #$*overworld_routes
    STA $2E
    PLX 

  code_03A541:
    LDA [$2C]
    AND #$00FF
    CMP #$00FF
    BNE code_03A54E
    JMP $&code_03A5FE
}

code_03A54E {
    INC $2C
    CMP #$00FE
    BNE code_03A558
    JMP $&code_03A5F0
}

code_03A558 {
    ASL 
    TAY 
    LDA $&table_01B086, Y
    STA $18
    LDA [$2C]
    AND #$00FF
    INC $2C
    ASL 
    TAY 
    LDA $&table_01B086, Y
    STA $1A
    LDA [$2C]
    AND #$00FF
    INC $2C
    ASL 
    TAY 
    LDA $&table_01B086, Y
    STA $1C
    LDA [$2C]
    AND #$00FF
    INC $2C
    STA $24
    COP [C1]
    LDA $18
    BEQ code_03A5A2
    LDA ($18)
    INC $18
    INC $18
    CLC 
    ADC $00CA
    STA $00CA
    SEC 
    SBC #$0080
    STA $06BE
    LDA ($18)
    STA $18
}

code_03A5A2 {
    LDA $1A
    BEQ code_03A5BE
    LDA ($1A)
    INC $1A
    INC $1A
    CLC 
    ADC $00CC
    STA $00CC
    SEC 
    SBC #$0070
    STA $06C2
    LDA ($1A)
    STA $1A
}

code_03A5BE {
    LDA $1C
    BEQ code_03A5D3
    LDA ($1C)
    INC $1C
    INC $1C
    CLC 
    ADC $00BC
    STA $00BC
    LDA ($1C)
    STA $1C
}

code_03A5D3 {
    DEC $24
    BMI code_03A5D8
    RTL 
}

code_03A5D8 {
    JMP $&code_03A541

  code_03A5DB:
    LDA $0D6E
    AND #$00FF
    STA $scene_next
    LDA $0D6C
    STA $0652
    JSR $&sub_03A681
    COP [C1]
    RTL 
}

code_03A5F0 {
    LDA $2C
    INC 
    INC 
    STA $0D5C
    LDA [$2C]
    STA $2C
    JMP $&code_03A541
}

code_03A5FE {
    LDA $0D5C
    BEQ code_03A60B
    STZ $0D5C
    STA $2C
    JMP $&code_03A541
}

code_03A60B {
    STZ $0D5A
    STZ $0D58
    LDA $0D6E
    AND #$00FF
    STA $0000
    COP [9C] ( @e_pr_actor_0BCF52, #$2000 )
    JSR $&sub_03A692
    TYA 
    LDY $06
    STA $0026, Y
    COP [DA] ( #3B )
    COP [C1]
    LDA $00B6
    SEC 
    SBC #$0010
    BMI code_03A644
    STA $00B6
    LDA $0660
    BIT #$1000
    BNE code_03A5DB
    RTL 
}

code_03A644 {
    LDA #$0000
    STA $00B6
    COP [C2]
    STZ $00DA
    LDA #$0800
    TSB $10
    COP [63] ( #00, #06, #00 )
    LDA #$0406
    STA $064A
    LDA $0D6E
    AND #$00FF
    STA $scene_next
    LDA $0D6C
    STA $0652
    JSR $&sub_03A681
    COP [C1]
    COP [64]
    LDA $7F002E, X
    CLC 
    ADC $00B8
    STA $00B8
    RTL 
}

---------------------------------------------

sub_03A681 {
    LDA #$0000
    LDY #$0000

  code_03A687:
    STA $0D52, Y
    INY 
    INY 
    CPY #$001C
    BCC code_03A687
    RTS 
}

---------------------------------------------

sub_03A692 {
    PHP 
    PHX 
    LDX #$0000
    SEP #$20
    PHB 
    LDA #$^overworld_names
    PHA 
    PLB 

  code_03A69E:
    LDA $&overworld_names, X
    BEQ code_03A6B6
    CMP $0000
    BEQ code_03A6AD
    INX 
    INX 
    INX 
    BRA code_03A69E
}

code_03A6AD {
    REP #$20
    LDY $&overworld_names+1, X
    PLB 
    PLX 
    PLP 
    RTS 
}

code_03A6B6 {
    PLB 
    PLX 
    PLP 
    RTS 
}