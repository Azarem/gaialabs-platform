
?INCLUDE 'chunk_008000'
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A

---------------------------------------------

func_02F048 {
    PHP 
    PHB 
    REP #$20
    LDA $joypad_mask_std
    STZ $joypad_mask_std
    PHA 
    SEP #$20
    LDA #$81
    PHA 
    PLB 
    JSL $@func_00817D
    REP #$20
    JSL $@sub_03E255
    PLA 
    STA $joypad_mask_std
    PLB 
    PLP 
    RTL 
}