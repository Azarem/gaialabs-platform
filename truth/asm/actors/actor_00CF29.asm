?INCLUDE 'inventory_spritemap'
?INCLUDE 'actor_00CD59'
?INCLUDE 'chunk_008000'
?INCLUDE 'chunk_03BAE1'


---------------------------------------------

h_actor_00CF29 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_actor_00CF29 {
    COP [BC] ( #08, #08 )
    COP [88] ( @table_108000 )
    LDA $0E
    STA $24
    BIT #$0010
    BEQ code_00CF42
    COP [BC] ( #00, #F8 )
}

code_00CF42 {
    LDA #$2000
    STA $0E
    PHX 
    LDA $24
    AND #$000F
    ASL 
    ASL 
    TAX 
    LDA $@binary_00CE97, X
    AND #$00FF
    JSL $@func_00B4B7
    BCC code_00CF60
    JMP $&code_00CF63
}

code_00CF60 {
    PLX 
    COP [E0]
}

code_00CF63 {
    LDA $@binary_00CE97+1, X
    AND #$00FF
    STA $28
    STZ $2A
    PLX 
    JSL $@func_03CA55
    LDA #$2000
    TRB $10
    COP [C1]
    LDA $0AFA
    CMP #$0003
    BEQ code_00CF88
    LDA #$2000
    TRB $10
    RTL 
}

code_00CF88 {
    LDA #$2000
    TSB $10
    RTL 
}