import React, { useState, useMemo } from 'react';
import { BinType, ChunkFile } from '@gaialabs/shared';

interface ResourceTreeProps {
  resources: ChunkFile[];
  onResourceSelect: (resource: ChunkFile) => void;
  selectedResource?: ChunkFile;
  className?: string;
}

interface TreeNode {
  id: string;
  name: string;
  type: 'folder' | 'file';
  resource?: ChunkFile;
  children?: TreeNode[];
  icon: string;
  expanded?: boolean;
}

const getResourceIcon = (type: BinType): string => {
  switch (type) {
    case BinType.Assembly:
      return '📝'; // Assembly files
    case BinType.Bitmap:
      return '🎨'; // Graphics files
    case BinType.Palette:
      return '🎨'; // Palette files (using same icon as graphics)
    case BinType.Tilemap:
      return '🗺️'; // Tilemap files
    case BinType.Tileset:
      return '🧩'; // Tileset files
    case BinType.Spritemap:
      return '👾'; // Spritemap files
    case BinType.Sound:
      return '🎵'; // Sound files
    case BinType.Music:
      return '🎼'; // Music files
    case BinType.Patch:
      return '🔧'; // Patch files
    // 'Binary' not part of BinType; default to Unknown icon
    // case BinType.Binary:
      return '📄'; // Binary files
    // 'String' not part of BinType; default to Unknown icon
    // case BinType.String:
      return '📃'; // String files
    case BinType.Unknown:
    default:
      return '❓'; // Unknown files
  }
};

const getTypeDisplayName = (type: BinType): string => {
  switch (type) {
    case BinType.Assembly:
      return 'Assembly';
    case BinType.Bitmap:
      return 'Graphics';
    case BinType.Palette:
      return 'Palettes';
    case BinType.Tilemap:
      return 'Tilemaps';
    case BinType.Tileset:
      return 'Tilesets';
    case BinType.Spritemap:
      return 'Spritemaps';
    case BinType.Sound:
      return 'Sounds';
    case BinType.Music:
      return 'Music';
    case BinType.Patch:
      return 'Patches';
    // Non-existent enum members in BinType, use Unknown
    case BinType.Unknown:
    default:
      return 'Unknown';
  }
};

export const ResourceTree: React.FC<ResourceTreeProps> = ({
  resources,
  onResourceSelect,
  selectedResource,
  className = ''
}) => {
  const [expandedNodes, setExpandedNodes] = useState<Set<string>>(new Set(['root']));

  const treeData = useMemo(() => {
    // Group resources by type
    const grouped = resources.reduce((acc, resource) => {
      const typeKey = resource.type.toString();
      if (!acc[typeKey]) {
        acc[typeKey] = [];
      }
      acc[typeKey].push(resource);
      return acc;
    }, {} as Record<string, ChunkFile[]>);

    // Create tree nodes
    const rootNode: TreeNode = {
      id: 'root',
      name: 'Resources',
      type: 'folder',
      icon: '📁',
      expanded: true,
      children: []
    };

    // Add type folders
    Object.entries(grouped).forEach(([typeKey, typeResources]) => {
      const type = typeResources[0]?.type as BinType;
      const typeNode: TreeNode = {
        id: `type-${typeKey}`,
        name: `${getTypeDisplayName(type)} (${typeResources.length})`,
        type: 'folder',
        icon: getResourceIcon(type),
        expanded: expandedNodes.has(`type-${typeKey}`),
        children: typeResources.map(resource => ({
          id: `resource-${resource.name}`,
          name: resource.name,
          type: 'file' as const,
          resource,
          icon: getResourceIcon(resource.type)
        }))
      };
      rootNode.children!.push(typeNode);
    });

    return rootNode;
  }, [resources, expandedNodes]);

  const toggleExpanded = (nodeId: string) => {
    const newExpanded = new Set(expandedNodes);
    if (newExpanded.has(nodeId)) {
      newExpanded.delete(nodeId);
    } else {
      newExpanded.add(nodeId);
    }
    setExpandedNodes(newExpanded);
  };

  const handleResourceClick = (resource: ChunkFile) => {
    onResourceSelect(resource);
  };

  const renderNode = (node: TreeNode, depth: number = 0): React.ReactNode => {
    const isExpanded = expandedNodes.has(node.id);
    const isSelected = selectedResource && node.resource && node.resource.name === selectedResource.name;

    return (
      <div key={node.id} className="tree-node">
        <div
          className={`tree-item ${isSelected ? 'selected' : ''}`}
          style={{ paddingLeft: `${depth * 20 + 8}px` }}
          onClick={() => {
            if (node.type === 'folder') {
              toggleExpanded(node.id);
            } else if (node.resource) {
              handleResourceClick(node.resource);
            }
          }}
        >
          {node.type === 'folder' && (
            <span className={`tree-arrow ${isExpanded ? 'expanded' : ''}`}>
              ▶
            </span>
          )}
          <span className="tree-icon">{node.icon}</span>
          <span className="tree-name">{node.name}</span>
        </div>
        
        {node.type === 'folder' && node.children && isExpanded && (
          <div className="tree-children">
            {node.children.map(child => renderNode(child, depth + 1))}
          </div>
        )}
      </div>
    );
  };

  return (
    <div className={`resource-tree ${className}`}>
      <div className="tree-header">
        <h3>Resource Explorer</h3>
      </div>
      <div className="tree-content">
        {resources.length > 0 ? (
          renderNode(treeData)
        ) : (
          <div className="empty-state">
            <span className="empty-icon">📂</span>
            <p>No resources loaded</p>
            <small>Load a ROM file to see resources</small>
          </div>
        )}
      </div>
    </div>
  );
};
