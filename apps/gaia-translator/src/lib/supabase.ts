import { createClient } from '@supabase/supabase-js';

const supabaseUrl =
  (import.meta as any).env.SUPABASE_URL ||
  (import.meta as any).env.VITE_SUPABASE_URL ||
  process.env.SUPABASE_URL ||
  process.env.VITE_SUPABASE_URL ||
  '';

const supabaseAnonKey =
  (import.meta as any).env.SUPABASE_ANON_KEY ||
  (import.meta as any).env.VITE_SUPABASE_ANON_KEY ||
  process.env.SUPABASE_ANON_KEY ||
  process.env.VITE_SUPABASE_ANON_KEY ||
  '';

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
