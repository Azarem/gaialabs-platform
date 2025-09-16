import React, { useRef, useState } from 'react';
import { Editor, loader } from '@monaco-editor/react';
import type { editor } from 'monaco-editor';
import { BinType, ChunkFile } from '@gaialabs/shared';

// Configure Monaco for Vite
loader.config({
  paths: {
    vs: 'https://cdn.jsdelivr.net/npm/monaco-editor@0.53.0/min/vs'
  }
});

interface CodeEditorProps {
  resource?: ChunkFile;
  onChange?: (value: string, resource: ChunkFile) => void;
  className?: string;
}

export const CodeEditor: React.FC<CodeEditorProps> = ({
  resource,
  onChange,
  className = ''
}) => {
  const editorRef = useRef<editor.IStandaloneCodeEditor | null>(null);
  const [_isEditorReady, setIsEditorReady] = useState(false);

  // Custom assembly language definition for 65816
  const registerAssemblyLanguage = (monaco: any) => {
    // Define the 65816 assembly language
    monaco.languages.register({ id: 'asm65816' });

    // Define tokens for syntax highlighting
    monaco.languages.setMonarchTokensProvider('asm65816', {
      tokenizer: {
        root: [
          // Comments
          [/;.*$/, 'comment'],
          
          // Labels (ending with colon)
          [/^[a-zA-Z_][a-zA-Z0-9_]*:/, 'label'],
          
          // Directives (starting with dot)
          [/\.[a-zA-Z]+/, 'directive'],
          
          // Hexadecimal numbers
          [/\$[0-9A-Fa-f]+/, 'number.hex'],
          
          // Decimal numbers
          [/\b\d+\b/, 'number'],
          
          // Binary numbers
          [/%[01]+/, 'number.binary'],
          
          // Addressing modes
          [/[#@&]/, 'operator'],
          [/[(),]/, 'delimiter'],
          [/[+\-*\/]/, 'operator'],
          
          // 65816 instruction mnemonics
          [/\b(ADC|AND|ASL|BCC|BCS|BEQ|BIT|BMI|BNE|BPL|BRA|BRK|BRL|BVC|BVS|CLC|CLD|CLI|CLV|CMP|COP|CPX|CPY|DEC|DEX|DEY|EOR|INC|INX|INY|JML|JMP|JSL|JSR|LDA|LDX|LDY|LSR|MVN|MVP|NOP|ORA|PEA|PEI|PER|PHA|PHB|PHD|PHK|PHP|PHX|PHY|PLA|PLB|PLD|PLP|PLX|PLY|REP|ROL|ROR|RTI|RTL|RTS|SBC|SEC|SED|SEI|SEP|STA|STP|STX|STY|STZ|TAX|TAY|TCD|TCS|TDC|TRB|TSB|TSC|TSX|TXA|TXS|TXY|TYA|TYX|WAI|WDM|XBA|XCE)\b/i, 'keyword'],
          
          // Registers and flags
          [/\b(A|X|Y|S|SP|PC|DBR|PBR|D|DP)\b/, 'type'],
          
          // String literals
          [/".*?"/, 'string'],
          [/'.*?'/, 'string'],
          
          // Identifiers
          [/[a-zA-Z_][a-zA-Z0-9_]*/, 'identifier'],
        ]
      }
    });

    // Define colors for the theme
    monaco.editor.defineTheme('assemblyTheme', {
      base: 'vs',
      inherit: true,
      rules: [
        { token: 'comment', foreground: '6A9955', fontStyle: 'italic' },
        { token: 'label', foreground: '795E26', fontStyle: 'bold' },
        { token: 'directive', foreground: 'AF00DB' },
        { token: 'number.hex', foreground: 'B5CEA8' },
        { token: 'number', foreground: 'B5CEA8' },
        { token: 'number.binary', foreground: 'B5CEA8' },
        { token: 'keyword', foreground: '569CD6', fontStyle: 'bold' },
        { token: 'type', foreground: '4EC9B0' },
        { token: 'string', foreground: 'CE9178' },
        { token: 'operator', foreground: 'D4D4D4' },
        { token: 'delimiter', foreground: 'D4D4D4' },
        { token: 'identifier', foreground: '9CDCFE' }
      ],
      colors: {
        'editor.background': '#1E1E1E',
        'editor.foreground': '#D4D4D4'
      }
    });

    // Set the theme
    monaco.editor.setTheme('assemblyTheme');
  };

  const handleEditorWillMount = (monaco: any) => {
    registerAssemblyLanguage(monaco);
  };

  const handleEditorDidMount = (editor: editor.IStandaloneCodeEditor, _monaco: any) => {
    editorRef.current = editor;
    setIsEditorReady(true);

    // Configure editor options
    editor.updateOptions({
      fontSize: 14,
      lineHeight: 22,
      minimap: { enabled: true, scale: 0.5 },
      scrollBeyondLastLine: false,
      automaticLayout: true,
      tabSize: 8,
      insertSpaces: false,
      wordWrap: 'off',
      lineNumbers: 'on',
      renderWhitespace: 'selection',
      folding: true,
      foldingStrategy: 'indentation'
    });
  };

  const handleEditorChange = (value: string | undefined) => {
    if (value !== undefined && resource && onChange) {
      onChange(value, resource);
    }
  };

  const getLanguage = (resource: ChunkFile): string => {
    switch (resource.type) {
      case BinType.Assembly:
      case BinType.Patch:
        return 'asm65816';
      default:
        return 'plaintext';
    }
  };

  const getContent = (resource: ChunkFile): string => {
    if (resource.textData) {
      return resource.textData;
    }
    
    if (resource.rawData) {
      // For binary data, show hex dump
      const bytes = Array.from(resource.rawData);
      const lines: string[] = [];
      
      for (let i = 0; i < bytes.length; i += 16) {
        const chunk = bytes.slice(i, i + 16);
        const hex = chunk.map(b => b.toString(16).padStart(2, '0')).join(' ');
        const ascii = chunk.map(b => (b >= 32 && b <= 126) ? String.fromCharCode(b) : '.').join('');
        const address = i.toString(16).padStart(8, '0').toUpperCase();
        lines.push(`${address}: ${hex.padEnd(47)} ${ascii}`);
      }
      
      return lines.join('\n');
    }
    
    return '';
  };

  const isReadOnly = (resource: ChunkFile): boolean => {
    // Only assembly and patch files should be editable
    return resource.type !== BinType.Assembly && resource.type !== BinType.Patch;
  };

  if (!resource) {
    return (
      <div className={`code-editor-container ${className}`}>
        <div className="editor-placeholder">
          <div className="placeholder-content">
            <span className="placeholder-icon">📝</span>
            <h3>No Resource Selected</h3>
            <p>Select a resource from the tree to view or edit its contents</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className={`code-editor-container ${className}`}>
      <div className="editor-header">
        <div className="file-info">
          <span className="file-icon">
            {resource.type === BinType.Assembly || resource.type === BinType.Patch ? '📝' : '📄'}
          </span>
          <span className="file-name">{resource.name}</span>
          <span className="file-type">{resource.type}</span>
        </div>
        {isReadOnly(resource) && (
          <div className="readonly-badge">
            <span>Read Only</span>
          </div>
        )}
      </div>
      
      <div className="editor-content">
        <Editor
          height="100%"
          language={getLanguage(resource)}
          value={getContent(resource)}
          onChange={handleEditorChange}
          beforeMount={handleEditorWillMount}
          onMount={handleEditorDidMount}
          options={{
            readOnly: isReadOnly(resource),
            theme: 'assemblyTheme'
          }}
          loading={
            <div className="editor-loading">
              <div className="loading-spinner"></div>
              <p>Loading editor...</p>
            </div>
          }
        />
      </div>
    </div>
  );
};
