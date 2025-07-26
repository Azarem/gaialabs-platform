?BANK 17

---------------------------------------------

table_17B000 [
  &sprite_set_17B01C   ;00
  &sprite_set_17B02E   ;01
  &sprite_set_17B034   ;02
  &sprite_set_17B03A   ;03
  &sprite_set_17B040   ;04
  &sprite_set_17B062   ;05
  &sprite_set_17B068   ;06
  &sprite_set_17B06E   ;07
  &sprite_set_17B074   ;08
  &sprite_set_17B07A   ;09
  &sprite_set_17B080   ;0A
  &sprite_set_17B086   ;0B
  &sprite_set_17B08C   ;0C
  &sprite_set_17B092   ;0D
]

sprite_set_17B01C [
  sprite_set < #$0009, &sprite_group_17B098 >   ;00
  sprite_set < #$0009, &sprite_group_17B0CF >   ;01
  sprite_set < #$0009, &sprite_group_17B0FF >   ;02
  sprite_set < #$0001, &sprite_group_17B12F >   ;03
]

sprite_set_17B02E [
  sprite_set < #$0003, &sprite_group_17B15F >   ;00
]

sprite_set_17B034 [
  sprite_set < #$0003, &sprite_group_17B15F >   ;00
]

sprite_set_17B03A [
  sprite_set < #$0003, &sprite_group_17B15F >   ;00
]

sprite_set_17B040 [
  sprite_set < #$0003, &sprite_group_17B18F >   ;00
  sprite_set < #$0003, &sprite_group_17B1BF >   ;01
  sprite_set < #$0003, &sprite_group_17B1EF >   ;02
  sprite_set < #$0006, &sprite_group_17B211 >   ;03
  sprite_set < #$0004, &sprite_group_17B233 >   ;04
  sprite_set < #$0003, &sprite_group_17B263 >   ;05
  sprite_set < #$0002, &sprite_group_17B293 >   ;06
  sprite_set < #$0000, &sprite_group_17B2D1 >   ;07
]

sprite_set_17B062 [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_set_17B068 [
  sprite_set < #$0007, &sprite_group_17B376 >   ;00
]

sprite_set_17B06E [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_set_17B074 [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_set_17B07A [
  sprite_set < #$0007, &sprite_group_17B308 >   ;00
]

sprite_set_17B080 [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_set_17B086 [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_set_17B08C [
  sprite_set < #$0007, &sprite_group_17B33F >   ;00
]

sprite_set_17B092 [
  sprite_set < #$001F, &sprite_group_17B098 >   ;00
]

sprite_group_17B098 [
  sprite_group < #10, #10, #30, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #06, [
    sprite_part < #01, #08, #08, #00, #28, #$0000 >   ;00
    sprite_part < #01, #00, #10, #0B, #1D, #$0020 >   ;01
    sprite_part < #01, #10, #00, #0B, #1D, #$0022 >   ;02
    sprite_part < #01, #00, #10, #1B, #0D, #$0040 >   ;03
    sprite_part < #01, #10, #00, #1B, #0D, #$0042 >   ;04
    sprite_part < #01, #08, #08, #28, #00, #$000E >   ;05
  ] >   ;00
]

sprite_group_17B0CF [
  sprite_group < #10, #10, #31, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #08, #08, #00, #21, #$0000 >   ;00
    sprite_part < #01, #00, #10, #0B, #16, #$0020 >   ;01
    sprite_part < #01, #10, #00, #0B, #16, #$0022 >   ;02
    sprite_part < #01, #00, #10, #1B, #06, #$0040 >   ;03
    sprite_part < #01, #10, #00, #1B, #06, #$0042 >   ;04
  ] >   ;00
]

sprite_group_17B0FF [
  sprite_group < #10, #10, #32, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #08, #08, #00, #22, #$0000 >   ;00
    sprite_part < #01, #00, #10, #0B, #17, #$0020 >   ;01
    sprite_part < #01, #10, #00, #0B, #17, #$0022 >   ;02
    sprite_part < #01, #00, #10, #1B, #07, #$0040 >   ;03
    sprite_part < #01, #10, #00, #1B, #07, #$0042 >   ;04
  ] >   ;00
]

sprite_group_17B12F [
  sprite_group < #10, #10, #33, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #08, #08, #00, #23, #$0000 >   ;00
    sprite_part < #01, #00, #10, #0B, #18, #$0020 >   ;01
    sprite_part < #01, #10, #00, #0B, #18, #$0022 >   ;02
    sprite_part < #01, #00, #10, #1B, #08, #$0040 >   ;03
    sprite_part < #01, #10, #00, #1B, #08, #$0042 >   ;04
  ] >   ;00
]

sprite_group_17B15F [
  sprite_group < #10, #10, #11, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #06, #0A, #00, #11, #$0000 >   ;00
    sprite_part < #01, #00, #10, #01, #10, #$0060 >   ;01
    sprite_part < #01, #10, #00, #01, #10, #$0062 >   ;02
    sprite_part < #01, #00, #10, #11, #00, #$0080 >   ;03
    sprite_part < #01, #10, #00, #11, #00, #$0082 >   ;04
  ] >   ;00
]

sprite_group_17B18F [
  sprite_group < #10, #10, #28, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #08, #08, #20, #00, #$000E >   ;00
    sprite_part < #01, #00, #10, #00, #20, #$05C0 >   ;01
    sprite_part < #01, #10, #00, #00, #20, #$05C2 >   ;02
    sprite_part < #01, #00, #10, #10, #10, #$05E0 >   ;03
    sprite_part < #01, #10, #00, #10, #10, #$05E2 >   ;04
  ] >   ;00
]

