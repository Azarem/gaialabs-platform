export interface TypedNumber {
  _tag: 'TypedNumber';
  value: number;
  size: number; // byte size
}

export interface Byte {
  _tag: 'Byte';
  value: number;
}

export interface Word {
  _tag: 'Word';
  value: number;
}

export function createTypedNumber(value: number, size: number): TypedNumber {
  return { _tag: 'TypedNumber', value, size };
}

export const createByte = (v: number): Byte => ({ _tag: 'Byte', value: v & 0xff });

export const createWord = (v: number): Word => ({ _tag: 'Word', value: v & 0xffff });
