/**
 * Universal file reading utilities
 * Works in both Node.js and browser environments
 */

// Platform detection
const isNode = typeof process !== 'undefined' && process.versions?.node;
const isBrowser = typeof globalThis !== 'undefined' && 'window' in globalThis;

export interface FileReadOptions {
  encoding?: 'utf8' | 'binary';
}

/**
 * Read a file as text
 * @param path File path or URL
 * @param options Read options
 * @returns Promise<string>
 */
export async function readFileAsText(path: string, options: FileReadOptions = {}): Promise<string> {
  const { encoding = 'utf8' } = options;
  
  if (isNode) {
    // Node.js environment
    const fs = await import('fs');
    const pathModule = await import('path');
    
    const fullPath = pathModule.resolve(path);
    if (!fs.existsSync(fullPath)) {
      throw new Error(`File not found: ${fullPath}`);
    }
    
    let text = fs.readFileSync(fullPath, encoding);
    
    // Strip UTF-8 BOM if present
    if (text.charCodeAt(0) === 0xFEFF) {
      text = text.slice(1);
    }
    
    return text;
  } else {
    // Browser environment
    const response = await fetch(path);
    if (!response.ok) {
      throw new Error(`Failed to fetch file: ${path} (${response.status})`);
    }
    
    let text = await response.text();
    
    // Strip UTF-8 BOM if present
    if (text.charCodeAt(0) === 0xFEFF) {
      text = text.slice(1);
    }
    
    return text;
  }
}

/**
 * Read a file as binary data (Uint8Array)
 * @param path File path or URL
 * @returns Promise<Uint8Array>
 */
export async function readFileAsBinary(path: string): Promise<Uint8Array> {
  if (isNode) {
    // Node.js environment
    const fs = await import('fs');
    const pathModule = await import('path');
    
    const fullPath = pathModule.resolve(path);
    if (!fs.existsSync(fullPath)) {
      throw new Error(`File not found: ${fullPath}`);
    }
    
    const buffer = fs.readFileSync(fullPath);
    return new Uint8Array(buffer);
  } else {
    // Browser environment
    const response = await fetch(path);
    if (!response.ok) {
      throw new Error(`Failed to fetch file: ${path} (${response.status})`);
    }
    
    const arrayBuffer = await response.arrayBuffer();
    return new Uint8Array(arrayBuffer);
  }
}

/**
 * Read a JSON file and parse it
 * @param path File path or URL
 * @returns Promise<any>
 */
export async function readJsonFile<T = any>(path: string): Promise<T> {
  const text = await readFileAsText(path);
  return JSON.parse(text) as T;
}

/**
 * Check if a file exists
 * @param path File path
 * @returns Promise<boolean>
 */
export async function fileExists(path: string): Promise<boolean> {
  if (isNode) {
    // Node.js environment
    const fs = await import('fs');
    const pathModule = await import('path');
    
    const fullPath = pathModule.resolve(path);
    return fs.existsSync(fullPath);
  } else {
    // Browser environment - try to fetch and check if successful
    try {
      const response = await fetch(path, { method: 'HEAD' });
      return response.ok;
    } catch {
      return false;
    }
  }
}

/**
 * Get the directory path containing a file
 * @param filePath File path
 * @returns string
 */
export function getDirectory(filePath: string): string {
  if (isNode) {
    // Node.js environment
    const path = require('path');
    return path.dirname(path.resolve(filePath));
  } else {
    // Browser environment
    const url = new URL(filePath, (globalThis as any).location.href);
    return url.pathname.split('/').slice(0, -1).join('/') || './';
  }
} 