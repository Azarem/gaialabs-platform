
?INCLUDE 'stats_01ABF0'

---------------------------------------------

h_mu60_floor_spikes [
  h_actor < #28, #01, #03 >   ;00
]

---------------------------------------------

e_mu60_floor_spikes {
    COP [13] ( &code_069D1D )
    LDA #$&stats_01ABF0
    STA $7F0020, X

  code_069CF7:
    COP [80] ( #28 )
    COP [89]
    COP [DA] ( #27 )
    COP [80] ( #29 )
    COP [89]
    LDA #$0101
    TRB $10
    COP [80] ( #2A )
    COP [89]
    COP [DA] ( #3B )
    LDA #$0101
    TSB $10
    COP [80] ( #2B )
    COP [89]
    BRA code_069CF7
}

code_069D1D {
    COP [E0]
}