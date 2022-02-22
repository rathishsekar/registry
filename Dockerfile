FROM amazoncorretto:11-alpine AS build

COPY build/libs/registry*.jar app.jar
ENTRYPOINT ["java", "-Djava.net.useSystemProxies=true", "-jar", "/app.jar"]
