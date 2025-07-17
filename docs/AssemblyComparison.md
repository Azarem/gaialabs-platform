# Assembly Output Comparison

This document summarizes differences observed between the C# disassembly and the current TypeScript output for the `sE6_gaia` scene.

## Missing COP parameters
The C# output shows each `COP` instruction with its full parameter list, for example:

```
COP [D9] ( #$0000, &code_list_08D7E2 )
```

from lines 118‑126 of `sE6_gaia(C#).asm`.
However, the TypeScript output lacks these operands and only prints the opcode:

```
COP [D9]
```

(from lines 96‑104 of `sE6_gaia(TS).asm`).
This indicates that `CopCommandProcessor.parseCopCommand` is not attaching
parsed operands to the operation.

## Rewritten literals
Numerous immediate values in the TypeScript file are replaced by label
expressions such as `@BMP_000000+4` instead of simple hex literals. Example:

```
CMP #$@BMP_000000+4
```

(from line 19 of the TypeScript file) vs.

```
CMP #$0004
```

(from line 26 of the C# file).
These substitutions come from the transform logic during reference
resolution and differ from the C# disassembly.

## Missing include directives
The C# version begins with several `?INCLUDE` statements which are absent in
the TypeScript output. This suggests the block writer is not emitting
includes from the block metadata.

## Suggested areas to inspect
- Ensure `CopCommandProcessor` receives the correct `CopDef` for each opcode
  and pushes all parsed operands before `AsmReader` constructs the `Op`.
- Review the transform application in `TransformProcessor` and
  `ReferenceManager.resolveName` to avoid rewriting small constants into
  labels when the C# version uses raw numbers.
- Verify `BlockWriter.writeBlocks` writes each block's include list at the
  top of the output file.

Addressing these points should help align the TypeScript disassembly with
the C# reference output.
