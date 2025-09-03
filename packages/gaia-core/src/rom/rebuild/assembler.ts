import { DbRoot, RomProcessingConstants, Word, Byte, Long } from '@gaialabs/shared';
import { AsmBlock } from '@gaialabs/shared';
import { StringProcessor } from './string-processor';
import { SortedMap } from './sorted-map';
import { AssemblerState } from './assembler-state';
import type { AssemblerContext } from './assembler-context';

/**
 * Main assembler class for parsing assembly files
 * Converted from GaiaLib/Rom/Rebuild/Assembler.cs
 */
export class Assembler implements AssemblerContext {
  public readonly root: DbRoot;
  private readonly lines: string[];
  private currentLineIndex: number = 0;
  public readonly stringProcessor: StringProcessor;

  public lineBuffer: string = '';
  public includes = new Set<string>();
  public blocks: AsmBlock[] = [];
  public tags = new SortedMap<string | null>();
  public currentBlock: AsmBlock | null = null;
  public lineCount: number = 0;
  public blockIndex: number = 0;
  public lastDelimiter: number | null = null;
  public reqBank: number | null = null;
  public eof: boolean = false;

  constructor(dbRoot: DbRoot, textData: string) {
    this.root = dbRoot;
    // Handle both Windows (\r\n) and Unix (\n) line endings
    this.lines = textData.split(/\r?\n/);
    this.stringProcessor = new StringProcessor(this);
  }

  public dispose(): void {
    this.stringProcessor.dispose();
  }

  public parseAssembly(): { blocks: AsmBlock[], includes: Set<string>, reqBank: number | null } {
    // Initialize root block (no label, location 0) and set as current
    this.blocks.push(this.currentBlock = new AsmBlock());

    // Initialize state machine and process text
    const state = new AssemblerState(this);
    state.processText();

    return { 
      blocks: this.blocks, 
      includes: this.includes, 
      reqBank: this.reqBank 
    };
  }

  public getLine(): boolean {
    // This can happen
    if (this.eof) {
      return false;
    }

    // Keep processing what we already have
    if (this.lineBuffer.length > 0) {
      return true;
    }

    let rawLine: string | null = null;
    
    while (true) {
      // Read next line
      if (this.currentLineIndex >= this.lines.length) {
        if (this.lineBuffer.length === 0) {
          this.eof = true;
          return false;
        } else {
          rawLine = '';
        }
      } else {
        rawLine = this.lines[this.currentLineIndex++];
        this.lineBuffer += rawLine;
      }

      this.lineCount++;

      // Ignore comments
      this.trimComments('--');
      this.trimComments(';');
      this.trimComments('//');

      // Trim
      this.lineBuffer = this.lineBuffer.replace(RomProcessingConstants.COMMA_SPACE_TRIM_REGEX, '');

      // This can happen
      if (this.lineBuffer.length === 0) {
        continue;
      }

      // Process hard line continuations
      if (this.lineBuffer.endsWith('\\')) {
        this.lineBuffer = this.lineBuffer.slice(0, -1);
        continue;
      }

      // Process directives
      if (this.lineBuffer[0] === '?') {
        this.processDirectives();
        this.lineBuffer = '';
        continue;
      }

      // Process tags
      if (this.lineBuffer[0] === '!') {
        this.processTags();
        this.lineBuffer = '';
        continue;
      }

      this.resolveTags();

      return true;
    }
  }

  private trimComments(sequence: string): void {
    // Look for the first instance of the comment sequence
    const index = this.lineBuffer.indexOf(sequence);
    if (index >= 0) {
      // Make sure it's not inside a string
      const strDelimRegex = new RegExp(`[${this.root.stringDelimiters.map(c => c.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')).join('')}]`);
      const strIndex = this.lineBuffer.search(strDelimRegex);
      
      // This works with line continuations because the string ending will not be on this line yet
      // If no string, string starts after comment, or last delimiter is before comment, trim it
      if (strIndex < 0 || 
          strIndex > index || 
          this.lineBuffer.lastIndexOf(this.lineBuffer[strIndex] || '') < index) {
        this.lineBuffer = this.lineBuffer.substring(0, index);
      }
    }
  }

