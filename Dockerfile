FROM node:22-slim

# Install required packages
RUN apt-get update && apt-get install -y git curl ca-certificates python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy app files
COPY . .

# Expose gateway port
EXPOSE 18789

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:18789/health || exit 1

# Start OpenClaw gateway
CMD ["npm", "start"]
