import { CompressionRegistry } from '@gaialabs/shared';
import { QuintetLZ } from './QuintetLZ';

/**
 * Register compression providers with the global registry
 */
export function registerCompressionProviders(): void {
  // Register QuintetLZ compression provider
  CompressionRegistry.register('QuintetLZ', () => new QuintetLZ());
}

// Auto-register when this module is imported
registerCompressionProviders();
