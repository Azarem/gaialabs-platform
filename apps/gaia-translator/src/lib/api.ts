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

  // First, get the IDs we need for filtering
  let chapterId: string | undefined;
  let sceneIds: string[] = [];
  let fileId: string | undefined;

  // Get chapter ID if filtering by chapter
  if (selectedChapter) {
    const { data: chapters } = await supabase
      .from('Chapter')
      .select('id')
      .eq('name', selectedChapter)
      .single();
    chapterId = chapters?.id;
  }

  // Get scene IDs if filtering by group or scene
  if (selectedGroup || selectedScene) {
    let sceneQuery = supabase.from('Scene').select('id, name, groupId');
    
    if (selectedGroup) {
      // Get group ID first
      const { data: groups } = await supabase
        .from('SceneGroup')
        .select('id')
        .eq('name', selectedGroup)
        .single();
      if (groups) {
        sceneQuery = sceneQuery.eq('groupId', groups.id);
      }
    }
    
    if (selectedScene) {
      sceneQuery = sceneQuery.eq('name', selectedScene);
    }
    
    const { data: scenes } = await sceneQuery;
    sceneIds = scenes?.map(s => s.id) || [];
  }

  // Get file ID if filtering by file
  if (selectedFile) {
    const { data: files } = await supabase
      .from('File')
      .select('id')
      .eq('name', selectedFile)
      .single();
    fileId = files?.id;
  }

  // Build the main query with proper joins
  let query = supabase
    .from('GameString')
    .select(`
      id,
      name,
      sceneId,
      chapterId,
      fileId,
      scene:Scene(id, name, groupId),
      chapter:Chapter(id, name),
      file:File(id, name),
      texts:StringText(
        id,
        text,
        region:TextRegion(code, name, isCore)
      )
    `)
    .limit(200); // Add reasonable limit

  // Apply direct ID-based filters
  if (chapterId) {
    query = query.eq('chapterId', chapterId);
  }
  
  if (sceneIds.length > 0) {
    query = query.in('sceneId', sceneIds);
  }
  
  if (fileId) {
    query = query.eq('fileId', fileId);
  }

  if (searchQuery) {
    // Search in game string name (text search in joined data is complex, start with name only)
    query = query.ilike('name', `%${searchQuery}%`);
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
    const scene = Array.isArray(gameString.scene) ? gameString.scene[0] : gameString.scene;
    const file = Array.isArray(gameString.file) ? gameString.file[0] : gameString.file;
    
    // For group name, we'll need to get it from scene groups since we don't have it joined anymore
    // For now, use 'Multiple' as default - we could enhance this later
    const groupName = selectedGroup || 'Multiple';
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
