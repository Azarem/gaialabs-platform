import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://adwobxutnpmjbmhdxrzx.supabase.co';
const supabaseAnonKey = 'sb_publishable_uBZdKmgGql5sDNGpj1DVMQ_opZ2V4kV';

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
