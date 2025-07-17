/**
 * @fileoverview Common UI Types and Interfaces
 * @module gaia-ui/types
 */

export type Size = 'xs' | 'sm' | 'md' | 'lg' | 'xl';
export type Variant = 'primary' | 'secondary' | 'success' | 'warning' | 'error';
export type Position = 'top' | 'bottom' | 'left' | 'right';
export type Alignment = 'start' | 'center' | 'end';

export interface BaseComponentProps {
  id?: string;
  className?: string;
  style?: React.CSSProperties;
  'data-testid'?: string;
}

export interface InteractiveProps {
  disabled?: boolean;
  loading?: boolean;
  onClick?: (event: React.MouseEvent) => void;
  onKeyDown?: (event: React.KeyboardEvent) => void;
}

export interface FormFieldProps {
  name: string;
  label?: string;
  placeholder?: string;
  required?: boolean;
  error?: string;
  helpText?: string;
}

export interface LayoutProps {
  gap?: Size;
  padding?: Size;
  margin?: Size;
  direction?: 'row' | 'column';
  align?: Alignment;
  justify?: Alignment;
}

export interface ColorScheme {
  primary: string;
  secondary: string;
  accent: string;
  background: string;
  surface: string;
  text: string;
  textSecondary: string;
  border: string;
  success: string;
  warning: string;
  error: string;
}

export interface BreakpointConfig {
  xs: number;
  sm: number;
  md: number;
  lg: number;
  xl: number;
}

export interface SpacingConfig {
  xs: string;
  sm: string;
  md: string;
  lg: string;
  xl: string;
}

export interface TypographyConfig {
  fontFamily: {
    primary: string;
    secondary: string;
    mono: string;
  };
  fontSize: Record<Size, string>;
  fontWeight: {
    normal: number;
    medium: number;
    semibold: number;
    bold: number;
  };
  lineHeight: Record<Size, number>;
}

export interface ThemeConfig {
  colors: ColorScheme;
  spacing: SpacingConfig;
  typography: TypographyConfig;
  breakpoints: BreakpointConfig;
  borderRadius: Record<Size, string>;
  shadows: Record<Size, string>;
  transitions: {
    duration: Record<Size, string>;
    easing: {
      linear: string;
      easeIn: string;
      easeOut: string;
      easeInOut: string;
    };
  };
}

export interface NotificationProps {
  id: string;
  type: Variant;
  title: string;
  message?: string;
  duration?: number;
  persistent?: boolean;
  actions?: Array<{
    label: string;
    onClick: () => void;
  }>;
}

export interface ModalState {
  isOpen: boolean;
  title?: string;
  content?: React.ReactNode;
  size?: Size;
  closable?: boolean;
  onClose?: () => void;
}

export interface TooltipProps {
  content: React.ReactNode;
  position?: Position;
  delay?: number;
  disabled?: boolean;
}

export interface DropdownOption {
  value: string;
  label: string;
  disabled?: boolean;
  icon?: React.ReactNode;
}

export interface TableColumn<T = any> {
  key: string;
  title: string;
  dataIndex?: keyof T;
  render?: (value: any, record: T, index: number) => React.ReactNode;
  sortable?: boolean;
  width?: number | string;
  align?: Alignment;
}

export interface PaginationProps {
  current: number;
  total: number;
  pageSize: number;
  showSizeChanger?: boolean;
  showQuickJumper?: boolean;
  onChange: (page: number, pageSize: number) => void;
}

export interface LoadingState {
  isLoading: boolean;
  error?: string;
  progress?: number;
}

export interface ValidationRule {
  required?: boolean;
  min?: number;
  max?: number;
  pattern?: RegExp;
  validator?: (value: any) => string | null;
}

export interface FormField {
  name: string;
  type: 'text' | 'email' | 'password' | 'number' | 'select' | 'checkbox' | 'radio';
  label?: string;
  placeholder?: string;
  defaultValue?: any;
  options?: DropdownOption[];
  rules?: ValidationRule[];
} 