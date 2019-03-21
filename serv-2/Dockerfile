FROM node:lts

RUN mkdir /app
WORKDIR /app
COPY package.json package-lock.json index.js ./

RUN npm install

EXPOSE 3000
