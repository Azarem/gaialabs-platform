# Use Node.js 20 Alpine as base image
FROM node:20-alpine AS base

# Install pnpm
RUN npm install -g pnpm@9

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY turbo.json ./

# Copy all package.json files
COPY apps/gaia-studio/package.json ./apps/gaia-studio/
COPY packages/*/package.json ./packages/*/

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Build the application
RUN pnpm run build --filter=gaia-studio

# Production stage
FROM nginx:alpine AS production

# Copy built assets to nginx
COPY --from=base /app/apps/gaia-studio/dist /usr/share/nginx/html

# Copy nginx configuration
COPY apps/gaia-studio/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 