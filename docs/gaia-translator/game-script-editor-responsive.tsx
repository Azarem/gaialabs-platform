import React, { useState, useMemo, useEffect } from 'react';
import { Search, Filter, Save, History, MessageSquare, Globe, FileText, Check, X, Menu, ChevronLeft, Eye, Code, Star, TrendingUp, Users, Award, Zap, Heart, ChevronDown, Edit3 } from 'lucide-react';

const GameScriptEditorResponsive = () => {
  const [selectedRegion, setSelectedRegion] = useState('NA-English');
  const [selectedChapter, setSelectedChapter] = useState('Chapter 1');
  const [selectedGroup, setSelectedGroup] = useState('');
  const [selectedScene, setSelectedScene] = useState('');
  const [selectedFile, setSelectedFile] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedString, setSelectedString] = useState(null);
  const [previewRegions, setPreviewRegions] = useState(['NA-English', 'JP-JAP', 'NA-GaiaLabs']);
  const [editingText, setEditingText] = useState({});
  const [showFilters, setShowFilters] = useState(false);
  const [showMobileMenu, setShowMobileMenu] = useState(false);
  const [viewMode, setViewMode] = useState('formatted');
  const [isMobile, setIsMobile] = useState(false);
  const [showUserMenu, setShowUserMenu] = useState(false);

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

  // Mock data
  const regions = [
    { code: 'NA-English', name: 'NA-English (core)', isCore: true },
    { code: 'JP-JAP', name: 'Japanese', isCore: false },
    { code: 'NA-GaiaLabs', name: 'NA-GaiaLabs', isCore: false },
    { code: 'EU-English', name: 'EU-English', isCore: false },
    { code: 'EU-French', name: 'French', isCore: false },
    { code: 'EU-German', name: 'German', isCore: false },
  ];

  const chapterData = {
    'Chapter 1': {
      group: 'South Cape',
      scenes: {
        "Tim's House": ['sc06_bill', 'sc06_lola'],
        "Seth's House": ['sc05_seths_father', 'sc05_seths_mother'],
        "Lance's House": ['sc03_lances_mother']
      }
    },
    'Chapter 2': {
      group: 'Inca Ruins',
      scenes: {
        'Temple': ['sc12_guard', 'sc12_spirit'],
        'Village': ['sc12_elder', 'sc12_merchant']
      }
    },
    'Chapter 3': {
      group: 'Edward Castle',
      scenes: {
        'Throne Room': ['sc08_king', 'sc08_queen'],
        'Prison': ['sc08_prisoner', 'sc08_guard']
      }
    }
  };

  const stringData = [
    {
      id: 'widestring_049193',
      type: 'dialogue',
      group: 'South Cape',
      scene: "Seth's House",
      file: 'sc05_seths_father',
      contributors: 3,
      lastEdit: '2 hours ago',
      quality: 'verified',
      texts: {
        'NA-English': "[TPL:B]Seth's father:[N][LU1:64]wrong with[N]having a [LU1:A7]fun with[N]my hard-earned money!![END]",
        'JP-JAP': "[TPL:B]モリスの父：[N]けっ。おれがかせいだ金[N]で酒を飲んで何が[N]悪いってんだ！[END]",
        'NA-GaiaLabs': "[TPL:B]Morris's father: Hmph.[N]What's wrong with drinking[N]alcohol with the money I[N]earned!?[END]"
      }
    },
    {
      id: 'widestring_04941D',
      type: 'dialogue',
      group: 'South Cape',
      scene: "Seth's House",
      file: 'sc05_seths_father',
      contributors: 5,
      lastEdit: '1 day ago',
      quality: 'needs-review',
      texts: {
        'NA-English': "[TPL:B][TPL:4][LU1:6]Coming home[N]at [LU1:D6]hour probably[N]means you had to stay[N]after school again.[FIN]Ha ha. Excellent! Even[N]if a boy [LU1:78]study,[N]he [LU1:CA]show a[N][LU1:A7]initiative.[PAL:0][END]",
        'JP-JAP': "[TPL:B][TPL:4]こんな時間に[N]帰ってくるなんて[N]また居残りか。[FIN]はは。結構！男は[N]勉強ができなくても[N]やる気を見せなきゃな。[PAL:0][END]",
        'NA-GaiaLabs': "[TPL:B][TPL:4]Coming home at this[N]hour probably means[N]you had detention again.[FIN]Ha ha. Excellent! Even[N]if a boy can't study,[N]he must show some[N]initiative.[PAL:0][END]"
      }
    },
    {
      id: 'widestring_0494B1',
      type: 'dialogue',
      group: 'South Cape',
      scene: "Tim's House",
      file: 'sc06_lola',
      contributors: 2,
      lastEdit: '3 days ago',
      quality: 'verified',
      texts: {
        'NA-English': "[TPL:B][TPL:4][LU1:6][N]Oh, my! I haven't sung [N][LU1:A5][LU1:D6]in a [LU1:A6]time.[FIN][LU1:68]grandmother Lola[N][LU2:BB]to be a singer.[FIN]I fell in love [LU1:F0]her[N]voice. That's why I[N]married her.[PAL:0][END]",
        'JP-JAP': "[TPL:B][TPL:4]まあ！歌なんて[N]久しぶりだわ。[FIN]ローラおばあちゃんは[N]昔歌手だったんだ。[FIN]俺はその歌声に[N]惚れて結婚したんだ。[PAL:0][END]",
        'NA-GaiaLabs': "[TPL:B][TPL:4]Oh my! I haven't sung[N]in such a long time.[FIN]Your grandmother Lola[N]used to be a singer.[FIN]I fell in love with her[N]voice. That's why I[N]married her.[PAL:0][END]"
      }
    }
  ];

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
  const formatTextForPreview = (text) => {
    if (!text) return '';
    return text
      .replace(/\[N\]/g, '\n')
      .replace(/\[TPL:\w+\]/g, '')
      .replace(/\[LU\d+:\w+\]/g, '')
      .replace(/\[FIN\]/g, '\n---\n')
      .replace(/\[PAL:\d+\]/g, '')
      .replace(/\[END\]/g, '');
  };

  const currentChapterData = chapterData[selectedChapter];
  const availableScenes = currentChapterData ? Object.keys(currentChapterData.scenes) : [];
  const availableFiles = selectedScene && currentChapterData ? currentChapterData.scenes[selectedScene] : [];

  React.useEffect(() => {
    if (currentChapterData) {
      setSelectedGroup(currentChapterData.group);
      setSelectedScene('');
      setSelectedFile('');
    }
  }, [selectedChapter]);

  const filteredStrings = useMemo(() => {
    return stringData.filter(str => {
      if (selectedGroup && str.group !== selectedGroup) return false;
      if (selectedScene && str.scene !== selectedScene) return false;
      if (selectedFile && str.file !== selectedFile) return false;
      
      if (searchQuery) {
        const query = searchQuery.toLowerCase();
        const regionText = str.texts[selectedRegion]?.toLowerCase() || '';
        if (!str.id.toLowerCase().includes(query) && 
            !regionText.includes(query) &&
            !str.scene.toLowerCase().includes(query) &&
            !str.file.toLowerCase().includes(query)) {
          return false;
        }
      }
      
      return true;
    });
  }, [searchQuery, selectedGroup, selectedScene, selectedFile, selectedRegion]);

  // User Profile Component
  const UserProfile = () => (
    <div className="relative">
      <button 
        onClick={() => setShowUserMenu(!showUserMenu)}
        className="flex items-center gap-2 px-3 py-2 rounded-lg hover:bg-gray-100 transition-colors"
      >
        <div className="w-8 h-8 bg-gradient-to-br from-blue-500 to-purple-600 rounded-full flex items-center justify-center text-white font-semibold text-sm">
          {userData.level}
        </div>
        <div className="hidden sm:block text-left">
          <div className="text-sm font-medium">{userData.username}</div>
          <div className="text-xs text-gray-500 flex items-center gap-1">
            <Zap className="w-3 h-3" />
            {userData.exp}/{userData.exp + userData.expToNext} XP
          </div>
        </div>
        <ChevronDown className="w-4 h-4 text-gray-400" />
      </button>

      {showUserMenu && (
        <div className="absolute right-0 mt-2 w-64 bg-white rounded-lg shadow-lg border border-gray-200 p-4 z-50">
          <div className="space-y-3">
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium">Level {userData.level}</span>
                <span className="text-xs text-gray-500">{userData.expToNext} XP to level {userData.level + 1}</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-gradient-to-r from-blue-500 to-purple-600 h-2 rounded-full transition-all"
                  style={{ width: `${(userData.exp / (userData.exp + userData.expToNext)) * 100}%` }}
                />
              </div>
            </div>

            <div className="grid grid-cols-2 gap-2 py-2 border-y border-gray-100">
              <div className="text-center">
                <div className="text-lg font-semibold">{userData.contributions}</div>
                <div className="text-xs text-gray-500">Contributions</div>
              </div>
              <div className="text-center">
                <div className="text-lg font-semibold flex items-center justify-center gap-1">
                  {userData.streak} <Heart className="w-4 h-4 text-red-500" />
                </div>
                <div className="text-xs text-gray-500">Day Streak</div>
              </div>
            </div>

            <div>
              <div className="text-xs font-medium text-gray-500 mb-1">Recent Badges</div>
              <div className="flex gap-1">
                {userData.badges.slice(0, 3).map((badge, i) => (
                  <div key={i} className="px-2 py-1 bg-yellow-100 text-yellow-700 text-xs rounded-full">
                    {badge}
                  </div>
                ))}
              </div>
            </div>

            <div className="pt-2 border-t border-gray-100 space-y-1">
              <button className="w-full text-left px-2 py-1 text-sm hover:bg-gray-50 rounded">Profile</button>
              <button className="w-full text-left px-2 py-1 text-sm hover:bg-gray-50 rounded">Achievements</button>
              <button className="w-full text-left px-2 py-1 text-sm hover:bg-gray-50 rounded">Settings</button>
              <button className="w-full text-left px-2 py-1 text-sm text-red-600 hover:bg-red-50 rounded">Sign Out</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );

  // Header Component
  const Header = () => (
    <div className="bg-white border-b border-gray-200 px-4 py-3 sticky top-0 z-40">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          {isMobile && (
            <button onClick={() => setShowMobileMenu(!showMobileMenu)} className="p-2 -ml-2 lg:hidden">
              <Menu className="w-5 h-5" />
            </button>
          )}
          <h1 className="text-lg font-semibold hidden sm:block">Game Script Editor</h1>
          
          <div className="flex items-center gap-2">
            <Globe className="w-4 h-4 text-gray-600" />
            <select 
              value={selectedRegion} 
              onChange={(e) => setSelectedRegion(e.target.value)}
              className="px-2 py-1 text-sm border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              {regions.map(region => (
                <option key={region.code} value={region.code}>
                  {region.name}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex items-center gap-2">
          <button className="p-2 hover:bg-gray-100 rounded-md" title="Community Activity">
            <Users className="w-4 h-4 text-gray-600" />
          </button>
          <button className="p-2 hover:bg-gray-100 rounded-md" title="Leaderboard">
            <TrendingUp className="w-4 h-4 text-gray-600" />
          </button>
          <UserProfile />
        </div>
      </div>
    </div>
  );

  // Filter Bar Component
  const FilterBar = () => (
    <div className={`bg-white border-b border-gray-200 ${isMobile && !showFilters ? 'hidden' : ''}`}>
      <div className="px-4 py-3">
        <div className={`${isMobile ? 'space-y-3' : 'flex items-center gap-4'}`}>
          <div className="flex items-center gap-2">
            <label className="text-sm font-medium text-gray-700 min-w-fit">Chapter:</label>
            <select 
              value={selectedChapter} 
              onChange={(e) => setSelectedChapter(e.target.value)}
              className="flex-1 px-3 py-1.5 text-sm border border-gray-300 rounded-md"
            >
              {Object.keys(chapterData).map(chapter => (
                <option key={chapter} value={chapter}>{chapter}</option>
              ))}
            </select>
          </div>

          <div className="flex items-center gap-2">
            <label className="text-sm font-medium text-gray-700 min-w-fit">Group:</label>
            <div className="flex-1 px-3 py-1.5 text-sm bg-gray-100 rounded-md">
              {selectedGroup}
            </div>
          </div>

          <div className="flex items-center gap-2">
            <label className="text-sm font-medium text-gray-700 min-w-fit">Scene:</label>
            <select 
              value={selectedScene} 
              onChange={(e) => {
                setSelectedScene(e.target.value);
                setSelectedFile('');
              }}
              className="flex-1 px-3 py-1.5 text-sm border border-gray-300 rounded-md"
            >
              <option value="">All Scenes</option>
              {availableScenes.map(scene => (
                <option key={scene} value={scene}>{scene}</option>
              ))}
            </select>
          </div>

          <div className="flex items-center gap-2">
            <label className="text-sm font-medium text-gray-700 min-w-fit">File:</label>
            <select 
              value={selectedFile} 
              onChange={(e) => setSelectedFile(e.target.value)}
              className="flex-1 px-3 py-1.5 text-sm border border-gray-300 rounded-md"
              disabled={!selectedScene}
            >
              <option value="">All Files</option>
              {availableFiles.map(file => (
                <option key={file} value={file}>{file}</option>
              ))}
            </select>
          </div>
          
          {(selectedScene || selectedFile) && (
            <button 
              onClick={() => {
                setSelectedScene('');
                setSelectedFile('');
              }}
              className="ml-auto px-3 py-1 text-sm text-gray-600 hover:text-gray-800 flex items-center gap-1"
            >
              <X className="w-3 h-3" />
              Clear
            </button>
          )}
        </div>
      </div>
    </div>
  );

  // Search Bar Component
  const SearchBar = () => (
    <div className="bg-white border-b border-gray-200 px-4 py-3">
      <div className="flex items-center gap-2">
        <div className="flex-1 relative">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400" />
          <input
            type="text"
            placeholder="Search strings..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="w-full pl-10 pr-4 py-2 text-sm border border-gray-300 rounded-md"
          />
        </div>
        {isMobile && (
          <button 
            onClick={() => setShowFilters(!showFilters)}
            className={`p-2 rounded-md ${showFilters ? 'bg-blue-100 text-blue-600' : 'text-gray-600'}`}
          >
            <Filter className="w-5 h-5" />
          </button>
        )}
      </div>
      <div className="mt-2 flex items-center justify-between text-sm">
        <span className="text-gray-600">{filteredStrings.length} strings found</span>
        <span className="text-xs text-gray-500">
          <span className="inline-flex items-center gap-1">
            <div className="w-2 h-2 bg-green-500 rounded-full"></div> Verified
          </span>
          <span className="inline-flex items-center gap-1 ml-3">
            <div className="w-2 h-2 bg-yellow-500 rounded-full"></div> Needs Review
          </span>
        </span>
      </div>
    </div>
  );

  // String Item Component
  const StringItem = ({ str, onClick }) => (
    <div 
      onClick={onClick}
      className="bg-white hover:bg-gray-50 cursor-pointer border-b border-gray-200 transition-colors"
    >
      <div className="px-4 py-3">
        <div className="flex items-start justify-between gap-3">
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <span className="font-mono text-sm text-blue-600">{str.id}</span>
              <div className={`w-2 h-2 rounded-full ${str.quality === 'verified' ? 'bg-green-500' : 'bg-yellow-500'}`} />
            </div>
            <div className="text-sm text-gray-700 line-clamp-2">
              {formatTextForPreview(str.texts[selectedRegion]) || '<No translation>'}
            </div>
            <div className="flex items-center gap-3 mt-2 text-xs text-gray-500">
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
            <button 
              onClick={(e) => {
                e.stopPropagation();
                setSelectedString(str);
                setEditingText({ [selectedRegion]: str.texts[selectedRegion] });
              }}
              className="p-2 hover:bg-gray-100 rounded-md"
            >
              <Edit3 className="w-4 h-4 text-gray-600" />
            </button>
          )}
        </div>
      </div>
    </div>
  );

  // Preview Panel Component
  const PreviewPanel = () => {
    if (!selectedString) {
      return (
        <div className="h-full flex items-center justify-center text-gray-400 bg-gray-50">
          <div className="text-center p-8">
            <FileText className="w-12 h-12 mx-auto mb-3" />
            <p className="text-gray-600 font-medium">Select a string to preview</p>
            <p className="text-sm mt-2">Click any string from the list to see translations</p>
          </div>
        </div>
      );
    }

    return (
      <div className="h-full flex flex-col bg-gray-50">
        <div className="bg-white border-b border-gray-200 px-4 py-3">
          <div className="flex items-center justify-between">
            <div>
              <h3 className="font-mono text-sm text-blue-600">{selectedString.id}</h3>
              <div className="flex items-center gap-3 mt-1 text-xs text-gray-500">
                <span>{selectedString.scene}</span>
                <span>•</span>
                <span>{selectedString.file}</span>
              </div>
            </div>
            <div className="flex items-center gap-2">
              <button
                onClick={() => setViewMode(viewMode === 'formatted' ? 'raw' : 'formatted')}
                className="px-3 py-1 text-sm bg-gray-100 rounded-md hover:bg-gray-200 flex items-center gap-2"
              >
                {viewMode === 'formatted' ? <Eye className="w-4 h-4" /> : <Code className="w-4 h-4" />}
                {viewMode === 'formatted' ? 'Preview' : 'Raw'}
              </button>
            </div>
          </div>
        </div>

        <div className="flex-1 overflow-auto p-4">
          <div className={`grid ${isMobile ? 'grid-cols-1' : 'grid-cols-3'} gap-4`}>
            {previewRegions.map(regionCode => {
              const region = regions.find(r => r.code === regionCode);
              const text = selectedString.texts[regionCode] || '';
              const isEditing = editingText[regionCode] !== undefined;

              return (
                <div key={regionCode} className="bg-white rounded-lg shadow-sm border border-gray-200">
                  <div className="px-4 py-2 bg-gray-50 border-b border-gray-200 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <h4 className="font-medium text-sm">{region?.name || regionCode}</h4>
                      {region?.isCore && (
                        <span className="text-xs px-2 py-0.5 bg-blue-100 text-blue-700 rounded">Core</span>
                      )}
                    </div>
                    <button 
                      onClick={() => {
                        if (isEditing) {
                          setEditingText(prev => {
                            const newState = { ...prev };
                            delete newState[regionCode];
                            return newState;
                          });
                        } else {
                          setEditingText(prev => ({
                            ...prev,
                            [regionCode]: text
                          }));
                        }
                      }}
                      className="text-xs text-blue-600 hover:text-blue-700"
                    >
                      {isEditing ? 'Cancel' : 'Edit'}
                    </button>
                  </div>

                  <div className="p-3">
                    {isEditing ? (
                      <div>
                        <textarea
                          value={editingText[regionCode]}
                          onChange={(e) => setEditingText(prev => ({
                            ...prev,
                            [regionCode]: e.target.value
                          }))}
                          className="w-full h-32 p-2 font-mono text-xs border border-gray-300 rounded"
                        />
                        <div className="mt-2 flex gap-2">
                          <button className="flex-1 px-3 py-1.5 text-xs bg-green-600 text-white rounded hover:bg-green-700 flex items-center justify-center gap-1">
                            <Check className="w-3 h-3" />
                            Save
                          </button>
                          <button className="px-3 py-1.5 text-xs bg-gray-200 text-gray-700 rounded hover:bg-gray-300">
                            Preview
                          </button>
                        </div>
                        <div className="mt-2 text-xs text-green-600">
                          +10 XP for contribution
                        </div>
                      </div>
                    ) : (
                      <div>
                        {viewMode === 'formatted' ? (
                          <div className="bg-gray-900 text-green-400 p-3 rounded font-mono text-xs whitespace-pre-wrap">
                            {formatTextForPreview(text) || '<No translation>'}
                          </div>
                        ) : (
                          <div className="bg-gray-50 p-3 rounded font-mono text-xs break-all border border-gray-200">
                            {text || '<No translation>'}
                          </div>
                        )}
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>

          <div className="mt-4 p-3 bg-yellow-50 border border-yellow-200 rounded-lg">
            <div className="text-sm">
              <p className="font-medium text-yellow-800">Translation Guidelines</p>
              <p className="text-yellow-700 mt-1 text-xs">
                Keep formatting codes intact: [N] = newline, [FIN] = page break, [END] = end of text
              </p>
            </div>
          </div>

          {/* Community Activity */}
          <div className="mt-4 p-4 bg-white rounded-lg border border-gray-200">
            <h4 className="font-medium text-sm mb-3">Recent Activity</h4>
            <div className="space-y-2">
              <div className="flex items-center gap-3 text-xs">
                <div className="w-6 h-6 bg-purple-500 rounded-full flex items-center justify-center text-white font-semibold">8</div>
                <div>
                  <span className="font-medium">PixelNinja</span> edited this string 2 hours ago
                </div>
              </div>
              <div className="flex items-center gap-3 text-xs">
                <div className="w-6 h-6 bg-blue-500 rounded-full flex items-center justify-center text-white font-semibold">15</div>
                <div>
                  <span className="font-medium">LangMaster</span> verified the translation
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="h-screen flex flex-col bg-gray-100">
      <Header />
      
      {!isMobile && <FilterBar />}
      
      <div className={`flex-1 flex ${isMobile ? 'flex-col' : ''} overflow-hidden`}>
        <div className={`${isMobile ? 'flex-1' : 'w-1/2'} flex flex-col bg-white ${isMobile && selectedString ? 'hidden' : ''}`}>
          <SearchBar />
          {isMobile && <FilterBar />}
          
          <div className="flex-1 overflow-auto">
            {filteredStrings.map(str => (
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
            ))}
          </div>
        </div>

        {!isMobile && (
          <div className="w-1/2 border-l border-gray-200">
            <PreviewPanel />
          </div>
        )}

        {isMobile && selectedString && (
          <div className="flex-1 flex flex-col">
            <div className="bg-white border-b border-gray-200 px-4 py-3 flex items-center gap-3">
              <button onClick={() => setSelectedString(null)}>
                <ChevronLeft className="w-6 h-6" />
              </button>
              <h2 className="font-semibold">Preview</h2>
            </div>
            <div className="flex-1 overflow-auto">
              <PreviewPanel />
            </div>
          </div>
        )}
      </div>

      {/* Mobile Bottom Navigation */}
      {isMobile && (
        <div className="bg-white border-t border-gray-200 px-4 py-2">
          <div className="flex justify-around">
            <button className="flex flex-col items-center gap-1 px-3 py-2 text-blue-600">
              <FileText className="w-5 h-5" />
              <span className="text-xs">Strings</span>
            </button>
            <button className="flex flex-col items-center gap-1 px-3 py-2 text-gray-600">
              <Users className="w-5 h-5" />
              <span className="text-xs">Community</span>
            </button>
            <button className="flex flex-col items-center gap-1 px-3 py-2 text-gray-600">
              <Award className="w-5 h-5" />
              <span className="text-xs">Achievements</span>
            </button>
            <button className="flex flex-col items-center gap-1 px-3 py-2 text-gray-600">
              <TrendingUp className="w-5 h-5" />
              <span className="text-xs">Stats</span>
            </button>
          </div>
        </div>
      )}
    </div>
  );
};

export default GameScriptEditorResponsive;