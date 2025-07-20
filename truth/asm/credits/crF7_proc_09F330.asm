

---------------------------------------------

h_crF7_proc_09F330 [
  h_thinker < #04, #08 >   ;00
]

---------------------------------------------

e_crF7_proc_09F330 {
    LDA $7F2104, X
    INC 
    STA $7F2104, X
    LSR 
    BCC code_09F34B
    LDA $0720
    STA $0722
    COP [01] ( @dma_data_09F358, #12 )
    RTL 
}

code_09F34B {
    LDA $0720
    STA $0724
    COP [01] ( @dma_data_09F35C, #12 )
    RTL 
}

dma_data_09F358 [
  dma_data < #01, #22, #07 >   ;00
]

dma_data_09F35C [
  dma_data < #01, #24, #07 >   ;00
]