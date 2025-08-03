#!/usr/bin/env tsx

import { fileURLToPath } from 'url';
import { dirname, join, resolve } from 'path';
import { existsSync, statSync } from 'fs';
import { readdir } from 'fs/promises';
import { config } from 'dotenv';
import { execSync } from 'child_process';
import SftpClient from 'ssh2-sftp-client';
import * as ftp from 'basic-ftp';

// Get the directory containing this script
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const projectRoot = resolve(__dirname, '..');

// Load environment variables - try multiple file names
const envFiles = ['.env.local', '.env'];
let envLoaded = false;

for (const envFile of envFiles) {
  const envPath = join(projectRoot, envFile);
  if (existsSync(envPath)) {
    console.log(`📄 Loading environment from ${envFile}...`);
    config({ path: envPath });
    envLoaded = true;
    break;
  }
}

if (!envLoaded) {
  console.warn('⚠️  No environment file found (.env.local or .env)');
}

interface DeployConfig {
  host: string;
  port: number;
  username: string;
  password: string;
  remotePath: string;
  localDistPath: string;
}

function getDeployConfig(): DeployConfig {
  const config = {
    host: process.env.SFTP_HOST,
    port: parseInt(process.env.SFTP_PORT || '22'),
    username: process.env.SFTP_USERNAME,
    password: process.env.SFTP_PASSWORD,
    remotePath: process.env.SFTP_REMOTE_PATH,
    localDistPath: join(projectRoot, 'apps/gaia-translator/dist')
  };

  // Validate required environment variables
  const missingVars: string[] = [];
  if (!config.host) missingVars.push('SFTP_HOST');
  if (!config.username) missingVars.push('SFTP_USERNAME');
  if (!config.password) missingVars.push('SFTP_PASSWORD');
  if (!config.remotePath) missingVars.push('SFTP_REMOTE_PATH');

  if (missingVars.length > 0) {
    throw new Error(`Missing required environment variables: ${missingVars.join(', ')}`);
  }

  return config as DeployConfig;
}

async function buildProject(): Promise<void> {
  console.log('🔨 Building gaia-translator...');
  try {
    execSync('pnpm run translator:build', {
      cwd: projectRoot,
      stdio: 'inherit'
    });
    console.log('✅ Build completed successfully');
  } catch (error) {
    console.error('❌ Build failed:', error);
    throw error;
  }
}

async function verifyDistDirectory(distPath: string): Promise<void> {
  if (!existsSync(distPath)) {
    throw new Error(`Dist directory not found: ${distPath}`);
  }

  const stat = statSync(distPath);
  if (!stat.isDirectory()) {
    throw new Error(`Path is not a directory: ${distPath}`);
  }

  const files = await readdir(distPath);
  if (files.length === 0) {
    throw new Error(`Dist directory is empty: ${distPath}`);
  }

  console.log(`📁 Found ${files.length} items in dist directory`);
}

async function uploadDirectory(
  sftp: SftpClient,
  localPath: string,
  remotePath: string
): Promise<void> {
  console.log(`📤 Uploading ${localPath} to ${remotePath}...`);
  
  try {
    // Ensure remote directory exists
    await sftp.mkdir(remotePath, true);
    
    // Upload the entire directory
    await sftp.uploadDir(localPath, remotePath);
    
    console.log('✅ Upload completed successfully');
  } catch (error) {
    console.error('❌ Upload failed:', error);
    throw error;
  }
}

async function uploadDirectoryFtp(
  client: ftp.Client,
  localPath: string,
  remotePath: string
): Promise<void> {
  console.log(`📤 Uploading ${localPath} to ${remotePath}...`);
  
  try {
    // Ensure we're in the correct remote directory
    await client.ensureDir(remotePath);
    
    // Upload the entire directory
    await client.uploadFromDir(localPath, remotePath);
    
    console.log('✅ Upload completed successfully');
  } catch (error) {
    console.error('❌ Upload failed:', error);
    throw error;
  }
}

async function deployToFtps(): Promise<void> {
  const config = getDeployConfig();
  const client = new ftp.Client();
  client.ftp.verbose = true;

  try {
    console.log(`🔗 Connecting to ${config.host}:${config.port} via FTPS...`);
    
    await client.access({
      host: config.host,
      port: config.port,
      user: config.username,
      password: config.password,
      secure: true, // Enable FTPS (FTP over SSL)
      secureOptions: {
        // Allow legacy SSL/TLS for hosting providers
        rejectUnauthorized: false
      }
    });

    console.log('✅ Connected to FTPS server');

    // Verify dist directory exists and has content
    await verifyDistDirectory(config.localDistPath);

    // Upload the dist directory
    await uploadDirectoryFtp(client, config.localDistPath, config.remotePath);

    console.log('🎉 Deployment completed successfully!');
    
  } catch (error) {
    console.error('❌ Deployment failed:', error);
    throw error;
  } finally {
    // Always close the connection
    try {
      client.close();
      console.log('🔌 FTPS connection closed');
    } catch (closeError) {
      console.warn('⚠️  Warning: Failed to close FTPS connection:', closeError);
    }
  }
}

async function main(): Promise<void> {
  try {
    console.log('🚀 Starting deployment process...\n');

    // Step 1: Build the project
    await buildProject();
    console.log('');

    // Step 2: Deploy to FTPS
    await deployToFtps();
    
    console.log('\n🎊 Deployment process completed successfully!');
    process.exit(0);
    
  } catch (error) {
    console.error('\n💥 Deployment process failed:', error);
    process.exit(1);
  }
}

// Handle uncaught errors
process.on('unhandledRejection', (error: Error) => {
  console.error('💥 Unhandled promise rejection:', error);
  process.exit(1);
});

process.on('uncaughtException', (error: Error) => {
  console.error('💥 Uncaught exception:', error);
  process.exit(1);
});

// Run the deployment
main();