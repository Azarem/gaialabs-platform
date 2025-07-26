
?INCLUDE 'func_06B9F2'
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_av69_signs [
  h_actor < #05, #00, #10 >   ;00
]

---------------------------------------------

e_av69_signs {
    JSL $@func_06B9F2
    COP [88] ( @table_0EDA00 )
    COP [80] ( #05 )
    COP [89]
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_06BA28 )
    COP [C1]
    RTL 
}

code_06BA28 {
    LDA $24
    BNE code_06BA31
    COP [BF] ( &widestring_06BA36 )
    RTL 
}

code_06BA31 {
    COP [BF] ( &widestring_06BA6B )
    RTL 
}

widestring_06BA36 `[DEF]       Travellers[N][LU1:3B]use [LU1:D6]room.[N][N]       Angel Tribe[END]`

widestring_06BA6B `[DEF][N] Angel Village Entrance[END]`