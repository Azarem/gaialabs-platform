
?INCLUDE 'ec_actor_09C2D0'

---------------------------------------------

h_ir28_actor_09C6A9 [
  h_actor < #00, #00, #20 >   ;00
]

---------------------------------------------

e_ir28_actor_09C6A9 {
    COP [C1]

  code_09C6AE:
    COP [45] ( #1A, #0C, #1C, #0E, &code_09C6E8 )
    COP [45] ( #1A, #16, #1C, #18, &code_09C6FE )
    COP [45] ( #12, #24, #14, #26, &code_09C714 )
    COP [45] ( #08, #24, #0A, #26, &code_09C72A )
    COP [45] ( #10, #1C, #12, #1E, &code_09C74E )
    COP [45] ( #12, #16, #14, #18, &code_09C773 )

  code_09C6DE:
    RTL 
}

---------------------------------------------

func_09C6DF {
    COP [08] ( #$2C2C )
    COP [C4] ( @code_09C6AE )
}

code_09C6E8 {
    COP [D0] ( #01, #01, &code_09C6DE )
    COP [CC] ( #01 )
    COP [A0] ( @code_09C2DB, #$01A8, #$0130, #$2300 )
    BRA func_09C6DF
}

code_09C6FE {
    COP [D0] ( #02, #01, &code_09C6DE )
    COP [CC] ( #02 )
    COP [A0] ( @code_09C2DB, #$01C8, #$01C0, #$2300 )
    BRA func_09C6DF
}

code_09C714 {
    COP [D0] ( #03, #01, &code_09C6DE )
    COP [CC] ( #03 )
    COP [A0] ( @code_09C2DB, #$00E8, #$0260, #$2300 )
    BRA func_09C6DF
}

code_09C72A {
    COP [D0] ( #04, #01, &code_09C6DE )
    COP [CC] ( #04 )
    COP [A0] ( @func_09C2E4, #$0088, #$0220, #$2300 )
    COP [DA] ( #0E )
    COP [A0] ( @func_09C2E4, #$0088, #$0200, #$2300 )
    BRA func_09C6DF
}

code_09C74E {
    COP [D0] ( #05, #01, &code_09C6DE )
    COP [CC] ( #05 )
    COP [A0] ( @func_09C2E4, #$0088, #$01C0, #$2300 )
    COP [DA] ( #0E )
    COP [A0] ( @func_09C2E4, #$0088, #$01A0, #$2300 )
    JMP $&func_09C6DF
}

code_09C773 {
    COP [D0] ( #06, #01, &code_09C6DE )
    COP [CC] ( #06 )
    COP [A0] ( @func_09C2E4, #$0128, #$0160, #$2300 )
    COP [DA] ( #0E )
    COP [A0] ( @func_09C2E4, #$0128, #$0140, #$2300 )
    JMP $&func_09C6DF
}