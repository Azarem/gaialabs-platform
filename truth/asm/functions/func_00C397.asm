?INCLUDE 'actor_00D877'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

func_00C397 {
    PHX 
    PHD 
    STZ $0002
    STY $0000
    ASL 
    BCC code_00C3AA
    PHA 
    LDA #$FFC4
    STA $0002
    PLA 
}

code_00C3AA {
    LSR 
    EOR #$FFFF
    INC 
    CLC 
    ADC $0ACE
    BPL code_00C3B8
    LDA #$0000
}

code_00C3B8 {
    STA $0ACE
    LDA $player_actor
    TCD 
    TAX 
    LDA #$0080
    TSB $10
    LDA $0002
    BNE code_00C3CD
    LDA #$003C
}

code_00C3CD {
    STA $7F0028, X
    LDA $player_flags
    BIT #$0800
    BNE code_00C410
    COP [A5] ( @e_actor_00D877, #00, #00, #$2400 )
    CPY #$1FC0
    BNE code_00C3ED
    LDA #$0F00
    TRB $joypad_mask_std
}

code_00C3ED {
    LDA $7F002A, X
    AND #$0020
    PHX 
    TYX 
    STA $7F002A, X
    PLX 
    LDA $0000
    STA $0028, Y
    LDA #$0000
    STA $002C, Y
    STA $002E, Y

  code_00C40A:
    COP [06] ( #07 )
    PLD 
    PLX 
    RTL 
}

code_00C410 {
    LDA #$0F00
    TRB $joypad_mask_std
    BRA code_00C40A
}