import { Routes, Route } from 'react-router-dom'
import { Toaster } from '@gaialabs/ui'
import { ThemeProvider } from './components/theme-provider'
import GameScriptEditor from './pages/GameScriptEditor'
import SupabaseTest from './components/SupabaseTest'

function App() {
  return (
    <ThemeProvider defaultTheme="system" storageKey="gaia-translator-theme">
      <Routes>
        <Route path="/" element={<GameScriptEditor />} />
        <Route path="/test" element={<SupabaseTest />} />
        {/* Future routes can be added here */}
        <Route path="/scripts" element={<div className="p-8 text-center">Scripts Page - Coming Soon</div>} />
        <Route path="/community" element={<div className="p-8 text-center">Community Page - Coming Soon</div>} />
        <Route path="/auth/*" element={<div className="p-8 text-center">Auth Pages - Coming Soon</div>} />
        <Route path="*" element={<div className="p-8 text-center">404 - Page Not Found</div>} />
      </Routes>
      <Toaster />
    </ThemeProvider>
  )
}

export default App
