FROM node:14-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build -prod

#Segunda etapa

FROM nginx:1.20.0-alpine

COPY --from=build-step /app/dist/testDockerAngular /usr/share/nginx/html