
?INCLUDE 'actor_00E256'
?INCLUDE 'func_00DF15'
?INCLUDE 'chunk_00E683'

!player_actor                   09AA

---------------------------------------------

h_sg4D_knight_armor1 [
  h_actor < #17, #10, #03 >   ;00
]

---------------------------------------------

e_sg4D_knight_armor1 {
    JSR $&sub_0AC506
    COP [0B]

  code_0AC106:
    COP [80] ( #17 )
    COP [89]

  code_0AC10B:
    COP [27] ( #1E )
    COP [21] ( #04, &code_0AC118 )
    COP [C4] ( @code_0AC10B )
}

code_0AC118 {
    COP [9A] ( @code_0AC1B4, #$2212 )
    TXA 
    TYX 
    TAY 
    TYA 
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA #$0001
    STA $7F0010, X
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0AD9D2 )
    COP [8D] ( #19 )
    COP [C1]
    COP [8B]
    LDA $7F0010, X
    BMI code_0AC1A1
    BEQ code_0AC14A
    RTL 
}

code_0AC14A {
    COP [C8] ( &code_0ADA12 )
    BRA code_0AC106
}

---------------------------------------------

h_sg4F_knight_armor2 [
  h_actor < #17, #10, #01 >   ;00
]

---------------------------------------------

e_sg4F_knight_armor2 {
    JSR $&sub_0AC506
    COP [0B]

  code_0AC158:
    COP [80] ( #17 )
    COP [89]
    COP [58] ( &code_0AC169 )

  code_0AC161:
    COP [27] ( #1E )
    COP [C4] ( @code_0AC161 )
}

code_0AC169 {
    COP [9A] ( @code_0AC1B4, #$2212 )
    TXA 
    TYX 
    TAY 
    TYA 
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA #$0001
    STA $7F0010, X
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0AD9D2 )
    COP [8D] ( #19 )
    COP [C1]
    COP [8B]
    LDA $7F0010, X
    BMI code_0AC1A1
    BEQ code_0AC19B
    RTL 
}

code_0AC19B {
    COP [C8] ( &code_0ADA12 )
    BRA code_0AC158
}

code_0AC1A1 {
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0ADA12 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [C1]
    RTL 
}

code_0AC1B4 {
    COP [BC] ( #FF, #DC )
    LDA #$2000
    TRB $10
    JSR $&sub_0ADD59
    LDA #$0000
    STA $7F0012, X
    LDA #$0100
    TSB $12
    LDA #$1010
    STA $20
    STA $22
    COP [84] ( #1A, #50 )
    COP [8A]
    LDA #$0200
    TRB $10
    COP [58] ( &code_0AC23D )
    BRA code_0AC1EE
}

---------------------------------------------

func_0AC1E4 {
    COP [58] ( &code_0AC23D )

  code_0AC1E8:
    COP [84] ( #22, #02 )
    COP [8A]
}

code_0AC1EE {
    COP [C6] ( &code_0AC1E8 )
    COP [21] ( #07, &code_0AC294 )
    COP [B2]

  code_0AC1F9:
    LDA $7F100C, X
    STA $7F0018, X
    LDA $7F100E, X
    STA $7F001A, X
    COP [52] ( #22, #04, #FF )
    COP [53]
    LDA $14
    CMP $7F100C, X
    BNE code_0AC1F9
    LDA $16
    CMP $7F100E, X
    BNE code_0AC1F9
    PHX 
    LDA $7F0010, X
    TAX 
    LDA #$0000
    STA $7F0010, X
    PLX 
    COP [80] ( #1A )
    COP [89]
    LDA #$0200
    TSB $10
    COP [DA] ( #77 )
    COP [E0]
}

code_0AC23D {
    LDA $7F0012, X
    INC 
    CMP #$0003
    BEQ code_0AC275
    STA $7F0012, X
    STZ $2C
    STZ $2E
    COP [9B] ( @code_0AC35A )
    LDA #$0200
    TSB $10
    COP [CA] ( #0A )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [DA] ( #01 )
    COP [CB]
    LDA #$0200
    TRB $10
    JMP $&func_0AC1E4
}

code_0AC275 {
    PHX 
    LDA $7F0010, X
    TAX 
    LDA #$FFFF
    STA $7F0010, X
    PLX 
    COP [07] ( #06 )
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [DA] ( #03 )
    COP [E0]
}

code_0AC294 {
    COP [8D] ( #22 )
    COP [2D]
    AND #$0007
    STA $0000
    COP [D9] ( #$0000, &code_list_0AC2A5 )
}

code_list_0AC2A5 [
  &code_0AC2B5   ;00
  &code_0AC2CA   ;01
  &code_0AC2DF   ;02
  &code_0AC2F3   ;03
  &code_0AC308   ;04
  &code_0AC31C   ;05
  &code_0AC331   ;06
  &code_0AC345   ;07
]

code_0AC2B5 {
    COP [C1]
    COP [8B]
    COP [C2]
    COP [84] ( #1A, #1E )
    COP [8A]
    COP [86] ( #1A, #18, #08 )
    COP [8A]
    COP [C5]
}

code_0AC2CA {
    COP [C1]
    COP [8C] ( #02 )
    COP [84] ( #1B, #1E )
    COP [8A]
    COP [87] ( #1B, #18, #05, #06 )
    COP [8A]
    COP [C5]
}

code_0AC2DF {
    COP [C1]
    COP [8C] ( #03 )
    COP [84] ( #1C, #1E )
    COP [8A]
    COP [85] ( #1C, #18, #07 )
    COP [8A]
    COP [C5]
}

code_0AC2F3 {
    COP [C1]
    COP [8C] ( #04 )
    COP [84] ( #1D, #1E )
    COP [8A]
    COP [87] ( #1D, #18, #05, #05 )
    COP [8A]
    COP [C5]
}

code_0AC308 {
    COP [C1]
    COP [8C] ( #05 )
    COP [84] ( #1E, #1E )
    COP [8A]
    COP [86] ( #1E, #18, #07 )
    COP [8A]
    COP [C5]
}

code_0AC31C {
    COP [C1]
    COP [8C] ( #06 )
    COP [84] ( #1F, #1E )
    COP [8A]
    COP [87] ( #1F, #18, #06, #05 )
    COP [8A]
    COP [C5]
}

code_0AC331 {
    COP [C1]
    COP [8C] ( #07 )
    COP [84] ( #20, #1E )
    COP [8A]
    COP [85] ( #20, #18, #08 )
    COP [8A]
    COP [C5]
}

code_0AC345 {
    COP [C1]
    COP [8C] ( #08 )
    COP [84] ( #21, #1E )
    COP [8A]
    COP [87] ( #21, #18, #06, #06 )
    COP [8A]
    COP [C5]
}

code_0AC35A {
    LDA #$0008
    TSB $12
    PEA $&func_0AC39C-1
    COP [35]
    AND #$0003
    BEQ code_0AC372
    DEC 
    BEQ code_0AC37B
    DEC 
    BEQ code_0AC387
    DEC 
    BEQ code_0AC393
}

code_0AC372 {
    LDA #$6000
    TRB $12
    COP [AB] ( #22 )
    RTS 
}

code_0AC37B {
    LDA #$6000
    TRB $12
    COP [AF] ( #01 )
    COP [AA] ( #22 )
    RTS 
}

code_0AC387 {
    LDA #$6000
    TRB $12
    COP [AF] ( #01 )
    COP [AB] ( #22 )
    RTS 
}

code_0AC393 {
    LDA #$6000
    TRB $12
    COP [AA] ( #22 )
    RTS 
}

---------------------------------------------

func_0AC39C {
    COP [C2]
    COP [CA] ( #14 )
    LDY $04
    LDY $24
    LDA $14
    STA $0014, Y
    LDA $16
    STA $0016, Y
    COP [CB]
    COP [E0]
}

---------------------------------------------

h_sg53_knight_armor3 [
  h_actor < #17, #10, #03 >   ;00
]

---------------------------------------------

e_sg53_knight_armor3 {
    JSR $&sub_0AC506
    COP [0B]

  code_0AC3BB:
    COP [80] ( #17 )
    COP [89]

  code_0AC3C0:
    COP [27] ( #1E )
    COP [21] ( #04, &code_0AC3CD )
    COP [C4] ( @code_0AC3C0 )
}

code_0AC3CD {
    COP [9E] ( @code_0AC471, #$FFFF, #$FFDC, #$0212 )
    TXA 
    TYX 
    TAY 
    TYA 
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA #$0001
    STA $7F0010, X
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0AD9F2 )
    COP [8D] ( #19 )
    COP [C1]
    COP [8B]
    LDA $7F0010, X
    BMI code_0AC45E
    BEQ code_0AC403
    RTL 
}

code_0AC403 {
    COP [C8] ( &code_0ADA12 )
    BRA code_0AC3BB
}

---------------------------------------------

h_sg53_knight_armor4 [
  h_actor < #17, #10, #01 >   ;00
]

---------------------------------------------

e_sg53_knight_armor4 {
    JSR $&sub_0AC506
    COP [0B]

  code_0AC411:
    COP [58] ( &code_0AC422 )
    COP [80] ( #17 )
    COP [89]

  code_0AC41A:
    COP [27] ( #1E )
    COP [C4] ( @code_0AC41A )
}

code_0AC422 {
    COP [9E] ( @code_0AC471, #$FFFF, #$FFDC, #$0212 )
    TXA 
    TYX 
    TAY 
    TYA 
    STA $7F0010, X
    TXA 
    TYX 
    TAY 
    LDA #$0001
    STA $7F0010, X
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0AD9F2 )
    COP [8D] ( #19 )
    COP [C1]
    COP [8B]
    LDA $7F0010, X
    BMI code_0AC45E
    BEQ code_0AC458
    RTL 
}

code_0AC458 {
    COP [C8] ( &code_0ADA12 )
    BRA code_0AC411
}

code_0AC45E {
    COP [80] ( #18 )
    COP [89]
    COP [C8] ( &code_0ADA32 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    COP [C1]
    RTL 
}

code_0AC471 {
    JSR $&sub_0ADD59
    LDA #$0000
    STA $7F0012, X
    COP [84] ( #1A, #50 )
    COP [8A]
    LDA #$0200
    TRB $10
    COP [8D] ( #22 )
    COP [C1]
    COP [8B]
    BRA code_0AC499
}

---------------------------------------------

func_0AC48F {
    COP [58] ( &code_0AC4CE )
    COP [84] ( #22, #04 )
    COP [8A]
}

code_0AC499 {
    COP [58] ( &code_0AC4CC )
    LDA #$8022
    STA $7F000A, X
    LDA #$0002
    STA $7F0014, X
    COP [A2] ( @func_00E6A6, #$2000 )
    LDA $player_actor
    STA $0024, Y
    COP [C2]
    LDA #$0030
    STA $24
    COP [C1]
    COP [8B]
    DEC $24
    BMI code_0AC4C8
    RTL 
}

code_0AC4C8 {
    COP [A9]
    BRA func_0AC48F
}

code_0AC4CC {
    COP [A9]
}

code_0AC4CE {
    LDA $7F0012, X
    INC 
    STA $7F0012, X
    CMP #$0003
    BEQ code_0AC4E7
    STZ $2C
    STZ $2E
    COP [9B] ( @code_0AC35A )
    BRA func_0AC48F
}

code_0AC4E7 {
    PHX 
    LDA $7F0010, X
    TAX 
    LDA #$FFFF
    STA $7F0010, X
    PLX 
    COP [07] ( #06 )
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [DA] ( #03 )
    COP [E0]
}

---------------------------------------------

sub_0AC506 {
    LDY $player_actor
    LDA $0014, Y
    CMP $14
    BNE code_0AC51F
    LDA $0016, Y
    CMP $16
    BNE code_0AC51F
    LDA $14
    SEC 
    SBC #$0020
    STA $14
}

code_0AC51F {
    RTS 
}

---------------------------------------------

sub_0ADD59 {
    LDA $14
    STA $7F100C, X
    LDA $16
    STA $7F100E, X
    RTS 
}

---------------------------------------------

code_0AD9D2 {
    COP [CA] ( #19 )
    COP [B7] ( #02 )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #02 )
    COP [DA] ( #01 )
    COP [B7] ( #00 )
    COP [CB]
    COP [B7] ( #02 )
    COP [C5]
}

code_0AD9F2 {
    COP [CA] ( #19 )
    COP [B7] ( #04 )
    COP [C2]
    COP [B7] ( #00 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #04 )
    COP [DA] ( #01 )
    COP [B7] ( #00 )
    COP [CB]
    COP [B7] ( #04 )
    COP [C5]
}

code_0ADA12 {
    COP [CA] ( #19 )
    COP [B7] ( #00 )
    COP [C2]
    COP [B7] ( #02 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #00 )
    COP [DA] ( #01 )
    COP [B7] ( #02 )
    COP [CB]
    COP [B7] ( #00 )
    COP [C5]
}

code_0ADA32 {
    COP [CA] ( #19 )
    COP [B7] ( #00 )
    COP [C2]
    COP [B7] ( #04 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #00 )
    COP [DA] ( #01 )
    COP [B7] ( #04 )
    COP [CB]
    COP [B7] ( #00 )
    COP [C5]
}