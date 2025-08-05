import { supabase } from './supabase';
import type {
  Chapter,
  SceneGroup,
  Scene,
  File,
  UIGameString,
  TextRegion
} from '../types/database';

export async function fetchChapters(): Promise<Chapter[]> {
  const { data } = await supabase.from('Chapter').select('*');
  return (data as Chapter[]) || [];
}

export async function fetchSceneGroups(): Promise<SceneGroup[]> {
  const { data } = await supabase.from('SceneGroup').select('*');
  return (data as SceneGroup[]) || [];
}

export async function fetchScenes(groupId?: string): Promise<Scene[]> {
  let query = supabase.from('Scene').select('*');
  if (groupId) {
    query = query.eq('groupId', groupId);
  }
  const { data } = await query;
  return (data as Scene[]) || [];
}

export async function fetchFiles(sceneId?: string): Promise<File[]> {
  let query = supabase.from('File').select('*');
  if (sceneId) {
    query = query.eq('sceneId', sceneId);
  }
  const { data } = await query;
  return (data as File[]) || [];
}

export interface GameStringFilter {
  selectedChapter?: string;
  selectedGroup?: string;
  selectedScene?: string;
  selectedFile?: string;
  searchQuery?: string;
}

export async function fetchGameStrings(_filter: GameStringFilter = {}): Promise<UIGameString[]> {
  const { data } = await supabase.from('GameString').select('*');
  return (data as UIGameString[]) || [];
}

export async function fetchTextRegions(): Promise<TextRegion[]> {
  const { data } = await supabase.from('TextRegion').select('*');
  return (data as TextRegion[]) || [];
}
