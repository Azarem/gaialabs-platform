
?INCLUDE 'entry_points_00C418'

!scene_current                  0644
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_sg4D_jump_handler [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_sg4D_jump_handler {
    PHX 
    LDX #$0000

  code_05F772:
    LDA $@array_05F7BB, X
    CMP #$FFFF
    BEQ code_05F7B8
    CMP $scene_current
    BNE code_05F792
    LDA $@array_05F7BB+2, X
    CMP $player_x_pos
    BNE code_05F792
    LDA $@array_05F7BB+4, X
    CMP $player_y_pos
    BEQ code_05F79A
}

code_05F792 {
    TXA 
    CLC 
    ADC #$0006
    TAX 
    BRA code_05F772
}

code_05F79A {
    LDY $player_actor
    LDA #$*func_00C4D1
    STA $0002, Y
    LDA #$&func_00C4D1
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    STA $002A, Y
    LDA #$0800
    TSB $player_flags
}

code_05F7B8 {
    PLX 
    COP [E0]
}

---------------------------------------------

array_05F7BB [
  unk9 < #$004D, #$0308, #$0290 >   ;00
  unk9 < #$004D, #$0258, #$03D0 >   ;01
  unk9 < #$004D, #$0098, #$03D0 >   ;02
  unk9 < #$004E, #$00E8, #$0280 >   ;03
  unk9 < #$004E, #$0198, #$03C0 >   ;04
  unk9 < #$004E, #$0358, #$03C0 >   ;05
  unk9 < #$004F, #$0338, #$0110 >   ;06
  unk9 < #$004F, #$0158, #$00F0 >   ;07
  unk9 < #$004F, #$01F8, #$0280 >   ;08
  unk9 < #$0050, #$00B8, #$0100 >   ;09
  unk9 < #$0050, #$0298, #$00E0 >   ;0A
  unk9 < #$0050, #$01F8, #$0270 >   ;0B
  unk9 < #$0051, #$02A8, #$0140 >   ;0C
  unk9 < #$0051, #$00E8, #$0100 >   ;0D
  unk9 < #$0051, #$0358, #$03C0 >   ;0E
  unk9 < #$0052, #$0148, #$0130 >   ;0F
  unk9 < #$0052, #$0308, #$00F0 >   ;10
  unk9 < #$0052, #$0098, #$03B0 >   ;11
  unk9 < #$0053, #$0208, #$0290 >   ;12
  unk9 < #$0053, #$0068, #$03E0 >   ;13
  unk9 < #$0053, #$02E8, #$02E0 >   ;14
  unk9 < #$0053, #$00A8, #$0100 >   ;15
  unk9 < #$0054, #$01E8, #$0270 >   ;16
  unk9 < #$0054, #$0388, #$03D0 >   ;17
  unk9 < #$0054, #$0108, #$02F0 >   ;18
  unk9 < #$0054, #$0348, #$00F0 >   ;19
]