/**
 * Unified API for GaiaCore
 * High-level interfaces for ROM processing and project management
 */

export * from './RomProcessor';
export * from './ProjectManager';

// Re-export commonly used types
export type { ProjectConfig } from '../rom/project';
export type { DbRoot } from '@gaialabs/shared';
export { RomState } from '../rom/state';
export { QuintetLZ } from '../compression/QuintetLZ';
export { SpriteMap } from '../sprites/SpriteMap';
export { OpCodeUtils } from '../assembly/OpCode'; 