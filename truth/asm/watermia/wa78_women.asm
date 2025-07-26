
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_wa78_women [
  h_actor < #0A, #00, #10 >   ;00
]

---------------------------------------------

e_wa78_women {
    LDA $0E
    LSR 
    LSR 
    LSR 
    LSR 
    AND #$0003
    CLC 
    ADC #$000A
    STA $28
    STZ $2A
    COP [C1]
    COP [8B]
    JSL $@func_06B9F2
    COP [C0] ( &code_078987 )
    COP [0B]
    COP [C1]
    RTL 
}

code_078987 {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_078992 )
}

code_list_078992 [
  &code_07899E   ;00
  &code_0789A3   ;01
  &code_0789A8   ;02
  &code_0789AD   ;03
  &code_0789B2   ;04
  &code_0789C2   ;05
]

code_07899E {
    COP [BF] ( &widestring_0789C7 )
    RTL 
}

code_0789A3 {
    COP [BF] ( &widestring_078A26 )
    RTL 
}

code_0789A8 {
    COP [BF] ( &widestring_078A73 )
    RTL 
}

code_0789AD {
    COP [BF] ( &widestring_078ABA )
    RTL 
}

code_0789B2 {
    COP [D0] ( #95, #01, &code_0789BD )
    COP [BF] ( &widestring_078AF8 )
    RTL 
}

code_0789BD {
    COP [BF] ( &widestring_078B3B )
    RTL 
}

code_0789C2 {
    COP [BF] ( &widestring_078B73 )
    RTL 
}

widestring_0789C7 `[DEF][SFX:10]Water [LU1:BB]stays in[N]the [LU1:CD]place. It's[N][LU2:44]moving and[N]cleansing itself.[FIN]We [LU1:F1]to live[N][LU1:A5]the water.[END]`

widestring_078A26 `[DEF][SFX:10]Nana: We haven't [N][LU1:99][LU1:8E]our [LU2:67][N][LU2:A4]his [LU2:79][LU2:7F][N]six months ago... [FIN]I [LU2:71]he's OK...[END]`

widestring_078A73 `[DEF][SFX:10]Human [LU1:B0]is not such[N]a simple thing.[FIN]You [LU2:A8]waste your[N][LU1:B0]on gambling.[END]`

widestring_078ABA `[DEF]As you can see, [LU1:9F]a[N]drinking contest. They[N]bet on who [LU1:EF]win.[END]`

widestring_078AF8 `[DEF][LU1:66][LU2:38]the baby[N][LU1:EF]be born. Our family[N]goes [LU1:6B][LU1:E1]jobs[N]in high spirits.[END]`

widestring_078B3B `[DEF][LU1:66]We [LU1:82]need[N]money. Real joy is being[N][LU1:F0]those you love.[END]`

widestring_078B73 `[DEF]The crazy old man has[N]grey hair, but [LU2:AB]say[N]he's [LU1:D3]young.[FIN][LU1:30][LU1:C8]bad[N][LU1:9D]to him.[END]`