
?INCLUDE 'chunk_00E683'

---------------------------------------------

func_00E655 {
    COP [A2] ( @func_00E6A6, #$2000 )
    CPY #$1FC0
    BEQ code_00E681
    LDA $24
    STA $0024, Y
    COP [C1]
    COP [89]
    LDA $7F000E, X
    DEC 
    STA $7F000E, X
    BEQ code_00E676
    RTL 
}

code_00E676 {
    COP [C1]
    COP [89]
    LDA $10
    BIT #$4000
    BEQ code_00E676
}

code_00E681 {
    COP [E0]
}