import React, { useCallback, useState } from 'react';
import { crc32_buffer } from '@gaialabs/shared';

interface FileUploadProps {
  onRomLoaded: (romData: Uint8Array, fileName: string) => void;
  expectedCrc?: number;
  className?: string;
}

export const FileUpload: React.FC<FileUploadProps> = ({ 
  onRomLoaded, 
  expectedCrc,
  className = ''
}) => {
  const [isDragging, setIsDragging] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [fileName, setFileName] = useState<string | null>(null);

  const validateRomFile = useCallback((file: File): Promise<Uint8Array> => {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      
      reader.onload = () => {
        try {
          const arrayBuffer = reader.result as ArrayBuffer;
          const uint8Array = new Uint8Array(arrayBuffer);
          
          // Basic ROM file validation
          if (uint8Array.length < 1024) {
            reject(new Error('File too small to be a valid ROM'));
            return;
          }
          
          // Validate CRC if provided
          if (expectedCrc !== undefined) {
            const calculatedCrc = crc32_buffer(uint8Array);
            if (calculatedCrc !== expectedCrc) {
              reject(new Error(`CRC mismatch. Expected: ${expectedCrc.toString(16)}, Got: ${calculatedCrc.toString(16)}`));
              return;
            }
          }
          
          resolve(uint8Array);
        } catch (err) {
          reject(new Error('Failed to read ROM file'));
        }
      };
      
      reader.onerror = () => {
        reject(new Error('Failed to read file'));
      };
      
      reader.readAsArrayBuffer(file);
    });
  }, [expectedCrc]);

  const handleFileUpload = useCallback(async (file: File) => {
    if (!file) return;
    
    setIsLoading(true);
    setError(null);
    setFileName(file.name);
    
    try {
      const romData = await validateRomFile(file);
      onRomLoaded(romData, file.name);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unknown error occurred');
      setFileName(null);
    } finally {
      setIsLoading(false);
    }
  }, [validateRomFile, onRomLoaded]);

  const handleDrop = useCallback((e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    setIsDragging(false);
    
    const files = e.dataTransfer.files;
    if (files.length > 0) {
      handleFileUpload(files[0]);
    }
  }, [handleFileUpload]);

  const handleDragOver = useCallback((e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    setIsDragging(true);
  }, []);

  const handleDragLeave = useCallback((e: React.DragEvent<HTMLDivElement>) => {
    e.preventDefault();
    setIsDragging(false);
  }, []);

  const handleFileSelect = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (files && files.length > 0) {
      handleFileUpload(files[0]);
    }
  }, [handleFileUpload]);

  return (
    <div className={`file-upload-container ${className}`}>
      <div
        className={`file-upload-dropzone ${isDragging ? 'dragging' : ''} ${isLoading ? 'loading' : ''}`}
        onDrop={handleDrop}
        onDragOver={handleDragOver}
        onDragLeave={handleDragLeave}
        onClick={() => document.getElementById('rom-file-input')?.click()}
      >
        <input
          id="rom-file-input"
          type="file"
          accept=".smc,.sfc,.rom,.bin"
          onChange={handleFileSelect}
          style={{ display: 'none' }}
        />
        
        <div className="upload-content">
          {isLoading ? (
            <div className="loading-state">
              <div className="spinner"></div>
              <p>Loading ROM...</p>
            </div>
          ) : (
            <div className="upload-prompt">
              <div className="upload-icon">📁</div>
              <h3>Load ROM File</h3>
              <p>
                {isDragging 
                  ? 'Drop your ROM file here' 
                  : 'Drag & drop a ROM file here, or click to browse'
                }
              </p>
              <div className="file-types">
                Supported formats: .smc, .sfc, .rom, .bin
              </div>
            </div>
          )}
        </div>
      </div>
      
      {error && (
        <div className="error-message">
          <span className="error-icon">⚠️</span>
          {error}
        </div>
      )}
      
      {fileName && !error && (
        <div className="success-message">
          <span className="success-icon">✅</span>
          Successfully loaded: {fileName}
        </div>
      )}
    </div>
  );
};
