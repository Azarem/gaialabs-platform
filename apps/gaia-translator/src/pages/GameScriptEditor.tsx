import { useState, useMemo, useEffect, useRef } from 'react';
import {
  Search,
  Filter,
  Globe,
  FileText,
  Check,
  X,
  Menu,
  ChevronLeft,
  Eye,
  Code,
  TrendingUp,
  Users,
  Award,
  Zap,
  Heart,
  ChevronDown,
  Edit3,
  Loader2,
  Sparkles
} from 'lucide-react';
import {
  Button,
  Input,
  Card,
  CardContent,
  Badge,
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
  Label
} from '@gaialabs/ui';
import {
  fetchChapters,
  fetchSceneGroups,
  fetchScenes,
  fetchFiles,
  fetchGameStrings,
  fetchTextRegions
} from '../lib/api';
import { ModeToggle } from '../components/mode-toggle';
import type {
  Chapter,
  SceneGroup,
  Scene,
  File,
  UIGameString,
  TextRegion
} from '../types/database';

const GameScriptEditor = () => {
  const [selectedRegion, setSelectedRegion] = useState('NA-English');
  const [selectedChapter, setSelectedChapter] = useState('');
  const [selectedGroup, setSelectedGroup] = useState('');
  const [selectedScene, setSelectedScene] = useState('');
  const [selectedFile, setSelectedFile] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedString, setSelectedString] = useState<UIGameString | null>(null);

  const [editingText, setEditingText] = useState<Record<string, string>>({});
  const [showFilters, setShowFilters] = useState(false);
  const [showMobileMenu, setShowMobileMenu] = useState(false);
  const [viewMode, setViewMode] = useState('formatted');
  const [isMobile, setIsMobile] = useState(false);
  const [showUserMenu, setShowUserMenu] = useState(false);

  // Data state
  const [chapters, setChapters] = useState<Chapter[]>([]);
  const [sceneGroups, setSceneGroups] = useState<SceneGroup[]>([]);
  const [scenes, setScenes] = useState<Scene[]>([]);
  const [files, setFiles] = useState<File[]>([]);
  const [gameStrings, setGameStrings] = useState<UIGameString[]>([]);
  const [textRegions, setTextRegions] = useState<TextRegion[]>([]);

  // Loading state
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Ref to prevent multiple initial data loads
  const initialDataLoaded = useRef(false);

  // Mock user data for community features
  const userData = {
    username: 'TranslatorPro',
    level: 12,
    exp: 3420,
    expToNext: 580,
    contributions: 247,
    streak: 5,
    badges: ['Early Adopter', 'Week Warrior', '100 Strings']
  };

  // Load initial data
  useEffect(() => {
    if (initialDataLoaded.current) return;

    const loadInitialData = async () => {
      try {
        setLoading(true);
        setError(null);
        initialDataLoaded.current = true;

        // Load all initial data in parallel
        const [chaptersData, sceneGroupsData, textRegionsData] = await Promise.all([
          fetchChapters(),
          fetchSceneGroups(),
          fetchTextRegions()
        ]);

        setChapters(chaptersData);
        setSceneGroups(sceneGroupsData);
        setTextRegions(textRegionsData);

        // Set default chapter if available
        if (chaptersData.length > 0 && !selectedChapter) {
          setSelectedChapter(chaptersData[0].name || '');
        }

        // Set default region if available
        if (textRegionsData.length > 0) {
          const coreRegion = textRegionsData.find((r: TextRegion) => r.isCore);
          if (coreRegion && selectedRegion === 'NA-English') {
            setSelectedRegion(coreRegion.code);
          }


        }

      } catch (err) {
        console.error('Error loading initial data:', err);
        setError('Failed to load initial data');
        console.error('Failed to load initial data');
      } finally {
        setLoading(false);
      }
    };

    loadInitialData();
  }, []);

  // Load scenes when scene group changes
  useEffect(() => {
    const loadScenes = async () => {
      if (!selectedGroup) {
        setScenes([]);
        return;
      }

      try {
        const sceneGroup = sceneGroups.find(g => g.name === selectedGroup);
        if (sceneGroup) {
          const scenesData = await fetchScenes(sceneGroup.id);
          setScenes(scenesData);
        }
      } catch (err) {
        console.error('Error loading scenes:', err);
        console.error('Failed to load scenes');
      }
    };

    loadScenes();
  }, [selectedGroup, sceneGroups]);

  // Load files when scene changes
  useEffect(() => {
    const loadFiles = async () => {
      if (!selectedScene) {
        setFiles([]);
        return;
      }

      try {
        const scene = scenes.find(s => s.name === selectedScene);
        if (scene) {
          const filesData = await fetchFiles(scene.id);
          setFiles(filesData);
        }
      } catch (err) {
        console.error('Error loading files:', err);
        console.error('Failed to load files');
      }
    };

    loadFiles();
  }, [selectedScene, scenes]);

  // Load game strings when filters change
  useEffect(() => {
    const loadGameStrings = async () => {
      try {
        const stringsData = await fetchGameStrings({
          selectedChapter,
          selectedGroup,
          selectedScene,
          selectedFile,
          searchQuery
        });
        setGameStrings(stringsData);
      } catch (err) {
        console.error('Error loading game strings:', err);
        console.error('Failed to load translation strings');
      }
    };

    // Only load if we have basic data loaded and scene groups are available
    if (!loading && sceneGroups.length > 0) {
      loadGameStrings();
    }
  }, [selectedChapter, selectedGroup, selectedScene, selectedFile, searchQuery, loading, sceneGroups.length]);

  // Detect mobile
  useEffect(() => {
    const checkMobile = () => {
      setIsMobile(window.innerWidth < 768);
    };
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  // Helper functions
  const formatTextForPreview = (text: string) => {
    if (!text) return '';
    return text
      .replace(/\[N\]/g, '\n')
      .replace(/\[TPL:\w+\]/g, '')
      .replace(/\[LU\d+:\w+\]/g, '')
      .replace(/\[FIN\]/g, '\n---\n')
      .replace(/\[PAL:\d+\]/g, '')
      .replace(/\[END\]/g, '');
  };

  // Get available scenes for the selected group
  const availableScenes = useMemo(() => {
    if (!selectedGroup) return [];
    return scenes.filter(scene => scene.group?.name === selectedGroup);
  }, [scenes, selectedGroup]);

  // Get available files for the selected scene
  const availableFiles = useMemo(() => {
    if (!selectedScene) return [];
    return files.filter(file => file.scene?.name === selectedScene);
  }, [files, selectedScene]);

  // Reset dependent selections when parent selection changes
  useEffect(() => {
    setSelectedScene('');
    setSelectedFile('');
  }, [selectedGroup]);

  useEffect(() => {
    setSelectedFile('');
  }, [selectedScene]);

  // No client-side filtering needed - all filtering is done server-side
  const filteredStrings = gameStrings;

  // User Profile Component
  const UserProfile = () => (
    <div className="relative">
      <Button
        variant="ghost"
        onClick={() => setShowUserMenu(!showUserMenu)}
        className="flex items-center gap-2 px-3 py-2"
      >
        <div className="w-8 h-8 bg-gradient-to-br from-primary to-secondary rounded-full flex items-center justify-center text-white font-semibold text-sm">
          {userData.level}
        </div>
        <div className="hidden sm:block text-left">
          <div className="text-sm font-medium text-foreground">{userData.username}</div>
          <div className="text-xs text-muted-foreground flex items-center gap-1">
            <Zap className="w-3 h-3" />
            {userData.exp}/{userData.exp + userData.expToNext} XP
          </div>
        </div>
        <ChevronDown className="w-4 h-4 text-muted-foreground" />
      </Button>

      {showUserMenu && (
        <Card className="absolute right-0 mt-2 w-64 z-50">
          <CardContent className="p-4 space-y-3">
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium text-foreground">Level {userData.level}</span>
                <span className="text-xs text-muted-foreground">{userData.expToNext} XP to level {userData.level + 1}</span>
              </div>
              <div className="w-full bg-muted rounded-full h-2">
                <div
                  className="bg-gradient-to-r from-primary to-secondary h-2 rounded-full transition-all"
                  style={{ width: `${(userData.exp / (userData.exp + userData.expToNext)) * 100}%` }}
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-2 py-2 border-y border-border">
              <div className="text-center">
                <div className="text-lg font-semibold text-foreground">{userData.contributions}</div>
                <div className="text-xs text-muted-foreground">Contributions</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-semibold flex items-center justify-center gap-1 text-foreground">
                  {userData.streak} <Heart className="w-4 h-4 text-coral" />
                </div>
                <div className="text-xs text-muted-foreground">Day Streak</div>
              </div>
            </div>

            <div>
              <div className="text-xs font-medium text-gray-500 mb-1">Recent Badges</div>
              <div className="flex gap-1">
                {userData.badges.slice(0, 3).map((badge, i) => (
                  <Badge key={i} variant="secondary" className="px-2 py-1 bg-yellow-100 text-yellow-700 text-xs">
                    {badge}
                  </Badge>
                ))}
              </div>
            </div>

            <div className="pt-2 border-t border-gray-100 space-y-1">
              <Button variant="ghost" className="w-full justify-start text-sm">Profile</Button>
              <Button variant="ghost" className="w-full justify-start text-sm">Achievements</Button>
              <Button variant="ghost" className="w-full justify-start text-sm">Settings</Button>
              <Button variant="ghost" className="w-full justify-start text-sm text-red-600 hover:text-red-700 hover:bg-red-50">Sign Out</Button>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );

  // Header Component
  const Header = () => (
    <div className="bg-card border-b border-border px-4 py-3 sticky top-0 z-40 backdrop-blur-sm bg-card/95">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          {isMobile && (
            <Button variant="ghost" size="icon" onClick={() => setShowMobileMenu(!showMobileMenu)} className="lg:hidden">
              <Menu className="w-5 h-5" />
            </Button>
          )}
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-lg bg-gradient-gaia-cosmos flex items-center justify-center">
              <Sparkles className="w-4 h-4 text-primary-foreground" />
            </div>
            <h1 className="text-lg font-display font-semibold text-foreground hidden sm:block">
              Gaia Script Editor
            </h1>
          </div>

          <div className="flex items-center gap-2">
            <Globe className="w-4 h-4 text-muted-foreground" />
            <Select value={selectedRegion} onValueChange={setSelectedRegion}>
              <SelectTrigger className="w-48 bg-background border-input">
                <SelectValue />
              </SelectTrigger>
              <SelectContent className="bg-popover border-border max-h-60 overflow-y-auto">
                {textRegions.map(region => (
                  <SelectItem key={region.code} value={region.code} className="hover:bg-accent hover:text-accent-foreground">
                    {region.name} {region.isCore ? '(core)' : ''}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        </div>

        <div className="flex items-center gap-2">
          <Button variant="ghost" size="icon" title="Community Activity" className="text-muted-foreground hover:text-foreground">
            <Users className="w-4 h-4" />
          </Button>
          <Button variant="ghost" size="icon" title="Leaderboard" className="text-muted-foreground hover:text-foreground">
            <TrendingUp className="w-4 h-4" />
          </Button>
          <ModeToggle />
          <UserProfile />
        </div>
      </div>
    </div>
  );

  // Filter Bar Component
  const FilterBar = () => (
    <div className={`bg-card border-b border-border ${isMobile && !showFilters ? 'hidden' : ''}`}>
      <div className="px-4 py-3">
        <div className={`${isMobile ? 'space-y-3' : 'flex items-center gap-4'}`}>
          {chapters.length > 0 && (
            <div className="flex items-center gap-2">
              <Label className="text-sm font-medium text-foreground min-w-fit">Chapter:</Label>
              <Select value={selectedChapter} onValueChange={setSelectedChapter}>
                <SelectTrigger className="flex-1">
                  <SelectValue placeholder="Select Chapter" />
                </SelectTrigger>
                <SelectContent>
                  {chapters.map(chapter => (
                    <SelectItem key={chapter.id} value={chapter.name || ''}>
                      {chapter.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          )}

          <div className="flex items-center gap-2">
            <Label className="text-sm font-medium text-foreground min-w-fit">Group:</Label>
            <Select value={selectedGroup} onValueChange={setSelectedGroup}>
              <SelectTrigger className="flex-1 bg-background border-input">
                <SelectValue placeholder="Select Group" />
              </SelectTrigger>
              <SelectContent className="bg-popover border-border max-h-60 overflow-y-auto">
                {sceneGroups.map(group => (
                  <SelectItem key={group.id} value={group.name} className="hover:bg-accent hover:text-accent-foreground">
                    {group.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div className="flex items-center gap-2">
            <Label className="text-sm font-medium text-foreground min-w-fit">Scene:</Label>
            <Select
              value={selectedScene}
              onValueChange={(value) => {
                setSelectedScene(value);
                setSelectedFile('');
              }}
              disabled={!selectedGroup}
            >
              <SelectTrigger className="flex-1 bg-background border-input disabled:opacity-50">
                <SelectValue placeholder="Select Scene" />
              </SelectTrigger>
              <SelectContent className="bg-popover border-border max-h-60 overflow-y-auto">
                {availableScenes.map(scene => (
                  <SelectItem key={scene.id} value={scene.name} className="hover:bg-accent hover:text-accent-foreground">
                    {scene.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          <div className="flex items-center gap-2">
            <Label className="text-sm font-medium text-foreground min-w-fit">File:</Label>
            <Select
              value={selectedFile}
              onValueChange={setSelectedFile}
              disabled={!selectedScene}
            >
              <SelectTrigger className="flex-1 bg-background border-input disabled:opacity-50">
                <SelectValue placeholder="Select File" />
              </SelectTrigger>
              <SelectContent className="bg-popover border-border max-h-60 overflow-y-auto">
                {availableFiles.map(file => (
                  <SelectItem key={file.id} value={file.name} className="hover:bg-accent hover:text-accent-foreground">
                    {file.name}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {(selectedScene || selectedFile) && (
            <Button
              variant="ghost"
              onClick={() => {
                setSelectedScene('');
                setSelectedFile('');
              }}
              className="ml-auto text-sm text-gray-600 hover:text-gray-800 flex items-center gap-1"
            >
              <X className="w-3 h-3" />
              Clear
            </Button>
          )}
        </div>
      </div>
    </div>
  );

  // Search Bar Component
  const SearchBar = () => (
    <div className="bg-card border-b border-border px-4 py-3">
      <div className="flex items-center gap-2">
        <div className="flex-1 relative">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-muted-foreground" />
          <Input
            type="text"
            placeholder="Search strings..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="pl-10 bg-background border-input"
          />
        </div>
        {isMobile && (
          <Button
            variant={showFilters ? "default" : "outline"}
            size="icon"
            onClick={() => setShowFilters(!showFilters)}
          >
            <Filter className="w-5 h-5" />
          </Button>
        )}
      </div>
      <div className="mt-2 flex items-center justify-between text-sm">
        <span className="text-muted-foreground">{filteredStrings.length} strings found</span>
        <span className="text-xs text-muted-foreground">
          <span className="inline-flex items-center gap-1">
            <div className="w-2 h-2 bg-teal rounded-full"></div> Verified
          </span>
          <span className="inline-flex items-center gap-1 ml-3">
            <div className="w-2 h-2 bg-accent rounded-full"></div> Needs Review
          </span>
        </span>
      </div>
    </div>
  );

  // String Item Component
  const StringItem = ({ str, onClick }: { str: any, onClick: () => void }) => (
    <Card
      className="cursor-pointer border-b border-border rounded-none hover:bg-accent/50 transition-colors"
      onClick={onClick}
    >
      <CardContent className="px-4 py-3">
        <div className="flex items-start justify-between gap-3">
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <span className="font-mono text-sm text-primary">{str.id}</span>
              <div className={`w-2 h-2 rounded-full ${str.quality === 'verified' ? 'bg-teal' : 'bg-accent'}`} />
            </div>
            <div className="text-sm text-foreground">
              {str.texts?.[selectedRegion] || '<No translation>'}
            </div>
            <div className="flex items-center gap-3 mt-2 text-xs text-muted-foreground">
              <span>{str.scene}</span>
              <span>•</span>
              <span>{str.file}</span>
              <span>•</span>
              <span className="flex items-center gap-1">
                <Users className="w-3 h-3" />
                {str.contributors}
              </span>
              <span>•</span>
              <span>{str.lastEdit}</span>
            </div>
          </div>
          {!isMobile && (
            <Button
              variant="ghost"
              size="icon"
              onClick={(e) => {
                e.stopPropagation();
                setSelectedString(str);
                setEditingText({ [selectedRegion]: str.texts?.[selectedRegion] || '' });
              }}
            >
              <Edit3 className="w-4 h-4 text-muted-foreground hover:text-foreground" />
            </Button>
          )}
        </div>
      </CardContent>
    </Card>
  );

  // Preview Panel Component
  const PreviewPanel = () => {
    if (!selectedString) {
      return (
        <div className="h-full flex items-center justify-center text-muted-foreground bg-muted/30">
          <div className="text-center p-8">
            <FileText className="w-12 h-12 mx-auto mb-3" />
            <p className="text-foreground font-medium">Select a string to preview</p>
            <p className="text-sm mt-2">Click any string from the list to see translations</p>
          </div>
        </div>
      );
    }

    return (
      <div className="h-full flex flex-col bg-muted/30">
        <div className="bg-card border-b border-border px-4 py-3">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-mono text-sm text-primary">{selectedString.id}</h3>
              <div className="flex items-center gap-3 mt-1 text-xs text-muted-foreground">
                <span>{selectedString.scene}</span>
                <span>•</span>
                <span>{selectedString.file}</span>
              </div>
            </div>
            <div className="flex items-center gap-2">
              <Button
                variant="outline"
                size="sm"
                onClick={() => setViewMode(viewMode === 'formatted' ? 'raw' : 'formatted')}
                className="flex items-center gap-2"
              >
                {viewMode === 'formatted' ? <Eye className="w-4 h-4" /> : <Code className="w-4 h-4" />}
                {viewMode === 'formatted' ? 'Preview' : 'Raw'}
              </Button>
            </div>
          </div>
        </div>

        <div className="flex-1 overflow-auto p-4">
          <div className="w-full">
            {(() => {
              const region = textRegions.find(r => r.code === selectedRegion);
              const text = selectedString.texts?.[selectedRegion] || '';
              const isEditing = editingText[selectedRegion] !== undefined;

              return (
                <div className="bg-card rounded-lg shadow-sm border border-border">
                  <div className="px-4 py-2 bg-muted border-b border-border flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <h4 className="font-medium text-sm text-foreground">{region?.name || selectedRegion}</h4>
                      {region?.isCore && (
                        <span className="text-xs px-2 py-0.5 bg-primary/10 text-primary rounded">Core</span>
                      )}
                    </div>
                    <button
                      onClick={() => {
                        if (isEditing) {
                          setEditingText(prev => {
                            const newState = { ...prev };
                            delete newState[selectedRegion];
                            return newState;
                          });
                        } else {
                          setEditingText(prev => ({
                            ...prev,
                            [selectedRegion]: text
                          }));
                        }
                      }}
                      className="text-xs text-primary hover:text-primary/80"
                    >
                      {isEditing ? 'Cancel' : 'Edit'}
                    </button>
                  </div>

                  <div className="p-3">
                    {isEditing ? (
                      <div>
                        <textarea
                          value={editingText[selectedRegion]}
                          onChange={(e) => setEditingText(prev => ({
                            ...prev,
                            [selectedRegion]: e.target.value
                          }))}
                          className="w-full h-32 p-2 font-mono text-xs border border-input rounded bg-background text-foreground"
                        />
                        <div className="mt-2 flex gap-2">
                          <button
                            onClick={() => {
                              console.log("Translation saved!");
                            }}
                            className="flex-1 px-3 py-1.5 text-xs bg-teal text-white rounded hover:bg-teal/90 flex items-center justify-center gap-1"
                          >
                            <Check className="w-3 h-3" />
                            Save
                          </button>
                          <button className="px-3 py-1.5 text-xs bg-muted text-muted-foreground rounded hover:bg-muted/80">
                            Preview
                          </button>
                        </div>
                        <div className="mt-2 text-xs text-teal">
                          +10 XP for contribution
                        </div>
                      </div>
                    ) : (
                      <div>
                        {viewMode === 'formatted' ? (
                          <div className="bg-cosmos text-stardust p-3 rounded font-mono text-xs whitespace-pre-wrap">
                            {formatTextForPreview(text) || '<No translation>'}
                          </div>
                        ) : (
                          <div className="bg-muted p-3 rounded font-mono text-xs break-all border border-border">
                            {text || '<No translation>'}
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                </div>
              );
            })()}
          </div>

          <div className="mt-4 p-3 bg-accent/10 border border-accent/20 rounded-lg">
            <div className="text-sm">
              <p className="font-medium text-accent-foreground">Translation Guidelines</p>
              <p className="text-muted-foreground mt-1 text-xs">
                Keep formatting codes intact: [N] = newline, [FIN] = page break, [END] = end of text
              </p>
            </div>
          </div>

          {/* Community Activity */}
          <div className="mt-4 p-4 bg-card rounded-lg border border-border">
            <h4 className="font-medium text-sm mb-3 text-foreground">Recent Activity</h4>
            <div className="space-y-2">
              <div className="flex items-center gap-3 text-xs">
                <div className="w-6 h-6 bg-mystic rounded-full flex items-center justify-center text-white font-semibold">8</div>
                <div className="text-muted-foreground">
                  <span className="font-medium text-foreground">PixelNinja</span> edited this string 2 hours ago
                </div>
              </div>
              <div className="flex items-center gap-3 text-xs">
                <div className="w-6 h-6 bg-primary rounded-full flex items-center justify-center text-white font-semibold">15</div>
                <div className="text-muted-foreground">
                  <span className="font-medium text-foreground">LangMaster</span> verified the translation
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  // Show loading state
  if (loading) {
    return (
      <div className="h-screen flex flex-col bg-background">
        <Header />
        <div className="flex-1 flex items-center justify-center">
          <div className="flex flex-col items-center gap-4">
            <Loader2 className="w-8 h-8 animate-spin text-primary" />
            <p className="text-muted-foreground">Loading translation data...</p>
          </div>
        </div>
      </div>
    );
  }

  // Show error state
  if (error) {
    return (
      <div className="h-screen flex flex-col bg-background">
        <Header />
        <div className="flex-1 flex items-center justify-center">
          <div className="flex flex-col items-center gap-4 max-w-md text-center">
            <div className="w-16 h-16 bg-destructive/10 rounded-full flex items-center justify-center">
              <X className="w-8 h-8 text-destructive" />
            </div>
            <h2 className="text-xl font-semibold text-foreground">Error Loading Data</h2>
            <p className="text-muted-foreground">{error}</p>
            <Button onClick={() => window.location.reload()}>
              Reload Page
            </Button>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className={`${isMobile ? 'h-dvh' : 'h-screen'} flex flex-col bg-background overflow-hidden`}>
      <Header />

      {!isMobile && <FilterBar />}

      <div className={`flex-1 flex ${isMobile ? 'flex-col' : ''} ${isMobile ? 'min-h-0' : 'overflow-hidden'}`}>
        <div className={`${isMobile ? 'flex-1 min-h-0' : 'w-1/2'} flex flex-col bg-card ${isMobile && selectedString ? 'hidden' : ''}`}>
          <SearchBar />
          {isMobile && <FilterBar />}

          <div className="flex-1 overflow-auto touch-pan-y">
            {filteredStrings.length === 0 ? (
              <div className="flex items-center justify-center h-full text-muted-foreground">
                <div className="text-center">
                  <FileText className="w-12 h-12 mx-auto mb-4 text-muted-foreground/50" />
                  <p className="text-foreground">No translation strings found</p>
                  <p className="text-sm">Try adjusting your filters</p>
                </div>
              </div>
            ) : (
              filteredStrings.map(str => (
                <StringItem
                  key={str.id}
                  str={str}
                  onClick={() => {
                    setSelectedString(str);
                    if (isMobile) {
                      // Mobile: navigate to preview
                    }
                  }}
                />
              ))
            )}
          </div>
        </div>

        {!isMobile && (
          <div className="w-1/2 border-l border-border">
            <PreviewPanel />
          </div>
        )}

        {isMobile && selectedString && (
          <div className="flex-1 flex flex-col min-h-0">
            <div className="bg-card border-b border-border px-4 py-3 flex items-center gap-3">
              <Button variant="ghost" size="icon" onClick={() => setSelectedString(null)}>
                <ChevronLeft className="w-6 h-6" />
              </Button>
              <h2 className="font-semibold text-foreground">Preview</h2>
            </div>
            <div className="flex-1 overflow-auto touch-pan-y">
              <PreviewPanel />
            </div>
          </div>
        )}
      </div>

      {/* Mobile Bottom Navigation */}
      {isMobile && (
        <div className="bg-card border-t border-border px-4 py-2">
          <div className="flex justify-around">
            <Button variant="ghost" className="flex flex-col items-center gap-1 px-3 py-2 text-primary">
              <FileText className="w-5 h-5" />
              <span className="text-xs">Strings</span>
            </Button>
            <Button variant="ghost" className="flex flex-col items-center gap-1 px-3 py-2 text-muted-foreground">
              <Users className="w-5 h-5" />
              <span className="text-xs">Community</span>
            </Button>
            <Button variant="ghost" className="flex flex-col items-center gap-1 px-3 py-2 text-muted-foreground">
              <Award className="w-5 h-5" />
              <span className="text-xs">Achievements</span>
            </Button>
            <Button variant="ghost" className="flex flex-col items-center gap-1 px-3 py-2 text-muted-foreground">
              <TrendingUp className="w-5 h-5" />
              <span className="text-xs">Stats</span>
            </Button>
          </div>
        </div>
      )}
    </div>
  );
};

export default GameScriptEditor;
