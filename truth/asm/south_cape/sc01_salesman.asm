

---------------------------------------------

h_sc01_salesman [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_sc01_salesman {
    COP [C0] ( &code_0482CD )
    COP [C1]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #0D, #12 )
    COP [8A]
    COP [86] ( #0F, #01, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #07, #12 )
    COP [8A]
    COP [86] ( #0E, #04, #11 )
    COP [8A]
    COP [85] ( #11, #01, #11 )
    COP [8A]
    COP [87] ( #11, #03, #11, #11 )
    COP [8A]
    COP [85] ( #11, #01, #11 )
    COP [8A]
    COP [86] ( #0E, #0B, #11 )
    COP [8A]
    COP [85] ( #11, #04, #11 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [87] ( #10, #04, #12, #11 )
    COP [8A]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #05, #12 )
    COP [8A]
    COP [86] ( #0F, #01, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #11, #0C, #11 )
    COP [8A]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_0482D2 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C1]
    RTL 
}

code_0482CD {
    COP [BF] ( &widestring_0482D7 )
    RTL 
}

code_0482D2 {
    COP [BF] ( &widestring_04835C )
    RTL 
}

widestring_0482D7 `[DEF]Salesman: I travel[N][LU1:6D]to people's[N][LU2:77]selling weapons[N][LU2:BB]to fight demons.[FIN]We may [LU1:AF]in troubled[N]times, but I [LU1:FA]sell[N]a weapon to a child.[END]`

widestring_04835C `[DEF]Salesman:[N]Hmmm...[END]`