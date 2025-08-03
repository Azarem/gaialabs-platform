import React, { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';

const SupabaseTest = () => {
  const [data, setData] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const testConnection = async () => {
      try {
        console.log('Testing Supabase connection...');
        
        // Test basic connection
        const { data: sceneGroups, error: sgError } = await supabase
          .from('SceneGroup')
          .select('*')
          .limit(5);

        if (sgError) {
          throw sgError;
        }

        console.log('Scene groups:', sceneGroups);

        // Test text regions
        const { data: textRegions, error: trError } = await supabase
          .from('text_regions')
          .select('*')
          .limit(5);

        if (trError) {
          throw trError;
        }

        console.log('Text regions:', textRegions);

        setData({ sceneGroups, textRegions });
      } catch (err) {
        console.error('Supabase test error:', err);
        setError(err instanceof Error ? err.message : 'Unknown error');
      } finally {
        setLoading(false);
      }
    };

    testConnection();
  }, []);

  if (loading) {
    return <div>Testing Supabase connection...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h2>Supabase Connection Test</h2>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
};

export default SupabaseTest;
