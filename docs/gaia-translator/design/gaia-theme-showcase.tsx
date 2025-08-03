import { useState, useEffect } from 'react';
import { Moon, Sun, Palette, Copy, Check, Sparkles, Zap, Shield, Heart, Star, Gamepad2, Code, Layers, Box, Database } from 'lucide-react';

// Theme configuration inspired by Illusion of Gaia
const themes = {
  light: {
    // Primary - Deep cosmic blue
    primary: 'hsl(220, 70%, 50%)',
    primaryForeground: 'hsl(0, 0%, 100%)',
    
    // Secondary - Mystical purple
    secondary: 'hsl(270, 50%, 65%)',
    secondaryForeground: 'hsl(0, 0%, 100%)',
    
    // Accent - Golden amber from the title
    accent: 'hsl(43, 85%, 55%)',
    accentForeground: 'hsl(220, 30%, 20%)',
    
    // Background hierarchy
    background: 'hsl(210, 40%, 98%)',
    foreground: 'hsl(220, 30%, 20%)',
    
    // Card and popover
    card: 'hsl(0, 0%, 100%)',
    cardForeground: 'hsl(220, 30%, 20%)',
    popover: 'hsl(0, 0%, 100%)',
    popoverForeground: 'hsl(220, 30%, 20%)',
    
    // Muted colors
    muted: 'hsl(210, 40%, 96%)',
    mutedForeground: 'hsl(215, 16%, 47%)',
    
    // Borders and inputs
    border: 'hsl(214, 32%, 91%)',
    input: 'hsl(214, 32%, 91%)',
    
    // Status colors
    destructive: 'hsl(0, 72%, 51%)',
    destructiveForeground: 'hsl(0, 0%, 98%)',
    
    // Ring (focus)
    ring: 'hsl(220, 70%, 50%)',
    
    // Additional Gaia-inspired colors
    cosmos: 'hsl(235, 60%, 18%)',
    stardust: 'hsl(45, 90%, 88%)',
    mystic: 'hsl(280, 45%, 75%)',
    coral: 'hsl(350, 60%, 70%)',
    teal: 'hsl(180, 50%, 45%)',
  },
  dark: {
    // Primary - Bright cosmic blue
    primary: 'hsl(220, 90%, 60%)',
    primaryForeground: 'hsl(0, 0%, 98%)',
    
    // Secondary - Vibrant purple
    secondary: 'hsl(270, 60%, 70%)',
    secondaryForeground: 'hsl(0, 0%, 98%)',
    
    // Accent - Golden amber
    accent: 'hsl(43, 90%, 65%)',
    accentForeground: 'hsl(220, 30%, 10%)',
    
    // Background hierarchy
    background: 'hsl(235, 60%, 12%)',
    foreground: 'hsl(210, 40%, 98%)',
    
    // Card and popover
    card: 'hsl(235, 50%, 15%)',
    cardForeground: 'hsl(210, 40%, 98%)',
    popover: 'hsl(235, 50%, 15%)',
    popoverForeground: 'hsl(210, 40%, 98%)',
    
    // Muted colors
    muted: 'hsl(235, 40%, 20%)',
    mutedForeground: 'hsl(215, 20%, 65%)',
    
    // Borders and inputs
    border: 'hsl(235, 40%, 25%)',
    input: 'hsl(235, 40%, 25%)',
    
    // Status colors
    destructive: 'hsl(0, 63%, 60%)',
    destructiveForeground: 'hsl(0, 0%, 98%)',
    
    // Ring (focus)
    ring: 'hsl(220, 90%, 60%)',
    
    // Additional Gaia-inspired colors
    cosmos: 'hsl(235, 70%, 8%)',
    stardust: 'hsl(45, 80%, 75%)',
    mystic: 'hsl(280, 55%, 80%)',
    coral: 'hsl(350, 70%, 75%)',
    teal: 'hsl(180, 60%, 50%)',
  }
};

