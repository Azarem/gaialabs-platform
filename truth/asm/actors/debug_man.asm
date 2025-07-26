
---------------------------------------------

h_debug_man [
  h_actor < #02, #00, #10 >   ;00
]

---------------------------------------------

e_debug_man {
    COP [0B]
    COP [C0] ( &code_0BEE2C )
    COP [C1]
    RTL 
}

code_0BEE2C {
    LDA #$0028
    STA $0ACA
    STA $0ACE
    LDA #$007F
    STA $0ADE
    STA $0ADC
    LDA #$00FF
    STA $0AA2
    COP [BF] ( &widestring_0BF010 )
    COP [BE] ( #04, #00, &code_list_0BEE4E )
}

code_list_0BEE4E [
  &code_0BEED0   ;00
  &code_0BEE58   ;01
  &code_0BEED5   ;02
  &code_0BEEF3   ;03
  &code_0BEEE4   ;04
]

code_0BEE58 {
    COP [BF] ( &widestring_0BF05C )
    COP [BE] ( #04, #00, &code_list_0BEE62 )
}

code_list_0BEE62 [
  &code_0BEED0   ;00
  &code_0BEE6C   ;01
  &code_0BEF02   ;02
  &code_0BEF11   ;03
  &code_0BEF20   ;04
]

code_0BEE6C {
    COP [BF] ( &widestring_0BF095 )
    COP [BE] ( #04, #00, &code_list_0BEE76 )
}

code_list_0BEE76 [
  &code_0BEED0   ;00
  &code_0BEE80   ;01
  &code_0BEF2F   ;02
  &code_0BEF3E   ;03
  &code_0BEF4D   ;04
]

code_0BEE80 {
    COP [BF] ( &widestring_0BF0C3 )
    COP [BE] ( #04, #00, &code_list_0BEE8A )
}

code_list_0BEE8A [
  &code_0BEED0   ;00
  &code_0BEE94   ;01
  &code_0BEF5C   ;02
  &code_0BEF6B   ;03
  &code_0BEF7A   ;04
]

code_0BEE94 {
    COP [BF] ( &widestring_0BF0EC )
    COP [BE] ( #04, #00, &code_list_0BEE9E )
}

code_list_0BEE9E [
  &code_0BEED0   ;00
  &code_0BEEA8   ;01
  &code_0BEF89   ;02
  &code_0BEF98   ;03
  &code_0BEFA7   ;04
]

code_0BEEA8 {
    COP [BF] ( &widestring_0BF10D )
    COP [BE] ( #04, #00, &code_list_0BEEB2 )
}

code_list_0BEEB2 [
  &code_0BEED0   ;00
  &code_0BEEBC   ;01
  &code_0BEFB6   ;02
  &code_0BEFC5   ;03
  &code_0BEFD4   ;04
]

code_0BEEBC {
    COP [BF] ( &widestring_0BF135 )
    COP [BE] ( #04, #00, &code_list_0BEEC6 )
}

code_list_0BEEC6 [
  &code_0BEED0   ;00
  &code_0BEED0   ;01
  &code_0BEFE3   ;02
  &code_0BEFF2   ;03
  &code_0BF001   ;04
]

code_0BEED0 {
    COP [BF] ( &widestring_0BF15A )
    RTL 
}

code_0BEED5 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #82, #$0020, #$0090, #07, #$1800 )
    RTL 
}

code_0BEEE4 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #0A, #$01E3, #$00A0, #03, #$4500 )
    RTL 
}

code_0BEEF3 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #E5, #$00A8, #$00A0, #00, #$1100 )
    RTL 
}

code_0BEF02 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #15, #$0339, #$01B0, #00, #$3500 )
    RTL 
}

code_0BEF11 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #1A, #$0110, #$00C3, #00, #$2200 )
    RTL 
}

code_0BEF20 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #0F, #$0078, #$05D0, #00, #$6100 )
    RTL 
}

code_0BEF2F {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #91, #$0370, #$0430, #03, #$5400 )
    RTL 
}

code_0BEF3E {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #AC, #$01C0, #$01D0, #07, #$2200 )
    RTL 
}

code_0BEF4D {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #C3, #$0010, #$00E8, #07, #$2300 )
    RTL 
}

code_0BEF5C {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #1C, #$006C, #$0174, #07, #$2200 )
    RTL 
}

code_0BEF6B {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #32, #$0138, #$0360, #07, #$4500 )
    RTL 
}

code_0BEF7A {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #3E, #$00B0, #$03D0, #07, #$4200 )
    RTL 
}

code_0BEF89 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #4C, #$0100, #$0136, #07, #$2200 )
    RTL 
}

code_0BEF98 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #5A, #$0088, #$00A0, #07, #$6400 )
    RTL 
}

code_0BEFA7 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #5F, #$0088, #$0050, #07, #$4400 )
    RTL 
}

code_0BEFB6 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #69, #$02A8, #$00A0, #07, #$1300 )
    RTL 
}

code_0BEFC5 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #AC, #$01C8, #$01E0, #07, #$2200 )
    RTL 
}

code_0BEFD4 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #C3, #$0020, #$00F0, #07, #$2300 )
    RTL 
}

code_0BEFE3 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #CC, #$002C, #$00E0, #07, #$4400 )
    RTL 
}

code_0BEFF2 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #78, #$027E, #$03A0, #07, #$4500 )
    RTL 
}

code_0BF001 {
    COP [BF] ( &widestring_0BF164 )
    COP [26] ( #B0, #$0200, #$04D0, #07, #$5400 )
    RTL 
}

widestring_0BF010 `[DEF]Hello! I am Debug-man![N][LU1:65]you go?[FIN] Others[N] [LU1:16]Wall[N] LAST GAIA LOOK[N] EDOWA-DO`

widestring_0BF05C `[CLR] Others[N] Itorie[N] HOME OF MOON TRIBE[N] Underground castle`

widestring_0BF095 `[CLR] Others[N] [LU1:8]of Euro[N] [LU2:22]Village[N] [LU2:8]Village Dao`

widestring_0BF0C3 `[CLR] Others[N] INCA[N] HANANOMIYAKO[N] DAIYAMONDO`

widestring_0BF0EC `[CLR] Others[N] Sky Garden[N] Palace[N] Mu`

widestring_0BF10D `[CLR] Others[N] Angel Village[N] [LU2:22]Village[N] Dao`

widestring_0BF135 `[CLR] Quit[N] Pyramid[N] Watermia[N] Ankor Wat`

widestring_0BF15A `[CLR]Bye bye![END]`

widestring_0BF164 `[CLR]Ok![N]See you again![END]`