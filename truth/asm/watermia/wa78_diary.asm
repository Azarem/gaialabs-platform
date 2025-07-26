
---------------------------------------------

h_wa78_diary [
  h_actor < #00, #00, #30 >   ;00
]

---------------------------------------------

e_wa78_diary {
    COP [C0] ( &code_079BFF )
    COP [C1]
    RTL 
}

code_079BFF {
    COP [BF] ( &widestring_079C19 )
    COP [BE] ( #02, #02, &code_list_079C09 )
}

code_list_079C09 [
  &code_079C0F   ;00
  &code_079C14   ;01
  &code_079C0F   ;02
]

code_079C0F {
    COP [BF] ( &widestring_079C4A )
    RTL 
}

code_079C14 {
    COP [BF] ( &widestring_079C81 )
    RTL 
}

widestring_079C19 `[DEF][TPL:0]Kara's diary is secret. [N]Read it? [N] Yes [N] No `

widestring_079C4A `[CLR]OK. You'd [LU1:91]guilty[N]reading it without[N]permission...[PAL:0][END]`

widestring_079C81 `[CLR][TPL:1]X Month X Day[N]After a [LU1:A6]journey we[N]arrive in the Floating[N]City, Watermia.[FIN]I was parched after the[N]journey. Blisters on[N]my feet, but I wrapped[N][LU1:E6]in my handkerchief.[FIN]Before, I [LU1:F3]have[N]complained, but I didn't[N]say [LU2:49]I think[N][LU1:20][LU1:7F]a little.[FIN]I'm pleased [LU1:D7]I can[N]be so concerned with[N][LU1:CF]else.[FIN][LU1:20][LU1:99][LU1:D6]saying[N][LU1:8E]a villager.[FIN]"If you wish [LU1:BE]a [N]lotus leaf on a full [N]moon night, [LU1:FE]love [N][LU1:EF]notice you.ˮ [FIN]A [LU1:94]saying.[N][LU1:30][LU1:1F]try it...[PAL:0][END]`