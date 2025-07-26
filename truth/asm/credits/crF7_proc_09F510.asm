
---------------------------------------------

h_crF7_proc_09F510 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_crF7_proc_09F510 {
    LDA $00E4
    BPL code_09F518
    RTL 
}

code_09F518 {
    JSR $&sub_09F68D
    COP [69] ( #$2FA8 )
    LDA #$0258
    STA $0E
    COP [C1]
    LDA $0E
    AND #$000F
    BNE code_09F54C
    LDA $0762
    BMI code_09F540
    LDA #$FFFF
    STA $0762
    LDA #$0001
    STA $0764
    BRA code_09F54C
}

code_09F540 {
    LDA #$0001
    STA $0762
    LDA #$FFFF
    STA $0764
}

code_09F54C {
    COP [01] ( @dma_data_09F5C6, #0F )
    DEC $0E
    BMI code_09F557
    RTL 
}

code_09F557 {
    JSR $&sub_09F68D
    COP [69] ( #$3CF0 )
    LDA #$0258
    STA $0E
    COP [C1]
    PHX 
    LDX #$0000

  code_09F569:
    LDA $000760, X
    SEC 
    SBC #$0001
    STA $000760, X
    TXA 
    LSR 
    INC 
    CLC 
    ADC $000760, X
    BMI code_09F588
    INX 
    INX 
    CPX #$0080
    BCC code_09F569
    BRA code_09F59B
}

code_09F588 {
    LDA $000760, X
    CLC 
    ADC #$0040
    STA $000760, X
    INX 
    INX 
    CPX #$0080
    BCC code_09F569
}

code_09F59B {
    PLX 
    LDA $0E
    LSR 
    BCC code_09F5AB
    LDA $06C0
    CLC 
    ADC #$0001
    STA $06C0
}

code_09F5AB {
    COP [01] ( @dma_data_09F5BC, #10 )
    DEC $0E
    BMI code_09F5B6
    RTL 
}

code_09F5B6 {
    STZ $06C0
    COP [3D]
    RTL 
}

dma_data_09F5BC [
  dma_data < #60, #1E, #07 >   ;00
  dma_data < #C0, #60, #07 >   ;01
  dma_data < #01, #1E, #07 >   ;02
]

dma_data_09F5C6 [
  dma_data < #60, #60, #07 >   ;00
  dma_data < #01, #62, #07 >   ;01
  dma_data < #01, #64, #07 >   ;02
  dma_data < #01, #62, #07 >   ;03
  dma_data < #01, #64, #07 >   ;04
  dma_data < #01, #62, #07 >   ;05
  dma_data < #01, #64, #07 >   ;06
  dma_data < #01, #62, #07 >   ;07
  dma_data < #01, #64, #07 >   ;08
  dma_data < #01, #62, #07 >   ;09
  dma_data < #01, #64, #07 >   ;0A
  dma_data < #01, #62, #07 >   ;0B
  dma_data < #01, #64, #07 >   ;0C
  dma_data < #01, #62, #07 >   ;0D
  dma_data < #01, #64, #07 >   ;0E
  dma_data < #01, #62, #07 >   ;0F
  dma_data < #01, #64, #07 >   ;10
  dma_data < #01, #62, #07 >   ;11
  dma_data < #01, #64, #07 >   ;12
  dma_data < #01, #62, #07 >   ;13
  dma_data < #01, #64, #07 >   ;14
  dma_data < #01, #62, #07 >   ;15
  dma_data < #01, #64, #07 >   ;16
  dma_data < #01, #62, #07 >   ;17
  dma_data < #01, #64, #07 >   ;18
  dma_data < #01, #62, #07 >   ;19
  dma_data < #01, #64, #07 >   ;1A
  dma_data < #01, #62, #07 >   ;1B
  dma_data < #01, #64, #07 >   ;1C
  dma_data < #01, #62, #07 >   ;1D
  dma_data < #01, #64, #07 >   ;1E
  dma_data < #01, #62, #07 >   ;1F
  dma_data < #01, #64, #07 >   ;20
  dma_data < #01, #62, #07 >   ;21
  dma_data < #01, #64, #07 >   ;22
  dma_data < #01, #62, #07 >   ;23
  dma_data < #01, #64, #07 >   ;24
  dma_data < #01, #62, #07 >   ;25
  dma_data < #01, #64, #07 >   ;26
  dma_data < #01, #62, #07 >   ;27
  dma_data < #01, #64, #07 >   ;28
  dma_data < #01, #62, #07 >   ;29
  dma_data < #01, #64, #07 >   ;2A
  dma_data < #01, #62, #07 >   ;2B
  dma_data < #01, #64, #07 >   ;2C
  dma_data < #01, #62, #07 >   ;2D
  dma_data < #01, #64, #07 >   ;2E
  dma_data < #01, #62, #07 >   ;2F
  dma_data < #01, #64, #07 >   ;30
  dma_data < #01, #62, #07 >   ;31
  dma_data < #01, #64, #07 >   ;32
  dma_data < #01, #62, #07 >   ;33
  dma_data < #01, #64, #07 >   ;34
  dma_data < #01, #62, #07 >   ;35
  dma_data < #01, #64, #07 >   ;36
  dma_data < #01, #62, #07 >   ;37
  dma_data < #01, #64, #07 >   ;38
  dma_data < #01, #62, #07 >   ;39
  dma_data < #01, #64, #07 >   ;3A
  dma_data < #01, #62, #07 >   ;3B
  dma_data < #01, #64, #07 >   ;3C
  dma_data < #01, #62, #07 >   ;3D
  dma_data < #01, #64, #07 >   ;3E
  dma_data < #01, #62, #07 >   ;3F
  dma_data < #01, #64, #07 >   ;40
  dma_data < #01, #60, #07 >   ;41
]

---------------------------------------------

sub_09F68D {
    PHX 
    LDA #$0000
    TAX 

  code_09F692:
    STA $000760, X
    INX 
    INX 
    CPX #$0080
    BCC code_09F692
    PLX 
    RTS 
}