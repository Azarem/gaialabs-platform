
?INCLUDE 'hint_npc'

---------------------------------------------

h_dark_rewards1 [
  h_actor < #05, #00, #30 >   ;00
]

---------------------------------------------

e_dark_rewards1 {
    LDA $0E
    STA $26
    LDA #$2000
    STA $0E
    BRA code_09A401
}

---------------------------------------------

h_dark_rewards2 [
  h_actor < #05, #00, #30 >   ;00
]

---------------------------------------------

e_dark_rewards2 {
    LDA $0E
    STA $26
    LDA #$2000
    STA $0E
    COP [8D] ( #85 )
    LDA #$0002
    TSB $12
}

code_09A401 {
    COP [BC] ( #F8, #00 )
    COP [9E] ( @code_09A38D, #$0000, #$FFD0, #$1800 )
    COP [9E] ( @code_09A3A0, #$0000, #$FFD0, #$1800 )
    COP [BC] ( #F8, #01 )
    COP [C0] ( &code_09A42B )
    LDA #$0000
    STA $24
    COP [C1]
    RTL 
}

code_09A42B {
    LDA #$FFFF
    STA $24
    LDA $0B12
    CMP #$0015
    BNE code_09A43B
    JMP $&code_09A479
}

code_09A43B {
    CMP #$0042
    BNE code_09A443
    JMP $&code_09A506
}

code_09A443 {
    CMP #$0062
    BNE code_09A44B
    JMP $&code_09A584
}

code_09A44B {
    CMP #$0086
    BNE code_09A453
    JMP $&code_09A628
}

code_09A453 {
    CMP #$00B8
    BNE code_09A45B
    JMP $&code_09A6DE
}

code_09A45B {
    CMP #$00CC
    BNE code_09A463
    JMP $&code_09A81B
}

code_09A463 {
    CMP #$00A7
    BNE code_09A46B
    JMP $&code_09A77F
}

code_09A46B {
    CMP #$00A1
    BNE code_09A473
    JMP $&code_09A8C1
}

code_09A473 {
    LDA #$0000
    STA $24
    RTL 
}

code_09A479 {
    LDA $0AA2
    BIT #$0001
    BNE code_09A491
    LDA $0AA2
    ORA #$0001
    STA $0AA2
    COP [BF] ( &widestring_09A498 )
    JMP $&code_09A473
}

code_09A491 {
    COP [BF] ( &widestring_09A498+M )
    JMP $&code_09A473
}

widestring_09A498 `[DEF]You receive the [N][LU1:3C]Crusher!! [FIN][::][DEF]You can smash obstacles[N]by ramming them.[N]Use the Attack Button[N]to [LU1:D1]energy...[END]`

code_09A506 {
    LDA $0AA2
    BIT #$0010
    BNE code_09A51E
    LDA $0AA2
    ORA #$0010
    STA $0AA2
    COP [BF] ( &widestring_09A525 )
    JMP $&code_09A473
}

code_09A51E {
    COP [BF] ( &widestring_09A525+M )
    JMP $&code_09A473
}

widestring_09A525 `[DEF]You receive the [N][LU1:3C]Flier! [FIN][::][DEF]You can scorch [LU1:8C][N][LU1:F0]its flame. [N]Use the Attack [LU2:2][N]to [LU1:D1]energy... [END]`

code_09A584 {
    LDA $0AA2
    BIT #$0002
    BNE code_09A59C
    LDA $0AA2
    ORA #$0002
    STA $0AA2
    COP [BF] ( &widestring_09A5A3 )
    JMP $&code_09A473
}

code_09A59C {
    COP [BF] ( &widestring_09A5A3+M )
    JMP $&code_09A473
}

widestring_09A5A3 `[DEF]You receive the [N][LU1:3C]Slider! [FIN][::][DEF]Now you can use the[N]Sliding Attack, and[N]pass [LU1:DC]small[N]passageways.[FIN][LU1:61][LU1:FF]running,[N]push the Attack Button.[END]`

code_09A628 {
    LDA $0AA2
    BIT #$0004
    BNE code_09A640
    LDA $0AA2
    ORA #$0004
    STA $0AA2
    COP [BF] ( &widestring_09A647 )
    JMP $&code_09A473
}

code_09A640 {
    COP [BF] ( &widestring_09A647+M )
    JMP $&code_09A473
}

widestring_09A647 `[DEF]You receive the [N][LU2:31]Dasher! [FIN][::][DEF]Send [LU1:8C]flying by[N]spinning [LU1:FE]body[N]rapidly.[FIN]Climb hills by using the[N]recoil. For [LU1:B7]power,[N]use the Attack and[N]LR Buttons...[END]`

code_09A6DE {
    LDA $0AA2
    BIT #$0040
    BNE code_09A6F6
    LDA $0AA2
    ORA #$0040
    STA $0AA2
    COP [BF] ( &widestring_09A6FD )
    JMP $&code_09A473
}

code_09A6F6 {
    COP [BF] ( &widestring_09A6FD+M )
    JMP $&code_09A473
}

widestring_09A6FD `[DEF]You receive the [N]Earthquaker! [FIN][::][DEF]The Earthquaker[N]causes earthquakes.[FIN]Stops [LU1:8C]for a long[N]time. Push the Attack[N]button [LU2:BF]jumping...[END]`

code_09A77F {
    LDA $0AA2
    BIT #$0020
    BNE code_09A797
    LDA $0AA2
    ORA #$0020
    STA $0AA2
    COP [BF] ( &widestring_09A79E )
    JMP $&code_09A473
}

code_09A797 {
    COP [BF] ( &widestring_09A79E+M )
    JMP $&code_09A473
}

widestring_09A79E `[DEF]You receive the [N]Aura Barrier! [FIN][::][DEF]It puts a protective[N]barrier [LU1:6D]you.[FIN]Use the Attack Button[N][LU1:C2]and push the LR[N][LU2:3]alternately.[END]`

code_09A81B {
    COP [D6] ( #24, &code_09A82C )
    COP [D4] ( #24, &code_09A833 )
    COP [BF] ( &widestring_09A83A )
    JMP $&code_09A473
}

code_09A82C {
    COP [BF] ( &widestring_09A83A+M )
    JMP $&code_09A473
}

code_09A833 {
    COP [BF] ( &widestring_09A88F )
    JMP $&code_09A473
}

widestring_09A83A `[DEF]You [LU1:BA]the Aura...[FIN][::][DEF][LU1:4C][LU1:72]has no [N]mass. [LU1:61]he holds up[N][LU1:D6]Ball, his [LU1:72][N]becomes [LU1:A5]water. [END]`

widestring_09A88F `[PAU:1E][DEF][LU1:68][LU1:A0]is full.[N]Store items somewhere[N]and [LU1:79]back.[END]`

code_09A8C1 {
    COP [BF] ( &widestring_09A8C6 )
    RTL 
}

widestring_09A8C6 `[DEF]The Spider spins a web [N][LU1:8E]stalk to stalk. If [N]you [LU1:82][LU1:98]a web, [N]you can fly... [END]`