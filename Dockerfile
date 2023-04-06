FROM node:latest

WORKDIR /usr/src/app

COPY ./ /usr/src/app

RUN npm install

COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]
