#App-UI DockerFile
FROM node:14.17.1-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
RUN npm cache clean --force
COPY . /app
RUN npm install && npm install -g @angular/cli
RUN mv ./src/app/app-config.proxy.ts ./src/app/app-config.ts
RUN ng build
FROM nginx:1.20.1
COPY --from=build-step /app/dist/app-ui /usr/share/nginx/html
ENV TZ Europe/Istanbul
CMD ["nginx", "-g", "daemon off;"]
