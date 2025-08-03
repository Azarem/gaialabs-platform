# GaiaLabs Theme Setup Guide

A mystical theme system inspired by Illusion of Gaia for shadcn/ui components.

## 🎨 Theme Overview

The GaiaLabs theme features:
- **Cosmic Blues**: Deep space-inspired primary colors
- **Mystical Purples**: Secondary colors for magical elements  
- **Golden Amber**: Accent colors from the game's title
- **Soft Pastels**: Coral and teal for highlights
- **Light/Dark Modes**: Fully responsive theme switching

## 📦 Installation

### 1. Install Dependencies

```bash
# Install shadcn/ui CLI (if not already installed)
npx shadcn@latest init

# Install required packages for React 19 and Tailwind CSS 4
npm install class-variance-authority clsx tailwind-merge lucide-react

# Install fonts (optional but recommended)
npm install @fontsource/cinzel @fontsource/inter @fontsource/jetbrains-mono
```

### 2. Configure Tailwind CSS v4

Create your main CSS file with the new CSS-first configuration:

```css
/* app.css or globals.css */
@import "tailwindcss";

@theme {
  /* Typography */
  --font-display: "Cinzel", serif;
  --font-body: "Inter", system-ui, sans-serif;
  --font-mono: "JetBrains Mono", monospace;

  /* Breakpoints */
  --breakpoint-3xl: 1920px;

  /* Border radius */
  --radius: 0.5rem;

  /* Light theme colors */
  --color-background: oklch(0.98 0.02 220);
  --color-foreground: oklch(0.2 0.05 220);
  --color-card: oklch(1 0 0);
  --color-card-foreground: oklch(0.2 0.05 220);
  --color-popover: oklch(1 0 0);
  --color-popover-foreground: oklch(0.2 0.05 220);
  --color-primary: oklch(0.5 0.15 220);
  --color-primary-foreground: oklch(1 0 0);
  --color-secondary: oklch(0.65 0.1 270);
  --color-secondary-foreground: oklch(1 0 0);
  --color-muted: oklch(0.96 0.02 210);
  --color-muted-foreground: oklch(0.47 0.03 215);
  --color-accent: oklch(0.55 0.15 43);
  --color-accent-foreground: oklch(0.2 0.05 220);
  --color-destructive: oklch(0.51 0.15 0);
  --color-destructive-foreground: oklch(0.98 0 0);
  --color-border: oklch(0.91 0.02 214);
  --color-input: oklch(0.91 0.02 214);
  --color-ring: oklch(0.5 0.15 220);

  /* Custom Gaia colors */
  --color-gaia-cosmos: oklch(0.18 0.08 235);
  --color-gaia-stardust: oklch(0.88 0.12 45);
  --color-gaia-mystic: oklch(0.75 0.08 280);
  --color-gaia-coral: oklch(0.7 0.1 350);
  --color-gaia-teal: oklch(0.45 0.08 180);

  /* Custom animations */
  --animate-shimmer: shimmer 2s infinite;
  --animate-glow: glow 2s ease-in-out infinite;
  --animate-float: float 3s ease-in-out infinite;
  --animate-pulse-glow: pulse-glow 2s ease-in-out infinite;
}

@media (prefers-color-scheme: dark) {
  @theme {
    /* Dark theme colors */
    --color-background: oklch(0.12 0.08 235);
    --color-foreground: oklch(0.98 0.02 210);
    --color-card: oklch(0.15 0.06 235);
    --color-card-foreground: oklch(0.98 0.02 210);
    --color-popover: oklch(0.15 0.06 235);
    --color-popover-foreground: oklch(0.98 0.02 210);
    --color-primary: oklch(0.6 0.18 220);
    --color-primary-foreground: oklch(0.98 0 0);
    --color-secondary: oklch(0.7 0.12 270);
    --color-secondary-foreground: oklch(0.98 0 0);
    --color-muted: oklch(0.2 0.05 235);
    --color-muted-foreground: oklch(0.65 0.03 215);
    --color-accent: oklch(0.65 0.18 43);
    --color-accent-foreground: oklch(0.1 0.05 220);
    --color-destructive: oklch(0.6 0.15 0);
    --color-destructive-foreground: oklch(0.98 0 0);
    --color-border: oklch(0.25 0.05 235);
    --color-input: oklch(0.25 0.05 235);
    --color-ring: oklch(0.6 0.18 220);

    /* Custom Gaia colors - dark mode */
    --color-gaia-cosmos: oklch(0.08 0.1 235);
    --color-gaia-stardust: oklch(0.75 0.15 45);
    --color-gaia-mystic: oklch(0.8 0.1 280);
    --color-gaia-coral: oklch(0.75 0.12 350);
    --color-gaia-teal: oklch(0.5 0.1 180);
  }
}

/* Custom utilities */
@utility container {
  margin-inline: auto;
  padding-inline: 2rem;
  max-width: 1400px;
}

/* Custom keyframes */
@keyframes shimmer {
  0% { transform: translateX(-100%); }
  100% { transform: translateX(100%); }
}

@keyframes glow {
  0%, 100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.8;
    transform: scale(1.05);
  }
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
}

@keyframes pulse-glow {
  0%, 100% {
    box-shadow: 0 0 20px color-mix(in oklab, var(--color-primary) 50%, transparent);
  }
  50% {
    box-shadow: 0 0 30px color-mix(in oklab, var(--color-primary) 80%, transparent),
                0 0 50px color-mix(in oklab, var(--color-primary) 50%, transparent);
  }
}
```

### 3. Configure PostCSS (if needed)

For Vite projects, add the Tailwind CSS plugin:

