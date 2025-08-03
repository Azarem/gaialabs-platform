/**
 * @fileoverview Gaia UI Components and Utilities
 * @module gaia-ui
 *
 * Enhanced with shadcn/ui components for better accessibility and consistency
 */

// Export utilities (enhanced with tailwind-merge)
export {
  cn,
  formatDate,
  formatDateTime,
  truncateText,
  slugify,
  capitalizeFirst,
  debounce
} from './lib/utils';

// Export shadcn/ui components
export { Button, buttonVariants } from './components/ui/button';
export { Input } from './components/ui/input';
export {
  Card,
  CardHeader,
  CardFooter,
  CardTitle,
  CardDescription,
  CardContent
} from './components/ui/card';
export { Badge, badgeVariants } from './components/ui/badge';
export {
  Dialog,
  DialogPortal,
  DialogOverlay,
  DialogClose,
  DialogTrigger,
  DialogContent,
  DialogHeader,
  DialogFooter,
  DialogTitle,
  DialogDescription,
} from './components/ui/dialog';
export {
  Select,
  SelectGroup,
  SelectValue,
  SelectTrigger,
  SelectContent,
  SelectLabel,
  SelectItem,
  SelectSeparator,
  SelectScrollUpButton,
  SelectScrollDownButton,
} from './components/ui/select';
export {
  Toaster
} from './components/ui/sonner';
export { Label } from './components/ui/label';
export {
  useFormField,
  Form,
  FormItem,
  FormLabel,
  FormControl,
  FormDescription,
  FormMessage,
  FormField,
} from './components/ui/form';
export {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuCheckboxItem,
  DropdownMenuRadioItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuShortcut,
  DropdownMenuGroup,
  DropdownMenuPortal,
  DropdownMenuSub,
  DropdownMenuSubContent,
  DropdownMenuSubTrigger,
  DropdownMenuRadioGroup,
} from './components/ui/dropdown-menu';

// Export theme test component
export { ThemeTest } from './components/theme-test';

// Legacy utility functions (kept for backward compatibility)
export const formatFileSize = (bytes: number): string => {
  const units = ['B', 'KB', 'MB', 'GB'];
  let size = bytes;
  let unitIndex = 0;

  while (size >= 1024 && unitIndex < units.length - 1) {
    size /= 1024;
    unitIndex++;
  }

  return `${size.toFixed(1)} ${units[unitIndex]}`;
};

export const throttle = <T extends (...args: any[]) => void>(
  func: T,
  limit: number
): ((...args: Parameters<T>) => void) => {
  let inThrottle: boolean;
  return (...args: Parameters<T>) => {
    if (!inThrottle) {
      func(...args);
      inThrottle = true;
      setTimeout(() => (inThrottle = false), limit);
    }
  };
};

// Export all types and utilities
export * from './types';

// Re-export React types for convenience
export type { ReactNode, ComponentType, FC } from 'react';