  private processDirectives(): void {
          // Find end of directive
      let endIx = this.lineBuffer.search(RomProcessingConstants.COMMA_SPACE_REGEX);

    // Default to line length if no end characters
    if (endIx < 0) {
      endIx = this.lineBuffer.length;
    }

    const value = this.lineBuffer.substring(endIx).replace(/^[\s,\t]+/, '');

    switch (this.lineBuffer.substring(1, endIx).toUpperCase()) {
      // This is taken care of by the loader
      case 'BANK':
        this.reqBank = parseInt(value, 16);
        break;

      case 'INCLUDE':
        if (value.length > 0) {
          this.includes.add(value.toUpperCase().replace(/'/g, ''));
        }
        break;
    }
  }

  private processTags(): void {
    // Remove the '!' prefix and trim leading spaces
    this.lineBuffer = this.lineBuffer.substring(1).replace(/^[\s,\t]+/, '');

    // Process as many pairs as we can
    while (this.lineBuffer.length > 0) {
      // Default name and value
      let name = this.lineBuffer;
      let value: string | null = null;

      // Find first index of comma/space/tab
      let endIx = this.lineBuffer.search(/[\s,\t]/);

      if (endIx >= 0) {
        // Split into name and value
        name = this.lineBuffer.substring(0, endIx);
        value = this.lineBuffer.substring(endIx + 1).replace(/^[\s,\t]+/, '');

        // Find next index of comma/space/tab inside value
        const nextIx = value.search(/[\s,\t]/);
        if (nextIx >= 0) {
          // Line buffer then take the remainder
          this.lineBuffer = value.substring(nextIx + 1).replace(/^[\s,\t]+/, '');
          // Value takes up to next index
          value = value.substring(0, nextIx);
        } else {
          this.lineBuffer = ''; // No more pairs, clear buffer
        }
      } else {
        this.lineBuffer = ''; // Take all as name, clear buffer
      }

      // Assign name/value pair to tags
      this.tags.set(name, value);
    }
  }

  private resolveTags(): void {
    // Tags are sorted by length descending so longer tags are replaced first (avoids minor conflicts)
    for (const [key, value] of this.tags) {
      let ix: number;
      while ((ix = this.lineBuffer.toLowerCase().indexOf(key.toLowerCase())) >= 0) {
        this.lineBuffer = this.lineBuffer.substring(0, ix) + (value || '') + 
                          this.lineBuffer.substring(ix + key.length);
      }
    }
  }

  public parseOperand(opnd: string): unknown {
    if (!opnd) return null;

    if(opnd.match(/^[a-fA-F0-9]{2,6}$/)){
      switch(opnd.length){
        case 2:
          return new Byte(parseInt(opnd, 16));
        case 4:
          return new Word(parseInt(opnd, 16));
        case 6:
          return new Long(parseInt(opnd, 16));
      }
    }

    return opnd;
  }

  public processRawData(): void {
    let reverse = false;

    // Immediate binary marker
    if (this.lineBuffer[0] === '#') {
      this.lineBuffer = this.lineBuffer.substring(1);
    }

    // Reverse binary marker
    if (this.lineBuffer[0] === '$') {
      reverse = true;
      this.lineBuffer = this.lineBuffer.substring(1);
    }

    let hex: string;
    const symbolIx = this.lineBuffer.search(RomProcessingConstants.SYMBOL_SPACE_REGEX);
    if (symbolIx >= 0) {
      hex = this.lineBuffer.substring(0, symbolIx);
      this.lineBuffer = this.lineBuffer.substring(symbolIx).replace(/^[, \t]+/, '');
    } else {
      hex = this.lineBuffer;
      this.lineBuffer = '';
    }

    if (hex.length > 0) {
      // Keep string values of address markers so they can be resolved later
      if (RomProcessingConstants.ADDRESS_SPACE.includes(hex[0])) {
        this.currentBlock!.objList.push(hex);
        this.currentBlock!.size += RomProcessingConstants.getSize(hex);
      } else {
        const data = this.hexStringToBytes(hex);
        if (data.length === 1) {
          this.currentBlock!.objList.push(new Byte(data[0]));
          this.currentBlock!.size++;
        } else {
          if (reverse) {
            data.reverse();
          }

          // Explicitly change two-byte data into number for easier processing later
          if (data.length === 2) {
            this.currentBlock!.objList.push(new Word(data[0] | (data[1] << 8)));
            this.currentBlock!.size += 2;
          } else {
            this.currentBlock!.objList.push(data);
            this.currentBlock!.size += data.length;
          }
        }
      }
    }
  }

  private hexStringToBytes(hex: string): Uint8Array {
    const result = new Uint8Array(hex.length / 2);
    for (let i = 0; i < hex.length; i += 2) {
      result[i / 2] = parseInt(hex.substring(i, i + 2), 16);
    }
    return result;
  }
}
