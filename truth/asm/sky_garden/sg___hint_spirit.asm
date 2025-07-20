

---------------------------------------------

h_sg___hint_spirit [
  h_actor < #3C, #00, #10 >   ;00
]

---------------------------------------------

e_sg___hint_spirit {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05F4D7 )
    COP [0B]
    COP [C1]
    COP [80] ( #3C )
    COP [89]
    RTL 
}

code_05F4D7 {
    COP [BF] ( &widestring_05F4DC )
    RTL 
}

widestring_05F4DC `[DEF][LU1:31]Tribe: [N]Attack [LU1:F6]the [LU1:7][N]Bird cries. [END]`