#APP-UI DockerFile 
FROM httpd:alpine
RUN apk add --no-cache tzdata
ENV TZ Europe/Istanbul
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
WORKDIR /usr/local/apache2/htdocs/
COPY dist/app-ui .
