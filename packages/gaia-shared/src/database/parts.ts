
/**
 * Database part definition
 * Converted from GaiaLib/Database/DbPart.cs
 */
export interface DbPart {
  name: string;
  start: number;
  end: number;
  struct: string;
  bank?: number;
  block: string;
  size: number;
  
  // Internal references (handled by database root)
  //_block?: any; // DbBlock reference
  //includes?: Set<DbPart>;
  //objectRoot?: unknown;
}
