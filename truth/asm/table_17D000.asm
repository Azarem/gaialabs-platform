?BANK 17

---------------------------------------------

table_17D000 [
  &sprite_set_17D010   ;00
  &sprite_set_17D01E   ;01
  &sprite_set_17D02C   ;02
  &sprite_set_17D03A   ;03
  &sprite_set_17D048   ;04
  &sprite_set_17D04E   ;05
  &sprite_set_17D054   ;06
  &sprite_set_17D05A   ;07
]

sprite_set_17D010 [
  sprite_set < #$0005, &sprite_group_17D30C >   ;00
  sprite_set < #$0002, &sprite_group_17D358 >   ;01
  sprite_set < #$0002, &sprite_group_17D3A4 >   ;02
]

sprite_set_17D01E [
  sprite_set < #$0005, &sprite_group_17D228 >   ;00
  sprite_set < #$0002, &sprite_group_17D274 >   ;01
  sprite_set < #$0002, &sprite_group_17D2C0 >   ;02
]

sprite_set_17D02C [
  sprite_set < #$0005, &sprite_group_17D144 >   ;00
  sprite_set < #$0002, &sprite_group_17D190 >   ;01
  sprite_set < #$0002, &sprite_group_17D1DC >   ;02
]

sprite_set_17D03A [
  sprite_set < #$0005, &sprite_group_17D060 >   ;00
  sprite_set < #$0002, &sprite_group_17D0AC >   ;01
  sprite_set < #$0002, &sprite_group_17D0F8 >   ;02
]

sprite_set_17D048 [
  sprite_set < #$0009, &sprite_group_17D3A4 >   ;00
]

sprite_set_17D04E [
  sprite_set < #$0009, &sprite_group_17D2C0 >   ;00
]

sprite_set_17D054 [
  sprite_set < #$0009, &sprite_group_17D1DC >   ;00
]

sprite_set_17D05A [
  sprite_set < #$0009, &sprite_group_17D0F8 >   ;00
]

sprite_group_17D060 [
  sprite_group < #17, #0F, #17, #0C, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #16, #00, #13, #00, #$4444 >   ;00
    sprite_part < #01, #06, #10, #13, #00, #$4446 >   ;01
    sprite_part < #00, #00, #1E, #06, #15, #$4463 >   ;02
    sprite_part < #00, #00, #1E, #0E, #0D, #$4464 >   ;03
    sprite_part < #01, #06, #10, #06, #0D, #$4442 >   ;04
    sprite_part < #01, #13, #03, #06, #0D, #$4440 >   ;05
    sprite_part < #00, #0E, #10, #00, #1B, #$4461 >   ;06
    sprite_part < #00, #06, #18, #00, #1B, #$4462 >   ;07
    sprite_part < #00, #16, #08, #00, #1B, #$4460 >   ;08
  ] >   ;00
]

sprite_group_17D0AC [
  sprite_group < #16, #11, #18, #0D, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #17, #00, #15, #00, #$4444 >   ;00
    sprite_part < #01, #07, #10, #15, #00, #$4446 >   ;01
    sprite_part < #00, #00, #1F, #07, #16, #$4463 >   ;02
    sprite_part < #00, #00, #1F, #0F, #0E, #$4464 >   ;03
    sprite_part < #01, #07, #10, #07, #0E, #$4442 >   ;04
    sprite_part < #01, #15, #02, #07, #0E, #$4440 >   ;05
    sprite_part < #00, #0F, #10, #00, #1D, #$4461 >   ;06
    sprite_part < #00, #07, #18, #00, #1D, #$4462 >   ;07
    sprite_part < #00, #17, #08, #00, #1D, #$4460 >   ;08
  ] >   ;00
]

