# To obtain the latest version of Node js #
FROM node:latest
# The port where the app listens on #
ENV PORT 3000
# Creates a new dirctory for the app files #
RUN mkdir -p /usr/src/app
# It makes the newly created directory as the working directory for any COPY, RUN and CMD instructions in the Dockerfile. #
WORKDIR /usr/src/app
# This copies the package.json file from the directory to the container #
COPY package.json /usr/src/app/
# This executes the npm install command which downloads the dependecies #
RUN [ "npm", "install" ]
# This copies code repository into the container #
COPY . /usr/src/app
# exposes a port which the container will listen on.#
EXPOSE 3000
# it sets the default command to execute the container #
CMD [ "npm", "start" ]