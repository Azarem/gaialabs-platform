
?INCLUDE 'actor_00E256'

---------------------------------------------

h_ir1F_stone_lord1 [
  h_actor < #00, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_lord1 {
    BRA code_0A95C9
}

---------------------------------------------

h_ir1F_stone_lord2 [
  h_actor < #01, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_lord2 {
    BRA code_0A95C9
}

---------------------------------------------

h_ir1F_stone_lord3 [
  h_actor < #02, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_lord3 {
    BRA code_0A95C9
}

---------------------------------------------

h_ir1F_stone_lord4 [
  h_actor < #02, #00, #03 >   ;00
]

---------------------------------------------

e_ir1F_stone_lord4 {
    COP [BB]
    BRA code_0A95C9
}

code_0A95C9 {
    LDA #$0010
    TSB $12
    LDA $0F
    AND #$0010
    LSR 
    LSR 
    LSR 
    LSR 
    STA $7F0010, X
    COP [B7] ( #0E )
    COP [B6] ( #20 )
    COP [0B]
    COP [27] ( #08 )
    COP [A2] ( @e_actor_00E256, #$2300 )
    LDA $7F0010, X
    BEQ code_0A960D
    BRA code_0A9615
}

---------------------------------------------

func_0A95F5_noref {
    LDA #$0200
    TRB $10
    COP [C1]
    LDA $7F0026, X
    CMP #$000A
    BNE code_0A9606
    RTL 
}

code_0A9606 {
    LDA #$0200
    TSB $10
    BRA code_0A9619
}

code_0A960D {
    COP [C1]
    COP [21] ( #02, &code_0A9619 )
    RTL 
}

code_0A9615 {
    COP [D2] ( #0F, #01 )
}

code_0A9619 {
    COP [1F] ( &code_0A961F )
    BRA code_0A9624
}

code_0A961F {
    COP [C4] ( @code_0A9619 )
}

code_0A9624 {
    COP [A9]
    COP [CA] ( #1E )
    COP [B7] ( #0E )
    COP [C2]
    COP [B7] ( #02 )
    COP [CB]
    COP [CA] ( #0F )
    COP [B7] ( #0E )
    COP [C2]
    COP [C2]
    COP [B7] ( #02 )
    COP [C2]
    COP [CB]
    LDA #$0300
    TRB $10
    LDA #$0010
    TRB $12
    COP [0C]
    JMP $&code_0A965F
}

---------------------------------------------

h_ir1F_stone_lord5 [
  h_actor < #00, #00, #00 >   ;00
]

---------------------------------------------

e_ir1F_stone_lord5 {
    COP [B6] ( #20 )
    COP [B7] ( #02 )
    COP [27] ( #0E )
}

code_0A965F {
    COP [C2]

  code_0A9661:
    COP [2C] ( &code_0A9667, &code_0A9671 )
}

code_0A9667 {
    COP [2A] ( #$0008, &code_0A9694, &code_0A9671, &code_0A96B2 )
}

code_0A9671 {
    COP [2B] ( #$0008, &code_0A96D0, &code_0A967B, &code_0A96EF )
}

code_0A967B {
    RTL 
}

---------------------------------------------

func_0A967C {
    COP [C2]
    COP [23]
    AND #$0003
    STA $0000
    COP [D9] ( #$0000, &code_list_0A968C )
}

code_list_0A968C [
  &code_0A9694   ;00
  &code_0A96B2   ;01
  &code_0A96D0   ;02
  &code_0A96EF   ;03
]

code_0A9694 {
    COP [44] ( #FA, #FF, #00, #01, &code_0A970E )

  code_0A969C:
    COP [17] ( &func_0A967C )
    COP [81] ( #07, #02 )
    COP [89]
    COP [17] ( &func_0A967C )
    COP [81] ( #08, #02 )
    COP [89]
    BRA code_0A9661
}

code_0A96B2 {
    COP [44] ( #00, #FF, #06, #01, &code_0A972A )

  code_0A96BA:
    COP [18] ( &func_0A967C )
    COP [81] ( #87, #01 )
    COP [89]
    COP [18] ( &func_0A967C )
    COP [81] ( #88, #01 )
    COP [89]
    BRA code_0A9661
}

code_0A96D0 {
    COP [44] ( #FF, #FA, #01, #00, &code_0A9746 )

  code_0A96D8:
    COP [15] ( &func_0A967C )
    COP [82] ( #05, #02 )
    COP [89]
    COP [15] ( &func_0A967C )
    COP [82] ( #06, #02 )
    COP [89]
    JMP $&code_0A9661
}

code_0A96EF {
    COP [44] ( #FF, #00, #01, #06, &code_0A9762 )

  code_0A96F7:
    COP [16] ( &func_0A967C )
    COP [82] ( #03, #01 )
    COP [89]
    COP [16] ( &func_0A967C )
    COP [82] ( #04, #01 )
    COP [89]
    JMP $&code_0A9661
}

code_0A970E {
    COP [07] ( #1F )
    COP [80] ( #0B )
    COP [89]
    COP [07] ( #21 )
    COP [A5] ( @code_0A977E, #E0, #00, #$0200 )
    COP [80] ( #1A )
    COP [89]
    JMP $&code_0A969C
}

code_0A972A {
    COP [07] ( #1F )
    COP [80] ( #8B )
    COP [89]
    COP [A5] ( @code_0A979A, #20, #00, #$0200 )
    COP [07] ( #21 )
    COP [80] ( #9A )
    COP [89]
    JMP $&code_0A96BA
}

code_0A9746 {
    COP [07] ( #1F )
    COP [80] ( #0A )
    COP [89]
    COP [A5] ( @code_0A97B6, #00, #E0, #$0200 )
    COP [07] ( #21 )
    COP [80] ( #19 )
    COP [89]
    JMP $&code_0A96D8
}

code_0A9762 {
    COP [07] ( #1F )
    COP [80] ( #09 )
    COP [89]
    COP [A5] ( @code_0A97D2, #00, #08, #$0200 )
    COP [07] ( #21 )
    COP [80] ( #18 )
    COP [89]
    JMP $&code_0A96F7
}

code_0A977E {
    COP [B7] ( #00 )

  code_0A9781:
    COP [13] ( &code_0A97EC )
    COP [80] ( #23 )
    COP [89]
    COP [A5] ( @code_0A9781, #FA, #00, #$0200 )
    COP [80] ( #24 )
    COP [89]
    COP [E0]
}

code_0A979A {
    COP [B7] ( #00 )

  code_0A979D:
    COP [13] ( &code_0A97EC )
    COP [80] ( #A3 )
    COP [89]
    COP [A5] ( @code_0A979D, #06, #00, #$0200 )
    COP [80] ( #A4 )
    COP [89]
    COP [E0]
}

code_0A97B6 {
    COP [B7] ( #00 )

  code_0A97B9:
    COP [13] ( &code_0A97EC )
    COP [80] ( #23 )
    COP [89]
    COP [A5] ( @code_0A97B9, #00, #FA, #$0200 )
    COP [80] ( #24 )
    COP [89]
    COP [E0]
}

code_0A97D2 {
    COP [B7] ( #00 )

  code_0A97D5:
    COP [13] ( &code_0A97EC )
    COP [80] ( #23 )
    COP [89]
    COP [A5] ( @code_0A97D5, #00, #06, #$0200 )
    COP [80] ( #24 )
    COP [89]
}

code_0A97EC {
    COP [E0]
}