sprite_group_17B1BF [
  sprite_group < #10, #10, #28, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #08, #08, #20, #00, #$000E >   ;00
    sprite_part < #01, #00, #10, #00, #20, #$05C4 >   ;01
    sprite_part < #01, #10, #00, #00, #20, #$05C6 >   ;02
    sprite_part < #01, #00, #10, #10, #10, #$05E4 >   ;03
    sprite_part < #01, #10, #00, #10, #10, #$05E6 >   ;04
  ] >   ;00
]

sprite_group_17B1EF [
  sprite_group < #0D, #0D, #1E, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #03, [
    sprite_part < #01, #00, #0A, #00, #16, #$0046 >   ;00
    sprite_part < #01, #0A, #00, #00, #16, #$4046 >   ;01
    sprite_part < #01, #05, #05, #16, #00, #$000E >   ;02
  ] >   ;00
]

sprite_group_17B211 [
  sprite_group < #0E, #0E, #20, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #03, [
    sprite_part < #01, #00, #0C, #00, #18, #$8046 >   ;00
    sprite_part < #01, #0C, #00, #00, #18, #$C046 >   ;01
    sprite_part < #01, #06, #06, #18, #00, #$000E >   ;02
  ] >   ;00
]

sprite_group_17B233 [
  sprite_group < #0D, #0F, #24, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #0C, #00, #09, #13, #$C048 >   ;00
    sprite_part < #01, #00, #0C, #08, #14, #$8048 >   ;01
    sprite_part < #01, #00, #0C, #00, #1C, #$8058 >   ;02
    sprite_part < #01, #05, #07, #1C, #00, #$000E >   ;03
    sprite_part < #01, #0C, #00, #00, #1C, #$C058 >   ;04
  ] >   ;00
]

sprite_group_17B263 [
  sprite_group < #0F, #10, #25, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #00, #0F, #0F, #0E, #$006C >   ;00
    sprite_part < #01, #00, #0F, #00, #1D, #$004C >   ;01
    sprite_part < #01, #0F, #00, #0F, #0E, #$406C >   ;02
    sprite_part < #01, #07, #08, #1D, #00, #$000E >   ;03
    sprite_part < #01, #0F, #00, #00, #1D, #$404C >   ;04
  ] >   ;00
]

sprite_group_17B293 [
  sprite_group < #0F, #0F, #27, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #07, [
    sprite_part < #01, #07, #07, #1F, #00, #$000E >   ;00
    sprite_part < #01, #07, #07, #02, #1D, #$004A >   ;01
    sprite_part < #01, #07, #07, #12, #0D, #$006A >   ;02
    sprite_part < #01, #00, #0E, #00, #1F, #$004C >   ;03
    sprite_part < #01, #0E, #00, #00, #1F, #$404C >   ;04
    sprite_part < #01, #00, #0E, #10, #0F, #$006C >   ;05
    sprite_part < #01, #0E, #00, #10, #0F, #$406C >   ;06
  ] >   ;00
]

sprite_group_17B2D1 [
  sprite_group < #10, #10, #2F, #08, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #06, [
    sprite_part < #01, #08, #08, #00, #27, #$0000 >   ;00
    sprite_part < #01, #00, #10, #0B, #1C, #$0020 >   ;01
    sprite_part < #01, #10, #00, #0B, #1C, #$0022 >   ;02
    sprite_part < #01, #00, #10, #1B, #0C, #$0040 >   ;03
    sprite_part < #01, #10, #00, #1B, #0C, #$0042 >   ;04
    sprite_part < #01, #08, #08, #27, #00, #$000E >   ;05
  ] >   ;00
]

sprite_group_17B308 [
  sprite_group < #13, #15, #13, #12, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #06, [
    sprite_part < #01, #03, #15, #00, #15, #$0002 >   ;00
    sprite_part < #01, #00, #18, #02, #13, #$0064 >   ;01
    sprite_part < #01, #10, #08, #02, #13, #$0066 >   ;02
    sprite_part < #01, #00, #18, #12, #03, #$0084 >   ;03
    sprite_part < #01, #10, #08, #12, #03, #$0086 >   ;04
    sprite_part < #00, #20, #00, #1D, #00, #$0098 >   ;05
  ] >   ;00
]

sprite_group_17B33F [
  sprite_group < #14, #14, #12, #13, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #06, [
    sprite_part < #01, #15, #03, #00, #15, #$4002 >   ;00
    sprite_part < #01, #18, #00, #02, #13, #$4064 >   ;01
    sprite_part < #01, #08, #10, #02, #13, #$4066 >   ;02
    sprite_part < #01, #18, #00, #12, #03, #$4084 >   ;03
    sprite_part < #01, #08, #10, #12, #03, #$4086 >   ;04
    sprite_part < #00, #00, #20, #1D, #00, #$4098 >   ;05
  ] >   ;00
]

sprite_group_17B376 [
  sprite_group < #10, #10, #14, #15, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #05, [
    sprite_part < #01, #00, #10, #09, #10, #$000A >   ;00
    sprite_part < #01, #10, #00, #09, #10, #$000C >   ;01
    sprite_part < #01, #09, #07, #00, #19, #$0004 >   ;02
    sprite_part < #01, #00, #10, #19, #00, #$002A >   ;03
    sprite_part < #01, #10, #00, #19, #00, #$002C >   ;04
  ] >   ;00
]