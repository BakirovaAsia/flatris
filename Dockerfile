FROM node:14-alpine as builder
RUN apk add git 
# && npm i -g yarn
COPY . /app
WORKDIR /app
RUN yarn 
RUN yarn build 

FROM nginx:latest
ARG NGINX_CONFIG
COPY --from=builder /app/packages/main-module/build/ /usr/share/nginx/html

EXPOSE 80