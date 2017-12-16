# Get the latest node image from repository
FROM node:latest

# Create a folder where we keep our application data
RUN mkdir -p /usr/app/user-manager

# Application working directory
WORKDIR /usr/app/user-manager

# Copy package.json
COPY package.json /usr/app/user-manager/

# Install dependencies
RUN npm install

# Copy files from the current
# working directory to /usr/app/user-manager
COPY . /usr/app/user-manager

# Expose port 3000
EXPOSE 3000

# Start the server
CMD [ "npm", "run", "start" ]