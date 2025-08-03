import { useState, useEffect } from 'react';
import {
  Moon, Sun, Sparkles, Code, Database, Box, Shield, Zap,
  Heart, Star, Gamepad2, Layers, ChevronRight, Search,
  Menu, X, Bell, User, Settings, LogOut, Check, Plus
} from 'lucide-react';

// Theme toggle component
const ThemeToggle = () => {
  const [isDark, setIsDark] = useState(false);

  useEffect(() => {
    if (isDark) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }, [isDark]);
  
  return (
    <button
      onClick={() => setIsDark(!isDark)}
      className="relative inline-flex h-10 w-10 items-center justify-center rounded-lg border border-input bg-background text-sm font-medium ring-offset-background transition-colors hover:bg-accent hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2"
    >
      <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
      <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
      <span className="sr-only">Toggle theme</span>
    </button>
  );
};

// Button component
interface ButtonProps {
  children: React.ReactNode;
  variant?: 'default' | 'destructive' | 'outline' | 'secondary' | 'ghost' | 'link';
  size?: 'default' | 'sm' | 'lg' | 'icon';
  className?: string;
  disabled?: boolean;
  onClick?: () => void;
}

const Button = ({
  children,
  variant = 'default',
  size = 'default',
  className = '',
  ...props
}: ButtonProps) => {
  const baseStyles = "inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50";
  
  const variants = {
    default: "bg-primary text-primary-foreground hover:bg-primary/90",
    destructive: "bg-destructive text-destructive-foreground hover:bg-destructive/90",
    outline: "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
    secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
    ghost: "hover:bg-accent hover:text-accent-foreground",
    link: "text-primary underline-offset-4 hover:underline",
  };
  
  const sizes = {
    default: "h-10 px-4 py-2",
    sm: "h-9 rounded-md px-3",
    lg: "h-11 rounded-md px-8",
    icon: "h-10 w-10",
  };
  
  return (
    <button
      className={`${baseStyles} ${variants[variant]} ${sizes[size]} ${className}`}
      {...props}
    >
      {children}
    </button>
  );
};

// Card component
const Card = ({ children, className = '' }) => (
  <div className={`rounded-lg border bg-card text-card-foreground shadow-sm ${className}`}>
    {children}
  </div>
);

const CardHeader = ({ children, className = '' }) => (
  <div className={`flex flex-col space-y-1.5 p-6 ${className}`}>
    {children}
  </div>
);

const CardTitle = ({ children, className = '' }) => (
  <h3 className={`text-2xl font-semibold leading-none tracking-tight ${className}`}>
    {children}
  </h3>
);

const CardDescription = ({ children, className = '' }) => (
  <p className={`text-sm text-muted-foreground ${className}`}>
    {children}
  </p>
);

const CardContent = ({ children, className = '' }) => (
  <div className={`p-6 pt-0 ${className}`}>
    {children}
  </div>
);

// Badge component
const Badge = ({ children, variant = 'default', className = '' }) => {
  const variants = {
    default: "border-transparent bg-primary text-primary-foreground hover:bg-primary/80",
    secondary: "border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80",
    destructive: "border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80",
    outline: "text-foreground",
  };
  
  return (
    <div className={`inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 ${variants[variant]} ${className}`}>
      {children}
    </div>
  );
};

// Input component
const Input = ({ className = '', ...props }) => (
  <input
    className={`flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 ${className}`}
    {...props}
  />
);

// Alert component
const Alert = ({ children, className = '' }) => (
  <div className={`relative w-full rounded-lg border p-4 [&>svg~*]:pl-7 [&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:left-4 [&>svg]:top-4 [&>svg]:text-foreground ${className}`}>
    {children}
  </div>
);

const AlertTitle = ({ children, className = '' }) => (
  <h5 className={`mb-1 font-medium leading-none tracking-tight ${className}`}>
    {children}
  </h5>
);

const AlertDescription = ({ children, className = '' }) => (
  <div className={`text-sm [&_p]:leading-relaxed ${className}`}>
    {children}
  </div>
);

