FROM node:14.17.1-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN npm install && npm install -g @angular/cli
RUN ng update
RUN ng -v
COPY . /app
RUN ng build
#App-UI Nginx Stage
FROM nginx:1.20.1
COPY --from=build-step /app/dist/app /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
WORKDIR /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]