```typescript
// vite.config.ts
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [tailwindcss()]
});
```

For other build tools, configure PostCSS:

```javascript
// postcss.config.js
export default {
  plugins: [
    "@tailwindcss/postcss"
  ]
};
```

### 4. Import Fonts (Optional)

Add to your main layout or app file:

```typescript
// app/layout.tsx or pages/_app.tsx
import '@fontsource/cinzel/400.css'
import '@fontsource/cinzel/600.css'
import '@fontsource/inter/400.css'
import '@fontsource/inter/500.css'
import '@fontsource/inter/600.css'
import '@fontsource/inter/700.css'
import '@fontsource/jetbrains-mono/400.css'
```

### 5. Create Theme Utilities

Create `lib/utils.ts` with the theme utilities:

```typescript
import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### 6. Configure shadcn/ui for React 19

Create or update your `components.json`:

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "",
    "css": "src/app.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  },
  "iconLibrary": "lucide"
}
```

## 🎯 Usage Examples

### Basic Components

```tsx
import { Button } from "@/components/ui/button"
import { Card, CardHeader, CardTitle, CardDescription, CardContent } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"

export function MyComponent() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Mystical Component</CardTitle>
        <CardDescription>Powered by GaiaLabs theme</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="flex gap-2">
          <Button>Primary Action</Button>
          <Button variant="secondary">Secondary</Button>
          <Badge>New</Badge>
        </div>
      </CardContent>
    </Card>
  )
}
```

### Using Custom Gaia Colors

```tsx
// Text colors
<p className="text-gaia-cosmos">Deep cosmic text</p>
<p className="text-gaia-mystic">Mystical purple text</p>
<p className="text-gaia-coral">Soft coral text</p>

// Background colors
<div className="bg-gaia-stardust p-4">Golden background</div>
<div className="bg-gaia-teal text-white p-4">Teal background</div>

// Borders
<div className="border-2 border-gaia-mystic">Mystical border</div>
```

### Gradient Effects

```tsx
// Predefined gradients
<div className="gradient-gaia-cosmos text-white p-8">
  Cosmic gradient background
</div>

<div className="gradient-gaia-sunset text-white p-8">
  Sunset gradient background
</div>

// Custom gradient
<div className="bg-gradient-to-r from-primary via-secondary to-accent text-white p-8">
  Custom gradient
</div>
```

### Animation Effects

```tsx
// Shimmer effect
<Button className="animate-shimmer">
  Shimmer Button
</Button>

// Float animation
<Badge className="animate-float">
  Floating Badge
</Badge>

// Glow effect
<Card className="gaia-glow">
  <CardContent>Glowing card</CardContent>
</Card>

// Hover lift effect
<Card className="transition-all hover:shadow-gaia-lg hover:-translate-y-1">
  <CardContent>Hover me!</CardContent>
</Card>
```

### Theme Toggle Component

```tsx
import { Moon, Sun } from "lucide-react"
import { Button } from "@/components/ui/button"
import { useTheme } from "@/lib/utils"

export function ThemeToggle() {
  const { theme, toggleTheme } = useTheme()
  
  return (
    <Button
      variant="outline"
      size="icon"
      onClick={toggleTheme}
    >
      <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
      <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
      <span className="sr-only">Toggle theme</span>
    </Button>
  )
}
```

## 🎨 Color Reference

### Primary Palette
- **Primary**: Cosmic Blue - Main actions and highlights
- **Secondary**: Mystical Purple - Secondary elements
- **Accent**: Golden Amber - Important accents from the game title

### Gaia Colors
- **Cosmos**: Deep space blue - Dark backgrounds
- **Stardust**: Pale gold - Light accents
- **Mystic**: Soft purple - Magical elements
- **Coral**: Pink-coral - Warm highlights
- **Teal**: Ocean teal - Cool accents

### Usage Tips
1. Use primary colors for main CTAs and important UI elements
2. Secondary colors work well for hover states and secondary actions
3. Accent colors draw attention to special features
4. Gaia colors add personality to specific sections
5. Combine with animations for mystical effects

## 🚀 Advanced Features

### Custom Animations
The theme includes several animation utilities:
- `animate-shimmer`: Creates a shimmering effect
- `animate-glow`: Gentle pulsing glow
- `animate-float`: Floating motion
- `animate-pulse-glow`: Pulsing box shadow

### Shadow Effects
- `shadow-gaia-sm`: Small mystical shadow
- `shadow-gaia-md`: Medium mystical shadow
- `shadow-gaia-lg`: Large mystical shadow
- `shadow-gaia-glow`: Glowing shadow effect

### Typography
- Headers use the Cinzel font for a mystical feel
- Body text uses Inter for readability
- Code blocks use JetBrains Mono

## 🔧 Customization

To customize the theme colors, modify the CSS variables in your `globals.css`. All colors use HSL format for easy adjustment:

```css
:root {
  /* Adjust the hue (first number) to change the color */
  --primary: 220 70% 50%; /* Change 220 to shift the blue */
  --accent: 43 85% 55%;   /* Change 43 to shift the gold */
}
```

## 📱 Responsive Design

The theme is fully responsive and includes:
- Mobile-first design approach
- Proper contrast ratios for accessibility
- Dark mode support with system preference detection
- Touch-friendly interactive elements

## ✨ Best Practices

1. **Consistency**: Use the predefined color tokens instead of custom colors
2. **Accessibility**: Ensure proper contrast ratios, especially with Gaia colors
3. **Performance**: Use CSS animations sparingly for best performance
4. **Theming**: Always test components in both light and dark modes

Enjoy building with the mystical GaiaLabs theme! 🎮✨