sprite_group_17D0F8 [
  sprite_group < #15, #13, #1A, #0F, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #18, #00, #19, #00, #$4444 >   ;00
    sprite_part < #01, #08, #10, #19, #00, #$4446 >   ;01
    sprite_part < #00, #00, #20, #09, #18, #$4463 >   ;02
    sprite_part < #00, #00, #20, #11, #10, #$4464 >   ;03
    sprite_part < #01, #08, #10, #09, #10, #$4442 >   ;04
    sprite_part < #01, #18, #00, #09, #10, #$4440 >   ;05
    sprite_part < #00, #10, #10, #01, #20, #$4461 >   ;06
    sprite_part < #00, #08, #18, #01, #20, #$4462 >   ;07
    sprite_part < #00, #18, #08, #00, #21, #$4460 >   ;08
  ] >   ;00
]

sprite_group_17D144 [
  sprite_group < #0F, #17, #17, #0C, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #00, #16, #13, #00, #$0444 >   ;00
    sprite_part < #01, #10, #06, #13, #00, #$0446 >   ;01
    sprite_part < #00, #1E, #00, #06, #15, #$0463 >   ;02
    sprite_part < #00, #1E, #00, #0E, #0D, #$0464 >   ;03
    sprite_part < #01, #10, #06, #06, #0D, #$0442 >   ;04
    sprite_part < #01, #03, #13, #06, #0D, #$0440 >   ;05
    sprite_part < #00, #10, #0E, #00, #1B, #$0461 >   ;06
    sprite_part < #00, #18, #06, #00, #1B, #$0462 >   ;07
    sprite_part < #00, #08, #16, #00, #1B, #$0460 >   ;08
  ] >   ;00
]

sprite_group_17D190 [
  sprite_group < #11, #16, #18, #0D, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #00, #17, #15, #00, #$0444 >   ;00
    sprite_part < #01, #10, #07, #15, #00, #$0446 >   ;01
    sprite_part < #00, #1F, #00, #07, #16, #$0463 >   ;02
    sprite_part < #00, #1F, #00, #0F, #0E, #$0464 >   ;03
    sprite_part < #01, #10, #07, #07, #0E, #$0442 >   ;04
    sprite_part < #01, #02, #15, #07, #0E, #$0440 >   ;05
    sprite_part < #00, #10, #0F, #00, #1D, #$0461 >   ;06
    sprite_part < #00, #18, #07, #00, #1D, #$0462 >   ;07
    sprite_part < #00, #08, #17, #00, #1D, #$0460 >   ;08
  ] >   ;00
]

sprite_group_17D1DC [
  sprite_group < #13, #15, #1A, #0F, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #00, #18, #19, #00, #$0444 >   ;00
    sprite_part < #01, #10, #08, #19, #00, #$0446 >   ;01
    sprite_part < #00, #20, #00, #09, #18, #$0463 >   ;02
    sprite_part < #00, #20, #00, #11, #10, #$0464 >   ;03
    sprite_part < #01, #10, #08, #09, #10, #$0442 >   ;04
    sprite_part < #01, #00, #18, #09, #10, #$0440 >   ;05
    sprite_part < #00, #10, #10, #01, #20, #$0461 >   ;06
    sprite_part < #00, #18, #08, #01, #20, #$0462 >   ;07
    sprite_part < #00, #08, #18, #00, #21, #$0460 >   ;08
  ] >   ;00
]

sprite_group_17D228 [
  sprite_group < #15, #15, #18, #12, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #0D, #0D, #00, #1A, #$0448 >   ;00
    sprite_part < #01, #0D, #0D, #0D, #0D, #$044A >   ;01
    sprite_part < #01, #0D, #0D, #1A, #00, #$044C >   ;02
    sprite_part < #01, #1A, #00, #0D, #0D, #$044E >   ;03
    sprite_part < #01, #00, #1A, #0D, #0D, #$444E >   ;04
    sprite_part < #00, #1A, #08, #05, #1D, #$0468 >   ;05
    sprite_part < #00, #21, #01, #05, #1D, #$0469 >   ;06
    sprite_part < #00, #01, #21, #05, #1D, #$4469 >   ;07
    sprite_part < #00, #08, #1A, #05, #1D, #$4468 >   ;08
  ] >   ;00
]

