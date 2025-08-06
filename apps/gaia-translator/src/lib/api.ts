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

export async function fetchGameStrings(filter: GameStringFilter = {}): Promise<UIGameString[]> {
  const { 
    selectedChapter, 
    selectedGroup, 
    selectedScene, 
    selectedFile, 
    searchQuery 
  } = filter;

  // Build the query with proper joins to get StringText data
  let query = supabase
    .from('GameString')
    .select(`
      id,
      name,
      sceneId,
      chapterId,
      fileId,
      scene:Scene(id, name, groupId, group:SceneGroup(id, name)),
      chapter:Chapter(id, name),
      file:File(id, name),
      texts:StringText(
        id,
        text,
        region:TextRegion(code, name, isCore)
      )
    `)
    .limit(200); // Add reasonable limit

  // Apply filters
  if (selectedChapter) {
    query = query.eq('chapter.name', selectedChapter);
  }
  
  if (selectedGroup) {
    query = query.eq('scene.group.name', selectedGroup);
  }
  
  if (selectedScene) {
    query = query.eq('scene.name', selectedScene);
  }
  
  if (selectedFile) {
    query = query.eq('file.name', selectedFile);
  }

  if (searchQuery) {
    query = query.or(`name.ilike.%${searchQuery}%, texts.text.ilike.%${searchQuery}%`);
  }

  const { data, error } = await query;
  
  if (error) {
    console.error('Error fetching game strings:', error);
    return [];
  }

  if (!data) return [];

  // Transform to UIGameString format
  return data.map(gameString => {
    // Build texts mapping from region code to text
    const texts: Record<string, string> = {};
    if (gameString.texts) {
      gameString.texts.forEach((stringText: any) => {
        if (stringText.region) {
          texts[stringText.region.code] = stringText.text;
        }
      });
    }

    // Handle records without scenes - group them as "Multiple"
    // Note: Supabase returns joined data as arrays, so we take the first element
    const scene = Array.isArray(gameString.scene) ? gameString.scene[0] : gameString.scene;
    const file = Array.isArray(gameString.file) ? gameString.file[0] : gameString.file;
    
    let groupName = 'Multiple';
    if (scene) {
      const group = Array.isArray(scene.group) ? scene.group[0] : scene.group;
      groupName = group?.name || 'Multiple';
    }
    
    const sceneName = scene?.name || 'Multiple';
    const fileName = file?.name || 'Unknown';

    return {
      id: gameString.id,
      group: groupName,
      scene: sceneName, 
      file: fileName,
      texts,
      quality: 'pending' as const, // Default quality
      contributors: 1, // Default contributors
      lastEdit: 'Recently' // Default last edit
    };
  });
}

export async function fetchTextRegions(): Promise<TextRegion[]> {
  const { data } = await supabase.from('TextRegion').select('*');
  return (data as TextRegion[]) || [];
}
