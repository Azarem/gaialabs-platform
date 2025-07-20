
!WH0                            2126

---------------------------------------------

h_thinker_00BBAF [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_thinker_00BBAF {
    LDA $0D96
    BMI code_00BBBC
    LDA $0036
    LSR 
    BCC code_00BBC7
}

code_00BBBC {
    LDA $0D92
    BPL code_00BBCF
    LDA #$00FF
    STA $WH0
}

code_00BBC7 {
    COP [02] ( @dma_data_00BC4C, #26 )
    BRA code_00BBEC
}

code_00BBCF {
    BNE code_00BBD9
    COP [02] ( @dma_data_00BC4D, #26 )
    BRA code_00BBEC
}

code_00BBD9 {
    DEC 
    BNE code_00BBE4
    COP [02] ( @dma_data_00BC57, #26 )
    BRA code_00BBEC
}

code_00BBE4 {
    COP [02] ( @dma_data_00BC61, #26 )
    BRA code_00BBEC
}

code_00BBEC {
    LDA $0D96
    BPL code_00BBFF
    LDA #$00FF
    STA $WH0
    COP [02] ( @dma_data_00BC4C, #26 )
    BRA code_00BC1C
}

code_00BBFF {
    BNE code_00BC09
    COP [02] ( @dma_data_00BC4D, #26 )
    BRA code_00BC1C
}

code_00BC09 {
    DEC 
    BNE code_00BC14
    COP [02] ( @dma_data_00BC57, #26 )
    BRA code_00BC1C
}

code_00BC14 {
    COP [02] ( @dma_data_00BC61, #26 )
    BRA code_00BC1C
}

code_00BC1C {
    LDA $0D98
    BPL code_00BC28
    COP [02] ( @dma_data_00BC6E, #26 )
    RTL 
}

code_00BC28 {
    BNE code_00BC31
    COP [02] ( @dma_data_00BC6F, #26 )
    RTL 
}

code_00BC31 {
    DEC 
    BNE code_00BC3B
    COP [02] ( @dma_data_00BC79, #26 )
    RTL 
}

code_00BC3B {
    DEC 
    BNE code_00BC45
    COP [02] ( @dma_data_00BC83, #26 )
    RTL 
}

code_00BC45 {
    COP [02] ( @dma_data_00BC8D, #26 )
    RTL 
}

dma_data_00BC4D [
  dma_data < #4F, #FF, #00 >   ;00
  dma_data < #1F, #10, #F0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]

dma_data_00BC4C [
]

dma_data_00BC57 [
  dma_data < #6F, #FF, #00 >   ;00
  dma_data < #1F, #10, #F0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]

dma_data_00BC61 [
  dma_data < #10, #FF, #00 >   ;00
  dma_data < #7F, #FF, #00 >   ;01
  dma_data < #1F, #10, #F0 >   ;02
  dma_data < #60, #FF, #00 >   ;03
]

dma_data_00BC6E [
]

dma_data_00BC6F [
  dma_data < #4F, #FF, #00 >   ;00
  dma_data < #0F, #30, #D0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]

dma_data_00BC79 [
  dma_data < #5F, #FF, #00 >   ;00
  dma_data < #0F, #30, #D0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]

dma_data_00BC83 [
  dma_data < #6F, #FF, #00 >   ;00
  dma_data < #0F, #30, #D0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]

dma_data_00BC8D [
  dma_data < #7F, #FF, #00 >   ;00
  dma_data < #0F, #30, #D0 >   ;01
  dma_data < #60, #FF, #00 >   ;02
]