// Convert theme to CSS variables
const themeToCssVars = (theme) => {
  const vars = {};
  Object.entries(theme).forEach(([key, value]) => {
    // Convert camelCase to kebab-case
    const cssKey = key.replace(/([A-Z])/g, '-$1').toLowerCase();
    vars[`--${cssKey}`] = value;
  });
  return vars;
};

function ThemeShowcase() {
  const [isDark, setIsDark] = useState(false);
  const [copiedColor, setCopiedColor] = useState(null);
  const currentTheme = isDark ? themes.dark : themes.light;
  
  useEffect(() => {
    // Apply theme to root element
    const root = document.documentElement;
    const cssVars = themeToCssVars(currentTheme);
    Object.entries(cssVars).forEach(([key, value]) => {
      root.style.setProperty(key, value);
    });
    
    // Set background color
    root.style.backgroundColor = currentTheme.background;
    root.style.color = currentTheme.foreground;
  }, [isDark, currentTheme]);

  const copyToClipboard = (value, name) => {
    navigator.clipboard.writeText(value);
    setCopiedColor(name);
    setTimeout(() => setCopiedColor(null), 2000);
  };

  const ColorCard = ({ name, value, cssVar }) => (
    <div 
      className="group relative rounded-lg border p-4 cursor-pointer transition-all hover:scale-105 hover:shadow-lg"
      style={{ borderColor: currentTheme.border, backgroundColor: currentTheme.card }}
      onClick={() => copyToClipboard(value, name)}
    >
      <div 
        className="w-full h-24 rounded-md mb-3 ring-2 ring-offset-2"
        style={{ 
          backgroundColor: value,
          ringColor: value,
          ringOffsetColor: currentTheme.background
        }}
      />
      <div className="space-y-1">
        <p className="font-semibold text-sm" style={{ color: currentTheme.foreground }}>
          {name.charAt(0).toUpperCase() + name.slice(1).replace(/([A-Z])/g, ' $1')}
        </p>
        <p className="text-xs font-mono" style={{ color: currentTheme.mutedForeground }}>
          {value}
        </p>
        <p className="text-xs opacity-60" style={{ color: currentTheme.mutedForeground }}>
          var({cssVar})
        </p>
      </div>
      <div className="absolute top-2 right-2 opacity-0 group-hover:opacity-100 transition-opacity">
        {copiedColor === name ? (
          <Check className="w-4 h-4" style={{ color: currentTheme.accent }} />
        ) : (
          <Copy className="w-4 h-4" style={{ color: currentTheme.mutedForeground }} />
        )}
      </div>
    </div>
  );

  interface ButtonProps {
    variant?: 'default' | 'secondary' | 'outline' | 'ghost' | 'destructive';
    size?: 'sm' | 'default' | 'lg';
    children: React.ReactNode;
    className?: string;
    onClick?: () => void;
  }

  const Button = ({ variant = 'default', size = 'default', children, ...props }: ButtonProps) => {
    const variants = {
      default: {
        backgroundColor: currentTheme.primary,
        color: currentTheme.primaryForeground,
        border: 'none',
      },
      secondary: {
        backgroundColor: currentTheme.secondary,
        color: currentTheme.secondaryForeground,
        border: 'none',
      },
      outline: {
        backgroundColor: 'transparent',
        color: currentTheme.foreground,
        border: `1px solid ${currentTheme.border}`,
      },
      ghost: {
        backgroundColor: 'transparent',
        color: currentTheme.foreground,
        border: 'none',
      },
      destructive: {
        backgroundColor: currentTheme.destructive,
        color: currentTheme.destructiveForeground,
        border: 'none',
      },
    };

    const sizes = {
      sm: 'px-3 py-1.5 text-sm',
      default: 'px-4 py-2',
      lg: 'px-6 py-3 text-lg',
    };

    return (
      <button
        className={`rounded-md font-medium transition-all hover:opacity-90 active:scale-95 ${sizes[size]}`}
        style={variants[variant]}
        {...props}
      >
        {children}
      </button>
    );
  };

  interface CardProps {
    title: string;
    children: React.ReactNode;
    icon?: React.ComponentType<{ className?: string; style?: React.CSSProperties }>;
  }

  const Card = ({ title, children, icon: Icon }: CardProps) => (
    <div 
      className="rounded-lg border p-6 space-y-4"
      style={{ 
        borderColor: currentTheme.border,
        backgroundColor: currentTheme.card,
      }}
    >
      <div className="flex items-center gap-3">
        {Icon && <Icon className="w-5 h-5" style={{ color: currentTheme.primary }} />}
        <h3 className="text-lg font-semibold" style={{ color: currentTheme.foreground }}>
          {title}
        </h3>
      </div>
      <div>{children}</div>
    </div>
  );

  interface BadgeProps {
    children: React.ReactNode;
    variant?: 'default' | 'secondary' | 'outline';
  }

  const Badge = ({ children, variant = 'default' }: BadgeProps) => {
    const variants = {
      default: {
        backgroundColor: currentTheme.primary,
        color: currentTheme.primaryForeground,
      },
      secondary: {
        backgroundColor: currentTheme.secondary,
        color: currentTheme.secondaryForeground,
      },
      outline: {
        backgroundColor: 'transparent',
        color: currentTheme.foreground,
        border: `1px solid ${currentTheme.border}`,
      },
    };

    return (
      <span 
        className="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold"
        style={variants[variant]}
      >
        {children}
      </span>
    );
  };

  return (
    <div className="min-h-screen p-8" style={{ backgroundColor: currentTheme.background }}>
      <div className="max-w-7xl mx-auto space-y-8">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-4xl font-bold mb-2" style={{ color: currentTheme.foreground }}>
              GaiaLabs Theme System
            </h1>
            <p className="text-lg" style={{ color: currentTheme.mutedForeground }}>
              Inspired by the mystical world of Illusion of Gaia
            </p>
          </div>
          <Button
            variant="outline"
            size="lg"
            onClick={() => setIsDark(!isDark)}
            className="flex items-center gap-2"
          >
            {isDark ? <Sun className="w-5 h-5" /> : <Moon className="w-5 h-5" />}
            {isDark ? 'Light' : 'Dark'} Mode
          </Button>
        </div>

        {/* Color Palette */}
        <Card title="Color Palette" icon={Palette}>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
            {Object.entries(currentTheme).map(([name, value]) => (
              <ColorCard 
                key={name} 
                name={name} 
                value={value} 
                cssVar={`--${name.replace(/([A-Z])/g, '-$1').toLowerCase()}`}
              />
            ))}
          </div>
        </Card>

        {/* Components Showcase */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Buttons */}
          <Card title="Buttons" icon={Zap}>
            <div className="space-y-4">
              <div className="flex flex-wrap gap-3">
                <Button variant="default">Primary</Button>
                <Button variant="secondary">Secondary</Button>
                <Button variant="outline">Outline</Button>
                <Button variant="ghost">Ghost</Button>
                <Button variant="destructive">Destructive</Button>
              </div>
              <div className="flex flex-wrap gap-3">
                <Button size="sm">Small</Button>
                <Button size="default">Default</Button>
                <Button size="lg">Large</Button>
              </div>
            </div>
          </Card>

          {/* Badges */}
          <Card title="Badges & Tags" icon={Shield}>
            <div className="flex flex-wrap gap-3">
              <Badge>Default</Badge>
              <Badge variant="secondary">Secondary</Badge>
              <Badge variant="outline">Outline</Badge>
              <div className="flex gap-2">
                <Badge variant="default"><Star className="w-3 h-3 mr-1" />Featured</Badge>
                <Badge variant="secondary"><Gamepad2 className="w-3 h-3 mr-1" />Gaming</Badge>
                <Badge variant="outline"><Code className="w-3 h-3 mr-1" />Code</Badge>
              </div>
            </div>
          </Card>

          {/* Input Elements */}
          <Card title="Form Elements" icon={Layers}>
            <div className="space-y-4">
              <input
                type="text"
                placeholder="Text input"
                className="w-full px-3 py-2 rounded-md border"
                style={{
                  borderColor: currentTheme.input,
                  backgroundColor: currentTheme.background,
                  color: currentTheme.foreground,
                }}
              />
              <textarea
                placeholder="Textarea"
                rows={3}
                className="w-full px-3 py-2 rounded-md border resize-none"
                style={{
                  borderColor: currentTheme.input,
                  backgroundColor: currentTheme.background,
                  color: currentTheme.foreground,
                }}
              />
              <div className="flex items-center gap-2">
                <input type="checkbox" id="check" className="w-4 h-4" />
                <label htmlFor="check" style={{ color: currentTheme.foreground }}>
                  Checkbox option
                </label>
              </div>
            </div>
          </Card>

          {/* Special Elements */}
          <Card title="Special Elements" icon={Sparkles}>
            <div className="space-y-4">
              <div 
                className="p-4 rounded-lg"
                style={{ backgroundColor: currentTheme.muted }}
              >
                <p className="font-medium mb-2" style={{ color: currentTheme.foreground }}>
                  Muted Background
                </p>
                <p style={{ color: currentTheme.mutedForeground }}>
                  Perfect for secondary content areas
                </p>
              </div>
              <div className="grid grid-cols-3 gap-3">
                <div 
                  className="p-4 rounded-lg text-center"
                  style={{ backgroundColor: currentTheme.cosmos }}
                >
                  <p className="text-white text-sm">Cosmos</p>
                </div>
                <div 
                  className="p-4 rounded-lg text-center"
                  style={{ backgroundColor: currentTheme.mystic }}
                >
                  <p className="text-white text-sm">Mystic</p>
                </div>
                <div 
                  className="p-4 rounded-lg text-center"
                  style={{ backgroundColor: currentTheme.coral }}
                >
                  <p className="text-white text-sm">Coral</p>
                </div>
              </div>
            </div>
          </Card>
        </div>

        {/* Project Cards */}
        <div>
          <h2 className="text-2xl font-semibold mb-4" style={{ color: currentTheme.foreground }}>
            Project Cards
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <Card title="ROM Editor" icon={Box}>
              <p style={{ color: currentTheme.mutedForeground }}>
                Advanced ROM editing tools with real-time preview
              </p>
              <div className="mt-4 flex gap-2">
                <Badge>Editor</Badge>
                <Badge variant="secondary">Tools</Badge>
              </div>
            </Card>
            <Card title="Sprite Manager" icon={Heart}>
              <p style={{ color: currentTheme.mutedForeground }}>
                Manage and edit sprite animations with ease
              </p>
              <div className="mt-4 flex gap-2">
                <Badge>Graphics</Badge>
                <Badge variant="secondary">Animation</Badge>
              </div>
            </Card>
            <Card title="Database" icon={Database}>
              <p style={{ color: currentTheme.mutedForeground }}>
                Comprehensive game data management system
              </p>
              <div className="mt-4 flex gap-2">
                <Badge>Data</Badge>
                <Badge variant="secondary">Storage</Badge>
              </div>
            </Card>
          </div>
        </div>

        {/* CSS Variables Display */}
        <Card title="CSS Variables" icon={Code}>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <pre className="p-4 rounded-lg overflow-x-auto text-sm" style={{ 
              backgroundColor: currentTheme.muted,
              color: currentTheme.foreground 
            }}>
              <code>{`/* Light Theme */
:root {
  --primary: ${themes.light.primary};
  --secondary: ${themes.light.secondary};
  --accent: ${themes.light.accent};
  --background: ${themes.light.background};
  --foreground: ${themes.light.foreground};
  /* ... more variables */
}`}</code>
            </pre>
            <pre className="p-4 rounded-lg overflow-x-auto text-sm" style={{ 
              backgroundColor: currentTheme.muted,
              color: currentTheme.foreground 
            }}>
              <code>{`/* Dark Theme */
.dark {
  --primary: ${themes.dark.primary};
  --secondary: ${themes.dark.secondary};
  --accent: ${themes.dark.accent};
  --background: ${themes.dark.background};
  --foreground: ${themes.dark.foreground};
  /* ... more variables */
}`}</code>
            </pre>
          </div>
        </Card>
      </div>
    </div>
  );
}

export default ThemeShowcase;