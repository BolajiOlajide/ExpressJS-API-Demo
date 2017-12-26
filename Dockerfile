FROM node:carbon
RUN mkdir -p /usr/src/app
# create app directory
WORKDIR /usr/src/app
# copy package.json content
COPY package*.json /usr/src/app/
RUN npm install
COPY . /usr/src/app/
EXPOSE 3000
CMD [ "npm", "start" ]