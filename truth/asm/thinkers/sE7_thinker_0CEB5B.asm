
---------------------------------------------

h_sE7_thinker_0CEB5B [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_sE7_thinker_0CEB5B {
    COP [C2]
    LDA $0720
    CLC 
    ADC #$FFF8
    STA $0720
    COP [01] ( @dma_data_0CEB70, #0E )
    RTL 
}

dma_data_0CEB70 [
  dma_data < #20, #20, #07 >   ;00
]