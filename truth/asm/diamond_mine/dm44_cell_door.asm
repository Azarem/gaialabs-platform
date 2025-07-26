
---------------------------------------------

h_dm44_cell_door [
  h_actor < #35, #01, #30 >   ;00
]

---------------------------------------------

e_dm44_cell_door {
    COP [BC] ( #08, #00 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D54B )
    COP [D2] ( #5B, #01 )
    COP [D2] ( #5C, #01 )
    COP [32] ( #7A )
    COP [33]
    COP [CD] ( #$017A )
    COP [E0]
}

code_05D54B {
    COP [D6] ( #0B, &code_05D552 )
    BRA code_05D557
}

code_05D552 {
    COP [D6] ( #0C, &code_05D56D )
}

code_05D557 {
    COP [D0] ( #5B, #01, &code_05D568 )
    COP [D0] ( #5C, #01, &code_05D568 )
    COP [BF] ( &widestring_05D593 )
    RTL 
}

code_05D568 {
    COP [BF] ( &widestring_05D5AC )
    RTL 
}

code_05D56D {
    COP [BF] ( &widestring_05D5D1 )
    COP [BE] ( #02, #02, &code_list_05D577 )
}

code_list_05D577 [
  &code_05D57D   ;00
  &code_05D582   ;01
  &code_05D57D   ;02
]

code_05D57D {
    COP [BF] ( &widestring_05D5FD )
    RTL 
}

code_05D582 {
    COP [BF] ( &widestring_05D5FF )
    COP [D5] ( #0B )
    COP [D5] ( #0C )
    COP [CC] ( #5B )
    COP [CC] ( #5C )
    RTL 
}

widestring_05D593 `[DEF]There are two keyholes.[END]`

widestring_05D5AC `[DEF]Without both keys, [N]the [LU2:58][LU1:FA]open...[END]`

widestring_05D5D1 `[DEF]I [LU1:98]both keys...[N]Put in the keys?[N] Yes[N] No`

widestring_05D5FD `[CLD]`

widestring_05D5FF `[CLR]The key turns with[N]a [LU1:C7]sound.[END]`