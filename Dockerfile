FROM node:22-slim

# Install git and other required packages
RUN apt-get update && apt-get install -y git curl ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy config
COPY openclaw.json ./

# Expose gateway port
EXPOSE 18789

# Start OpenClaw gateway
CMD ["npm", "start"]
