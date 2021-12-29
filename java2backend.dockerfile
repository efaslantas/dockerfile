FROM openjdk:16-alpine3.13
COPY /target/*.jar /usr/local/lib/app.jar
WORKDIR /usr/local/lib/
ENV TZ Europe/Istanbul
EXPOSE 8080
ENTRYPOINT ["java","-Djava.awt.headless=true","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
