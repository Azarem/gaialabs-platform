
?INCLUDE 'dm_func_0ADB6B'

---------------------------------------------

h_dm41_actor_05D70A [
  h_actor < #30, #00, #00 >   ;00
]

---------------------------------------------

e_dm41_actor_05D70A {
    LDA #$0011
    TSB $12

  code_05D712:
    COP [27] ( #0D )
    COP [80] ( #2F )
    COP [89]
    COP [80] ( #30 )
    COP [89]
    COP [A5] ( @dm_func_0ADB6B, #00, #CE, #$0202 )
    COP [80] ( #31 )
    COP [89]
    COP [DA] ( #3B )
    BRA code_05D712
    TSB $1000
    RTL 
}