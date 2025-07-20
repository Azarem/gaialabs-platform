?INCLUDE 'func_06B9F2'


---------------------------------------------

h_eu91_women1 [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_eu91_women1 {
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    CLC 
    ADC #$002A
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_07C776 )
    COP [0B]
    COP [C1]
    RTL 
}

code_07C776 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_07C781 )
}

code_list_07C781 [
  &code_07C787   ;00
  &code_07C78C   ;01
  &code_07C7A6   ;02
]

code_07C787 {
    COP [BF] ( &widestring_07C7BA )
    RTL 
}

code_07C78C {
    COP [BF] ( &widestring_07C836 )
    COP [BE] ( #02, #02, &code_list_07C796 )
}

code_list_07C796 [
  &code_07C79C   ;00
  &code_07C7A1   ;01
  &code_07C79C   ;02
]

code_07C79C {
    COP [BF] ( &widestring_07C8D5 )
    RTL 
}

code_07C7A1 {
    COP [BF] ( &widestring_07C860 )
    RTL 
}

code_07C7A6 {
    COP [BF] ( &widestring_07C8EC )
    RTL 
    COP [BF] ( &widestring_07C924 )
    RTL 
    COP [BF] ( &widestring_07C926 )
    RTL 
    COP [BF] ( &widestring_07C928 )
    RTL 
}

widestring_07C7BA `[DEF]This is [LU1:F4]the [N]world-famous, Rofsky,[N]and the violinist, [N]Erasquez, live. [FIN]They are [LU2:44]arguing.[N]Geniuses can be[N]so peculiar.[END]`

widestring_07C836 `[DEF]Believe in fortune-[N]telling? [N] Yes [N] No `

widestring_07C860 `[CLR]Mmmm.[N]The future [LU1:AA]dark[N]and uncertain.[FIN]A [LU1:9C][LU1:7B][LU1:EF]enter[N][LU2:B]orbit. Mankind[N][LU1:EF][LU1:71]extinct.[FIN]There [LU1:EF]be nothing[N]but despair!![END]`

widestring_07C8D5 `[CLR]Oh. [N]That's too bad. [END]`

widestring_07C8EC `[DEF][SFX:10]I [LU1:9B][LU1:D9]are people[N]in [LU1:D6][LU1:E2]who can[N]increase [LU1:FE]strength.[END]`

widestring_07C924 `[DEF][END]`

widestring_07C926 `[DEF][END]`

widestring_07C928 `[DEF][END]`