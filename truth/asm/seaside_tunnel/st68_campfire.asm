
?INCLUDE 'table_0EDA00'

---------------------------------------------

h_st68_campfire [
  h_actor < #08, #00, #18 >   ;00
]

---------------------------------------------

e_st68_campfire {
    LDA $0AA6
    STA $0000
    COP [D9] ( #$0000, &code_list_06AABC )
}

code_list_06AABC [
  &code_06AAC2   ;00
  &code_06AAD3   ;01
  &code_06AAD3   ;02
]

code_06AAC2 {
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #08 )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_06AAD3 {
    COP [E0]
}