// Main showcase component
function ComponentsShowcase() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  
  return (
    <div className="min-h-screen bg-background">
      {/* Apply theme styles */}
      <style jsx global>{`
        @import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Inter:wght@400;500;600;700&family=JetBrains+Mono&display=swap');
        
        :root {
          --background: 201 40% 98%;
          --foreground: 220 30% 20%;
          --card: 0 0% 100%;
          --card-foreground: 220 30% 20%;
          --popover: 0 0% 100%;
          --popover-foreground: 220 30% 20%;
          --primary: 220 70% 50%;
          --primary-foreground: 0 0% 100%;
          --secondary: 270 50% 65%;
          --secondary-foreground: 0 0% 100%;
          --muted: 210 40% 96%;
          --muted-foreground: 215 16% 47%;
          --accent: 43 85% 55%;
          --accent-foreground: 220 30% 20%;
          --destructive: 0 72% 51%;
          --destructive-foreground: 0 0% 98%;
          --border: 214 32% 91%;
          --input: 214 32% 91%;
          --ring: 220 70% 50%;
          --radius: 0.5rem;
          --gaia-cosmos: 235 60% 18%;
          --gaia-stardust: 45 90% 88%;
          --gaia-mystic: 280 45% 75%;
          --gaia-coral: 350 60% 70%;
          --gaia-teal: 180 50% 45%;
        }
        
        .dark {
          --background: 235 60% 12%;
          --foreground: 210 40% 98%;
          --card: 235 50% 15%;
          --card-foreground: 210 40% 98%;
          --popover: 235 50% 15%;
          --popover-foreground: 210 40% 98%;
          --primary: 220 90% 60%;
          --primary-foreground: 0 0% 98%;
          --secondary: 270 60% 70%;
          --secondary-foreground: 0 0% 98%;
          --muted: 235 40% 20%;
          --muted-foreground: 215 20% 65%;
          --accent: 43 90% 65%;
          --accent-foreground: 220 30% 10%;
          --destructive: 0 63% 60%;
          --destructive-foreground: 0 0% 98%;
          --border: 235 40% 25%;
          --input: 235 40% 25%;
          --ring: 220 90% 60%;
          --gaia-cosmos: 235 70% 8%;
          --gaia-stardust: 45 80% 75%;
          --gaia-mystic: 280 55% 80%;
          --gaia-coral: 350 70% 75%;
          --gaia-teal: 180 60% 50%;
        }
        
        body {
          font-family: 'Inter', system-ui, sans-serif;
        }
        
        h1, h2, h3, h4, h5, h6 {
          font-family: 'Cinzel', serif;
        }
        
        code {
          font-family: 'JetBrains Mono', monospace;
        }
      `}</style>

      {/* Navigation */}
      <nav className="border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
        <div className="container flex h-16 items-center px-4">
          <div className="mr-8 flex items-center space-x-2">
            <Sparkles className="h-6 w-6 text-primary" />
            <span className="font-display text-xl font-semibold">GaiaLabs</span>
          </div>
          
          <div className="flex flex-1 items-center justify-between space-x-2 md:justify-end">
            <div className="w-full flex-1 md:w-auto md:flex-none">
              <div className="relative">
                <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
                <Input
                  type="search"
                  placeholder="Search projects..."
                  className="pl-8 md:w-[300px] lg:w-[400px]"
                />
              </div>
            </div>
            
            <div className="flex items-center space-x-2">
              <Button variant="ghost" size="icon">
                <Bell className="h-4 w-4" />
              </Button>
              <ThemeToggle />
              <Button
                variant="ghost"
                size="icon"
                className="md:hidden"
                onClick={() => setIsMenuOpen(!isMenuOpen)}
              >
                {isMenuOpen ? <X className="h-4 w-4" /> : <Menu className="h-4 w-4" />}
              </Button>
            </div>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="relative overflow-hidden border-b bg-gradient-to-b from-background to-muted/50 px-4 py-24">
        <div className="absolute inset-0 bg-gaia-radial" />
        <div className="container relative">
          <div className="flex flex-col items-center text-center">
            <Badge variant="secondary" className="mb-4 animate-float">
              <Sparkles className="mr-1 h-3 w-3" />
              Mystical ROM Editor
            </Badge>
            <h1 className="mb-4 text-4xl font-bold tracking-tight sm:text-5xl md:text-6xl lg:text-7xl">
              Welcome to <span className="text-primary">GaiaLabs</span>
            </h1>
            <p className="mb-8 max-w-[700px] text-lg text-muted-foreground sm:text-xl">
              Experience the magic of ROM editing with our mystical theme inspired by Illusion of Gaia.
              Beautiful components, accessible design, and powerful tools.
            </p>
            <div className="flex flex-wrap gap-4">
              <Button size="lg" className="animate-pulse-glow">
                <Zap className="mr-2 h-4 w-4" />
                Get Started
              </Button>
              <Button size="lg" variant="outline">
                <Code className="mr-2 h-4 w-4" />
                View Components
              </Button>
            </div>
          </div>
        </div>
      </section>

      {/* Main Content */}
      <main className="container px-4 py-8">
        {/* Feature Cards */}
        <section className="mb-12">
          <h2 className="mb-8 text-3xl font-bold">Core Features</h2>
          <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
            <Card className="transition-all hover:shadow-gaia-lg hover:-translate-y-1">
              <CardHeader>
                <Box className="mb-2 h-8 w-8 text-primary" />
                <CardTitle>ROM Editor</CardTitle>
                <CardDescription>
                  Advanced ROM editing with real-time preview and undo/redo support
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex flex-wrap gap-2">
                  <Badge>Editor</Badge>
                  <Badge variant="secondary">Tools</Badge>
                  <Badge variant="outline">Preview</Badge>
                </div>
              </CardContent>
            </Card>

            <Card className="transition-all hover:shadow-gaia-lg hover:-translate-y-1">
              <CardHeader>
                <Heart className="mb-2 h-8 w-8 text-gaia-coral" />
                <CardTitle>Sprite Manager</CardTitle>
                <CardDescription>
                  Create and edit sprite animations with our intuitive visual editor
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex flex-wrap gap-2">
                  <Badge>Graphics</Badge>
                  <Badge variant="secondary">Animation</Badge>
                  <Badge variant="outline">Export</Badge>
                </div>
              </CardContent>
            </Card>

            <Card className="transition-all hover:shadow-gaia-lg hover:-translate-y-1">
              <CardHeader>
                <Database className="mb-2 h-8 w-8 text-gaia-teal" />
                <CardTitle>Data Management</CardTitle>
                <CardDescription>
                  Comprehensive game data management with version control
                </CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex flex-wrap gap-2">
                  <Badge>Database</Badge>
                  <Badge variant="secondary">Version Control</Badge>
                  <Badge variant="outline">Sync</Badge>
                </div>
              </CardContent>
            </Card>
          </div>
        </section>

        {/* Components Demo */}
        <section className="mb-12">
          <h2 className="mb-8 text-3xl font-bold">Component Library</h2>
          
          {/* Buttons */}
          <Card className="mb-6">
            <CardHeader>
              <CardTitle>Buttons</CardTitle>
              <CardDescription>Various button styles and states</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="flex flex-wrap gap-3">
                <Button>Default</Button>
                <Button variant="secondary">Secondary</Button>
                <Button variant="destructive">Destructive</Button>
                <Button variant="outline">Outline</Button>
                <Button variant="ghost">Ghost</Button>
                <Button variant="link">Link</Button>
              </div>
              <div className="flex flex-wrap gap-3">
                <Button size="sm">Small</Button>
                <Button>Default</Button>
                <Button size="lg">Large</Button>
                <Button size="icon"><Plus className="h-4 w-4" /></Button>
              </div>
              <div className="flex flex-wrap gap-3">
                <Button disabled>Disabled</Button>
                <Button className="animate-shimmer">
                  <Sparkles className="mr-2 h-4 w-4" />
                  Shimmer Effect
                </Button>
                <Button className="bg-gradient-to-r from-primary to-secondary">
                  Gradient
                </Button>
              </div>
            </CardContent>
          </Card>

          {/* Form Elements */}
          <Card className="mb-6">
            <CardHeader>
              <CardTitle>Form Elements</CardTitle>
              <CardDescription>Input fields and form controls</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid gap-4 md:grid-cols-2">
                <div className="space-y-2">
                  <label className="text-sm font-medium">Text Input</label>
                  <Input type="text" placeholder="Enter text..." />
                </div>
                <div className="space-y-2">
                  <label className="text-sm font-medium">Email Input</label>
                  <Input type="email" placeholder="email@example.com" />
                </div>
              </div>
              <div className="space-y-2">
                <label className="text-sm font-medium">Textarea</label>
                <textarea 
                  className="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
                  placeholder="Type your message here..."
                />
              </div>
            </CardContent>
          </Card>

          {/* Alerts */}
          <Card>
            <CardHeader>
              <CardTitle>Alerts & Notifications</CardTitle>
              <CardDescription>System messages and alerts</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <Alert>
                <Star className="h-4 w-4" />
                <AlertTitle>Success!</AlertTitle>
                <AlertDescription>
                  Your project has been saved successfully.
                </AlertDescription>
              </Alert>
              <Alert className="border-destructive">
                <Shield className="h-4 w-4 text-destructive" />
                <AlertTitle>Error</AlertTitle>
                <AlertDescription>
                  There was a problem processing your request.
                </AlertDescription>
              </Alert>
              <Alert className="border-accent bg-accent/10">
                <Sparkles className="h-4 w-4 text-accent" />
                <AlertTitle>Pro Tip</AlertTitle>
                <AlertDescription>
                  Use keyboard shortcuts to speed up your workflow!
                </AlertDescription>
              </Alert>
            </CardContent>
          </Card>
        </section>

        {/* Color Palette */}
        <section>
          <h2 className="mb-8 text-3xl font-bold">Color Palette</h2>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            <div className="space-y-3">
              <h3 className="font-semibold">Primary Colors</h3>
              <div className="flex gap-3">
                <div className="h-20 w-20 rounded-lg bg-primary" />
                <div className="h-20 w-20 rounded-lg bg-secondary" />
                <div className="h-20 w-20 rounded-lg bg-accent" />
              </div>
            </div>
            <div className="space-y-3">
              <h3 className="font-semibold">Gaia Colors</h3>
              <div className="flex gap-3">
                <div className="h-20 w-20 rounded-lg bg-gaia-cosmos" />
                <div className="h-20 w-20 rounded-lg bg-gaia-mystic" />
                <div className="h-20 w-20 rounded-lg bg-gaia-coral" />
              </div>
            </div>
            <div className="space-y-3">
              <h3 className="font-semibold">Gradients</h3>
              <div className="flex gap-3">
                <div className="h-20 w-20 rounded-lg bg-gradient-to-br from-primary to-secondary" />
                <div className="h-20 w-20 rounded-lg bg-gradient-to-r from-accent to-gaia-stardust" />
                <div className="h-20 w-20 rounded-lg bg-gradient-to-tr from-gaia-teal to-primary" />
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}

export default ComponentsShowcase;