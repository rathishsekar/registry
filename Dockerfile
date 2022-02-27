FROM amazoncorretto:11-alpine AS build

COPY build/libs/registry-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-Djava.net.useSystemProxies=true", "-jar", "/app.jar"]
