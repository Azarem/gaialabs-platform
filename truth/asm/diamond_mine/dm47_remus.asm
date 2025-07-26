
?INCLUDE 'dm_actor_05D49E'

---------------------------------------------

h_dm47_remus [
  h_actor < #28, #00, #10 >   ;00
]

---------------------------------------------

e_dm47_remus {
    COP [D0] ( #5E, #01, &dm47_remus_destroy )
    COP [9C] ( @e_dm_actor_05D49E, #$0100 )
    LDA #$0200
    TSB $12
    COP [C0] ( &code_05D189 )
    COP [0B]
    COP [C1]
    LDY $06
    LDA $0010, Y
    BIT #$0040
    BNE code_05D182
    RTL 
}

code_05D182 {
    COP [C0] ( &code_05D18E )
    COP [C1]
    RTL 
}

code_05D189 {
    COP [BF] ( &widestring_05D193 )
    RTL 
}

code_05D18E {
    COP [BF] ( &widestring_05D1AE )
    RTL 
}

widestring_05D193 `[DEF][TPL:5]Remus:[N]Cut the chain![PAL:0][END]`

widestring_05D1AE `[DEF][TPL:5]Remus: Thank [LU2:C7]Our [N][LU2:72][LU1:EC]is far  [N]across the ocean. [FIN]If you [LU1:7A]go there,[N]help the villagers to[N]regain [LU1:E1]strength.[PAL:0][END]`

---------------------------------------------

dm47_remus_destroy {
    COP [E0]
}