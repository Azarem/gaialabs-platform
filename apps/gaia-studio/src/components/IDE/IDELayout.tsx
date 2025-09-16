import React, { useState, useCallback } from 'react';
import { BlockReader, BlockWriter } from '@gaialabs/core';
import { ChunkFile, DbRootUtils, BinType } from '@gaialabs/shared';
import { FileUpload } from './FileUpload';
import { ResourceTree } from './ResourceTree';
import { CodeEditor } from './CodeEditor';
import './FileUpload.css';
import './ResourceTree.css';
import './CodeEditor.css';

interface IDEState {
  romData?: Uint8Array;
  romFileName?: string;
  resources: ChunkFile[];
  selectedResource?: ChunkFile;
  isProcessing: boolean;
  error?: string;
}

const SUPABASE_API_URL = 'https://adwobxutnpmjbmhdxrzx.supabase.co/rest/v1/GameRomBranch?apikey=sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV';

export const IDELayout: React.FC = () => {
  const [state, setState] = useState<IDEState>({
    resources: [],
    isProcessing: false
  });

  const fetchGameRomBranchData = useCallback(async () => {
    try {
      const response = await fetch(SUPABASE_API_URL);
      if (!response.ok) {
        throw new Error(`Failed to fetch GameRomBranch data: ${response.statusText}`);
      }
      
      const data = await response.json();
      
      // Return the first GameRomBranch entry (there should only be one in the example)
      if (data && data.length > 0) {
        return data[0];
      } else {
        throw new Error('No GameRomBranch data found in response');
      }
    } catch (error) {
      console.error('Error fetching GameRomBranch data:', error);
      throw error;
    }
  }, []);

  const processRomData = useCallback(async (romData: Uint8Array) => {
    setState(prev => ({ ...prev, isProcessing: true, error: undefined }));
    
    try {
      console.log('Fetching GameRomBranch data from Supabase...');
      const gameRomBranchData = await fetchGameRomBranchData();
      
      console.log('Creating DbRoot from GameRomBranch data...');
      const dbRoot = await DbRootUtils.fromSupabaseProject(gameRomBranchData.name, gameRomBranchData.id);
      
      console.log('Initializing BlockReader...');
      const reader = new BlockReader(romData, dbRoot);
      
      console.log('Analyzing and resolving ROM blocks...');
      const chunkFiles = reader.analyzeAndResolve();
      
      console.log('Filtering assembly files...');
      const asmFiles = chunkFiles.filter(b => b.type === BinType.Assembly);
      
      console.log('Converting assembly blocks to text...');
      const writer = new BlockWriter(reader);
      for (const block of asmFiles) {
        block.textData = writer.generateAsm(block);
      }
      
      console.log(`✅ Successfully processed ROM: ${chunkFiles.length} resources loaded`);
      console.log(`📝 Assembly files: ${asmFiles.length}`);
      console.log(`📄 Other files: ${chunkFiles.length - asmFiles.length}`);
      
      setState(prev => ({
        ...prev,
        resources: chunkFiles,
        isProcessing: false
      }));
      
    } catch (error) {
      console.error('Error processing ROM data:', error);
      setState(prev => ({
        ...prev,
        error: error instanceof Error ? error.message : 'Unknown error occurred',
        isProcessing: false
      }));
    }
  }, [fetchGameRomBranchData]);

  const handleRomLoaded = useCallback(async (romData: Uint8Array, fileName: string) => {
    console.log(`ROM file loaded: ${fileName} (${romData.length} bytes)`);
    setState(prev => ({
      ...prev,
      romData,
      romFileName: fileName
    }));
    
    await processRomData(romData);
  }, [processRomData]);

  const handleResourceSelect = useCallback((resource: ChunkFile) => {
    setState(prev => ({
      ...prev,
      selectedResource: resource
    }));
  }, []);

  const handleResourceChange = useCallback((value: string, resource: ChunkFile) => {
    // Update the resource's text data
    resource.textData = value;
    
    // Update the resources array to trigger re-render if needed
    setState(prev => ({
      ...prev,
      resources: prev.resources.map(r => 
        r.name === resource.name ? { ...r, textData: value } : r
      )
    }));
  }, []);

  // Show file upload screen if no ROM is loaded
  if (!state.romData) {
    return (
      <div className="ide-layout initial-state">
        <div className="ide-header">
          <div className="header-content">
            <h1>GaiaLabs Studio</h1>
            <p>Universal ROM Editor Platform</p>
          </div>
        </div>
        
        <div className="ide-main">
          <FileUpload 
            onRomLoaded={handleRomLoaded}
            className="centered-upload"
          />
        </div>
        
        {state.error && (
          <div className="error-overlay">
            <div className="error-content">
              <h3>⚠️ Error Processing ROM</h3>
              <p>{state.error}</p>
              <button onClick={() => setState(prev => ({ ...prev, error: undefined }))}>
                Dismiss
              </button>
            </div>
          </div>
        )}
      </div>
    );
  }

  return (
    <div className="ide-layout">
      <div className="ide-header">
        <div className="header-content">
          <h1>GaiaLabs Studio</h1>
          <div className="rom-info">
            <span className="rom-name">{state.romFileName}</span>
            <span className="resource-count">
              {state.resources.length} resources loaded
            </span>
          </div>
        </div>
        
        <div className="header-actions">
          <button 
            className="load-new-button"
            onClick={() => setState({ resources: [], isProcessing: false })}
          >
            Load New ROM
          </button>
        </div>
      </div>
      
      <div className="ide-main">
        <div className="ide-sidebar">
          <ResourceTree
            resources={state.resources}
            onResourceSelect={handleResourceSelect}
            selectedResource={state.selectedResource}
          />
        </div>
        
        <div className="ide-content">
          <CodeEditor
            resource={state.selectedResource}
            onChange={handleResourceChange}
          />
        </div>
      </div>
      
      {state.isProcessing && (
        <div className="processing-overlay">
          <div className="processing-content">
            <div className="processing-spinner"></div>
            <h3>Processing ROM...</h3>
            <p>Analyzing ROM structure and generating resources</p>
          </div>
        </div>
      )}
      
      {state.error && (
        <div className="error-overlay">
          <div className="error-content">
            <h3>⚠️ Error</h3>
            <p>{state.error}</p>
            <button onClick={() => setState(prev => ({ ...prev, error: undefined }))}>
              Dismiss
            </button>
          </div>
        </div>
      )}
    </div>
  );
};
