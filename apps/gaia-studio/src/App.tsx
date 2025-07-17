import { useState, useEffect } from 'react'
import './App.css'

// Import the new TypeScript core library
import { GAIA_CORE_VERSION, isPlatformBrowser } from 'gaia-core'

function App() {
  const [coreLoaded, setCoreLoaded] = useState(false)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    // Initialize TypeScript core module
    const initCore = async () => {
      try {
        // Check if we're in browser environment
        if (isPlatformBrowser) {
          console.log(`GaiaCore v${GAIA_CORE_VERSION} initialized in browser`)
          setCoreLoaded(true)
        } else {
          throw new Error('Core library not supported in this environment')
        }
      } catch (err) {
        console.error('Failed to load core library:', err)
        setError('Failed to load TypeScript core module')
      }
    }

    initCore()
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <h1>GaiaLabs Studio</h1>
        <p>Universal ROM Editor Platform</p>
        
        <div className="status">
          {coreLoaded ? (
            <div className="status-success">
              ✓ TypeScript Core Ready (v{GAIA_CORE_VERSION})
            </div>
          ) : error ? (
            <div className="status-error">
              ✗ {error}
            </div>
          ) : (
            <div className="status-loading">
              ⏳ Loading TypeScript Core...
            </div>
          )}
        </div>

        <div className="quick-start">
          <h2>Quick Start</h2>
          <p>Welcome to GaiaLabs Studio - the modern web-based ROM editor!</p>
          <ul>
            <li>🎮 SNES ROM Support (Starting with Illusion of Gaia)</li>
            <li>🎨 Visual Editors (Tilemap, Sprite, Palette)</li>
            <li>🤝 Collaborative Editing</li>
            <li>⚡ TypeScript Performance with Web Workers</li>
            <li>⚛️ React 19 UI Framework</li>
          </ul>
        </div>

        <div className="development-info">
          <h3>Development Status</h3>
          <p>This is Phase 1 of the GaiaLabs MVP development.</p>
          <p>Currently implementing: Foundation & Core TypeScript functionality</p>
          <p>Architecture: TypeScript-focused with React 19 compatibility</p>
        </div>
      </header>
    </div>
  )
}

export default App 