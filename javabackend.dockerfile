#Java-Backend Dockerfile
FROM openjdk:8-alpine
COPY /target/*.jar /usr/local/lib/app.jar
WORKDIR /usr/local/lib/
VOLUME /path/file
RUN apk add ttf-dejavu
RUN apk add --no-cache tzdata
ENV TZ Europe/Istanbul
EXPOSE 8088
ENTRYPOINT ["java","-Djava.awt.headless=true","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
