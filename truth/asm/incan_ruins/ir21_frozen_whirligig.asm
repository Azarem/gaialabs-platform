

---------------------------------------------

h_ir21_frozen_whirligig [
  h_actor < #1B, #00, #00 >   ;00
]

---------------------------------------------

e_ir21_frozen_whirligig {
    LDA #$0010
    TSB $12
    COP [BC] ( #08, #08 )
    COP [80] ( #1B )
    COP [89]
    COP [C1]
    RTL 
}