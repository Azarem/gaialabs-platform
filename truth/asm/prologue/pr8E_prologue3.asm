?INCLUDE 'pr_actor_0BCF52'
?INCLUDE 'pr_thinkers'

!camera_bounds_y                06DC
!player_actor                   09AA
!CGWSEL                         2130
!CGADSUB                        2131
!COLDATA                        2132

---------------------------------------------

h_pr8E_prologue3 [
  h_actor < #00, #00, #38 >   ;00
]

---------------------------------------------

e_pr8E_prologue3 {
    LDA #$4001
    TSB $09EC
    COP [50] ( @palette_1E1A35, #00, #00, #20 )
    LDA #$0A00
    STA $064A
    LDA #$0220
    STA $camera_bounds_y
    SEP #$20
    LDA #$81
    STA $CGADSUB
    LDA #$EF
    STA $COLDATA
    REP #$20
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    AND #$FFF7
    STA $0010, Y
    COP [9C] ( @code_0BCE05, #$2800 )
    COP [C1]
    LDY $player_actor
    LDA $0016, Y
    INC 
    STA $0016, Y
    CMP #$01A0
    BEQ code_0BCD9E
    RTL 
}

code_0BCD9E {
    LDA #$000F
    STA $24

  code_0BCDA3:
    COP [DA] ( #09 )
    SEP #$20
    LDA $24
    ORA #$E0
    STA $COLDATA
    REP #$20
    LDA $24
    BEQ code_0BCDBA
    DEC 
    STA $24
    BRA code_0BCDA3
}

code_0BCDBA {
    SEP #$20
    LDA #$82
    STA $CGWSEL
    LDA #$10
    STA $CGADSUB
    LDA #$E0
    STA $COLDATA
    REP #$20
    COP [A0] ( @code_0BCF8F, #$003C, #$0048, #$2000 )
    LDA #$&spritestring_0BD1CA
    STA $0026, Y
    COP [3C] ( @e_pr_thinker_0BD031 )
    COP [DB] ( #$010D )
    COP [3C] ( @e_pr_thinker_0BD039 )
    COP [DA] ( #59 )
    LDA #$0404
    STA $064A
    COP [26] ( #8F, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}

---------------------------------------------

func_0BCE02_noref {
    COP [C1]
    RTL 
}

code_0BCE05 {
    COP [23]
    AND #$0007
    ASL 
    ASL 
    ASL 
    STA $08
    COP [C2]
    COP [9C] ( @code_0BCE1A, #$1800 )
    BRA code_0BCE05
}

code_0BCE1A {
    LDA #$0100
    STA $14
    COP [23]
    AND #$003F
    CLC 
    ADC #$0138
    STA $16
    COP [85] ( #0C, #08, #02 )
    COP [8A]
    COP [E0]
}

---------------------------------------------

spritestring_0BD1CA ~People who entered[N]the ruins,[N]searching for[N]wealth, went in,[N]and were never seen[N]again.~