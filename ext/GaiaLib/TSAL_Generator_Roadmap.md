# Roadmap: TSAL Generator for GaiaLib

This document outlines a comprehensive roadmap for creating a TSAL (TypeScript Assembly Language) generator within the `GaiaLib` C# solution. The goal is to create a new module that serializes the existing in-memory representation of the game's ROM into high-quality, human-readable TSAL code.

## Workflow Diagram

```
[Diagram Placeholder: A workflow diagram showing ROM/JSONs entering the C# Extraction Process, which creates an in-memory AsmBlock model. This model is then fed to a new TsalSerializer, which uses TsalWriter and Op.ToTsal() extensions to generate a final .ts file.]
```

---

## Phase 1: Foundation & Core Components

*Objective: Set up the project structure and create the essential classes for code generation.*

1.  **Task: Create the Generator's Home.**
    *   Create a new folder within the `GaiaLib` project named `Tsal`. All new generator-related files will reside here.

2.  **Task: Build the `TsalWriter.cs` Utility.**
    *   Create a class `TsalWriter` that simplifies writing TypeScript code.
    *   **Key Features:**
        *   Manages indentation levels (`Indent()` and `Unindent()` methods).
        *   Provides `WriteLine(string)` to write an indented line.
        *   Includes helpers like `OpenBlock()` and `CloseBlock()` to write `{` and `}` with correct indentation.

3.  **Task: Create the `TsalSerializer.cs` Orchestrator.**
    *   Create the main class `TsalSerializer`.
    *   It will have a primary method: `public string Serialize(IEnumerable<AsmBlock> blocks)`.
    *   This class will use the `TsalWriter` to build the final output string.

4.  **Task: Establish `AddressingMode` Mapping.**
    *   In `TsalSerializer`, create a `static Dictionary<AddressingMode, string>` to map the C# enum to the TSAL function suffixes (e.g., `AddressingMode.Immediate` -> `"imm"`, `AddressingMode.Absolute` -> `"abs"`).

---

## Phase 2: Instruction-Level Generation

*Objective: Convert a single `Op` object into a valid TSAL string. This is the most critical translation step.*

1.  **Task: Implement Operand Formatting Logic.**
    *   Create a helper method `string FormatOperand(object operand)` in `TsalSerializer`.
    *   This method will inspect the operand's type:
        *   `int`, `byte`, `short`: Format as a hexadecimal string (e.g., `0x1A`, `word(0x1234)`).
        *   `string`: Treat as a label name and output directly.
        *   Other custom types: Determine their correct TSAL representation.

2.  **Task: Implement `Op.ToTsal()` Extension Method.**
    *   Create a static class `TsalExtensions` and an extension method `public static string ToTsal(this Op op, TsalSerializer serializer)`.
    *   This method will contain the core logic:
        *   Look up the mnemonic (`op.Code.Mnem`) and addressing mode suffix.
        *   Format the operands using `FormatOperand`.
        *   Handle the special case for `COP` instructions, formatting them as `COP[0xOPCODE](...)`.
        *   Construct and return the final string, e.g., `LDA.imm(byte(0x42))`.

---

## Phase 3: Block-Level Generation

*Objective: Convert an entire `AsmBlock` into a TSAL `code`, `layout`, or `pointerTable` definition.*

1.  **Task: Implement `AsmBlock` Serialization.**
    *   In `TsalSerializer`, create the method `private void SerializeBlock(AsmBlock block, TsalWriter writer)`.
    *   This method will be the primary dispatcher for `AsmBlock` objects.

2.  **Task: Handle Code Blocks.**
    *   If a block represents code (`!block.IsString`), generate the `const func_... = code(ctx => { ... });` structure.
    *   **Internal Label Management:** Before generating the `emit` array, scan the `block.ObjList` for any internal labels. For each one found, write a `const my_label = label();` declaration at the top of the function.
    *   In the `ctx.emit([...])` array, render the `ToTsal()` string for each `Op` and render the names of the internal labels.

3.  **Task: Handle Data & String Blocks.**
    *   If a block is data/string (`block.IsString`), generate a `const data_... = layout([...]);` or a more specific type like `const text_... = new WideStringObject(...)`.
    *   This will require analyzing the contents of `ObjList` to determine the appropriate data factories (`byte()`, `word()`, etc.).

---

## Phase 4: Pipeline Integration & Execution

*Objective: Connect the generator to the existing extraction process and produce `.ts` files.*

1.  **Task: Create the `TsalGenerationPipeline.cs`.**
    *   This class will manage the end-to-end process.
    *   It will be responsible for:
        *   Invoking the existing `BlockReader` to get the list of `AsmBlock`s.
        *   Instantiating `TsalSerializer`.
        *   Calling `Serialize()` to get the final TypeScript code.
        *   Writing the output string to a `.ts` file (e.g., `generated/sFA_diary_menu.ts`).

2.  **Task: Create a New Entry Point.**
    *   Modify `GaiaDump/Program.cs` or your main application entry point.
    *   Add a new command-line argument (e.g., `--target=tsal`) that executes the `TsalGenerationPipeline`.

3.  **Task: Manage Imports.**
    *   The pipeline will be responsible for adding the necessary `import { ... } from './platform';` and `import { ... } from './game';` lines at the top of each generated file.

---

## Phase 5: Advanced Features & Refinement

*Objective: Improve the quality of the generated code by recognizing higher-level patterns.*

1.  **Task: Implement Pointer Table Detection.**
    *   Enhance the `SerializeBlock` logic to detect if a data block is a sequence of pointers (e.g., a list of `DW` ops pointing to known labels).
    *   When this pattern is found, generate the type-safe `pointerTable<Code>([...])` syntax instead of a generic `layout`.

2.  **Task: Improve Type Inference.**
    *   Refine the data block serialization to recognize specific data structures defined in your database (e.g., `structs.json`) and generate corresponding `new MyStruct(...)` calls in TSAL. 