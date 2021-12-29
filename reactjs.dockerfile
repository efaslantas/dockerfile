#ıntranetuı Set the base image to node:12-alpine
FROM node:12-alpine as build
#Timezone
RUN apk add --no-cache tzdata
ENV TZ Europe/Istanbul
# Specify where our app will live in the container
WORKDIR /app
# Copy the React App to the container
COPY . /app/
# Prepare the container for building React
RUN npm install
# We want the production version
RUN npm run build
# Prepare nginx
FROM nginx:1.16.0-alpine
COPY --from=build /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
# Fire up nginx
EXPOSE 9090
CMD ["nginx", "-g", "daemon off;"]
