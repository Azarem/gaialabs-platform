?INCLUDE 'sE6_gaia'
?INCLUDE 'table_0EDA00'

!joypad_mask_std                065A
!player_actor                   09AA
!player_flags                   09AE

---------------------------------------------

h_pyCD_jackal [
  h_actor < #0B, #00, #30 >   ;00
]

---------------------------------------------

e_pyCD_jackal {
    COP [CC] ( #0E )
    COP [D2] ( #C2, #01 )
    COP [D2] ( #C3, #01 )
    COP [D2] ( #C4, #01 )
    COP [D2] ( #C5, #01 )
    COP [D2] ( #C6, #01 )
    COP [D2] ( #C7, #01 )
    COP [D0] ( #BB, #01, &code_08B9EC )
    COP [CE] ( #0E )
    COP [CC] ( #0F )
    COP [C1]
    COP [45] ( #05, #09, #0A, #0B, &code_08B853 )
    RTL 
}

code_08B853 {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    COP [DA] ( #3B )
    COP [0F] ( #06, #0C )
    COP [0F] ( #07, #0C )
    COP [0F] ( #08, #0C )
    COP [0F] ( #09, #09 )
    COP [0F] ( #09, #0A )
    COP [BF] ( &widestring_08BA11 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    COP [45] ( #03, #09, #04, #0D, &code_08B893 )
    COP [40] ( #$0501, &code_08B88E )
    RTL 
}

code_08B88E {
    COP [BF] ( &widestring_08BA36 )
    RTL 
}

code_08B893 {
    COP [10] ( #06, #0C )
    COP [10] ( #07, #0C )
    COP [10] ( #08, #0C )
    COP [10] ( #09, #09 )
    COP [10] ( #09, #0A )
    COP [0F] ( #05, #09 )
    COP [0F] ( #05, #0A )
    COP [BF] ( &widestring_08BA5A )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$2000
    TRB $10
    COP [CC] ( #02 )
    COP [DA] ( #1F )
    COP [86] ( #0E, #03, #12 )
    COP [8A]
    COP [85] ( #10, #04, #11 )
    COP [8A]
    COP [84] ( #0A, #06 )
    COP [8A]
    COP [80] ( #0C )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_08BA7D )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_08BC55 )
    LDA $0AD4
    BEQ code_08B921
    CMP #$0001
    BEQ code_08B90C
    LDY $player_actor
    LDA #$*func_08F3B1
    STA $0002, Y
    LDA #$&func_08F3B1
    STA $0000, Y
    LDA #$0800
    TSB $player_flags
    BRA code_08B921
}

code_08B90C {
    LDY $player_actor
    LDA #$*func_08F37D
    STA $0002, Y
    LDA #$&func_08F37D
    STA $0000, Y
    LDA #$0800
    TSB $player_flags
}

code_08B921 {
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$000F
    STA $06F2
    COP [CC] ( #0E )
    COP [C1]
    COP [D0] ( #03, #01, &code_08B956 )
    COP [D0] ( #0D, #01, &code_08B950 )
    LDY $player_actor
    LDA $0014, Y
    CMP #$0048
    BEQ code_08B94A
    RTL 
}

code_08B94A {
    COP [40] ( #$0101, &code_08B951 )
}

code_08B950 {
    RTL 
}

code_08B951 {
    COP [BF] ( &widestring_08BCBC )
    RTL 
}

code_08B956 {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [CE] ( #0E )
    COP [DA] ( #1D )
    COP [CA] ( #0C )
    COP [9C] ( @func_08B7E8, #$0B02 )
    COP [DA] ( #09 )
    COP [CB]
    LDA #$0800
    TSB $10
    COP [8D] ( #13 )
    COP [DA] ( #1D )
    COP [9C] ( @code_08BA04, #$2000 )
    COP [CC] ( #04 )
    COP [DA] ( #3B )
    COP [81] ( #13, #14 )
    COP [89]
    COP [DA] ( #4F )
    COP [81] ( #14, #14 )
    COP [89]
    COP [DA] ( #4F )
    COP [80] ( #15 )
    COP [89]
    COP [84] ( #16, #B4 )
    COP [8A]
    COP [CC] ( #05 )
    COP [81] ( #17, #14 )
    COP [89]
    COP [DA] ( #4F )
    COP [81] ( #18, #14 )
    COP [89]
    COP [DA] ( #4F )
    COP [84] ( #19, #40 )
    COP [8A]
    COP [84] ( #1A, #78 )
    COP [8A]
    COP [80] ( #1B )
    COP [89]
    COP [05] ( #11 )
    COP [DA] ( #B3 )
    COP [10] ( #05, #09 )
    COP [10] ( #05, #0A )
    COP [CC] ( #06 )
    COP [CC] ( #BB )
    COP [CE] ( #0F )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [C1]
    RTL 
}

code_08B9EC {
    LDA #$2000
    TRB $10
    COP [25] ( #09, #0B )
    COP [88] ( @table_0EDA00 )
    COP [80] ( #02 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}

code_08BA04 {
    COP [BF] ( &widestring_08BCF2 )
    COP [DA] ( #EF )
    COP [BF] ( &widestring_08BD16 )
    COP [E0]
}

widestring_08BA11 `[TPL:9][TPL:4][DLY:0]Walk to the left[N][LU1:F8]a sound!![PAL:0][END]`

widestring_08BA36 `[TPL:9][TPL:4]It says to walk to[N]the left!![PAL:0][END]`

widestring_08BA5A `[TPL:9][TPL:4]There, that's good.[N][LU1:D]move!![PAL:0][END]`

widestring_08BA7D `[TPL:A][TPL:4][DLY:0]Jackal: [N]I [LU1:A4]the whole [N]story of [LU1:FE]adventure. [FIN]I [LU1:99][LU1:6B]an[N][LU1:6F]bio-technology[N]using a [LU2:55]light. [FIN]I [LU1:83][LU1:A4]it was you.[FIN][LU2:40]the [LU1:C2]to change[N][LU1:72]shape, you could[N]get anything.[FIN][LU1:3D][LU1:F3]bow [N]at [LU1:FE]feet.[FIN][LU1:1D][LU2:89]natural that[N][LU1:27][LU1:11][LU1:F3][N]trick you [LU1:A1]this...[FIN][TPL:1][LU1:25][N]My father!!? [FIN][TPL:4]Jackal: [N]Yes! After all, that's [N]the way kings are. [FIN]He [LU1:F3]do [LU1:6C]to[N]get the power.[FIN]He might even be [LU1:B7][N]evil [LU2:B5]a mercenary [N][LU1:A5]me. Heh heh. [FIN][TPL:1][LU1:25][N]Stop it! [FIN][TPL:4]Jackal: [N]Either way, if I [LU2:84][N]money, [LU1:9F]fine. [FIN][LU1:9][LU1:F0]me to[N][LU1:11]Castle.[PAL:0][END]`

widestring_08BC55 `[TPL:A][TPL:0]A [LU1:EE]whispers [N]in Will's head... [FIN][DLY:0]Will... [LU2:27]the [N]Flute....Will....[PAL:0][END]`

---------------------------------------------

widestring_08BC9F `[TPL:A][TPL:4]Jackal: [N]Give up...? [N][PAL:0][END]`

widestring_08BCBC `[TPL:A][TPL:4]Jackal: [N]If you [LU1:79]any closer, [N][LU1:1F]use [LU1:D6]knife...[PAL:0][END]`

widestring_08BCF2 `[TPL:9][TPL:4][DLY:0]Jackal: [N]Wa-a-a-a-ah!!!![PAU:3C][PAL:0][CLD]`

widestring_08BD16 `[TPL:8][TPL:4][DLY:4]Kara...Kara...[PAU:78][PAL:0][CLD]`

---------------------------------------------

func_08B7E8 {
    COP [23]
    AND #$000F
    SEC 
    SBC #$0008
    CLC 
    ADC $14
    STA $14
    COP [23]
    AND #$001F
    SEC 
    SBC #$0020
    CLC 
    ADC $16
    STA $16
}

---------------------------------------------

func_08B804 {
    COP [08] ( #$0505 )
    COP [BC] ( #00, #FC )
    COP [84] ( #11, #02 )
    COP [8A]
    COP [BC] ( #00, #04 )
    COP [84] ( #12, #10 )
    COP [8A]
    COP [E0]
}