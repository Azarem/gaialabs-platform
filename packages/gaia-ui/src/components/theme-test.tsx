import * as React from "react"
import { Button } from "./ui/button"
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "./ui/card"
import { Badge } from "./ui/badge"

/**
 * Theme Test Component
 * 
 * This component demonstrates the GaiaLabs theme system with all the colors
 * and components from the design showcase. Use this to verify that the theme
 * is working correctly across light and dark modes.
 */
export function ThemeTest() {
  const [isDark, setIsDark] = React.useState(false)

  React.useEffect(() => {
    // Apply dark class to document root for testing
    if (isDark) {
      document.documentElement.classList.add('dark')
    } else {
      document.documentElement.classList.remove('dark')
    }
  }, [isDark])

  return (
    <div className="min-h-screen bg-background text-foreground p-8">
      <div className="max-w-4xl mx-auto space-y-8">
        {/* Header */}
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-4xl font-bold text-foreground">
              GaiaLabs Theme Test
            </h1>
            <p className="text-muted-foreground mt-2">
              Testing the Illusion of Gaia inspired theme system
            </p>
          </div>
          <Button
            variant="outline"
            onClick={() => setIsDark(!isDark)}
          >
            {isDark ? '☀️ Light' : '🌙 Dark'} Mode
          </Button>
        </div>

        {/* Color Palette */}
        <Card>
          <CardHeader>
            <CardTitle>Color Palette</CardTitle>
            <CardDescription>
              Core theme colors with proper CSS variable mapping
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
              <div className="space-y-2">
                <div className="w-full h-16 bg-primary rounded-md"></div>
                <p className="text-sm font-medium">Primary</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-secondary rounded-md"></div>
                <p className="text-sm font-medium">Secondary</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-accent rounded-md"></div>
                <p className="text-sm font-medium">Accent</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-destructive rounded-md"></div>
                <p className="text-sm font-medium">Destructive</p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Gaia Colors */}
        <Card>
          <CardHeader>
            <CardTitle>Gaia-Inspired Colors</CardTitle>
            <CardDescription>
              Special colors inspired by Illusion of Gaia
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
              <div className="space-y-2">
                <div className="w-full h-16 bg-cosmos rounded-md"></div>
                <p className="text-sm font-medium">Cosmos</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-stardust rounded-md"></div>
                <p className="text-sm font-medium">Stardust</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-mystic rounded-md"></div>
                <p className="text-sm font-medium">Mystic</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-coral rounded-md"></div>
                <p className="text-sm font-medium">Coral</p>
              </div>
              <div className="space-y-2">
                <div className="w-full h-16 bg-teal rounded-md"></div>
                <p className="text-sm font-medium">Teal</p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Components */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <Card>
            <CardHeader>
              <CardTitle>Buttons</CardTitle>
              <CardDescription>All button variants with theme colors</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <div className="flex flex-wrap gap-2">
                  <Button variant="default">Primary</Button>
                  <Button variant="secondary">Secondary</Button>
                  <Button variant="outline">Outline</Button>
                  <Button variant="ghost">Ghost</Button>
                  <Button variant="destructive">Destructive</Button>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Badges</CardTitle>
              <CardDescription>Badge components with theme integration</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex flex-wrap gap-2">
                <Badge>Default</Badge>
                <Badge variant="secondary">Secondary</Badge>
                <Badge variant="outline">Outline</Badge>
                <Badge variant="destructive">Error</Badge>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Surface Elements */}
        <Card>
          <CardHeader>
            <CardTitle>Surface Elements</CardTitle>
            <CardDescription>
              Testing background, muted, and card surfaces
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="p-4 bg-muted rounded-lg">
                <p className="text-muted-foreground">
                  This is a muted background area with muted foreground text.
                </p>
              </div>
              <div className="p-4 border rounded-lg">
                <p className="text-foreground">
                  This is a bordered area with normal foreground text.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
