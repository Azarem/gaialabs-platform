import { createClient } from '@supabase/supabase-js';
import { getEnvVar } from '@gaialabs/shared';

const supabaseUrl = getEnvVar('SUPABASE_URL');
const supabaseAnonKey = getEnvVar('SUPABASE_ANON_KEY');

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
