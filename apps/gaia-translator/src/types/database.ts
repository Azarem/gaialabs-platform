// Database types based on Prisma schema

export interface User {
  id: string
  email: string
  username: string
  displayName?: string
  avatarUrl?: string
  createdOn: string
  updatedOn?: string
}

export interface SceneGroup {
  id: string
  name: string
  description?: string
}

export interface Scene {
  id: string
  code: string
  name: string
  groupId: string
  chapterId?: string
  group?: SceneGroup
  chapter?: Chapter
}

export interface Chapter {
  id: string
  name?: string
  description?: string
}

export interface File {
  id: string
  name: string
  description?: string
  sceneId?: string
  groupId?: string
  scene?: Scene
  group?: SceneGroup
}

export interface StringType {
  id: string
  name: string
  description?: string
}

export interface GameString {
  id: string
  name: string
  typeId: string
  sceneId?: string
  chapterId?: string
  fileId: string
  stringType?: StringType
  scene?: Scene
  chapter?: Chapter
  file?: File
  texts?: StringText[]
}

export interface TextRegion {
  id: string
  code: string
  name: string
  language: string
  description?: string
  website?: string
  isCore: boolean
  createdOn: string
  createdById: string
  updatedOn?: string
  updatedById?: string
  deletedOn?: string
  deletedById?: string
}

export interface StringText {
  id: string
  stringId: string
  regionId: string
  text: string
  string?: GameString
  region?: TextRegion
  createdOn: string
  createdById: string
  updatedOn?: string
  updatedById?: string
  deletedOn?: string
  deletedById?: string
}

export interface TextFeedback {
  id: string
  textId: string
  userId: string
  type: 'suggestion' | 'correction' | 'question' | 'approval'
  content: string
  isResolved: boolean
  text?: StringText
  user?: User
  createdOn: string
  createdById: string
  updatedOn?: string
  updatedById?: string
  deletedOn?: string
  deletedById?: string
}

// UI-specific types that match the current component structure
export interface UIGameString {
  id: string
  group: string
  scene: string
  file: string
  texts: Record<string, string> // region code -> text
  quality: 'verified' | 'pending' | 'draft'
  contributors: number
  lastEdit: string
}

export interface FilterOptions {
  selectedChapter?: string
  selectedGroup?: string
  selectedScene?: string
  selectedFile?: string
  searchQuery?: string
}
