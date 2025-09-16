import { useState, useEffect } from 'react'
import './App.css'

// Import the new TypeScript core library
import { GAIA_CORE_VERSION, isPlatformBrowser } from 'gaia-core'

// Import the IDE layout
import { IDELayout } from './components/IDE/IDELayout'
import './components/IDE/IDELayout.css'

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

  // Show loading or error state while core is initializing
  if (!coreLoaded && !error) {
    return (
      <div className="app-loading">
        <div className="loading-content">
          <div className="loading-spinner"></div>
          <h2>GaiaLabs Studio</h2>
          <p>⏳ Loading TypeScript Core v{GAIA_CORE_VERSION}...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="app-error">
        <div className="error-content">
          <h2>⚠️ Initialization Error</h2>
          <p>{error}</p>
          <button onClick={() => window.location.reload()}>
            Retry
          </button>
        </div>
      </div>
    )
  }

  // Core is loaded, show the IDE
  return <IDELayout />
}

export default App 