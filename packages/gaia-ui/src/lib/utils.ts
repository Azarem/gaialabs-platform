import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';
import { useState, useEffect } from 'react';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

// Additional utility functions for the UI library
export function formatDate(date: Date | string): string {
  const d = new Date(date);
  return d.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  });
}

export function formatDateTime(date: Date | string): string {
  const d = new Date(date);
  return d.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
  });
}

export function truncateText(text: string, maxLength: number): string {
  if (text.length <= maxLength) return text;
  return text.slice(0, maxLength) + '...';
}

export function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^\w\s-]/g, '')
    .replace(/[\s_-]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

export function capitalizeFirst(text: string): string {
  return text.charAt(0).toUpperCase() + text.slice(1);
}

export function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): (...args: Parameters<T>) => void {
  let timeout: NodeJS.Timeout;
  return (...args: Parameters<T>) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => func(...args), wait);
  };
}


/**
 * Theme configuration
 */
export const gaiaTheme = {
  colors: {
    // Light theme colors
    light: {
      background: "hsl(201, 40%, 98%)",
      foreground: "hsl(220, 30%, 20%)",
      card: "hsl(0, 0%, 100%)",
      cardForeground: "hsl(220, 30%, 20%)",
      popover: "hsl(0, 0%, 100%)",
      popoverForeground: "hsl(220, 30%, 20%)",
      primary: "hsl(220, 70%, 50%)",
      primaryForeground: "hsl(0, 0%, 100%)",
      secondary: "hsl(270, 50%, 65%)",
      secondaryForeground: "hsl(0, 0%, 100%)",
      muted: "hsl(210, 40%, 96%)",
      mutedForeground: "hsl(215, 16%, 47%)",
      accent: "hsl(43, 85%, 55%)",
      accentForeground: "hsl(220, 30%, 20%)",
      destructive: "hsl(0, 72%, 51%)",
      destructiveForeground: "hsl(0, 0%, 98%)",
      border: "hsl(214, 32%, 91%)",
      input: "hsl(214, 32%, 91%)",
      ring: "hsl(220, 70%, 50%)",
      // Custom Gaia colors
      gaia: {
        cosmos: "hsl(235, 60%, 18%)",
        stardust: "hsl(45, 90%, 88%)",
        mystic: "hsl(280, 45%, 75%)",
        coral: "hsl(350, 60%, 70%)",
        teal: "hsl(180, 50%, 45%)",
      }
    },
    // Dark theme colors
    dark: {
      background: "hsl(235, 60%, 12%)",
      foreground: "hsl(210, 40%, 98%)",
      card: "hsl(235, 50%, 15%)",
      cardForeground: "hsl(210, 40%, 98%)",
      popover: "hsl(235, 50%, 15%)",
      popoverForeground: "hsl(210, 40%, 98%)",
      primary: "hsl(220, 90%, 60%)",
      primaryForeground: "hsl(0, 0%, 98%)",
      secondary: "hsl(270, 60%, 70%)",
      secondaryForeground: "hsl(0, 0%, 98%)",
      muted: "hsl(235, 40%, 20%)",
      mutedForeground: "hsl(215, 20%, 65%)",
      accent: "hsl(43, 90%, 65%)",
      accentForeground: "hsl(220, 30%, 10%)",
      destructive: "hsl(0, 63%, 60%)",
      destructiveForeground: "hsl(0, 0%, 98%)",
      border: "hsl(235, 40%, 25%)",
      input: "hsl(235, 40%, 25%)",
      ring: "hsl(220, 90%, 60%)",
      // Custom Gaia colors
      gaia: {
        cosmos: "hsl(235, 70%, 8%)",
        stardust: "hsl(45, 80%, 75%)",
        mystic: "hsl(280, 55%, 80%)",
        coral: "hsl(350, 70%, 75%)",
        teal: "hsl(180, 60%, 50%)",
      }
    }
  },
  fonts: {
    display: "'Cinzel', serif",
    body: "'Inter', system-ui, sans-serif",
    mono: "'JetBrains Mono', monospace",
  }
}

/**
 * Apply theme to the document
 */
