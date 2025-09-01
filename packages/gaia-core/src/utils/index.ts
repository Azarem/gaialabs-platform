export function indexOfAny(str: string, chars: string[], startIndex = 0): number {
  for (let i = startIndex; i < str.length; i++) {
    if (chars.includes(str[i])) {
      return i;
    }
  }
  return -1;
}

export * from './debug-export';
