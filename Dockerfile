FROM node:14-alpine as builder
RUN apk add git 
COPY . /app
WORKDIR /app
RUN yarn 
RUN yarn build 
RUN yarn start

EXPOSE 3000