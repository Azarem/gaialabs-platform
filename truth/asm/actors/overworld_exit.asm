
!scene_current                  0644
!player_y_pos                   09A4

---------------------------------------------

h_overworld_exit [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_overworld_exit {
    LDA $scene_current
    CMP #$0001
    BNE code_00CA50
    JMP $&code_00CACA
}

code_00CA50 {
    CMP #$000A
    BNE code_00CA58
    JMP $&code_00CB11
}

code_00CA58 {
    CMP #$0015
    BNE code_00CA60
    JMP $&code_00CB2A
}

code_00CA60 {
    CMP #$001C
    BNE code_00CA68
    JMP $&code_00CB5F
}

code_00CA68 {
    CMP #$0032
    BNE code_00CA70
    JMP $&code_00CB78
}

code_00CA70 {
    CMP #$003E
    BNE code_00CA78
    JMP $&code_00CBA7
}

code_00CA78 {
    CMP #$0069
    BNE code_00CA80
    JMP $&code_00CBC0
}

code_00CA80 {
    CMP #$0078
    BNE code_00CA88
    JMP $&code_00CBEF
}

code_00CA88 {
    CMP #$0082
    BNE code_00CA90
    JMP $&code_00CC34
}

code_00CA90 {
    CMP #$0091
    BNE code_00CA98
    JMP $&code_00CC4D
}

code_00CA98 {
    CMP #$00A0
    BNE code_00CAA0
    JMP $&code_00CC92
}

code_00CAA0 {
    CMP #$00AC
    BNE code_00CAA8
    JMP $&code_00CCAB
}

code_00CAA8 {
    CMP #$00B0
    BNE code_00CAB0
    JMP $&code_00CCF0
}

code_00CAB0 {
    CMP #$00C3
    BNE code_00CAB8
    JMP $&code_00CD09
}

code_00CAB8 {
    CMP #$00CC
    BNE code_00CAC0
    JMP $&code_00CD38
}

code_00CAC0 {
    RTL 

  code_00CAC1:
    LDA #$0400
    STA $064A
    COP [C1]
    RTL 
}

code_00CACA {
    COP [C1]
    LDA $player_y_pos
    CMP #$0010
    BCC code_00CAD5
    RTL 
}

code_00CAD5 {
    COP [D0] ( #26, #01, &code_00CAF1 )
    COP [D0] ( #25, #01, &code_00CB01 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$00D4, #$03A4, #01 )
    JMP $&code_00CAC1
}

code_00CAF1 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$00D4, #$03A4, #02 )
    JMP $&code_00CAC1
}

code_00CB01 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$00D4, #$03A4, #1B )
    JMP $&code_00CAC1
}

code_00CB11 {
    LDA $player_y_pos
    CMP #$02D0
    BEQ code_00CB1A
    RTL 
}

code_00CB1A {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0104, #$0334, #03 )
    JMP $&code_00CAC1
}

code_00CB2A {
    COP [D0] ( #01, #01, &code_00CB38 )
    COP [45] ( #2D, #2E, #2F, #30, &code_00CB39 )
}

code_00CB38 {
    RTL 
}

code_00CB39 {
    COP [D0] ( #4A, #01, &code_00CB4F )
    LDA #$0000
    STA $0D60
    COP [66] ( #$00C4, #$02B4, #04 )
    JMP $&code_00CAC1
}

code_00CB4F {
    LDA #$0000
    STA $0D60
    COP [66] ( #$00C4, #$02B4, #06 )
    JMP $&code_00CAC1
}

code_00CB5F {
    COP [45] ( #06, #1C, #08, #1E, &code_00CB68 )
    RTL 
}

code_00CB68 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0134, #$0284, #05 )
    JMP $&code_00CAC1
}

code_00CB78 {
    COP [45] ( #12, #3C, #16, #3E, &code_00CB81 )
    RTL 
}

code_00CB81 {
    COP [D0] ( #65, #01, &code_00CB97 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$0254, #$02D4, #09 )
    JMP $&code_00CAC1
}

code_00CB97 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0254, #$02D4, #07 )
    JMP $&code_00CAC1
}

code_00CBA7 {
    COP [45] ( #0A, #3F, #0C, #40, &code_00CBB0 )
    RTL 
}

code_00CBB0 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0334, #$0334, #08 )
    JMP $&code_00CAC1
}

code_00CBC0 {
    COP [45] ( #29, #0D, #2C, #0F, &code_00CBC9 )
    RTL 
}

code_00CBC9 {
    COP [D0] ( #8D, #01, &code_00CBDF )
    LDA #$0000
    STA $0D60
    COP [66] ( #$0384, #$0164, #15 )
    JMP $&code_00CAC1
}

code_00CBDF {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0384, #$0164, #0A )
    JMP $&code_00CAC1
}

code_00CBEF {
    COP [45] ( #27, #3D, #29, #40, &code_00CBF8 )
    RTL 
}

code_00CBF8 {
    COP [D0] ( #94, #01, &code_00CC24 )
    COP [D0] ( #8E, #01, &code_00CC14 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$02D4, #$01A4, #0B )
    JMP $&code_00CAC1
}

code_00CC14 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$02D4, #$01A4, #0C )
    JMP $&code_00CAC1
}

code_00CC24 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$02D4, #$01A4, #0E )
    JMP $&code_00CAC1
}

code_00CC34 {
    COP [45] ( #00, #08, #01, #0B, &code_00CC3D )
    RTL 
}

code_00CC3D {
    LDA #$0000
    STA $0D60
    COP [66] ( #$02A4, #$0124, #0D )
    JMP $&code_00CAC1
}

code_00CC4D {
    COP [45] ( #3F, #42, #40, #48, &code_00CC56 )
    RTL 
}

code_00CC56 {
    COP [D0] ( #AC, #01, &code_00CC82 )
    COP [D0] ( #9F, #01, &code_00CC72 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$01D4, #$0134, #0F )
    JMP $&code_00CAC1
}

code_00CC72 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$01D4, #$0134, #10 )
    JMP $&code_00CAC1
}

code_00CC82 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$01D4, #$0134, #1A )
    JMP $&code_00CAC1
}

code_00CC92 {
    COP [45] ( #2F, #1B, #30, #1C, &code_00CC9B )
    RTL 
}

code_00CC9B {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0214, #$00B4, #11 )
    JMP $&code_00CAC1
}

code_00CCAB {
    COP [45] ( #1F, #1B, #20, #20, &code_00CCB4 )
    RTL 
}

code_00CCB4 {
    COP [D0] ( #B6, #01, &code_00CCE0 )
    COP [D0] ( #B1, #01, &code_00CCD0 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$0124, #$01A4, #12 )
    JMP $&code_00CAC1
}

code_00CCD0 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0124, #$01A4, #13 )
    JMP $&code_00CAC1
}

code_00CCE0 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0124, #$01A4, #19 )
    JMP $&code_00CAC1
}

code_00CCF0 {
    COP [45] ( #1D, #4F, #24, #50, &code_00CCF9 )
    RTL 
}

code_00CCF9 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0134, #$0154, #14 )
    JMP $&code_00CAC1
}

code_00CD09 {
    COP [45] ( #00, #0D, #01, #11, &code_00CD12 )
    RTL 
}

code_00CD12 {
    COP [D0] ( #B4, #01, &code_00CD28 )
    LDA #$0000
    STA $0D60
    COP [66] ( #$0094, #$0114, #16 )
    JMP $&code_00CAC1
}

code_00CD28 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0094, #$0114, #17 )
    JMP $&code_00CAC1
}

code_00CD38 {
    COP [45] ( #00, #0D, #01, #0F, &code_00CD49 )
    COP [45] ( #3F, #0D, #40, #0F, &code_00CD49 )
    RTL 
}

code_00CD49 {
    LDA #$0000
    STA $0D60
    COP [66] ( #$0074, #$00B4, #18 )
    JMP $&code_00CAC1
}