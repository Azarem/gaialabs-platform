
?INCLUDE 'stats_01ABF0'

---------------------------------------------

h_mu64_switch_spikes [
  h_actor < #2A, #01, #03 >   ;00
]

---------------------------------------------

e_mu64_switch_spikes {
    LDA #$&stats_01ABF0
    STA $7F0020, X

  code_069D29:
    COP [80] ( #2A )
    COP [89]
    COP [0B]
    COP [D2] ( #0F, #01 )
    COP [0C]
    COP [80] ( #2B )
    COP [89]
    COP [80] ( #28 )
    COP [89]
    COP [DA] ( #C7 )
    COP [80] ( #29 )
    COP [89]
    COP [CE] ( #0F )
    BRA code_069D29
}