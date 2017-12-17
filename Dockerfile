FROM node:carbon

# Create application directory
RUN mkdir /app
WORKDIR /app

# Copy package files 
COPY package.json /app

# Install packages 
RUN npm install
COPY . /app

# Expose the port for the application
EXPOSE 8333

# Start command
CMD ["npm", "start"]