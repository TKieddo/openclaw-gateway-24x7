FROM node:22-slim

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
