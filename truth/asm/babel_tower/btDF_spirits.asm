?INCLUDE 'table_0EDA00'


---------------------------------------------

h_btDF_spirits [
  h_actor < #00, #00, #10 >   ;00
]

---------------------------------------------

e_btDF_spirits {
    LDA #$0200
    TSB $12
    LDA $0E
    STA $24
    LDA #$2000
    STA $0E
    LDA #$2000
    TRB $10
    COP [88] ( @table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C0] ( &code_099B5A )
    COP [C1]
    COP [80] ( #04 )
    COP [89]
    RTL 
}

code_099B5A {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_099B65 )
}

code_list_099B65 [
  &code_099B71   ;00
  &code_099B76   ;01
  &code_099B7B   ;02
  &code_099B80   ;03
  &code_099B85   ;04
  &code_099B8A   ;05
]

code_099B71 {
    COP [BF] ( &widestring_099B8F )
    RTL 
}

code_099B76 {
    COP [BF] ( &widestring_099C1E )
    RTL 
}

code_099B7B {
    COP [BF] ( &widestring_099C95 )
    RTL 
}

code_099B80 {
    COP [BF] ( &widestring_099D16 )
    RTL 
}

code_099B85 {
    COP [BF] ( &widestring_099DE5 )
    RTL 
}

code_099B8A {
    COP [BF] ( &widestring_099E34 )
    RTL 
}

widestring_099B8F `[TPL:B]The [LU1:A8]released[N][LU1:8E]the [LU1:7B]has a[N]profound effect on the[N]growth of [LU1:B1]things.[FIN][LU1:61]the star nears[N][LU2:B]orbit, all[N][LU1:B1][LU1:E0]experience[N]a dramatic evolution...[END]`

widestring_099C1E `[TPL:B]The passage of [LU1:DF]is[N][LU1:86][LU1:A2]the[N]Tower of Babel... [N]Time races by...[FIN][LU1:69]not normal human[N]beings, because[N]you can [LU1:AF]here...[END]`

widestring_099C95 `[TPL:A]The evolution of living[N][LU1:E0]took a [LU1:A6]time.[FIN][LU2:11]insects to fish,[N][LU1:8E]reptiles to mammals,[N][LU2:B6]humans [LU1:F2]born.[FIN]And so [LU1:9A]beings[N][LU1:98]evolved.[END]`

widestring_099D16 `[TPL:A][LU2:11][LU1:6F][LU2:AA][N]comets [LU1:98][LU1:70][LU2:54][N]the spirits of stars,[FIN]but [LU2:48]the demon [N]of stars. [FIN]The one now nearing [N]the [LU1:14]is a demon [N]of stars... [FIN]The [LU1:7B]is the highest[N]form of consciousness.[FIN]The [LU1:14][LU1:EF]evolve [N]beyond imagination...[END]`

widestring_099DE5 `[TPL:B]In [LU1:D7]room are demons[N]evolved by the light.[N]You [LU1:B2]put [LU1:E6]to[N]sleep [LU1:74]you go up.[END]`

widestring_099E34 `[TPL:B]The [LU1:14]took a wrong[N][LU2:B9]on its path[N]of evolution...[FIN][LU1:68]battle [LU1:EF]change[N]the [LU2:6B]of humanity.[END]`