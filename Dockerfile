FROM node:alpine

#Install some dependencies

#WORKDIR /usr/app
COPY ./ ./
RUN npm install

# Set up a default command
CMD [ "npm","start" ]
