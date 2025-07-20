?INCLUDE 'chunk_008000'
?INCLUDE 'func_0AA3FD'


---------------------------------------------

h_dm3F_laborer [
  h_actor < #0C, #00, #10 >   ;00
]

---------------------------------------------

e_dm3F_laborer {
    LDA #$1000
    TSB $12
    LDA $0E
    STA $24
    PHX 
    TAX 
    LDA $@binary_0AA72F, X
    PLX 
    AND #$00FF
    JSL $@func_00B4B7
    BCC code_0AA6D5
    JMP $&code_0AA72D
}

code_0AA6D5 {
    LDA #$2000
    STA $0E
    LDA #$0200
    TSB $12
    COP [9C] ( @code_0AA9E0, #$0100 )
    COP [0B]
    COP [C0] ( &func_0AA733 )
    COP [C1]
    LDY $06
    LDA $0010, Y
    BIT #$0040
    BNE code_0AA6F9
    RTL 
}

code_0AA6F9 {
    COP [C0] ( &code_0AA738 )
    COP [C1]
    RTL 
}

---------------------------------------------

func_0AA700 {
    COP [C0] ( #$0000 )
    LDA #$0800
    TSB $10
    COP [0C]
    LDA #$0080
    TSB $09EC
    COP [86] ( #0D, #08, #01 )
    COP [8A]
    LDA #$0080
    TRB $09EC
    PHX 
    LDX $24
    LDA $@binary_0AA72F, X
    PLX 
    AND #$00FF
    JSL $@func_00B4BE
}

code_0AA72D {
    COP [E0]
}

---------------------------------------------

binary_0AA72F #A0A1A2A3

---------------------------------------------

func_0AA733 {
    COP [BF] ( &widestring_0AA791 )
    RTL 
}

code_0AA738 {
    LDA #$&func_0AA700
    STA $00
    LDA $24
    STA $0000
    COP [D9] ( #$0000, &code_list_0AA748 )
}

code_list_0AA748 [
  &code_0AA78C   ;00
  &code_0AA787   ;01
  &code_0AA751   ;02
  &code_0AA771   ;03
]

---------------------------------------------

func_0AA750 {
    RTL 
}

code_0AA751 {
    COP [BF] ( &widestring_0AA7B4 )
    COP [D4] ( #0C, &code_0AA767 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_0AA7EF )
    RTL 
}

code_0AA767 {
    LDA #$&code_0AA6F9
    STA $00
    COP [BF] ( &widestring_0AA9C5 )
    RTL 
}

code_0AA771 {
    COP [BF] ( &widestring_0AA811 )
    COP [D4] ( #0F, &code_0AA767 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, @widestring_0AA85C )
    RTL 
}

code_0AA787 {
    COP [BF] ( &widestring_0AA874 )
    RTL 
}

code_0AA78C {
    COP [BF] ( &widestring_0AA97D )
    RTL 
}

widestring_0AA791 `[DEF]Laborer:[N]I beg you![N]Cut [LU1:D6]chain!![END]`

widestring_0AA7B4 `[DEF]Laborer:[N]Thank you! I won't[N][LU2:6A][LU1:F7]you've done![FIN]Take [LU1:D6]key.[FIN]`

widestring_0AA7EF `[CLR][SFX:0][DLY:9]You [LU1:98]the[N]key to the mine![PAU:FF][END]`

widestring_0AA811 `[DEF]There are [LU1:C1]who are[N][LU2:69]to work deep in[N]the [LU1:E]Mine.[FIN][LU1:3B]use [LU1:D6]key[N]to [LU1:D1]them.[FIN]`

widestring_0AA85C `[CLR][SFX:0][DLY:9][LU1:67]got the[N][LU2:5E]key![PAU:FF][END]`

widestring_0AA874 `[DEF]Thank you for saving me.[N]As a reward, [LU1:1F]tell[N]you something.[FIN]This mine has a secret[N]room. Its entrance[N]blends [LU1:A1]the wall.[FIN]But you can [LU1:90]it by[N]watching for wind[N]blowing [LU1:DC]cracks[N]in the wall.[FIN]Of course, it [LU1:F3]blow [N]fine hair [LU1:A5]yours [N]around. Then you'll [N]understand. [END]`

widestring_0AA97D `[DEF]There are eight[N]laborers including me[N][LU2:69]to work in the[N]mine. [FIN][LU1:3B][LU1:D1]us. [END]`

widestring_0AA9C5 `[DEF][CLR]But [LU1:FE]inventory[N]is full![END]`

code_0AA9E0 {
    JSL $@func_0AA3FD
    COP [80] ( #33 )
    COP [89]
    COP [C1]
    RTL 
}