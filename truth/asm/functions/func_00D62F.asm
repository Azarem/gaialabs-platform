
?INCLUDE 'func_00B5B3'
?INCLUDE 'func_00D718'
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_008000'

!scene_next                     0642
!scene_current                  0644
!joypad_mask_std                065A
!INIDISP                        2100

---------------------------------------------

func_00D62F {
    LDA #$0040
    TSB $10
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #20 )
    COP [3C] ( @func_00B5B3 )
    COP [9B] ( @func_00D718 )
    COP [DA] ( #77 )
    LDA #$8000
    TRB $10
    COP [08] ( #$0C0C )
    COP [88] ( @table_0EE000 )
    COP [80] ( #1C )
    COP [89]
    LDA #$000F
    STA $7F0010, X

  code_00D664:
    SEP #$20
    LDA $7F0010, X
    DEC 
    BMI code_00D67B
    STA $7F0010, X
    STA $INIDISP
    REP #$20
    COP [DA] ( #03 )
    BRA code_00D664
}

code_00D67B {
    REP #$20
    COP [3B] ( #0B, @func_00B519 )
    COP [3B] ( #0D, @func_00B519 )
    COP [C2]
    PHB 
    LDA $0AD6
    CMP #$0064
    BCC code_00D6AD
    SBC #$0064
    STA $0AD6
    LDA $0ACA
    LSR 
    STA $0ACE
    SEP #$20
    LDA $0AF6
    PHA 
    PLB 
    LDY $0AF4
    BRA code_00D6E6
}

code_00D6AD {
    STZ $0AD6
    LDA $scene_current
    AND #$00FF
    CMP #$00E8
    BNE code_00D6C3
    LDA #$0002
    STA $0AD4
    BRA code_00D6C6
}

code_00D6C3 {
    STZ $0AD4
}

code_00D6C6 {
    LDA $0ACA
    STA $0ACE
    LDY #$0000
    LDA #$0000

  code_00D6D2:
    STA $0A80, Y
    INY 
    INY 
    CPY #$0020
    BNE code_00D6D2
    SEP #$20
    LDA $0AF2
    PHA 
    PLB 
    LDY $0AF0
}

code_00D6E6 {
    LDA $0000, Y
    STA $scene_next
    LDA $0005, Y
    AND #$7F
    STA $0650
    REP #$20
    LDA $0001, Y
    STA $064C
    LDA $0003, Y
    STA $064E
    LDA $0006, Y
    STA $0652
    PLB 
    LDA #$0404
    STA $064A
    INC $0AF8
    STZ $0654
    COP [C1]
    RTL 
}