export function applyTheme(isDark: boolean) {
  const root = document.documentElement
  const theme = isDark ? gaiaTheme.colors.dark : gaiaTheme.colors.light
  
  // Remove existing theme class
  root.classList.remove('light', 'dark')
  
  // Add new theme class
  root.classList.add(isDark ? 'dark' : 'light')
  
  // Apply CSS variables
  Object.entries(theme).forEach(([key, value]) => {
    if (typeof value === 'string') {
      root.style.setProperty(`--${key}`, value)
    } else if (typeof value === 'object') {
      // Handle nested objects like gaia colors
      Object.entries(value).forEach(([subKey, subValue]) => {
        root.style.setProperty(`--${key}-${subKey}`, subValue as string)
      })
    }
  })
}

/**
 * Get theme from system preference
 */
export function getSystemTheme(): 'light' | 'dark' {
  if (typeof window === 'undefined') return 'light'
  return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
}

/**
 * Theme hook for React components
 */
export function useTheme() {
  const [theme, setTheme] = useState<'light' | 'dark'>(getSystemTheme())

  useEffect(() => {
    applyTheme(theme === 'dark')

    // Save preference to localStorage
    localStorage.setItem('gaia-theme', theme)
  }, [theme])

  useEffect(() => {
    // Check for saved preference
    const savedTheme = localStorage.getItem('gaia-theme') as 'light' | 'dark' | null
    if (savedTheme) {
      setTheme(savedTheme)
    }

    // Listen for system theme changes
    const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)')
    const handleChange = (e: MediaQueryListEvent) => {
      if (!localStorage.getItem('gaia-theme')) {
        setTheme(e.matches ? 'dark' : 'light')
      }
    }

    mediaQuery.addEventListener('change', handleChange)
    return () => mediaQuery.removeEventListener('change', handleChange)
  }, [])

  const toggleTheme = () => {
    setTheme(prev => prev === 'light' ? 'dark' : 'light')
  }

  return { theme, setTheme, toggleTheme }
}

/**
 * Gaia-specific utility classes
 */
export const gaiaStyles = {
  // Gradient backgrounds
  gradients: {
    cosmos: "bg-gradient-to-br from-primary via-gaia-cosmos to-gaia-mystic",
    sunset: "bg-gradient-to-r from-gaia-coral via-accent to-gaia-stardust",
    ocean: "bg-gradient-to-b from-gaia-teal via-primary to-gaia-cosmos",
    mystic: "bg-gradient-to-tr from-secondary via-gaia-mystic to-gaia-coral",
  },
  // Animation classes
  animations: {
    shimmer: "animate-shimmer",
    glow: "animate-glow",
    float: "animate-float",
    pulseGlow: "animate-pulse-glow",
  },
  // Effect classes
  effects: {
    glow: "shadow-gaia-glow",
    glowAccent: "shadow-gaia-glow-accent",
    softGlow: "shadow-gaia-sm hover:shadow-gaia-md transition-shadow",
    hoverLift: "transition-all hover:shadow-gaia-lg hover:-translate-y-1",
  }
}

/**
 * Color palette helper
 */
export const colorPalette = {
  // Get all theme colors as an array
  getColors: (isDark = false) => {
    const theme = isDark ? gaiaTheme.colors.dark : gaiaTheme.colors.light
    return Object.entries(theme).map(([name, value]) => ({
      name,
      value,
      cssVar: `--${name.replace(/([A-Z])/g, '-$1').toLowerCase()}`
    }))
  },
  
  // Get Gaia-specific colors
  getGaiaColors: (isDark = false) => {
    const theme = isDark ? gaiaTheme.colors.dark : gaiaTheme.colors.light
    return Object.entries(theme.gaia).map(([name, value]) => ({
      name: `gaia-${name}`,
      value,
      cssVar: `--gaia-${name}`
    }))
  }
}

/**
 * Typography utilities
 */
export const typography = {
  // Apply display font
  display: "font-display",
  // Apply body font
  body: "font-body",
  // Apply mono font
  mono: "font-mono",
  // Title styles
  title: {
    hero: "text-4xl font-bold tracking-tight sm:text-5xl md:text-6xl lg:text-7xl font-display",
    h1: "text-3xl font-bold tracking-tight sm:text-4xl md:text-5xl font-display",
    h2: "text-2xl font-bold tracking-tight sm:text-3xl font-display",
    h3: "text-xl font-semibold tracking-tight sm:text-2xl font-display",
    h4: "text-lg font-semibold tracking-tight sm:text-xl font-display",
  }
}
