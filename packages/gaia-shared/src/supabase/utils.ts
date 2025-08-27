/**
 * Utility functions for Supabase integration
 */

/**
 * Get environment variable value that works in both browser and Node.js contexts
 * @param key - The environment variable key to retrieve
 * @throws {Error} If the environment variable is not set
 * @returns The environment variable value
 */
export function getEnvVar(key: string): string {
  // Try different environment variable sources in order of preference
  const value = 
    // Browser with Vite (import.meta.env)
    ((typeof globalThis !== 'undefined' && typeof (globalThis as any).window !== 'undefined') && 
     (import.meta as any)?.env?.[key]) ||
    // Node.js (process.env)
    (typeof process !== 'undefined' && process.env?.[key]) ||
    '';
  
  if (!value) {
    throw new Error(`Required environment variable ${key} is not set`);
  }
  
  return value;
}

/**
 * Convert base64 string to Uint8Array for binary data processing
 * @param base64 - Base64 encoded string
 * @returns Uint8Array containing the binary data
 */
export function base64ToUint8Array(base64: string): Uint8Array {
  // Handle data URLs by extracting just the base64 part
  const base64Data = base64.includes(',') ? base64.split(',')[1] : base64;
  
  try {
    // Use browser's built-in atob if available
    if (typeof atob !== 'undefined') {
      const binaryString = atob(base64Data);
      const bytes = new Uint8Array(binaryString.length);
      for (let i = 0; i < binaryString.length; i++) {
        bytes[i] = binaryString.charCodeAt(i);
      }
      return bytes;
    }
    
    // Node.js fallback
    if (typeof Buffer !== 'undefined') {
      return new Uint8Array(Buffer.from(base64Data, 'base64'));
    }
    
    throw new Error('No base64 decoding method available');
  } catch (error) {
    throw new Error(`Failed to decode base64 data: ${error instanceof Error ? error.message : 'Unknown error'}`);
  }
}

/**
 * Convert Uint8Array to base64 string
 * @param uint8Array - Binary data as Uint8Array
 * @returns Base64 encoded string
 */
export function uint8ArrayToBase64(uint8Array: Uint8Array): string {
  try {
    // Use browser's built-in btoa if available
    if (typeof btoa !== 'undefined') {
      const binaryString = Array.from(uint8Array)
        .map(byte => String.fromCharCode(byte))
        .join('');
      return btoa(binaryString);
    }
    
    // Node.js fallback
    if (typeof Buffer !== 'undefined') {
      return Buffer.from(uint8Array).toString('base64');
    }
    
    throw new Error('No base64 encoding method available');
  } catch (error) {
    throw new Error(`Failed to encode base64 data: ${error instanceof Error ? error.message : 'Unknown error'}`);
  }
}

/**
 * Validate that required environment variables are set
 * @param requiredVars - Array of environment variable names that must be set
 * @throws {Error} If any required environment variable is missing
 */
export function validateEnvironmentVariables(requiredVars: string[]): void {
  const missingVars: string[] = [];
  
  for (const varName of requiredVars) {
    try {
      getEnvVar(varName);
    } catch {
      missingVars.push(varName);
    }
  }
  
  if (missingVars.length > 0) {
    throw new Error(
      `Missing required environment variables: ${missingVars.join(', ')}\n` +
      'Make sure to set VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY in your environment'
    );
  }
}
