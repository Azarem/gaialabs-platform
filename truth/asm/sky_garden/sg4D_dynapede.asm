
?INCLUDE 'func_00DB8A'
?INCLUDE 'func_00DF15'

---------------------------------------------

h_sg4F_dynapede1 [
  h_actor < #25, #00, #00 >   ;00
]

---------------------------------------------

e_sg4F_dynapede1 {
    LDA #$0080
    TSB $12
    COP [57] ( @code_0AC700 )

  code_0AC52D:
    COP [27] ( #0F )
    JMP $&code_0AC546
}

---------------------------------------------

h_sg4D_dynapede2 [
  h_actor < #23, #00, #00 >   ;00
]

---------------------------------------------

e_sg4D_dynapede2 {
    LDA #$0080
    TSB $12
    COP [57] ( @code_0AC700 )

  code_0AC540:
    COP [27] ( #0F )
    JMP $&code_0AC5DF
}

code_0AC546 {
    LDA $10
    BIT #$4000
    BNE code_0AC52D
    COP [C6] ( &code_0AC546 )
    COP [80] ( #25 )
    COP [89]
    BRA code_0AC561
}

---------------------------------------------

func_0AC558 {
    COP [C6] ( &func_0AC558 )
    COP [80] ( #25 )
    COP [89]
}

code_0AC561 {
    COP [2A] ( #$0020, &code_0AC6CA, &code_0AC56B, &code_0AC6E5 )
}

code_0AC56B {
    COP [C2]
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AC57B )
}

code_list_0AC57B [
  &code_0AC57F   ;00
  &code_0AC597   ;01
]

code_0AC57F {
    COP [15] ( &code_0AC5CD )
    COP [14] ( #00, #FE, &code_0AC5CD )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0AC5F4 )
    JMP $&code_0AC681
}

code_0AC597 {
    COP [15] ( &code_0AC5BB )
    COP [14] ( #00, #FE, &code_0AC5BB )
    COP [C2]
    COP [16] ( &code_0AC5BB )
    COP [14] ( #00, #02, &code_0AC5BB )
    COP [C2]
    COP [80] ( #2D )
    COP [89]
    COP [C6] ( &code_0AC5DF )
    JMP $&code_0AC6A5
}

code_0AC5BB {
    COP [C2]
    COP [18] ( &code_0AC5CD )
    COP [14] ( #02, #00, &code_0AC5CD )
    COP [C8] ( &code_0AC6E5 )
    BRA code_0AC57F
}

code_0AC5CD {
    COP [C2]
    COP [17] ( &code_0AC5BB )
    COP [14] ( #FE, #00, &code_0AC5BB )
    COP [C8] ( &code_0AC6CA )
    BRA code_0AC57F
}

code_0AC5DF {
    LDA $10
    BIT #$4000
    BEQ code_0AC5E9
    JMP $&code_0AC540
}

code_0AC5E9 {
    COP [C6] ( &code_0AC5DF )
    COP [80] ( #23 )
    COP [89]
    BRA code_0AC5FD
}

code_0AC5F4 {
    COP [C6] ( &code_0AC5F4 )
    COP [80] ( #24 )
    COP [89]
}

code_0AC5FD {
    COP [2B] ( #$0020, &code_0AC681, &code_0AC607, &code_0AC6A5 )
}

code_0AC607 {
    COP [C2]
    COP [23]
    AND #$0001
    STA $0000
    COP [D9] ( #$0000, &code_list_0AC617 )
}

code_list_0AC617 [
  &code_0AC637   ;00
  &code_0AC61B   ;01
]

code_0AC61B {
    COP [C6] ( &code_0AC61B )
    COP [18] ( &code_0AC65D )
    COP [14] ( #02, #00, &code_0AC65D )
    COP [C2]
    COP [80] ( #38 )
    COP [89]
    COP [C6] ( &func_0AC558 )
    JMP $&code_0AC6E5
}

code_0AC637 {
    COP [C6] ( &code_0AC637 )
    COP [18] ( &code_0AC66F )
    COP [14] ( #02, #00, &code_0AC66F )
    COP [C2]
    COP [17] ( &code_0AC66F )
    COP [14] ( #FE, #00, &code_0AC66F )
    COP [80] ( #38 )
    COP [89]
    COP [C6] ( &code_0AC546 )
    JMP $&code_0AC6CA
}

code_0AC65D {
    COP [C2]
    COP [16] ( &code_0AC66F )
    COP [14] ( #00, #02, &code_0AC66F )
    COP [C8] ( &code_0AC6A5 )
    BRA code_0AC61B
}

code_0AC66F {
    COP [C2]
    COP [15] ( &code_0AC65D )
    COP [14] ( #00, #FE, &code_0AC65D )
    COP [C8] ( &code_0AC681 )
    BRA code_0AC637
}

code_0AC681 {
    COP [14] ( #00, #FE, &code_0AC607 )
    COP [C2]
    COP [14] ( #00, #FD, &code_0AC607 )
    COP [8D] ( #26 )
    LDA #$2000
    TSB $12
    COP [C1]
    COP [8C] ( #04 )
    COP [AB] ( #3C )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AC6A5 {
    COP [16] ( &code_0AC607 )
    COP [C2]
    COP [14] ( #00, #02, &code_0AC607 )
    COP [8D] ( #27 )
    LDA #$2000
    TRB $12
    COP [AB] ( #3C )
    COP [C1]
    COP [8C] ( #08 )
    COP [AB] ( #00 )
    COP [C1]
    COP [89]
    COP [C5]
}

code_0AC6CA {
    COP [14] ( #FE, #00, &code_0AC56B )
    COP [C2]
    COP [14] ( #FD, #00, &code_0AC56B )
    LDA #$4000
    TSB $12
    COP [81] ( #28, #3D )
    COP [89]
    COP [C5]
}

code_0AC6E5 {
    COP [14] ( #02, #00, &code_0AC56B )
    COP [C2]
    COP [14] ( #03, #00, &code_0AC56B )
    LDA #$4000
    TRB $12
    COP [81] ( #28, #3D )
    COP [89]
    COP [C5]
}

code_0AC700 {
    COP [C1]
    COP [89]
    PHX 
    LDA $28
    AND #$00FF
    SEC 
    SBC #$0023
    TAX 
    LDA $@binary_0AC79A, X
    AND #$00FF
    PLX 
    CMP #$0001
    BEQ code_0AC724
    COP [84] ( #33, #04 )
    COP [8A]
    BRA code_0AC72A
}

code_0AC724 {
    COP [84] ( #34, #04 )
    COP [8A]
}

code_0AC72A {
    LDA #$6000
    TRB $12
    COP [8D] ( #2E )
    COP [C1]
    COP [8B]
    COP [08] ( #$0E0E )
    COP [9E] ( @func_0AC7B2, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7C6, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7D0, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7DA, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7E4, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7EE, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [9E] ( @code_0AC7F8, #$0000, #$0000, #$0302 )
    COP [C2]
    COP [C7] ( @func_00DB8A )
}

---------------------------------------------

binary_0AC79A #010100010100010100010109000001010000000000000001

---------------------------------------------

func_0AC7B2 {
    COP [A5] ( @func_00DF15, #00, #00, #$0302 )
    COP [63] ( #03, #07, #00 )
    COP [AA] ( #03 )
    JMP $&code_0AC7FD
}

code_0AC7C6 {
    COP [63] ( #03, #07, #00 )
    COP [AA] ( #04 )
    BRA code_0AC7FD
}

code_0AC7D0 {
    COP [63] ( #04, #07, #01 )
    COP [AA] ( #01 )
    BRA code_0AC7FD
}

code_0AC7DA {
    COP [63] ( #04, #07, #01 )
    COP [AA] ( #02 )
    BRA code_0AC7FD
}

code_0AC7E4 {
    COP [63] ( #05, #07, #02 )
    COP [AA] ( #11 )
    BRA code_0AC7FD
}

code_0AC7EE {
    COP [63] ( #05, #07, #02 )
    COP [AA] ( #12 )
    BRA code_0AC7FD
}

code_0AC7F8 {
    COP [63] ( #06, #07, #03 )
}

code_0AC7FD {
    COP [64]
    CMP #$0000
    BMI code_0AC808
    COP [C2]
    BRA code_0AC7FD
}

code_0AC808 {
    COP [07] ( #06 )
    COP [C2]
    COP [BC] ( #04, #14 )
    COP [C7] ( @func_00DF15 )
}