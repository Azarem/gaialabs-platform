/*
 * Tailwind CSS v4 Configuration
 * This file shows the equivalent CSS-first configuration for Tailwind CSS v4
 * Place this content in your main CSS file (e.g., app.css or globals.css)
 */

/*
@import "tailwindcss";

@theme {
  // Typography
  --font-display: "Cinzel", serif;
  --font-body: "Inter", system-ui, sans-serif;
  --font-mono: "JetBrains Mono", monospace;

  // Breakpoints
  --breakpoint-3xl: 1920px;

  // Border radius
  --radius: 0.5rem;

  // Light theme colors (using OKLCH for better color space)
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

  // Custom Gaia colors
  --color-gaia-cosmos: oklch(0.18 0.08 235);
  --color-gaia-stardust: oklch(0.88 0.12 45);
  --color-gaia-mystic: oklch(0.75 0.08 280);
  --color-gaia-coral: oklch(0.7 0.1 350);
  --color-gaia-teal: oklch(0.45 0.08 180);

  // Custom animations
  --animate-shimmer: shimmer 2s infinite;
  --animate-glow: glow 2s ease-in-out infinite;
  --animate-float: float 3s ease-in-out infinite;
  --animate-pulse-glow: pulse-glow 2s ease-in-out infinite;
}

@media (prefers-color-scheme: dark) {
  @theme {
    // Dark theme colors
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

    // Custom Gaia colors - dark mode
    --color-gaia-cosmos: oklch(0.08 0.1 235);
    --color-gaia-stardust: oklch(0.75 0.15 45);
    --color-gaia-mystic: oklch(0.8 0.1 280);
    --color-gaia-coral: oklch(0.75 0.12 350);
    --color-gaia-teal: oklch(0.5 0.1 180);
  }
}

// Custom utilities
@utility container {
  margin-inline: auto;
  padding-inline: 2rem;
  max-width: 1400px;
}

// Custom keyframes for animations
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
*/

// For projects still using Tailwind CSS v3, keep this configuration:
/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: ["class"],
  content: [
    './pages/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './app/**/*.{ts,tsx}',
    './src/**/*.{ts,tsx}',
  ],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
        // Custom Gaia colors
        gaia: {
          cosmos: "hsl(var(--gaia-cosmos))",
          stardust: "hsl(var(--gaia-stardust))",
          mystic: "hsl(var(--gaia-mystic))",
          coral: "hsl(var(--gaia-coral))",
          teal: "hsl(var(--gaia-teal))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: 0 },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: 0 },
        },
        "shimmer": {
          "0%": { transform: "translateX(-100%)" },
          "100%": { transform: "translateX(100%)" },
        },
        "glow": {
          "0%, 100%": {
            opacity: 1,
            transform: "scale(1)",
          },
          "50%": {
            opacity: 0.8,
            transform: "scale(1.05)",
          },
        },
        "float": {
          "0%, 100%": { transform: "translateY(0px)" },
          "50%": { transform: "translateY(-10px)" },
        },
        "pulse-glow": {
          "0%, 100%": {
            "box-shadow": "0 0 20px hsl(var(--primary) / 0.5)",
          },
          "50%": {
            "box-shadow": "0 0 30px hsl(var(--primary) / 0.8), 0 0 50px hsl(var(--primary) / 0.5)",
          },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
        "shimmer": "shimmer 2s infinite",
        "glow": "glow 2s ease-in-out infinite",
        "float": "float 3s ease-in-out infinite",
        "pulse-glow": "pulse-glow 2s ease-in-out infinite",
      },
      fontFamily: {
        'display': ['Cinzel', 'serif'],
        'body': ['Inter', 'system-ui', 'sans-serif'],
        'mono': ['JetBrains Mono', 'monospace'],
      },
      backgroundImage: {
        'gaia-radial': 'radial-gradient(circle at center, hsl(var(--primary) / 0.15) 0%, transparent 70%)',
        'gaia-conic': 'conic-gradient(from 180deg at 50% 50%, hsl(var(--primary)) 0deg, hsl(var(--secondary)) 90deg, hsl(var(--accent)) 180deg, hsl(var(--gaia-mystic)) 270deg, hsl(var(--primary)) 360deg)',
      },
      boxShadow: {
        'gaia-sm': '0 2px 8px hsl(var(--primary) / 0.1)',
        'gaia-md': '0 4px 16px hsl(var(--primary) / 0.15)',
        'gaia-lg': '0 8px 32px hsl(var(--primary) / 0.2)',
        'gaia-glow': '0 0 20px hsl(var(--primary) / 0.3), 0 0 40px hsl(var(--primary) / 0.2)',
      },
    },
  },
  plugins: [require("tailwindcss-animate")],
}