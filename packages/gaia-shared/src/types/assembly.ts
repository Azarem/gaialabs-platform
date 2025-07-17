/**
 * Represents a block of assembly code or data
 */
export class AsmBlock {
  public label?: string;
  public location: number;
  public size: number;
  public isString: boolean;
  public objList: unknown[];

  constructor(
    location: number = 0,
    size: number = 0,
    isString: boolean = false,
    label?: string
  ) {
    this.label = label;
    this.location = location;
    this.size = size;
    this.isString = isString;
    this.objList = [];
  }
} 