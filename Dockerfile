FROM node:alpine

#Install some dependencies

#WORKDIR /usr/share/nodejs/npm-package-arg/
COPY /usr/share/nodejs/npm-package-arg/package*.json ./
RUN npm install

# Set up a default command
CMD [ "npm","start" ]
