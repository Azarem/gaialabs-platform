import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

/**
 * Merge class names using `clsx` and `tailwind-merge` to prevent conflicts.
 */
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

/**
 * Format a date using the provided locale.
 */
export function formatDate(date: Date | string, locale: string = 'en-US') {
  const value = typeof date === 'string' ? new Date(date) : date;
  return new Intl.DateTimeFormat(locale).format(value);
}

/**
 * Format a date and time using the provided locale.
 */
export function formatDateTime(
  date: Date | string,
  locale: string = 'en-US'
) {
  const value = typeof date === 'string' ? new Date(date) : date;
  return new Intl.DateTimeFormat(locale, {
    dateStyle: 'medium',
    timeStyle: 'short',
  }).format(value);
}

/**
 * Truncate a string to a maximum length and append an ellipsis if needed.
 */
export function truncateText(text: string, maxLength: number) {
  return text.length <= maxLength ? text : `${text.slice(0, maxLength)}…`;
}

/**
 * Convert a string into a URL-friendly slug.
 */
export function slugify(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-');
}

/**
 * Capitalize the first character of a string.
 */
export function capitalizeFirst(value: string) {
  return value.charAt(0).toUpperCase() + value.slice(1);
}

/**
 * Debounce a function by waiting `delay` milliseconds before invoking it.
 */
export function debounce<T extends (...args: any[]) => void>(
  fn: T,
  delay = 100
): (...args: Parameters<T>) => void {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: Parameters<T>) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delay);
  };
}
