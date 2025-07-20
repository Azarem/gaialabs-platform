?INCLUDE 'sE6_gaia'
?INCLUDE 'actor_00E98B'
?INCLUDE 'sg55_actor_0AD000'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_y_tile                  09A8
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_sg55_mystic_statue [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_sg55_mystic_statue {
    COP [C1]
    LDA $0AEC
    BEQ code_0ACE3F
    RTL 
}

code_0ACE3F {
    COP [D0] ( #F9, #01, &code_0ACE81 )
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [BF] ( &widestring_0ACF0E )
    LDA #$0001
    STA $0AAC
    LDA #$0055
    STA $0B12
    LDA #$0010
    STA $0B08
    STA $0B0A
    LDA #$0008
    STA $0B0C
    STA $0B0E
    LDA #$2200
    STA $0B10
    COP [26] ( #FD, #$0000, #$0000, #00, #$1100 )
    RTL 
}

code_0ACE81 {
    COP [9A] ( @e_actor_00E98B, #$2800 )
    LDA #$0201
    STA $0014, Y
    LDA #$000C
    STA $0016, Y
    COP [9A] ( @code_0AD034, #$2800 )
    COP [DA] ( #3B )
    LDA $0AD4
    BEQ code_0ACEC9
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0000
    STA $0008, Y
    LDA #$0800
    TSB $player_flags
    COP [C1]
    LDA $player_flags
    BIT #$0800
    BEQ code_0ACEC9
    RTL 
}

code_0ACEC9 {
    COP [DA] ( #3B )
    COP [BF] ( &widestring_0ACF4A )
    COP [CA] ( #30 )
    LDA $camera_bounds_y
    INC 
    STA $camera_bounds_y
    COP [CB]
    LDA #$0170
    STA $camera_bounds_y
    COP [42] ( #07, #0C, #08 )
    COP [C1]
    LDA $player_y_tile
    CMP #$0018
    BEQ code_0ACEF2
    RTL 
}

code_0ACEF2 {
    LDA #$0000
    STA $0AA6
    STA $0688
    LDA #$0404
    STA $064A
    COP [26] ( #58, #$0000, #$0000, #03, #$1100 )
    COP [C1]
    RTL 
}

widestring_0ACF0E `[DEF][TPL:0]You [LU1:98]defeated the, [N][LU1:9C]demon! [N]Look! A Mystic Statue!![PAL:0][END]`

widestring_0ACF4A `[DEF][TPL:0]A [LU1:C7]noise fills [N]the air [LU1:6D][LU2:C7][N][LU2:11]out of nowhere,[N]you [LU1:9B][LU1:37]voice![FIN][TPL:6][LU1:36][N]Will! [LU1:69]falling [N]to the ground!!!! [FIN]Grab the airplane, and[N]we'll fly out of here![PAL:0][END]`