?BANK 02

?INCLUDE 'inventory_spritemap'
?INCLUDE 'system_strings'
?INCLUDE 'chunk_008000'

!inventory_slots                0AB4
!inventory_equipped_index       0AC4
!inventory_equipped_type        0AC6

---------------------------------------------

h_inventory_menu [
  h_actor < #00, #00, #28 >   ;00
]

---------------------------------------------

e_inventory_menu {
    COP [88] ( @table_108000 )
    COP [BD] ( @asciistring_01E869 )
    STZ $0AFA
    LDA #$000F
    STA $24

  code_02E3AB:
    COP [9C] ( @func_02E8C7, #$1800 )
    PHY 
    LDY $24
    LDA $inventory_slots, Y
    AND #$00FF
    PLY 
    STA $0028, Y
    DEC $24
    BPL code_02E3AB
    TYA 
    STA $7F0010, X
    COP [9C] ( @func_02E8E7, #$0802 )
    TYA 
    STA $7F0012, X
    LDA $inventory_equipped_index
    STA $1A
    JSR $&sub_02EA73
    COP [9C] ( @func_02E8FF, #$0800 )
    TYA 
    STA $7F0018, X
    COP [9C] ( @func_02E953, #$0800 )
    COP [9C] ( @func_02E934, #$0800 )
    COP [9C] ( @func_02E915, #$0800 )
    TYA 
    STA $7F001A, X
    COP [C2]
    STZ $0AFA
    LDA #$1000
    TSB $10

  code_02E40C:
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01E8E9 )
    STZ $1C
    LDA #$FFFF
    STA $18
    LDA #$8000
    TSB $0658
    COP [C2]
    JSR $&sub_02EC58
    BCS func_02E445
    LDA $0AFA
    CMP $18
    BNE code_02E432
    RTL 
}

code_02E432 {
    STA $18
    STA $0000
    COP [D9] ( #$0000, &code_list_02E43D )
}

code_list_02E43D [
  &func_02E7C7   ;00
  &func_02E7E6   ;01
  &func_02E7F7   ;02
  &func_02E816   ;03
]

---------------------------------------------

func_02E445 {
    COP [06] ( #0D )
    LDA $0AFA
    STA $18
    STA $0000
    COP [D9] ( #$0000, &code_list_02E456 )
}

code_list_02E456 [
  &code_02E45E   ;00
  &code_02E536   ;01
  &code_02E657   ;02
  &code_02E719   ;03
]

code_02E45E {
    LDA #$0004
    STA $0AE6
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01EA02 )
    COP [BD] ( @asciistring_01E975 )
    STZ $inventory_equipped_index
    JSR $&sub_02EAF7
    LDA $1A
    BPL code_02E47F
    STZ $1A
}

code_02E47F {
    JSR $&sub_02EA73
    COP [BD] ( @asciistring_01E912 )
    LDY $1A
    LDA $inventory_slots, Y
    AND #$00FF
    STA $0AE8
    COP [BD] ( @asciistring_01E9D0 )
    COP [C2]
    COP [40] ( #$C040, &code_02E50B )
    COP [40] ( #$0800, &code_02E4B8 )
    COP [40] ( #$0400, &code_02E4CE )
    COP [40] ( #$0200, &code_02E4E4 )
    COP [40] ( #$0100, &code_02E4F7 )
    RTL 
}

code_02E4B8 {
    LDA #$0B00
    TSB $0658
    COP [06] ( #10 )
    LDA $1A
    SEC 
    SBC #$0004
    AND #$000F
    STA $1A
    BRA code_02E47F
}

code_02E4CE {
    LDA #$0700
    TSB $0658
    COP [06] ( #10 )
    LDA $1A
    CLC 
    ADC #$0004
    AND #$000F
    STA $1A
    BRA code_02E47F
}

code_02E4E4 {
    LDA #$0200
    TSB $0658
    COP [06] ( #10 )
    LDA $1A
    DEC 
    AND #$000F
    STA $1A
    BRA code_02E47F
}

code_02E4F7 {
    LDA #$0100
    TSB $0658
    COP [06] ( #10 )
    LDA $1A
    INC 
    AND #$000F
    STA $1A
    JMP $&code_02E47F
}

code_02E50B {
    LDA #$C040
    TSB $0658
    COP [06] ( #11 )
    LDA $1A
    STA $inventory_equipped_index
    TAY 
    LDA $inventory_slots, Y
    AND #$00FF
    BNE code_02E530
    LDA #$FFFF
    STA $inventory_equipped_index
    STA $1A
    STZ $inventory_equipped_type
    JMP $&code_02E40C
}

code_02E530 {
    STA $inventory_equipped_type
    JMP $&code_02E40C
}

code_02E536 {
    JSR $&code_02EB0B
    COP [9C] ( @code_02E8F1, #$0802 )
    STY $20
    STZ $22

  code_02E544:
    STZ $1C
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01EA14 )
    COP [BD] ( @asciistring_01E98C )

  code_02E555:
    JSR $&sub_02EA3D
    COP [C2]
    COP [40] ( #$4040, &code_02E64C )
    COP [40] ( #$8000, &code_02E583 )
    PEA $&code_02E555-1
    COP [40] ( #$0800, &sub_02E981 )
    COP [40] ( #$0400, &sub_02E996 )
    COP [40] ( #$0200, &sub_02E9AB )
    COP [40] ( #$0100, &sub_02E9BD )
    PLA 
    RTL 
}

code_02E583 {
    COP [06] ( #11 )
    LDA #$8000
    TSB $0658
    LDA $20
    STA $2C
    LDA $22
    STA $2E
    COP [9C] ( @code_02E8F1, #$0802 )
    STY $20
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01EA14 )
    COP [BD] ( @asciistring_01E9A6 )

  code_02E5AC:
    JSR $&sub_02EA3D
    COP [C2]
    COP [40] ( #$4040, &code_02E64A )
    COP [40] ( #$8000, &code_02E5DA )
    PEA $&code_02E5AC-1
    COP [40] ( #$0800, &sub_02E981 )
    COP [40] ( #$0400, &sub_02E996 )
    COP [40] ( #$0200, &sub_02E9AB )
    COP [40] ( #$0100, &sub_02E9BD )
    PLA 
    RTL 
}

code_02E5DA {
    LDA #$8000
    TSB $0658
    LDA $22
    CMP $2E
    BEQ code_02E5AC
    COP [06] ( #11 )
    LDY $22
    SEP #$20
    LDA $inventory_slots, Y
    XBA 
    LDY $2E
    LDA $inventory_slots, Y
    XBA 
    STA $inventory_slots, Y
    XBA 
    LDY $22
    STA $inventory_slots, Y
    REP #$20
    LDY $2E
    LDA $inventory_slots, Y
    AND #$00FF
    PHA 
    TYA 
    JSR $&sub_02E9ED
    PLA 
    STA $0028, Y
    LDY $22
    LDA $inventory_slots, Y
    AND #$00FF
    PHA 
    TYA 
    JSR $&sub_02E9ED
    PLA 
    STA $0028, Y
    TYA 
    CMP $inventory_equipped_index
    BNE code_02E631
    LDA $2E
    STA $inventory_equipped_index
    BRA code_02E63D
}

code_02E631 {
    LDA $2E
    CMP $inventory_equipped_index
    BNE code_02E63D
    LDA $22
    STA $inventory_equipped_index
}

code_02E63D {
    PHX 
    PHD 
    LDA $2C
    TAX 
    TCD 
    COP [A7]
    PLD 
    PLX 
    JMP $&code_02E544
}

code_02E64A {
    COP [A9]
}

code_02E64C {
    COP [A9]
    LDA #$4040
    TSB $0658
    JMP $&code_02E40C
}

code_02E657 {
    LDA #$0004
    STA $0AE6
    JSR $&code_02EB0B
    COP [9C] ( @code_02E8F1, #$0802 )
    STY $20
    STZ $22

  code_02E66B:
    STZ $1C
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01EA27 )
    COP [BD] ( @asciistring_01E9B7 )

  code_02E67C:
    JSR $&sub_02EA3D
    COP [C2]
    COP [40] ( #$4040, &code_02E70B )
    COP [40] ( #$8000, &code_02E6AA )
    PEA $&code_02E67C-1
    COP [40] ( #$0800, &sub_02E981 )
    COP [40] ( #$0400, &sub_02E996 )
    COP [40] ( #$0200, &sub_02E9AB )
    COP [40] ( #$0100, &sub_02E9BD )
    PLA 
    RTL 
}

code_02E6AA {
    LDA #$8000
    TSB $0658
    LDY $22
    LDA $inventory_slots, Y
    AND #$00FF
    BEQ code_02E705
    STA $0AE8
    JSR $&sub_02EA13
    BCS code_02E705
    COP [BD] ( @asciistring_01E912 )
    COP [BD] ( @asciistring_01E9E2 )
    STZ $28
    COP [C2]
    JSR $&sub_02EBC6
    BCS code_02E6D6
    RTL 
}

code_02E6D6 {
    LDA $28
    BEQ code_02E702
    LDY $22
    LDA $inventory_slots, Y
    AND #$FF00
    STA $inventory_slots, Y
    LDA $22
    JSR $&sub_02E9ED
    LDA $22
    CMP $inventory_equipped_index
    BNE code_02E6FC
    STZ $inventory_equipped_type
    LDA #$FFFF
    STA $inventory_equipped_index
    STA $1A
}

code_02E6FC {
    COP [06] ( #13 )
    JMP $&code_02E66B
}

code_02E702 {
    JMP $&code_02E66B
}

code_02E705 {
    COP [06] ( #12 )
    JMP $&code_02E66B
}

code_02E70B {
    LDA #$4040
    TSB $0658
    COP [A9]
    JSR $&sub_02EAF7
    JMP $&code_02E40C
}

code_02E719 {
    LDA #$0000
    STA $0AE6
    COP [BD] ( @asciistring_01E90B )
    COP [BD] ( @asciistring_01EA39 )
    COP [9C] ( @code_02E8F1, #$0802 )
    STY $20
    STZ $22

  code_02E734:
    JSR $&sub_02E7A3
    COP [BD] ( @asciistring_01E912 )
    LDA $0AD4
    STA $0004
    LDA $22
    JSR $&sub_02E9DC
    BCC code_02E753
    LDA $22
    JSR $&sub_02E972
    COP [BD] ( @asciistring_01EAB4 )
}

code_02E753 {
    COP [C2]
    COP [40] ( #$0800, &code_02E768 )
    COP [40] ( #$0400, &code_02E77D )
    COP [40] ( #$C040, &code_02E795 )
    RTL 
}

code_02E768 {
    LDA #$0800
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    DEC 
    BPL code_02E779
    LDA #$0002
}

code_02E779 {
    STA $22
    BRA code_02E734
}

code_02E77D {
    LDA #$0400
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    INC 
    CMP #$0003
    BCC code_02E791
    LDA #$0000
}

code_02E791 {
    STA $22
    BRA code_02E734
}

code_02E795 {
    COP [06] ( #11 )
    LDA #$C040
    TSB $0658
    COP [A9]
    JMP $&code_02E40C
}

---------------------------------------------

sub_02E7A3 {
    PHX 
    LDY $20
    LDA $22
    ASL 
    ASL 
    TAX 
    LDA $@binary_02E7BB, X
    STA $0014, Y
    LDA $@binary_02E7BB+2, X
    STA $0016, Y
    PLX 
    RTS 
}

---------------------------------------------

binary_02E7BB [
  #$0098   ;00
  #$0048   ;01
  #$0098   ;02
  #$0060   ;03
  #$0098   ;04
  #$0078   ;05
]

---------------------------------------------

func_02E7C7 {
    JSR $&sub_02EB1A
    JSR $&sub_02EAF7
    JSR $&sub_02EAC0
    COP [BD] ( @asciistring_01E8E2 )
    COP [BD] ( @asciistring_01E912 )
    COP [BD] ( @asciistring_01E919 )
    LDA #$0004
    STA $0AE6
    RTL 
}

---------------------------------------------

func_02E7E6 {
    JSR $&sub_02EB1A
    JSR $&sub_02EAF7
    COP [BD] ( @asciistring_01E912 )
    COP [BD] ( @asciistring_01E954 )
    RTL 
}

---------------------------------------------

func_02E7F7 {
    JSR $&sub_02EB1A
    JSR $&sub_02EAF7
    JSR $&sub_02EAC0
    COP [BD] ( @asciistring_01E912 )
    COP [BD] ( @asciistring_01E8E2 )
    COP [BD] ( @asciistring_01E962 )
    LDA #$0004
    STA $0AE6
    RTL 
}

---------------------------------------------

func_02E816 {
    JSR $&sub_02EB45
    JSR $&code_02EB0B
    COP [BD] ( @asciistring_01E912 )
    COP [BD] ( @asciistring_01E870 )
    COP [BD] ( @asciistring_01EA70 )
    LDA #$0000
    STA $0AE6
    LDA $7F0018, X
    TAY 
    LDA $inventory_equipped_index
    BMI code_02E84A
    LDA $inventory_equipped_type
    JSR $&sub_02E9CF
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
}

code_02E84A {
    LDA $7F001A, X
    STA $0002
    LDA $0AD4
    STA $0004
    LDA #$0000
    JSR $&sub_02E9DC
    BCC code_02E876
    LDY $0002
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    LDA #$0000
    JSR $&sub_02E972
    COP [BD] ( @asciistring_01EA49 )
}

code_02E876 {
    LDY $0002
    LDA $0006, Y
    STA $0002
    LDA #$0001
    JSR $&sub_02E9DC
    BCC code_02E89E
    LDY $0002
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    LDA #$0001
    JSR $&sub_02E972
    COP [BD] ( @asciistring_01EA56 )
}

code_02E89E {
    LDY $0002
    LDA $0006, Y
    STA $0002
    LDA #$0002
    JSR $&sub_02E9DC
    BCC code_02E8C6
    LDY $0002
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    LDA #$0002
    JSR $&sub_02E972
    COP [BD] ( @asciistring_01EA63 )
}

code_02E8C6 {
    RTL 
}

---------------------------------------------

func_02E8C7 {
    INC $0AFA
    JSR $&sub_02EB70

  loc_02E8CD:
    COP [C1]
    LDA $28
    BNE code_02E8D9
    LDA #$2000
    TSB $10
    RTL 
}

code_02E8D9 {
    LDA #$2000
    TRB $10

  code_02E8DE:
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ code_02E8DE
    RTL 
}

---------------------------------------------

func_02E8E7 {
    LDA $inventory_equipped_index
    BPL code_02E8F1
    LDA #$2000
    TSB $10
}

code_02E8F1 {
    COP [8D] ( #40 )
    COP [C2]
}

---------------------------------------------

func_02E8F6 {
    COP [C1]
    COP [8B]
    LDA $2A
    BEQ func_02E8F6
    RTL 
}

---------------------------------------------

func_02E8FF {
    LDA #$0028
    STA $14
    LDA #$0078
    STA $16
    LDA $inventory_equipped_type
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    RTL 
}

---------------------------------------------

func_02E915 {
    LDA #$0098
    STA $14
    LDA #$0048
    STA $16
    LDA $0AD4
    ASL 
    CLC 
    ADC $0AD4
    CLC 
    ADC #$0044
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    RTL 
}

---------------------------------------------

func_02E934 {
    LDA #$0098
    STA $14
    LDA #$0060
    STA $16
    LDA $0AD4
    ASL 
    CLC 
    ADC $0AD4
    CLC 
    ADC #$0045
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    RTL 
}

---------------------------------------------

func_02E953 {
    LDA #$0098
    STA $14
    LDA #$0078
    STA $16
    LDA $0AD4
    ASL 
    CLC 
    ADC $0AD4
    CLC 
    ADC #$0046
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    RTL 
}

---------------------------------------------

sub_02E972 {
    PHA 
    LDA $0AD4
    ASL 
    ASL 
    CLC 
    ADC $01, S
    INC 
    STA $0AE8
    PLA 
    RTS 
}

---------------------------------------------

sub_02E981 {
    LDA #$0B00
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    SEC 
    SBC #$0004
    AND #$000F
    STA $22
    RTS 
}

---------------------------------------------

sub_02E996 {
    LDA #$0700
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    CLC 
    ADC #$0004
    AND #$000F
    STA $22
    RTS 
}

---------------------------------------------

sub_02E9AB {
    LDA #$0200
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    DEC 
    AND #$000F
    STA $22
    RTS 
}

---------------------------------------------

sub_02E9BD {
    LDA #$0100
    TSB $0658
    COP [06] ( #10 )
    LDA $22
    INC 
    AND #$000F
    STA $22
    RTS 
}

---------------------------------------------

sub_02E9CF {
    STA $0028, Y
    LDA #$0000
    STA $002A, Y
    STA $0008, Y
    RTS 
}

---------------------------------------------

sub_02E9DC {
    PHA 
    LDA $0004
    ASL 
    ASL 
    CLC 
    ADC $01, S
    STA $01, S
    PLA 
    JSL $@func_00B4AC
    RTS 
}

---------------------------------------------

sub_02E9ED {
    STA $000E
    LDA $7F0010, X
    TAY 

  code_02E9F5:
    DEC $000E
    BMI code_02EA00
    LDA $0006, Y
    TAY 
    BRA code_02E9F5
}

code_02EA00 {
    LDA #$&loc_02E8CD
    STA $0000, Y
    LDA #$0000
    STA $0028, Y
    STA $0008, Y
    STA $002A, Y
    RTS 
}

---------------------------------------------

sub_02EA13 {
    PHX 
    STA $0000
    LSR 
    LSR 
    LSR 
    TAY 
    LDA #$0000
    SEP #$20
    LDA $0000
    AND #$07
    TAX 
    LDA $@bitflags_02EA35, X
    AND $&binary_01E12A, Y
    SEC 
    BNE code_02EA31
    CLC 
}

code_02EA31 {
    REP #$20
    PLX 
    RTS 
}

---------------------------------------------

bitflags_02EA35 [
  #01   ;00
  #02   ;01
  #04   ;02
  #08   ;03
  #10   ;04
  #20   ;05
  #40   ;06
  #80   ;07
]

---------------------------------------------

sub_02EA3D {
    LDA $22
    STA $0000
    LDY $20
    BRA code_02EA4D
    LDA $2E
    STA $0000
    LDY $2C
}

code_02EA4D {
    PHX 
    LDA $0000
    ASL 
    ASL 
    PHA 
    AND #$000C
    TAX 
    LDA #$0030
    AND $01, S
    STA $01, S
    LDA $@binary_02EAB0, X
    STA $0014, Y
    LDA $@binary_02EAB0+2, X
    CLC 
    ADC $01, S
    STA $0016, Y
    PLA 
    PLX 
    RTS 
}

---------------------------------------------

sub_02EA73 {
    LDA $1A
    BMI code_02EAA1
    PHX 
    LDA $7F0012, X
    TAY 
    LDA $1A
    ASL 
    ASL 
    PHA 
    AND #$000C
    TAX 
    LDA #$0030
    AND $01, S
    STA $01, S
    LDA $@binary_02EAB0, X
    STA $0014, Y
    LDA $@binary_02EAB0+2, X
    CLC 
    ADC $01, S
    STA $0016, Y
    PLA 
    PLX 
    RTS 
}

code_02EAA1 {
    LDA $7F0012, X
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    RTS 
}

---------------------------------------------

binary_02EAB0 [
  #$005C   ;00
  #$0030   ;01
  #$0074   ;02
  #$0030   ;03
  #$008C   ;04
  #$0030   ;05
  #$00A4   ;06
  #$0030   ;07
]

---------------------------------------------

sub_02EAC0 {
    LDA $7F0018, X
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $7F001A, X
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0006, Y
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0006, Y
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    RTS 
}

---------------------------------------------

sub_02EAF7 {
    LDA $inventory_equipped_index
    BMI code_02EB0B
    LDA $7F0012, X
    TAY 
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    RTS 
}

code_02EB0B {
    LDA $7F0012, X
    TAY 
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    RTS 
}

---------------------------------------------

sub_02EB1A {
    LDA $10
    BIT #$1000
    BEQ code_02EB22
    RTS 
}

code_02EB22 {
    LDA #$1000
    TSB $10
    LDA #$000F
    STA $0000
    LDA $7F0010, X
    TAY 

  code_02EB32:
    LDA $0010, Y
    AND #$DFFF
    STA $0010, Y
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_02EB32
    RTS 
}

---------------------------------------------

sub_02EB45 {
    LDA $10
    BIT #$1000
    BNE code_02EB4D
    RTS 
}

code_02EB4D {
    LDA #$1000
    TRB $10
    LDA #$000F
    STA $0000
    LDA $7F0010, X
    TAY 

  code_02EB5D:
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    LDA $0006, Y
    TAY 
    DEC $0000
    BPL code_02EB5D
    RTS 
}

---------------------------------------------

sub_02EB70 {
    PHX 
    LDA $0AFA
    DEC 
    ASL 
    ASL 
    TAX 
    LDA $@binary_02EB86, X
    STA $14
    LDA $@binary_02EB86+2, X
    STA $16
    PLX 
    RTS 
}

---------------------------------------------

binary_02EB86 [
  #$005C   ;00
  #$0031   ;01
  #$0074   ;02
  #$0031   ;03
  #$008C   ;04
  #$0031   ;05
  #$00A4   ;06
  #$0031   ;07
  #$005C   ;08
  #$0041   ;09
  #$0074   ;0A
  #$0041   ;0B
  #$008C   ;0C
  #$0041   ;0D
  #$00A4   ;0E
  #$0041   ;0F
  #$005C   ;10
  #$0051   ;11
  #$0074   ;12
  #$0051   ;13
  #$008C   ;14
  #$0051   ;15
  #$00A4   ;16
  #$0051   ;17
  #$005C   ;18
  #$0061   ;19
  #$0074   ;1A
  #$0061   ;1B
  #$008C   ;1C
  #$0061   ;1D
  #$00A4   ;1E
  #$0061   ;1F
]

---------------------------------------------

sub_02EBC6 {
    COP [40] ( #$8000, &sub_02EC22 )
    COP [40] ( #$0800, &sub_02EBF2 )
    COP [40] ( #$0400, &sub_02EC0A )
    LDA $1C
    INC $1C
    BIT #$000F
    BEQ code_02EBE3
    CLC 
    RTS 
}

code_02EBE3 {
    BIT #$0010
    BNE code_02EBED
    JSR $&sub_02EC2D
    CLC 
    RTS 
}

code_02EBED {
    JSR $&sub_02EC46
    CLC 
    RTS 
}

---------------------------------------------

sub_02EBF2 {
    COP [06] ( #10 )
    LDA #$0800
    TSB $0658
    LDA $28
    DEC 
    AND #$0001
    STA $28
    STZ $1C
    JSR $&sub_02EC2D
    CLC 
    RTS 
}

---------------------------------------------

sub_02EC0A {
    COP [06] ( #10 )
    LDA #$0400
    TSB $0658
    LDA $28
    INC 
    AND #$0001
    STA $28
    STZ $1C
    JSR $&sub_02EC2D
    CLC 
    RTS 
}

---------------------------------------------

sub_02EC22 {
    LDA #$8000
    TSB $0658
    JSR $&sub_02EC2D
    SEC 
    RTS 
}

---------------------------------------------

sub_02EC2D {
    JSR $&sub_02EC46
    PHX 
    LDA $28
    AND #$00FF
    XBA 
    LSR 
    CLC 
    ADC #$0696
    TAX 
    LDA #$202B
    STA $7F0200, X
    PLX 
    RTS 
}

---------------------------------------------

sub_02EC46 {
    LDA #$0001
    TSB $09EC
    LDA #$2040
    STA $7F0896
    STA $7F0916
    RTS 
}

---------------------------------------------

sub_02EC58 {
    COP [40] ( #$8000, &sub_02ECC3 )
    COP [40] ( #$0800, &sub_02EC8A )
    COP [40] ( #$0400, &sub_02ECA4 )
    COP [40] ( #$6040, &sub_02ECBE )
    LDA $1C
    INC $1C
    BIT #$000F
    BEQ code_02EC7B
    CLC 
    RTS 
}

code_02EC7B {
    BIT #$0010
    BNE code_02EC85
    JSR $&sub_02ECCE
    CLC 
    RTS 
}

code_02EC85 {
    JSR $&sub_02ECE8
    CLC 
    RTS 
}

---------------------------------------------

sub_02EC8A {
    COP [06] ( #10 )
    LDA #$0800
    TSB $0658
    STZ $1C
    LDA $0AFA
    DEC 
    AND #$0003
    STA $0AFA
    JSR $&sub_02ECCE
    CLC 
    RTS 
}

---------------------------------------------

sub_02ECA4 {
    COP [06] ( #10 )
    LDA #$0400
    TSB $0658
    STZ $1C
    LDA $0AFA
    INC 
    AND #$0003
    STA $0AFA
    JSR $&sub_02ECCE
    CLC 
    RTS 
}

---------------------------------------------

sub_02ECBE {
    COP [CC] ( #00 )
    CLC 
    RTS 
}

---------------------------------------------

sub_02ECC3 {
    LDA #$8000
    TSB $0658
    JSR $&sub_02ECCE
    SEC 
    RTS 
}

---------------------------------------------

sub_02ECCE {
    JSR $&sub_02ECE8
    PHX 
    LDA $0AFA
    AND #$00FF
    XBA 
    LSR 
    CLC 
    ADC #$0584
    TAX 
    LDA #$202B
    STA $7F0200, X
    PLX 
    RTS 
}

---------------------------------------------

sub_02ECE8 {
    LDA #$0001
    TSB $09EC
    LDA #$2040
    STA $7F0784
    STA $7F0804
    STA $7F0884
    STA $7F0904
    RTS 
}