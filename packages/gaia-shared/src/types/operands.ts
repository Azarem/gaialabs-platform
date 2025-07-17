export interface TypedNumber {
  _tag: 'TypedNumber';
  value: number;
  size: number; // byte size
}

export function createTypedNumber(value: number, size: number): TypedNumber {
  return { _tag: 'TypedNumber', value, size };
}
