
?INCLUDE 'func_06B9F2'

---------------------------------------------

h_daC5_weaver [
  h_actor < #26, #00, #18 >   ;00
]

---------------------------------------------

e_daC5_weaver {
    LDA #$0200
    TSB $12
    LDA $0E
    AND #$0010
    STA $26
    JSL $@func_06B9F2
    LDA $26
    BEQ code_08B482
    LDA $0E
    ORA #$4000
    STA $0E
}

code_08B482 {
    COP [C0] ( &code_08B49C )
    COP [0B]
    COP [C1]
    COP [89]
    COP [23]
    AND #$001F
    STA $08
    COP [C2]
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}

code_08B49C {
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_08B4A7 )
}

code_list_08B4A7 [
  &code_08B4AF   ;00
  &code_08B4B4   ;01
  &code_08B4B9   ;02
  &code_08B4BE   ;03
]

code_08B4AF {
    COP [BF] ( &widestring_08B4C3 )
    RTL 
}

code_08B4B4 {
    COP [BF] ( &widestring_08B4F0 )
    RTL 
}

code_08B4B9 {
    COP [BF] ( &widestring_08B51D )
    RTL 
}

code_08B4BE {
    COP [BF] ( &widestring_08B54A )
    RTL 
}

widestring_08B4C3 `[TPL:E][TPL:0]She [LU1:83]understand. [N]She [LU1:A3]kept working.[PAL:0][END]`

widestring_08B4F0 `[TPL:E][TPL:0]She [LU1:83]understand. [N]She [LU1:A3]kept working.[PAL:0][END]`

widestring_08B51D `[TPL:E][TPL:0]She [LU1:83]understand. [N]She [LU1:A3]kept working.[PAL:0][END]`

widestring_08B54A `[TPL:E][TPL:0]She [LU1:83]understand. [N]She [LU1:A3]kept working.[PAL:0][END]`