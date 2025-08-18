/**
 * ROM processing constants
 * Converted from GaiaLib/Types/RomProcessingConstants.cs
 */
export class RomProcessingConstants {
  // Core constants
  public static readonly PAGE_SIZE = 0x8000;
  public static readonly SNES_HEADER_SIZE = 0x50;

  // Dictionary constants
  public static readonly DICTIONARIES = ["dictionary_01EBA8", "dictionary_01F54D"];
  public static readonly DICT_COMMANDS = [0xD6, 0xD7];
  public static readonly END_CHARS = [0xC0, 0xCA, 0xD1];

  // Character arrays for parsing
  public static readonly WHITESPACE = [' ', '\t'];
  public static readonly OPERATORS = ['-', '+'];
  public static readonly COMMA_SPACE = [',', ' ', '\t'];
  public static readonly ADDRESS_SPACE = ['@', '&', '^', '#', '$', '%', '*'];
  public static readonly SYMBOL_SPACE = [',', ' ', '\t', '<', '>', '(', ')', ':', '[', ']', '{', '}', '`', '~', '|'];
  public static readonly LABEL_SPACE = ['[', '{', '#', '`', '~', '|', ':'];
  public static readonly OBJECT_SPACE = ['<', '['];
  public static readonly COP_SPLIT_CHARS = [' ', '\t', ',', '(', ')', '[', ']', '$', '#'];

  // Pre-compiled regular expressions for parsing
  public static readonly WHITESPACE_REGEX = /[ \t]/;
  public static readonly COMMA_SPACE_REGEX = /[, \t]/;
  public static readonly SYMBOL_SPACE_REGEX = /[, \t<>()\:\[\]{}`~|]/;
  public static readonly LABEL_SPACE_REGEX = /[\[{#`~|:]/;
  public static readonly OBJECT_SPACE_REGEX = /[<\[]/;
  public static readonly ADDRESS_SPACE_REGEX = /[@&^#$%*]/;
  public static readonly COP_SPLIT_REGEX = /[ \t,()[\]$#]/;
  
  // Trim patterns (for start/end of string)
  public static readonly COMMA_SPACE_TRIM_REGEX = /^[, \t]+|[, \t]+$/g;

  /**
   * Gets the size of an object for processing purposes
   * @param obj The object to get the size for
   * @returns Size in bytes
   * @throws Error when unable to determine size
   */
  public static getSize(obj: unknown): number {
    if (obj && typeof obj === 'object') {
      if ('size' in obj) {
        return (obj as { size: number }).size;
      }
      if ('_tag' in obj) {
        switch ((obj as { _tag: string })._tag) {
          case 'Byte':
            return 1;
          case 'Word':
            return 2;
        }
      }
    } else if (obj instanceof Uint8Array) {
      return obj.length;
    } else if (typeof obj === 'number') {
      // Determine size based on value range
      if (obj <= 0xFF) return 1;
      if (obj <= 0xFFFF) return 2;
      if (obj <= 0xFFFFFF) return 3;
      return 4;
    } else if (typeof obj === 'string') {
      if (obj.length > 0) {
        switch (obj[0]) {
          case '@':
            return 3;
          case '*':
          case '&':
            return 2;
          case '^':
            return 1;
        }

        switch (obj) {
          case "Byte":
            return 1;
          case "Word":
            return 2;
          case "Offset":
            return 2;
          case "Address":
            return 3;
        }
      }
    }

    throw new Error(`Unable to get size for operand '${obj}'`);
  }
}

/**
 * BlockReader specific constants
 */
export class BlockReaderConstants {
  public static readonly REF_SEARCH_MAX_RANGE = 0x1A0;
  public static readonly BANK_MASK_CHECK = 0x40;
  public static readonly BYTE_DELIMITER_THRESHOLD = 0x100;
  public static readonly BANK_HIGH_MEMORY_1 = 0x7E;
  public static readonly BANK_HIGH_MEMORY_2 = 0x7F;
  public static readonly POINTER_CHARACTERS = ['&', '@'];
  public static readonly WIDE_STRING_TYPE = "WideString";
  public static readonly BINARY_TYPE = "Binary";
  public static readonly CODE_TYPE = "Code";
  
  // Format strings
  public static readonly LOCATION_FORMAT = "loc_{0:X6}";
  public static readonly TYPE_NAME_FORMAT = "{0}_{1:X6}";
  public static readonly OFFSET_FORMAT = "+{0:X}";
  public static readonly MARKER_FORMAT = "+M";
  public static readonly NEGATIVE_OFFSET_FORMAT = "-{0:X}";
  public static readonly NEGATIVE_MARKER_FORMAT = "-M";
} 