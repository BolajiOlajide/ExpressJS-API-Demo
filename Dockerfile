# Create image based on the official Node 6 image from the dockerhub
FROM node:8.6.0

# Create a directory where our app will be placed
RUN mkdir -p /UserManager/app

# Change directory so that our commands run inside this new directory
WORKDIR /UserManager/app

# Copy dependency definitions
COPY package.json /UserManager/app

# Install dependecies
RUN npm install

# Get all the code needed to run the app
COPY . /UserManager/app

# Expose the port the app runs in
EXPOSE 2999

# Serve the app

CMD ["npm", "start"]

