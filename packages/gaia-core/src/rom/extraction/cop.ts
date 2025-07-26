import { RomDataReader } from './reader';
import {
  Address,
  AddressType,
  AddressSpace,
  LocationWrapper,
  MemberType,
  createByte,
  createWord,
} from 'gaia-shared';
import type { CopDef } from 'gaia-shared';
import type { DbRoot } from 'gaia-shared';
import type { BlockReader } from './blocks';

/**
 * Handles COP (Coprocessor) command processing
 * Converted from GaiaLib/Rom/Extraction/CopCommandProcessor.cs
 */
export class CopCommandProcessor {
  private readonly _blockReader: BlockReader;
  private readonly _romDataReader: RomDataReader;

  constructor(blockReader: BlockReader) {
    this._blockReader = blockReader;
    this._romDataReader = blockReader._romDataReader;
  }

  /**
   * Parses a COP command based on its definition
   */
  public parseCopCommand(copDef: CopDef, operands: unknown[]): void {
    for (const partStr of copDef.parts) {
      // Use the first character to determine the address type (for pointers)
      const addrType = Address.typeFromCode(partStr[0]);
      const isPtr = addrType !== AddressType.Unknown;
      
      // Reference type is the target of a pointer from partStr, or the struct type if not a pointer
      const referenceType = isPtr ? partStr.substring(1) : this._blockReader._currentPart?.struct ?? 'Binary';
      
      // Member type resolves to the underlying pointer type, or partStr
      const memberTypeName = isPtr ? addrType.toString() : partStr;

      // Resolve member type name to a MemberType enum
      const memberType = this.tryParseMemberType(memberTypeName);
      if (memberType === null) {
        throw new Error('Cannot use structs in cop def'); // Only basic types are allowed in COP definitions
      }

      // If there is a label, ignore reading and use the label instead
      const label = this._blockReader._root.labels[this._romDataReader.position];
      if (label) {
        this._romDataReader.position += this.getMemberTypeSize(memberType);
        operands.push(label);
      } else {
        operands.push(this.readMemberTypeValue(memberType, partStr, isPtr, referenceType, addrType));
      }

    }
  }

  private tryParseMemberType(memberTypeName: string): MemberType | null {
    // Check if the string matches any MemberType enum value (case-insensitive)
    const upperName = memberTypeName.toUpperCase();
    for (const [key, value] of Object.entries(MemberType)) {
      if (key.toUpperCase() === upperName) {
        return value;
      }
    }
    return null;
  }

  private getMemberTypeSize(memberType: MemberType): number {
    switch (memberType) {
      case MemberType.Byte:
        return 1;
      case MemberType.Word:
      case MemberType.Offset:
        return 2;
      case MemberType.Address:
        return 3;
      default:
        throw new Error('Unsupported COP member type');
    }
  }

  private readMemberTypeValue(
    memberType: MemberType,
    partStr: string,
    isPtr: boolean,
    referenceType: string,
    addrType: AddressType
  ): unknown {
    switch (memberType) {
      case MemberType.Byte:
        return createByte(this._romDataReader.readByte());
      case MemberType.Word:
        return createWord(this._romDataReader.readUShort());
      case MemberType.Offset:
        return this.createCopLocation(this._romDataReader.readUShort(), null, partStr, isPtr, referenceType, addrType);
      case MemberType.Address:
        return this.createCopLocation(this._romDataReader.readUShort(), this._romDataReader.readByte(), partStr, isPtr, referenceType, addrType);
      default:
        throw new Error('Unsupported COP member type');
    }
  }

  private createCopLocation(
    offset: number, 
    bank: number | null, 
    partStr: string, 
    isPtr: boolean, 
    otherStr: string, 
    type: AddressType
  ): unknown {
    if (bank === null && offset === 0) {
      return createWord(offset);
    }

    const addr = new Address(bank ?? (this._romDataReader.position >> 16), offset);
    if (addr.space === AddressSpace.ROM) {
      const location = addr.toInt();
      if (partStr !== 'Address' && isPtr && !this._blockReader._root.rewrites[location]) {
        this._blockReader.noteType(location, otherStr, true);
      }

      // When address is unknown, try to use the part string (for Offset or Address)
      if (type === AddressType.Unknown) {
        type = this.tryParseAddressType(partStr) ?? AddressType.Unknown;
      }

      return new LocationWrapper(location, type);
    }
    return addr;
  }

  private tryParseAddressType(addressTypeName: string): AddressType | null {
    // Check if the string matches any AddressType enum value (case-insensitive)
    const upperName = addressTypeName.toUpperCase();
    for (const [key, value] of Object.entries(AddressType)) {
      if (key.toUpperCase() === upperName) {
        return value;
      }
    }
    return null;
  }
} 