sprite_group_17D274 [
  sprite_group < #16, #16, #1B, #11, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #0E, #0E, #00, #1C, #$0448 >   ;00
    sprite_part < #01, #0E, #0E, #0E, #0E, #$044A >   ;01
    sprite_part < #01, #0E, #0E, #1C, #00, #$044C >   ;02
    sprite_part < #01, #1C, #00, #0E, #0E, #$044E >   ;03
    sprite_part < #01, #00, #1C, #0E, #0E, #$444E >   ;04
    sprite_part < #00, #1C, #08, #06, #1E, #$0468 >   ;05
    sprite_part < #00, #24, #00, #06, #1E, #$0469 >   ;06
    sprite_part < #00, #00, #24, #06, #1E, #$4469 >   ;07
    sprite_part < #00, #08, #1C, #06, #1E, #$4468 >   ;08
  ] >   ;00
]

sprite_group_17D2C0 [
  sprite_group < #18, #18, #20, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #10, #10, #00, #20, #$0448 >   ;00
    sprite_part < #01, #10, #10, #10, #10, #$044A >   ;01
    sprite_part < #01, #10, #10, #20, #00, #$044C >   ;02
    sprite_part < #01, #20, #00, #10, #10, #$044E >   ;03
    sprite_part < #01, #00, #20, #10, #10, #$444E >   ;04
    sprite_part < #00, #20, #08, #08, #20, #$0468 >   ;05
    sprite_part < #00, #28, #00, #08, #20, #$0469 >   ;06
    sprite_part < #00, #00, #28, #08, #20, #$4469 >   ;07
    sprite_part < #00, #08, #20, #08, #20, #$4468 >   ;08
  ] >   ;00
]

sprite_group_17D30C [
  sprite_group < #15, #15, #12, #18, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #0D, #0D, #1A, #00, #$8448 >   ;00
    sprite_part < #01, #0D, #0D, #0D, #0D, #$844A >   ;01
    sprite_part < #01, #0D, #0D, #00, #1A, #$844C >   ;02
    sprite_part < #01, #1A, #00, #0D, #0D, #$844E >   ;03
    sprite_part < #01, #00, #1A, #0D, #0D, #$C44E >   ;04
    sprite_part < #00, #1A, #08, #1D, #05, #$8468 >   ;05
    sprite_part < #00, #21, #01, #1D, #05, #$8469 >   ;06
    sprite_part < #00, #01, #21, #1D, #05, #$C469 >   ;07
    sprite_part < #00, #08, #1A, #1D, #05, #$C468 >   ;08
  ] >   ;00
]

sprite_group_17D358 [
  sprite_group < #16, #16, #11, #1B, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #0E, #0E, #1C, #00, #$8448 >   ;00
    sprite_part < #01, #0E, #0E, #0E, #0E, #$844A >   ;01
    sprite_part < #01, #0E, #0E, #00, #1C, #$844C >   ;02
    sprite_part < #01, #1C, #00, #0E, #0E, #$844E >   ;03
    sprite_part < #01, #00, #1C, #0E, #0E, #$C44E >   ;04
    sprite_part < #00, #1C, #08, #1E, #06, #$8468 >   ;05
    sprite_part < #00, #24, #00, #1E, #06, #$8469 >   ;06
    sprite_part < #00, #00, #24, #1E, #06, #$C469 >   ;07
    sprite_part < #00, #08, #1C, #1E, #06, #$C468 >   ;08
  ] >   ;00
]

sprite_group_17D3A4 [
  sprite_group < #18, #18, #10, #20, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #09, [
    sprite_part < #01, #10, #10, #20, #00, #$8448 >   ;00
    sprite_part < #01, #10, #10, #10, #10, #$844A >   ;01
    sprite_part < #01, #10, #10, #00, #20, #$844C >   ;02
    sprite_part < #01, #20, #00, #10, #10, #$844E >   ;03
    sprite_part < #01, #00, #20, #10, #10, #$C44E >   ;04
    sprite_part < #00, #20, #08, #20, #08, #$8468 >   ;05
    sprite_part < #00, #28, #00, #20, #08, #$8469 >   ;06
    sprite_part < #00, #00, #28, #20, #08, #$C469 >   ;07
    sprite_part < #00, #08, #20, #20, #08, #$C468 >   ;08
  ] >   ;00
]