?INCLUDE 'func_09E8E4'


---------------------------------------------

func_09E64B {
    COP [69] ( #$3844 )
    COP [6A] ( &func_09E675 )
    COP [69] ( #$3A4C )
    COP [6A] ( &code_09E65B )
}

code_09E65B {
    COP [E0]
}

code_09E65D {
    COP [99] ( @func_09E64B )
    LDA #$0041
    JSL $@func_09E8E4
    COP [88] ( $7E6000 )

  code_09E66D:
    COP [81] ( #0E, #01 )
    COP [89]
    BRA code_09E66D
}

---------------------------------------------

func_09E675 {
    COP [80] ( #0E )
    COP [89]
    BRA func_09E675
}

code_09E67C {
    COP [37] ( #7C )
    COP [39]
    COP [E0]
}

---------------------------------------------

func_09E683 {
    COP [69] ( #$515C )
    COP [6A] ( &code_09E68B )
}

code_09E68B {
    COP [E0]
}

code_09E68D {
    COP [99] ( @func_09E683 )
    COP [88] ( $7E6000 )
    LDA #$0003
    JSL $@func_09E8E4

  code_09E69D:
    COP [81] ( #0A, #02 )
    COP [89]
    BRA code_09E69D
}

code_09E6A5 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0D, #C8, #01 )
    COP [8A]
    COP [85] ( #0D, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E6C0 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #09, #C8, #01 )
    COP [8A]
    COP [85] ( #09, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E6DB {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0A, #C8, #01 )
    COP [8A]
    COP [85] ( #0A, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E6F6 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0B, #C8, #01 )
    COP [8A]
    COP [85] ( #0B, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E711 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0C, #C8, #01 )
    COP [8A]
    COP [85] ( #0C, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E72C {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #11, #C8, #01 )
    COP [8A]
    COP [85] ( #11, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E747 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #15, #C8, #01 )
    COP [8A]
    COP [85] ( #15, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E762 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #16, #C8, #01 )
    COP [8A]
    COP [85] ( #16, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E77D {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #1B, #C8, #01 )
    COP [8A]
    COP [85] ( #1B, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E798 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #1C, #C8, #01 )
    COP [8A]
    COP [85] ( #1C, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E7B3 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #17, #C8, #01 )
    COP [8A]
    COP [85] ( #17, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E7CE {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0E, #C8, #01 )
    COP [8A]
    COP [85] ( #0E, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E7E9 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #0F, #C8, #01 )
    COP [8A]
    COP [85] ( #0F, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E804 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #12, #C8, #01 )
    COP [8A]
    COP [85] ( #12, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E81F {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #13, #C8, #01 )
    COP [8A]
    COP [85] ( #13, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E83A {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #18, #C8, #01 )
    COP [8A]
    COP [85] ( #18, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E855 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #14, #C8, #01 )
    COP [8A]
    COP [85] ( #14, #68, #01 )
    COP [8A]
    COP [E0]
}

code_09E870 {
    COP [88] ( $7E4000 )
    LDA #$0020
    JSL $@func_09E8E4
    COP [85] ( #1A, #C8, #01 )
    COP [8A]
    COP [85] ( #1A, #88, #01 )
    COP [8A]
    COP [E0]
}

code_09E88B {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #19, #C8, #01 )
    COP [8A]
    COP [85] ( #19, #80, #01 )
    COP [8A]
    COP [E0]
}

code_09E8A6 {
    COP [88] ( $7E4000 )
    LDA #$0021
    JSL $@func_09E8E4
    COP [85] ( #10, #C8, #01 )
    COP [8A]
    COP [85] ( #10, #80, #01 )
    COP [8A]
    COP [E0]
}

code_09E8C1 {
    COP [88] ( $7E6000 )
    LDA #$0032
    JSL $@func_09E8E4
    COP [85] ( #13, #04, #02 )
    COP [8A]
    COP [84] ( #13, #55 )
    COP [8A]
    COP [80] ( #12 )
    COP [89]
    COP [DB] ( #$0FEF )
    COP [E0]
}