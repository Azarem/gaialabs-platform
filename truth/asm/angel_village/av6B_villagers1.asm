
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_av6B_villagers1 [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_av6B_villagers1 {
    LDA $0E
    AND #$0070
    LSR 
    LSR 
    LSR 
    LSR 
    CLC 
    ADC $28
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_06C77D )
    COP [0B]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_06C77D {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_06C788 )
}

code_list_06C788 [
  &code_06C794   ;00
  &code_06C7EA   ;01
  &code_06C840   ;02
  &code_06C896   ;03
  &code_06C97C   ;04
  &code_06C9BA   ;05
]

code_06C794 {
    COP [BF] ( &widestring_06C799 )
    RTL 
}

widestring_06C799 `[TPL:B]This is the Angel [N][LU1:60]If our bodies [N]are [LU1:8D]to the sun [N]for long, we'll perish. [END]`

code_06C7EA {
    COP [BF] ( &widestring_06C7EF )
    RTL 
}

widestring_06C7EF `[TPL:B]This is the Angel [N][LU1:60]If our bodies [N]are [LU1:8D]to the sun [N]for long, we'll perish. [END]`

code_06C840 {
    COP [BF] ( &widestring_06C845 )
    RTL 
}

widestring_06C845 `[TPL:B]This is the Angel [N][LU1:60]If our bodies [N]are [LU1:8D]to the sun [N]for long, we'll perish. [END]`

code_06C896 {
    COP [BF] ( &widestring_06C8B0 )
    COP [BE] ( #02, #02, &code_list_06C8A0 )
}

code_list_06C8A0 [
  &code_06C8A6   ;00
  &code_06C8AB   ;01
  &code_06C8A6   ;02
]

code_06C8A6 {
    COP [BF] ( &widestring_06C8DC )
    RTL 
}

code_06C8AB {
    COP [BF] ( &widestring_06C8F7 )
    RTL 
}

widestring_06C8B0 `[DEF]Do you [LU1:A4][N]the painter, Ishtar? [N] Yes [N] No `

widestring_06C8DC `[CLR]You [LU1:CA]speak [N][LU1:F0]everyone. [END]`

widestring_06C8F7 `[CLR][LU2:17]studio is[N]on the [LU1:BD]side[N]of [LU1:D6]door.[FIN]But in front, creatures [N][LU1:F0]hate in [LU1:E1][N]hearts are waiting. [FIN]If you [LU1:B2]go, you[N]can open the door.[END]`

code_06C97C {
    COP [BF] ( &widestring_06C981 )
    RTL 
}

widestring_06C981 `[TPL:A]I am a sculptor. I plan[N]to [LU2:84]1000 [LU1:D2][N]in my lifetime...[END]`

code_06C9BA {
    COP [BF] ( &widestring_06C9BF )
    RTL 
}

widestring_06C9BF `[TPL:B]This is the Angel [N][LU1:60]If our bodies [N]are [LU1:8D]to the sun [N]for long, we'll perish. [END]`